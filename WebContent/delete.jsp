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
<h2>인사관리 사원정보삭제 화면</h2>

<form name="form" method="post" action="deleteProcess.jsp">
	<table border=1 id=table1>
		
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" value="">
		</tr>
		<tr>
			<th>사원번호</th>
			<td><input type="number" name="id" value="">
		</tr>
		<tr>
			<td colspan="2"><input type="submit" id="button1" value="삭제">
			<a href=""><input type="button" id="button1" value="취소"></a>
		</tr>
	</table>
</form>

</section>
<%@ include file ="footer.jsp" %>
</body>
</html>