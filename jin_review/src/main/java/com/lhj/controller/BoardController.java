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
		revlist = reviewService.revListPage(cri); //리뷰 리스트
		
		List plist = new ArrayList();
		cri.setAmount(4);
		plist = boardService.boardListAttach(cri); //상품 리스트 4개씩.
		
		cri.setAmount(10);
		PageVO pv = new PageVO(cri, boardService.boardCount(cri));
		List adminList = new ArrayList();
		adminList = boardService.boardListPage(cri); //관리자 페이지 리스트
		
		model.addAttribute("revlist", revlist); //댓글리스트
		model.addAttribute("plist", plist); //상품 리스트
		model.addAttribute("adminList", adminList); //관리자 리스트
		ReviewVO wrv = reviewService.weekReview(); //주간 리뷰 
		wrv.setFn(wrv.getFn().substring(0,12)+wrv.getFn().substring(14)); //주간리뷰 원본파일로.
		model.addAttribute("weekReview",wrv);
		
		model.addAttribute("rpage",rpv);
		model.addAttribute("page",pv);
		
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
		logger.info("파일"+board.getFiles());
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
		logger.info("상세보기"+boardService.getAttach(pno));
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
		
		logger.info("더보기버튼 왓나요?"+pageNum);
		Criteria criteria = new Criteria();
		criteria.setPageNum(pageNum+1);
		logger.info("이거는요?"+criteria);
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
		
		logger.info("리뷰 수정으로 옴?"+rno);
		
		List revFileDetail = reviewService.revFileDetail(rno);
		logger.info("리뷰디테일 리스트="+revFileDetail);
		model.addAttribute("rv",reviewService.revDetail(rno));
		model.addAttribute("rfd",revFileDetail);
		
		
		return "board/reviewUpdate";
	}
	

	
	@RequestMapping(value="eventList", method = RequestMethod.GET)
	public String eventList(HttpServletRequest req,Model model) throws Exception {
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("eventList");
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
