<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 회원 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_mng.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>

		<div class="box">


			<h1>회원 관리</h1>
			<table border="1">
				<input type="text" placeholder="검색어를 입력하세요.">
				<button>검색</button>
				<tr>
					<!-- 			<td><select name="mtId"> -->
					<!-- 					<option value="all">전체</option> -->
					<!-- 					<option value="200">회원</option> -->
					<!-- 					<option value="100">관리자</option> -->
					<!-- 			</select></td> -->
					<!-- -->
					<td>회원 아이디</td>
					<td>회원 이름</td>
					<!--기업 회원의 경우 기업 이름-->

					<td>삭제</td>
				</tr>
				<c:forEach var="memberDTO" items="${memberList }">
					<tr>
						<!-- 			<td>회원 유형</td> -->
						<td>${memberDTO.memberId}</td>
						<td>${memberDTO.memberName}</td>

						<td><a
								href="${pageContext.request.contextPath }/manager/deleteMember?memberId=${memberDTO.memberId}">회원
								삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>