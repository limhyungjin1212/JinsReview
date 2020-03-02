package com.lhj.mapper;

import java.util.List;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;

public interface BoardMapper {
	public List<BoardVO> boardList() throws Exception;
	
	public void boardWrite(BoardVO board) throws Exception;
	
	public void boardUpdate(BoardVO board) throws Exception;
	
	public void boardDelete(int pno) throws Exception;
	
	public List<BoardVO> boardListPage(Criteria cri) throws Exception;
	
	public int boardCount(Criteria cri) throws Exception;
	
	public BoardVO boardDetail(int pno) throws Exception;
	
	//寃뚯떆�뙋 湲� �벐湲� �븷�뻹 �뙆�씪 �뾽濡쒕뱶
	public void addAttach(String filename) throws Exception;
	
	//寃뚯떆�뙋 �긽�꽭蹂닿린 �뙆�씪 遺덈윭�삤湲�
	public List<String> getAttach(int pno) throws Exception;
	
	//硫붿씤�럹�씠吏� �씠誘몄��옉 湲� 遺덈윭�삤湲�
	public List<BoardVO> boardListAttach(Criteria cri) throws Exception;
	
	//�뙆�씪 �궘�젣
	public void deleteAttach(int pno) throws Exception;
	
	//�뙆�씪 �벑濡�(�닔�젙�떆)
	public void replaceAttach(String filename , int pno) throws Exception;
	
	//寃��깋 由ъ뒪�듃
	
	//寃뚯떆�뙋 �궘�젣�떆 �뙎湲��룄 �궘�젣
	public void deleteRep(int pno) throws Exception;
	
	//디테일 추가
	public void boardAddDetail(BoardVO board) throws Exception;
	
}
