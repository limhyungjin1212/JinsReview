package com.lhj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;
import com.lhj.model.PageVO;
import com.lhj.model.ReviewVO;
import com.lhj.service.BoardService;
import com.lhj.service.ReviewService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public void test() throws Exception{
		logger.info("boardListGet..");
		
	}
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String index(BoardVO boardVO,ReviewVO reviewVO,Criteria cri,Model model,HttpServletRequest req) throws Exception{
		
		PageVO rpv = new PageVO(cri, reviewService.revCount());
		List revlist = new ArrayList(); 
		revlist = reviewService.revListPage(cri); //由щ럭 由ъ뒪�듃
		
		List plist = new ArrayList();
		cri.setAmount(4);
		plist = boardService.boardListAttach(cri); //�긽�뭹 由ъ뒪�듃 4媛쒖뵫.
		
		cri.setAmount(10);
		PageVO pv = new PageVO(cri, boardService.boardCount(cri));
		List adminList = new ArrayList();
		adminList = boardService.boardListPage(cri); //愿�由ъ옄 �럹�씠吏� 由ъ뒪�듃
		
		model.addAttribute("revlist", revlist); //�뙎湲�由ъ뒪�듃
		model.addAttribute("plist", plist); //�긽�뭹 由ъ뒪�듃
		model.addAttribute("adminList", adminList); //愿�由ъ옄 由ъ뒪�듃
		ReviewVO wrv = reviewService.weekReview(); //二쇨컙 由щ럭 
		System.out.println(wrv.getFn());
		if(wrv.getFn() != null) {
			wrv.setFn(wrv.getFn().substring(0,12)+wrv.getFn().substring(14)); //二쇨컙由щ럭 �썝蹂명뙆�씪濡�.
		}
		model.addAttribute("weekReview",wrv);
		
		model.addAttribute("rpage",rpv);
		model.addAttribute("page",pv);
		model.addAttribute("peventing",boardService.peventIng());
		logger.info("boardService.peventIng()="+boardService.peventIng());
		model.addAttribute("mrga",reviewService.mainRevGetAttach());
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		
		return "index";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardListGet(BoardVO boardVO,Criteria cri,Model model,HttpServletRequest req) throws Exception{
		logger.info("boardListGet..");
		
		//List<BoardVO> list = boardService.boardList(); 
		PageVO pv = new PageVO(cri, boardService.boardCount(cri));
		
		model.addAttribute("list",boardService.boardListPage(cri));
		model.addAttribute("page",pv);
		
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info(req.getRequestURI().substring(req.getContextPath().length()));
		
		return "main";
	}
	
	@RequestMapping(value="register", method = RequestMethod.GET)
	public String registerGet(HttpServletRequest req) throws Exception{
		logger.info("registerGet..");
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info(req.getRequestURI().substring(req.getContextPath().length()));
		return "main";
	}
	
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String registerPost(BoardVO board , RedirectAttributes rttr) throws Exception{
		
		logger.info("registerPost.."+board);
		logger.info("�뙆�씪"+board.getFiles());
		logger.info("pevent="+board.getPevent());
		boardService.boardWrite(board);
		rttr.addFlashAttribute("msg","wsuccess");
		
		return "redirect:main";
	}
	
	
	@RequestMapping(value="detail" , method= RequestMethod.GET)
	public String detailGet(HttpServletRequest req,@RequestParam int pno,Model model) throws Exception {
		logger.info("detail"+pno);
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("User="+req.getHeader("User-Agent"));
		logger.info(req.getRequestURI().substring(req.getContextPath().length()));
		
		
		model.addAttribute("detail",boardService.boardDetail(pno));
		
		
		//model.addAttribute("cnt",rs.repCount(pno));
		
		
		return "main";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/detailJSON" , method= RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getAttach(@RequestParam int pno ) throws Exception{
		
		
		ResponseEntity<Map<String, Object>> entity = null;
		logger.info("pno="+pno);
		logger.info("�긽�꽭蹂닿린"+boardService.getAttach(pno));
		Map<String, Object> map = new HashMap<String, Object>();
		
		List boardAttachList = boardService.getAttach(pno);
		List repFileDetail = reviewService.repFileList(pno);
		
		map.put("boardAttachList", boardAttachList);
		map.put("repFileDetail", repFileDetail);
		
		return entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/addRevList" , method = RequestMethod.GET)
	public List<ReviewVO> addrevlist(@RequestParam int pageNum) throws Exception{
		
		logger.info("�뜑蹂닿린踰꾪듉 �솓�굹�슂?"+pageNum);
		Criteria criteria = new Criteria();
		criteria.setPageNum(pageNum+1);
		logger.info("�씠嫄곕뒗�슂?"+criteria);
		return reviewService.revListPage(criteria);
	}
	
	
	@RequestMapping(value="update" , method= RequestMethod.GET)
	public String updateGet(HttpServletRequest req,@RequestParam int pno,Model model) throws Exception {
		logger.info("updateGet");
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		model.addAttribute("update",boardService.boardDetail(pno));
		
		return "main";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String updatePost(BoardVO board , RedirectAttributes rttr) throws Exception{
		logger.info("updatePost.."+board);
		boardService.boardUpdate(board);
		rttr.addFlashAttribute("msg","usuccess");
		
		return "redirect:detail?pno="+board.getPno()+"";
	}
	
	@RequestMapping(value="delete" , method = RequestMethod.GET)
	public String deletePost(@RequestParam int pno,RedirectAttributes rttr) throws Exception{
		logger.info("delete..");
		
		boardService.boardDelete(pno);
		
		rttr.addFlashAttribute("msg","dsuccess");
		return "redirect:main";
	}
	
	//commit
	
	@RequestMapping(value = "productSearch" , method = RequestMethod.GET)
	public String prosearch(HttpServletRequest req , Criteria cri,Model model) throws Exception {
		logger.info("search?cri="+cri);
		
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		cri.setAmount(5);
		PageVO pv = new PageVO(cri, boardService.boardCount(cri));
		logger.info("pv="+pv);
		List searchList = new ArrayList();
		searchList = boardService.boardListAttach(cri);
		logger.info("searchList="+searchList);
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("page", pv);
		
		
		return "main";
	}
	
	
	@RequestMapping(value="reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdate(@RequestParam int rno,Model model) throws Exception {
		
		logger.info("由щ럭 �닔�젙�쑝濡� �샂?"+rno);
		
		List revFileDetail = reviewService.revFileDetail(rno);
		logger.info("由щ럭�뵒�뀒�씪 由ъ뒪�듃="+revFileDetail);
		model.addAttribute("rv",reviewService.revDetail(rno));
		model.addAttribute("rfd",revFileDetail);
		
		
		return "board/reviewUpdate";
	}
	

	
	@RequestMapping(value="eventList", method = RequestMethod.GET)
	public String eventList(HttpServletRequest req, Criteria cri,Model model) throws Exception {
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("eventList");
		PageVO pv = new PageVO(cri, boardService.peventCnt());
		List peventList = boardService.peventList(cri);
		
		model.addAttribute("peventList",peventList);
		
		return "main";
	}
	
	

	@RequestMapping(value="flagged", method = RequestMethod.GET)
	public String flagged(HttpServletRequest req,Model model) throws Exception {
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("Flagged");
		return "main";
	}
	
	@RequestMapping(value="suggestions", method = RequestMethod.GET)
	public String suggestions(HttpServletRequest req,Model model) throws Exception {
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("suggestions");
		return "main";
	}
	
	
	
	
	
}
