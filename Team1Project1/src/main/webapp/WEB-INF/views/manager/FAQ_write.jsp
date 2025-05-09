<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>관리자 | FAQ 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include><div class="all">
	<jsp:include page="../inc/mng.jsp"></jsp:include>
	<div class="box">
	<h1>FAQ 등록</h1>

	<form action="${pageContext.request.contextPath }/manager/FAQ_writePro"
		method="post">
		<label for="faq_subject">faq_subject:</label> <br>
		<input type="text" id="faq_subject" name="faqSubject" required>
		<br> <br> <label for="faq_content">faq_content:</label> <br>
		<input type="text" id="faq_content" name="faqContent" required>
		<br> <br>
		<input type="submit" value="등록">
	</form>
	</div></div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>