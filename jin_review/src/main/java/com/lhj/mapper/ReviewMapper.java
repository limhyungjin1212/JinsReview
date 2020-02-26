package com.lhj.mapper;

import java.util.List;

import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

public interface ReviewMapper {
	//댓글 조회
		public List<ReviewVO> repList(int pno) throws Exception;
		
		//댓글 쓰기
		public void repWrite(ReviewVO rv) throws Exception;
		
		//댓글 수정
		public void repModify(ReviewVO rv) throws Exception;
		
		//댓글 삭제
		public void repDel(int rno) throws Exception;
		
		//댓글 조회 페이징
		public List<ReviewVO> repListPage(int pno,Criteria cri) throws Exception;
		
		//게시판에서 각 댓글의 첨부파일 불러오기
		public List<ReviewVO> repFileList(int pno) throws Exception;
		
		//댓글 총 갯수
		public int repCount(int pno) throws Exception;
		
		
		public int revCount() throws Exception;
		
		//댓글 조회 페이징
		public List<ReviewVO> revListPage(Criteria criteria) throws Exception;
		
		//내가 작성한 댓글 조회 페이징
		public List<ReviewVO> revMyListPage(String writer,Criteria criteria) throws Exception;
		
		//리뷰 쓸때 파일 업로드
		public void revAddAttach(String filename) throws Exception;
		
		//한 작성자 댓글 총 갯수와 도움이 된수
		public List<Integer> revCntHelpful(String writer) throws Exception;
		
		//도움이 된 수 증가
		public void HelpfulAdd(int rno,String uname) throws Exception;
		
		//도움이 된 수 감소
		public void Helpfuldis(int rno,String uname) throws Exception;
		
		//마이페이지 나의 댓글 갯수
		public int myRevCount(String writer) throws Exception;
		
		//마이페이지 첨부파일 불러오기
		public List<ReviewVO> revMyFile(String uname) throws Exception;
		
		//댓글 상세보기
		public ReviewVO revDetail(int rno) throws Exception;
		
		//댓글 상세보기 파일 불러오기
		public List<ReviewVO> revFileDetail(int rno) throws Exception;
		
		//댓글 수정시 파일 삭제.
		public void deleteRevAttach(int rno) throws Exception;
		
		//댓글 수정시 파일삭제후 다시 insert
		public void replaceRevAttach(String filename , int rno) throws Exception;
		
		//주간 리뷰
		public ReviewVO weekReview() throws Exception;
		
		//도움이 된 사람 리스트
		public List<String> revHelpfulList(int rno) throws Exception;
		
		//메인페이지 랜덤 리뷰 가져오기
		public ReviewVO mainRevGetAttach() throws Exception;
		
		//리뷰 사진 클릭시 원본이미지와 다불러오기
		public List<ReviewVO> revAttach(int rno) throws Exception;
		
}
