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
<title>EmployeeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
<body>

<!-------------------------------------------------------
    #14. EmployeeList.jsp
    - 직원 리스트 출력 페이지
    - 관리자가 접근하는 직원 데이터 출력 페이지
      (일반 직원이 접근하는 직원 데이터 출력 페이지는
       EmpList.jsp로 구성 예정)
-------------------------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[  직원 관리  ]</h1>
		<hr>
		<div>
			<form action="">
				<input type="button" value="직원 추가" class="btn">
			</form>
		</div>
		
		<br><br>
		
		<table id="customers" class="table">
			<tr>
				<!-- 항목 15EA -->
				<th>번호</th>
				<th>이름</th>
				<th>주민번호</th>
				<th>생년월일</th>
				<th>양/음력</th>
				<th>전화번호</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>기본급</th>
				<th>수당</th>
				<th>급여</th>
				<th>등급</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<!-- 
			<tr>
				<td>1</td>
				<td>박나현</td>
				<td>631212</td>
				<td>1963-12-12</td>
				<td>양력</td>
				<td>010-1111-1111</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>1,500,000</td>
				<td>1,000,000</td>
				<td>2,500,000</td>
				<td>관리자</td>
				<td><button type="button" class="btn">수정</button></td>
				<td><button type="button" class="btn">삭제</button></td>
			</tr>
			-->

			<c:forEach var="item" items="${employeeList}">
				<tr>
					<td>${item.employeeId }</td>
					<td>${item.name }</td>
					<td>${item.ssn }-******</td>
					<td>${item.birthday }</td>
					<td>${item.lunarName }</td>
					<td>${item.telephone }</td>
					<td>${item.departmentName }</td>
					<td>${item.positionName }</td>
					<td>${item.regionName }</td>
					<%-- <td>${item.basicPay }</td> --%>
					<td>
						<fmt:formatNumber value="${item.basicPay }" groupingUsed="true"></fmt:formatNumber>
					</td>
					<%-- <td>${item.extraPay }</td> --%>
					<td>
						<fmt:formatNumber value="${item.extraPay }" groupingUsed="true"></fmt:formatNumber>
					</td>
					<%-- <td>${item.pay }</td> --%>
					<td>
						<fmt:formatNumber value="${item.pay }" groupingUsed="true"></fmt:formatNumber>
					</td>
					<%-- <td>${item.grade }</td> --%>
					<td>${item.grade==0 ? "관리자" : "일반직원"}</td>
					<td><button type="button" class="btn">수정</button></td>
					<td><button type="button" class="btn">삭제</button></td>
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