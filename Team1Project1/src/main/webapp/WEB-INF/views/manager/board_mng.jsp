<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 게시판 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/mng.jsp"></jsp:include>
	<div class="box">
		<h1>게시판 관리</h1>
		<ul>
			<li><a
					href="${pageContext.request.contextPath }/manager/review_employment_mng">취업
					후기 게시판 관리</a></li>
			<li><a
					href="${pageContext.request.contextPath }/manager/review_interview_mng">면접
					후기 게시판 관리</a></li>
			<li><a
					href="${pageContext.request.contextPath }/manager/FAQ_mng">FAQ
					게시판 관리</a></li>
		</ul>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>