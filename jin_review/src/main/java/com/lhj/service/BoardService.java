package com.lhj.service;

import java.util.List;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;

public interface BoardService {
	
	//리스트
	public List<BoardVO> boardList() throws Exception;

	//글 작성
	public void boardWrite(BoardVO board) throws Exception;

	//글 수정
	public void boardUpdate(BoardVO board) throws Exception;

	// 글 삭제
	public void boardDelete(int pno) throws Exception;

	//페이징 처리한 리스트
	public List<BoardVO> boardListPage(Criteria cri) throws Exception;

	//전체 갯수
	public int boardCount(Criteria cri) throws Exception;
	
	//상세보기
	public BoardVO boardDetail(int pno) throws Exception;
	
	//게시판 상세보기 파일 불러오기
	public List<String> getAttach(int pno) throws Exception;
	
	//메인페이지 이미지랑 글 불러오기
	public List<BoardVO> boardListAttach(Criteria cri) throws Exception;
	
		
}
