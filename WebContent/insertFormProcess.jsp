<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBConn.jsp" %>
<%
	PreparedStatement pstmt = null;
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String duty = request.getParameter("duty");
	String phone = request.getParameter("phone");

	try{
		String sql = "insert into person0526 values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, dept);
			pstmt.setString(4, position);
			pstmt.setString(5, duty);
			pstmt.setString(6, phone);
			
		pstmt.executeUpdate();
		System.out.println("데이터 입력 성공");
		
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("데이터 입력 실패");
	}

%>