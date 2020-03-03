package com.lhj.service;

import java.util.List;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;

public interface BoardService {
	
	//由ъ뒪�듃
	public List<BoardVO> boardList() throws Exception;

	//湲� �옉�꽦
	public void boardWrite(BoardVO board) throws Exception;

	//湲� �닔�젙
	public void boardUpdate(BoardVO board) throws Exception;

	// 湲� �궘�젣
	public void boardDelete(int pno) throws Exception;

	//�럹�씠吏� 泥섎━�븳 由ъ뒪�듃
	public List<BoardVO> boardListPage(Criteria cri) throws Exception;

	//�쟾泥� 媛��닔
	public int boardCount(Criteria cri) throws Exception;
	
	//�긽�꽭蹂닿린
	public BoardVO boardDetail(int pno) throws Exception;
	
	//寃뚯떆�뙋 �긽�꽭蹂닿린 �뙆�씪 遺덈윭�삤湲�
	public List<String> getAttach(int pno) throws Exception;
	
	//硫붿씤�럹�씠吏� �씠誘몄��옉 湲� 遺덈윭�삤湲�
	public List<BoardVO> boardListAttach(Criteria cri) throws Exception;
	
	//pventList
	public List<BoardVO> peventList(Criteria cri) throws Exception;
	
	//peventlist 갯수
		public int peventCnt() throws Exception;
		
		//pevent중 현재날짜에 진행하는 이벤트 하나 불러오기
		public BoardVO peventIng() throws Exception;
}
