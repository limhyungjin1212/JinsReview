package com.lhj.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.lhj.model.Criteria;
import com.lhj.model.LoginVO;
import com.lhj.model.MailVO;
import com.lhj.model.PageVO;
import com.lhj.model.ReviewVO;
import com.lhj.model.UserVO;
import com.lhj.service.ReviewService;
import com.lhj.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService us;

	@Autowired
	private ReviewService rs;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet() {
		logger.info("joinGet..");
		return "user/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPost(UserVO uvo, RedirectAttributes rttr) throws Exception {
		logger.info("joinPost.." + uvo);
		us.join(uvo);
		rttr.addFlashAttribute("uvo", uvo);
		return "redirect:/joinSuccess";

	}
	@RequestMapping(value = "joinSuccess", method = RequestMethod.GET)
	public String joinSuccess() throws Exception {
		return "user/joinSuccess";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginGet() {
		logger.info("loginGet..");

		return "user/login";
	}
	@RequestMapping(value = "userIdFind", method = RequestMethod.GET)
	public String userIdFind() {
		logger.info("userIdFind..");

		return "user/userIdFind";
	}
	@RequestMapping(value = "userIdFind", method = RequestMethod.POST)
	public String userIdFindPost(UserVO uv,Model model) throws Exception {
		logger.info("userIdFind.."+uv);
		
		model.addAttribute("userid",us.userIdFind(uv));
		logger.info("uif="+us.userIdFind(uv));
		
		return "user/userIdFindSuccess";
	}
	@RequestMapping(value = "userPwFind", method = RequestMethod.GET)
	public String userPwFind() {
		logger.info("userPwFind..");

		return "user/userPwFind";
	}
	
	@RequestMapping(value = "userPwFind", method = RequestMethod.POST)
	public String userPwFindPost(UserVO uv,Model model) throws Exception {
		logger.info("userIdFind.."+uv);
		
		model.addAttribute("userpw",us.userPwFind(uv));
		logger.info("uif="+us.userIdFind(uv));
		
		return "user/userPwFindSuccess";
	}
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public String loginPost(LoginVO lvo, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("loginPost..");
		UserVO uv = us.login(lvo);
		logger.info("loginPost" + uv);

		if (uv == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:login";
		}

		model.addAttribute("userVO", uv);

		if (lvo.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;
			Date sessionlimit = new Date(System.currentTimeMillis() + (1000 * amount));
			us.keepLogin(uv.getUid(), session.getId(), sessionlimit);
		}

		return "user/loginPost";
	}

	@RequestMapping("logout")
	public String logoutGet(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		logger.info("logout");

		Object obj = session.getAttribute("login");
		if (obj != null) {
			UserVO uv = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				us.keepLogin(uv.getUid(), session.getId(), new Date());
			}
		}

		return "redirect:/";

	}

	@ResponseBody
	@RequestMapping(value = "mailSending", method = RequestMethod.POST)
	public int mailSending(String umail) {

		int checkNum = 1;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			
			messageHelper.setFrom("limhyungjin1212@gmail.com"); // 보내는사람
			messageHelper.setSubject("JinsReview 이메일 인증 번호"); // 제목
			while (true) {
				checkNum = ((int) (Math.random() * 1000000));// 난수 만들기
				if (checkNum > 99999) {
					break;
				}
			}
			messageHelper.setText(("인증번호 :" + checkNum)); // 내용
			messageHelper.setTo(umail); // 받는사람
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return checkNum;
	}

	@ResponseBody
	@RequestMapping(value = "nameCheck", method = RequestMethod.GET)
	public int nameCheck(String uname) throws Exception {

		int result = us.nameCheck(uname);

		return result;
	}
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	public int idCheck(String uid) throws Exception {

		int result = us.idCheck(uid);

		return result;
	}
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypageGET(@RequestParam String uid,@RequestParam String uname,Criteria cri, Model model) throws Exception {
		
		cri.setAmount(3);
		PageVO pv = new PageVO(cri, rs.myRevCount(uname));
		
		//내가 작성한 리뷰
		List myRevList = new ArrayList();
		myRevList = rs.revMyListPage(uname, cri);
		logger.info("myRevList=" + myRevList);
		
		//작성한 리뷰의 첨부파일 불러오기
		logger.info("cri="+cri);
		List revMyFile = new ArrayList();
		revMyFile = rs.revMyFile(uname);
		logger.info("revMyFile=" + revMyFile);
		
		//팔로우 리스트
		List<UserVO> followList = new ArrayList();
		followList = us.followList(uid);
		logger.info("followList=" + followList);
		
		List<UserVO> followerList = new ArrayList();
		followerList = us.followerList(uid);
		logger.info("followerList=" + followerList);
		
		model.addAttribute("myRevList", myRevList);
		model.addAttribute("revMyFile", revMyFile);
		model.addAttribute("user", us.userDetail(uname));
		logger.info("user"+us.userDetail(uname));
		model.addAttribute("page", pv);
		model.addAttribute("followList", followList);
		model.addAttribute("followerList", followerList);
		
		//메시지함
		model.addAttribute("myMessage",us.myMessage(uname));
		logger.info("마이메세지:"+us.myMessage(uname));
		
		return "user/mypage";
	}

	@RequestMapping(value = "userDetail", method = RequestMethod.GET)
	public String userDetail(@RequestParam String uname, HttpServletRequest req, Criteria cri, ReviewVO rv, Model model)
			throws Exception {
		logger.info("+userDetail" + uname);
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("userdetail req=" + req.getRequestURI().substring(req.getContextPath().length()));

		cri.setAmount(5);
		int mrcnt = rs.myRevCount(uname);
		PageVO pv = new PageVO(cri, mrcnt);
		logger.info("pv" + pv);
		logger.info("mrcnt" + mrcnt);
		List myRevList = new ArrayList();
		myRevList = rs.revMyListPage(uname, cri);
		
		//작성한 리뷰의 첨부파일 불러오기
		List revMyFile = new ArrayList();
		revMyFile = rs.revMyFile(uname);
		logger.info("revMyFile=" + revMyFile);
		
		
		UserVO uv = us.userDetail(uname);
		//팔로워 목록
		List<UserVO> followerList = new ArrayList();
		followerList = us.followerList(uv.getUid());
		logger.info("followerList=" + followerList);
		
		
		
		model.addAttribute("user", uv);
		logger.info("user="+us.userDetail(uname));
		model.addAttribute("myRevList", myRevList);
		model.addAttribute("mrcnt", mrcnt);
		model.addAttribute("revMyFile", revMyFile);
		model.addAttribute("followerList", followerList);
		model.addAttribute("flcnt", followerList.size());
		model.addAttribute("page", pv);

		return "main";
	}

	@RequestMapping(value = "follow", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> follow(String uid, String myid) {
		logger.info("followuname~~" + uid);
		logger.info("followmyname~~" + myid);
		ResponseEntity<String> entity = null;
			try {
				// 서비스 호출하는곳
				us.follow(uid, myid);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}

		return entity;
	}

	@RequestMapping(value = "unfollow", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> unfollow(String uid,String myid) {
		logger.info("unfollowmyname~~" + myid);
		ResponseEntity<String> entity = null;
			try {
				// 서비스 호출하는곳
				us.unfollow(uid,myid);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}

		return entity;
	}
	@RequestMapping(value ="userList" , method = RequestMethod.GET)
	public String userList(HttpServletRequest req, Criteria cri,Model model) throws Exception{
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		
		PageVO pv = new PageVO(cri, us.userCnt());
		
		List<UserVO> userList = new ArrayList<>();
		userList = us.userList(cri);
		
		model.addAttribute("userList", userList);
		model.addAttribute("page", pv);
		
		return "main";
	}
	
	
	@RequestMapping(value ="updateUserInfo" , method=RequestMethod.POST)
	public String updateUserInfo(MultipartFile file , Model model , UserVO uv) throws Exception{
		
		logger.info("유저인포 업데이트로 왓는가요?");
		logger.info("file="+file);
		logger.info("uvo="+uv.getUname());
		us.user_profile(uv);
		
		return "redirect:mypage?uid="+uv.getUid()+"&uname="+uv.getUname()+"";
	}
	
	
	@RequestMapping(value = "message" , method=RequestMethod.POST)
	public void message(Model model) throws Exception {
		logger.info("message");
		
		
		
	}
	
	
}
