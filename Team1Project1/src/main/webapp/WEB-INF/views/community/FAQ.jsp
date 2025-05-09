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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/community.css">

</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/community.jsp"></jsp:include>
		<div class="box">
			<div class="main-content">
				<h3>자주 묻는 질문</h3>
				<c:forEach var="FAQ" items="${listFAQ}">
					<table class="qna-table">

						<tr class="question">
							<td>Q</td>
							<td>${FAQ.faq_subject}</td>
						</tr>
						<tr class="answer">
							<td>A</td>
							<td>${FAQ.faq_content}</td>
						</tr>


					</table>
					<br>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>