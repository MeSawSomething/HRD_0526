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
		String sql = "update person0526 set name=?, dept=?, position=?, duty=?, phone=? where id=?";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(6, id);
			pstmt.setString(1, name);
			pstmt.setString(2, dept);
			pstmt.setString(3, position);
			pstmt.setString(4, duty);
			pstmt.setString(5, phone);
			
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		
%>
<script>
	alert('데이터 수정 성공');
	location.href("select.jsp");
</script>
<%		
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("데이터 수정 실패");
	}

%>