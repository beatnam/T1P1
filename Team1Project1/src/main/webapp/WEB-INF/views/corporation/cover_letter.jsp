<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 지원 자소서 모음</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
	<div class="parent_div">
		<!-- 본문 영역 -->
		<div class="main_content">
			<h3>지원 자소서 모음</h3>
			<table border="1">
<%-- 				<c:forEach var="" items=""> --%>
					<tr>
						<td>번호</td>
						<td>자소서이름</td>
						<td>마감일자</td>
					</tr>
<%-- 				</c:forEach> --%>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
			</table>
			<!-- 			<div class=""> -->
			<!-- 페이지 번호 -->
			<%-- 			<c:if test=""> --%>
			<!-- 				<a href="">[이 전]</a> -->
			<%-- 			</c:if> --%>

			<%-- 			<c:forEach var="" begin="" end="" step="1"> --%>
			<!-- 				<a href="">1 | 2 | 3 | 4 | 5</a> -->
			<div class="page_numbers">
				<a href="">[이 전]</a> <a href="">1</a> <a href="">2</a> <a href="">3</a>
				<a href="">4</a> <a href="">5</a> <a href="">[다 음]</a>
			</div>
			<%-- 			</c:forEach> --%>
			<!-- 페이지 번호 -->
			<%-- 			<c:if test=""> --%>
			<!-- 				<a href="">[다 음]</a> -->
			<%-- 			</c:if> --%>
			<!-- 			</div> -->

		</div>
	</div>
</div>
</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>