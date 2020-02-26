package com.lhj.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

@Repository
public class ReviewMapperImpl implements ReviewMapper {

	@Autowired
	private SqlSession session;
	private static final String namespace ="com.lhj.mapper.ReviewMapper";
	
	
	@Override
	public List<ReviewVO> repList(int pno) throws Exception {
		List list = session.selectList(namespace+".repList",pno);
		return list;
	}

	@Override
	public void repWrite(ReviewVO rv) throws Exception {
		session.insert(namespace+".repWrite",rv);
	}

	@Override
	public void repModify(ReviewVO rv) throws Exception {
			session.update(namespace+".repModify",rv);
		}

	@Override
	public void repDel(int rno) throws Exception {
		session.delete(namespace+".repDel",rno);
	}

	@Override
	public List<ReviewVO> repListPage(int pno, Criteria cri) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		param.put("pno", pno);
		param.put("cri", cri);
		
		List pagelist = session.selectList(namespace+".repListPage",param);
		System.out.println("pagelist="+pagelist);
		return pagelist;
	}

	@Override
	public int repCount(int pno) throws Exception {
		int cnt = session.selectOne(namespace+".repCount",pno); 
		return cnt;
	}

	@Override
	public int revCount() throws Exception {
		int cnt = session.selectOne(namespace+".revCount"); 
		return cnt;
	}
	@Override
	public void revAddAttach(String filename) throws Exception {
		session.insert(namespace+".revAddAttach",filename);
	}

	@Override
	public List<Integer> revCntHelpful(String writer) throws Exception {
		List list = session.selectList(namespace+".revCntHelpful",writer);
		return list;
	}

	@Override
	public void HelpfulAdd(int rno,String uname) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rno", rno);
		paramMap.put("uname", uname);
		session.insert(namespace+".HelpfulAdd",paramMap);
	}

	@Override
	public void Helpfuldis(int rno,String uname) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rno", rno);
		paramMap.put("uname", uname);
		session.delete(namespace+".Helpfuldis",paramMap);
	}

	@Override
	public List<ReviewVO> revMyListPage(String writer,Criteria criteria) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("writer", writer);
		paramMap.put("cri", criteria);
		
		List<ReviewVO> revMyList = session.selectList(namespace+".revMyListPage",paramMap);
		System.out.println("revmylist="+revMyList);
		return revMyList;
	}

	@Override
	public int myRevCount(String writer) throws Exception {
		return session.selectOne(namespace+".myRevCount",writer);
	}

	@Override
	public List<ReviewVO> revListPage(Criteria criteria) throws Exception {
		List<ReviewVO> revlist = session.selectList(namespace+".revListPage",criteria);
		return revlist;
	}

	@Override
	public ReviewVO revDetail(int rno) throws Exception {
		ReviewVO revDetail= session.selectOne(namespace+".revDetail",rno);
		return revDetail;
	}

	@Override
	public List<ReviewVO> revFileDetail(int rno) throws Exception {
		List<ReviewVO> revFileList = session.selectList(namespace+".revFileDetail",rno); 
		return revFileList;
	}

	@Override
	public List<ReviewVO> repFileList(int pno) throws Exception {
		List<ReviewVO> repFileList = session.selectList(namespace+".repFileList",pno);
		return repFileList;
	}

	@Override
	public List<ReviewVO> revMyFile(String uname) throws Exception {
		List<ReviewVO> revMyFile = session.selectList(namespace+".revMyFile",uname);
		return revMyFile;
	}

	@Override
	public void deleteRevAttach(int rno) throws Exception {
		session.delete(namespace+".deleteRevAttach",rno);
	}

	@Override
	public void replaceRevAttach(String filename, int rno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filename", filename);
		paramMap.put("rno", rno);
		
		session.insert(namespace+".replaceRevAttach",paramMap);
	}

	@Override
	public ReviewVO weekReview() throws Exception {
		return session.selectOne(namespace+".weekReview");
	}

	@Override
	public List<String> revHelpfulList(int rno) throws Exception {
		List<String> revHelpfulList = session.selectList(namespace+".revHelpfulList",rno);
		return revHelpfulList;
	}

	@Override
	public ReviewVO mainRevGetAttach() throws Exception {
		return session.selectOne(namespace+".mainRevGetAttach");
	}

	@Override
	public List<ReviewVO> revAttach(int rno) throws Exception {
		List<ReviewVO> revAttachList = session.selectList(namespace+".revAttach",rno); 
		return revAttachList;
	}
	
	
	

}
