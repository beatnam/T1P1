
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | FAQ 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
	<jsp:include page="../inc/mng.jsp"></jsp:include>
	<div class="box">
	<h1>FAQ 관리</h1>
	<a href="${pageContext.request.contextPath }/manager/FAQ_write">자주
		묻는 질문 등록</a>
	<table border="1">

		<tr>
			<td>글번호</td>
			<td>질문 내용</td>
			<td>답변</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>

		<c:forEach var="FAQ" items="${listFAQ}">
			<tr>
				<td>${FAQ.faq_num }</td>
				<td>${FAQ.faq_subject}</td>
				<td>${FAQ.faq_content}</td>
				<td><a
						href="${pageContext.request.contextPath}/manager/FAQ_update?faqNum=${FAQ.faq_num}">
						수정 </a></td>
				<td><a
						href="${pageContext.request.contextPath}/manager/FAQ_delete?faqNum=${FAQ.faq_num}">
						삭제 </a></td>
			</tr>
		</c:forEach>
	</table>
</div></div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>