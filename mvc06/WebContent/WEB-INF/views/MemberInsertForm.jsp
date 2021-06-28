<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
</head>
<body>

<div>
	<h1>회원 명단</h1>
	<hr>
</div>

<div>
	<form action="memberinsert.action" method="post" id="memberForm">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" name="id"/></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="pw" name="pw"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="name" name="name"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="tel" name="tel"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" id="email" name="email"/></td>
		</tr>
		<tr>
			<th><button type="submit">등록</button>
		</tr>
	</table>
	</form>
</div>

</body>
</html>