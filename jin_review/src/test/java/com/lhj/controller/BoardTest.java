package com.lhj.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lhj.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class) //�������Ҷ� �������������� Ŭ������ ���� ���� ���Ѷ�
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //context ȯ�漳���� ����ִ��� �ν� �����ֱ�����
public class BoardTest {
	
	@Autowired 
	private BoardService bs;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardTest.class);
	
	@Test
	public void boardListTest() throws Exception {
		//logger.info(""+bs.boardList());
	}
	
	
	
}
