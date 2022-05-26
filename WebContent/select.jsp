<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 시스템 Index</title>
<%@ include file ="header.jsp" %>
<%@ include file = "DBConn.jsp" %>



</head>
<body>
<section>
<h2>직원 정보 조회</h2>

<form name="form" method="post" action="insertFormProcess.jsp">
	<table border=1 id=table1>
		<tr>
			<th>no</th>
			<th>성명</th>
			<th>사번</th>
			<th>직급</th>
			<th>직책</th>
			<th>연락처</th>
			<th>소속부서</th>
		</tr>
		<tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null; 
int count = 0;

try{
	String sql = "select * from person0526";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		String name = rs.getString(2);
		int id = rs.getInt(1);
		String dept = rs.getString(3);
		String position = rs.getString(4);
		String duty = rs.getString(5);
		String phone = rs.getString(6);
		count++;

%>
			<td><%=count %></td>
			<td><%=name %></td>
			<td><a href="update.jsp?id=<%=id %>"><%=id %></a></td>
			<td><%=position %></td>
			<td><%=duty %></td>
			<td><%=phone %></td>
			<td><%=dept %></td>
		</tr>
<%
	}
}
catch(Exception e){
	e.printStackTrace();
}

%>
	</table>
</form>

</section>
<%@ include file ="footer.jsp" %>
</body>
</html>