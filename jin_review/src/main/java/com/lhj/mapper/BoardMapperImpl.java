package com.lhj.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;

@Repository
public class BoardMapperImpl implements BoardMapper {

	@Autowired
	private SqlSession session;
	private static final String namespace ="com.lhj.mapper.BoardMapper";
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		List<BoardVO> list = session.selectList(namespace+".boardList");
		return list;
	}

	@Override
	public void boardWrite(BoardVO board) throws Exception {
		session.insert(namespace+".boardWrite",board);
	}

	@Override
	public void boardUpdate(BoardVO board) throws Exception {
		session.update(namespace+".boardUpdate",board);
	}

	@Override
	public void boardDelete(int pno) throws Exception {
		session.delete(namespace+".boardDelete",pno);
	}

	@Override
	public List<BoardVO> boardListPage(Criteria cri) throws Exception {
		List list = session.selectList(namespace+".boardListPage",cri);
		return list;
	}

	@Override
	public int boardCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".boardCount",cri);
	}

	@Override
	public BoardVO boardDetail(int pno) throws Exception {
		return session.selectOne(namespace+".boardDetail",pno);
	}
	
	//게시판 파일 업로드
		@Override
		public void addAttach(String filename) throws Exception {
			session.insert(namespace+".addAttach",filename);
		}

		@Override
		public List<String> getAttach(int pno) throws Exception {
			List list = session.selectList(namespace+".getAttach",pno);
			return list;
		}

		@Override
		public List<BoardVO> boardListAttach(Criteria cri) throws Exception {
			List<BoardVO> list = session.selectList(namespace+".boardListAttach",cri);
			return list;
		}

		@Override
		public void deleteAttach(int pno) throws Exception {
			session.delete(namespace+".deleteAttach",pno);
		}

		@Override
		public void replaceAttach(String filename, int pno) throws Exception {
			Map<String, Object> param = new HashMap<>();
			
			param.put("filename", filename);
			param.put("pno", pno);
			
			session.insert(namespace+".replaceAttach",param);
		}

}
