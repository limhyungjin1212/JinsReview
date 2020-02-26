package com.lhj.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	private static final String DRIVER="com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/lhj?serverTimezone=Asia/Seoul";
	private static final String USER = "root";
	private static final String PASSWORD = "aaaa";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		
		try (Connection con = DriverManager.getConnection(URL,USER,PASSWORD)){
			System.out.println(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
