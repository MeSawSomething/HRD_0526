<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	
	try{
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, "system", "1234");
		System.out.println("데이터베이스 연결 성공");
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("데이터베이스 연결 실패");
	}

%>
