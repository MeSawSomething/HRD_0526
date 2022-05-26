<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 시스템 Index</title>
<%@ include file ="header.jsp" %>
<%@ include file = "DBConn.jsp" %>
<script>
function check(){
	if(document.form.id.value==""){
		alert('사원번호가 입력되지 않았습니다.');
		document.form.id.focus();
		return false;
	}
	if(document.form.name.value==""){
		alert('이름이 입력되지 않았습니다.');
		document.form.name.focus();
		return false;
	}
	if(document.form.dept.value==""){
		alert('소속부서가 입력되지 않았습니다.');
		document.form.dept.focus();
		return false;
	}
	else{
		document.form.submit();
	}
}
</script>
<%
PreparedStatement pstmt = null;
ResultSet rs = null; 
String id = request.getParameter("id");

try{
	String sql = "select * from person0526 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		String name = rs.getString(2);
		String dept = rs.getString(3);
		String position = rs.getString(4);
		String duty = rs.getString(5);
		String phone = rs.getString(6);
		

%>

</head>
<body>
<section>
<h2>인사관리 사원등록 화면</h2>

<form name="form" method="post" action="updateProcess.jsp">
	<table border=1 id=table1>
		<tr>
			<th>사원번호</th>
			<td><input type="number" name="id" value="<%=id %>" readonly>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" value="<%=name%>">
		</tr>
		<tr>
			<th>소속부서</th>
			<td><select name="dept" value="<%=dept%>">
				<option value="인사부"<%if(dept.equals("인사부")){%>selected<%} %>>인사부</option>
				<option value="경리부"<%if(dept.equals("경리부")){%>selected<%} %>>경리부</option>
				<option value="홍보부"<%if(dept.equals("홍보부")){%>selected<%} %>>홍보부</option>
				<option value="기획부"<%if(dept.equals("기획부")){%>selected<%} %>>기획부</option>
				<option value="영업부"<%if(dept.equals("영업부")){%>selected<%} %>>영업부</option>
			</select>
		</tr>
		<tr>
			<th>직급</th>
			<td><select name="position" value="<%=position%>">
				<option value="1"<%if(position.equals("1")){%>selected<%} %>>1급</option>
				<option value="2"<%if(position.equals("2")){%>selected<%} %>>2급</option>
				<option value="3"<%if(position.equals("3")){%>selected<%} %>>3급</option>
				<option value="4"<%if(position.equals("4")){%>selected<%} %>>4급</option>
				<option value="5"<%if(position.equals("5")){%>selected<%} %>>5급</option>
			</select>
		</tr>
		<tr>
			<th>직책</th>
			<td><input type="text" name="duty" value="<%=duty%>">
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone" value="<%=phone%>">
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="button1" value="등록" onclick="check()">
			<a href=""><input type="button" id="button1" value="취소"></a>
		</tr>
		
<%
	}
	
	System.out.println("수정데이터 불러오기 성공");
}catch(Exception e){
	e.printStackTrace();
	System.out.println("수정데이터 불러오기 실패");
}

%>

	</table>
</form>

</section>
<%@ include file ="footer.jsp" %>
</body>
</html>