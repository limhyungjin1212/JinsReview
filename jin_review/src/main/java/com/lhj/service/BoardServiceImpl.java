package com.lhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lhj.mapper.BoardMapper;
import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bm;
	
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return bm.boardList();
	}

	//寃뚯떆�뙋 湲��벐湲�
	@Transactional //�룞�떆�뿉
	@Override
	public void boardWrite(BoardVO board) throws Exception {
		bm.boardWrite(board);
		
		bm.boardAddDetail(board);
		System.out.println("boardgetfiles"+board.getFiles());
		String[] files = board.getFiles();
		if(files == null) {
			return;
		}
		for(String filename : files) {
			bm.addAttach(filename);
		}
		
		
	}

	@Transactional
	@Override
	public void boardUpdate(BoardVO board) throws Exception {
		bm.boardUpdate(board);
		
		int pno = board.getPno();
		
		bm.deleteAttach(pno);
		
		String[] files = board.getFiles();
		if(files == null) {
			return;
		}
		for(String filename : files) {
			System.out.println("�닔�젙�떆 �옱�벑濡� �뙆�씪�꽕�엫="+filename);
			System.out.println("�닔�젙�떆 �옱�벑濡� pno="+pno);
			bm.replaceAttach(filename, pno);
		}
	}

	@Transactional
	@Override
	public void boardDelete(int pno) throws Exception {
		bm.deleteAttach(pno);
		bm.boardDelete(pno);
		bm.deleteRep(pno);
	}

	@Override
	public List<BoardVO> boardListPage(Criteria cri) throws Exception {
		return bm.boardListPage(cri);
	}

	@Override
	public int boardCount(Criteria cri) throws Exception {
		return bm.boardCount(cri);
	}

	@Override
	public BoardVO boardDetail(int pno) throws Exception {
		return bm.boardDetail(pno);
	}

	@Override
	public List<String> getAttach(int pno) throws Exception {
		return bm.getAttach(pno);
	}

	@Override
	public List<BoardVO> boardListAttach(Criteria cri) throws Exception {
		return bm.boardListAttach(cri);
	}

	@Override
	public List<BoardVO> peventList(Criteria cri) throws Exception {
		return bm.peventList(cri);
	}

	@Override
	public int peventCnt() throws Exception {
		return bm.peventCnt();
	}

	@Override
	public BoardVO peventIng() throws Exception {
		return bm.peventIng();
	}

	
	
	
	

}
