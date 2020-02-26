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
	
	//게시판 글 쓰기 할떄 파일 업로드
	public void addAttach(String filename) throws Exception;
	
	//게시판 상세보기 파일 불러오기
	public List<String> getAttach(int pno) throws Exception;
	
	//메인페이지 이미지랑 글 불러오기
	public List<BoardVO> boardListAttach(Criteria cri) throws Exception;
	
	//파일 삭제
	public void deleteAttach(int pno) throws Exception;
	
	//파일 등록(수정시)
	public void replaceAttach(String filename , int pno) throws Exception;
	
	//검색 리스트
	
	
}
