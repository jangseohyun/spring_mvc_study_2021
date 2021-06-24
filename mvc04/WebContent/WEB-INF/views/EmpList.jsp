<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<!-------------------------------------------------------
    #31. EmpList.jsp
    - 직원 리스트 출력 페이지
    - 일반 직원이 접근하는 직원 데이터 출력 페이지
-------------------------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmpMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[  직원 리스트(일반직원 전용)  ]</h1>
		<hr>
		
		<br><br>
		
		<table id="customers" class="table">
			<tr>
				<!-- 항목 6EA -->
				<th>번호</th>
				<th>이름</th>
				<th>부서</th>
				<th>직위</th>
				<th>지역</th>
				<th>등급</th>
			</tr>
			<c:forEach var="item" items="${employeeList}">
				<tr>
					<td>${item.employeeId }</td>
					<td>${item.name }</td>
					<td>${item.departmentName }</td>
					<td>${item.positionName }</td>
					<td>${item.regionName }</td>
					<td>${item.grade==0 ? "관리자" : "일반직원"}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>
	
</div>

</body>
</html>