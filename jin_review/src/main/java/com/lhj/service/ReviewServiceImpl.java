package com.lhj.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lhj.mapper.ReviewMapper;
import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper rm;
	
	@Override
	public List<ReviewVO> repList(int pno) throws Exception {
		return rm.repList(pno);
	}

	@Transactional
	@Override
	public void repWrite(ReviewVO rv) throws Exception {
		rm.repWrite(rv);
		
		System.out.println("review get files"+rv.getFiles());
		String[] files = rv.getFiles();
		if(files == null) {
			return;
		}
		for(String filename : files) {
			rm.revAddAttach(filename);
		}
	}

	@Transactional
	@Override
	public void repModify(ReviewVO rv) throws Exception {
		rm.repModify(rv);
		
		int rno = rv.getRno();
		
		rm.deleteRevAttach(rno);
		System.out.println("삭제?"+rno);
		String[] files = rv.getFiles();
		if(files == null) {
			System.out.println("파일이 없습니당.");
			return;
		}
		for(String filename : files) {
			System.out.println("리뷰 수정시 재등록 파일네임="+filename);
			System.out.println("리뷰 수정시 재등록 rno="+rno);
			rm.replaceRevAttach(filename, rno);
		}
	}

	@Override
	public void repDel(int rno) throws Exception {
		rm.repDel(rno);
	}

	@Override
	public List<ReviewVO> repListPage(int pno, Criteria cri) throws Exception {
		List list = rm.repListPage(pno, cri);
		
		return list;
	}
	

	@Override
	public int repCount(int pno) throws Exception {
		return rm.repCount(pno);
	}
	
	@Override
	public int revCount() throws Exception {
		return rm.revCount();
	}
	@Override
	public List<Integer> revCntHelpful(String writer) throws Exception {
		return rm.revCntHelpful(writer);
	}

	@Override
	public void HelpfulAdd(int rno,String uname) throws Exception {
		rm.HelpfulAdd(rno,uname);
	}

	@Override
	public void Helpfuldis(int rno,String uname) throws Exception {
		rm.Helpfuldis(rno,uname);
	}

	@Override
	public List<ReviewVO> revMyListPage(String writer,Criteria criteria) throws Exception {
		return rm.revMyListPage(writer,criteria);
	}
	@Override
	public List<ReviewVO> revListPage(Criteria criteria) throws Exception {
		return rm.revListPage(criteria);
	}
	@Override
	public int myRevCount(String writer) throws Exception {
		return rm.myRevCount(writer);
	}

	@Override
	public ReviewVO revDetail(int rno) throws Exception {
		return rm.revDetail(rno);
	}

	@Override
	public List<ReviewVO> revFileDetail(int rno) throws Exception {
		return rm.revFileDetail(rno);
	}

	@Override
	public List<ReviewVO> repFileList(int pno) throws Exception {
		return rm.repFileList(pno);
	}

	@Override
	public List<ReviewVO> revMyFile(String uname) throws Exception {
		return rm.revMyFile(uname);
	}

	@Override
	public ReviewVO weekReview() throws Exception {
		return rm.weekReview();
	}

	@Override
	public List<String> revHelpfulList(int rno) throws Exception {
		return rm.revHelpfulList(rno);
	}

	@Override
	public ReviewVO mainRevGetAttach() throws Exception {
		return rm.mainRevGetAttach();
	}

	@Override
	public List<ReviewVO> revAttach(int rno) throws Exception {
		return rm.revAttach(rno);
	}
	
}
