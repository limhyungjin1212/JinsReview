package com.lhj.controller;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class) //�������Ҷ� �������������� Ŭ������ ���� ���� ���Ѷ�
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //context ȯ�漳���� ����ִ��� �ν� �����ֱ�����
public class ConnectionPoolTest {
	@Autowired //ã�ƺ� root-context�� bean id = dataSource ���ذ� ã���ִµ�?? 
	//DataSource dataSource = new DataSource();
	private DataSource dataSource;
	
	
	@Autowired 
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnetion() {
		try (
				SqlSession session = sqlSessionFactory.openSession();
				Connection con = dataSource.getConnection()) {
			System.out.println("session="+session);
			
			
			System.out.println("con="+con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
