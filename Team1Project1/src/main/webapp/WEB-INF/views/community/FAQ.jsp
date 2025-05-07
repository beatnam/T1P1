<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 자주 묻는 질문</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">

</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>

	<table border="1">
		<c:forEach var="FAQ" items="${listFAQ}">
			<tr>
				<td>질문 내용</td>
				<td>${FAQ.faq_subject}</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>${FAQ.faq_content}</td>
			</tr>


		</c:forEach>
	</table>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>