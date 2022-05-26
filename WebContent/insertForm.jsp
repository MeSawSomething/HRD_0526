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
int sq = 0;

try{
	String sql = "select id_0526.nextval from dual"; //일단 dual에서 불러오기로 시도
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	if(rs.next()){
		sq = rs.getInt(1); 
	}
	
	System.out.println("시퀀스 불러오기 성공");
}catch(Exception e){
	e.printStackTrace();
	System.out.println("시퀀스 불러오기 실패");
}

%>
</head>
<body>
<section>
<h2>인사관리 사원등록 화면</h2>

<form name="form" method="post" action="insertFormProcess.jsp">
	<table border=1 id=table1>
		<tr>
			<th>사원번호</th>
			<td><input type="number" name="id" value="<%=sq %>" readonly>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" value="">
		</tr>
		<tr>
			<th>소속부서</th>
			<td><select name="dept" value="dept">
				<option value="인사부">인사부</option>
				<option value="경리부">경리부</option>
				<option value="홍보부">홍보부</option>
				<option value="기획부">기획부</option>
				<option value="영업부">영업부</option>
			</select>
		</tr>
		<tr>
			<th>직급</th>
			<td><select name="position" value="position">
				<option value="1">1급</option>
				<option value="2">2급</option>
				<option value="3">3급</option>
				<option value="4">4급</option>
				<option value="5">5급</option>
			</select>
		</tr>
		<tr>
			<th>직책</th>
			<td><input type="text" name="duty" value="">
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone" value="">
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="button1" value="등록" onclick="check()">
			<a href=""><input type="button" id="button1" value="취소"></a>
		</tr>
	</table>
</form>

</section>
<%@ include file ="footer.jsp" %>
</body>
</html>