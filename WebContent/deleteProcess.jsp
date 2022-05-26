<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBConn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String name =request.getParameter("name");

	try{
		String sql = "select id, name from person0526 where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs= pstmt.executeQuery();

		if(rs.next()){
			String nameDB = rs.getString("name");
			
			if(name.equals(nameDB)){
				sql = "delete from person0526 where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				%>
				<script>
					alert('삭제완료');
					location.href="select.jsp";
				</script>
				<%
			}
			else{
				%>
				<script>
					alert('이름을 다시 확인하세요');
					history.back(-1);
				</script>
				<%
				
			}
		}else{
			%>
			<script>
				alert('없는 사번입니다.');
				history.back(-1);
			</script>
			<%
		}
		
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("데이터 삭제 실패");
	}

%>