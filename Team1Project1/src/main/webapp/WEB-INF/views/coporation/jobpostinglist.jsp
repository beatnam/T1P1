<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 업로드 공고 리스트</title>
<link rel="stylesheet" type="text/css" href="../css/selfintroductionletter.css">
</head>
<body>
				<!-- 다른계획있을시 수정 -->
	<jsp:include page="../inc/coptop.jsp"></jsp:include>

	<header>
		<div class="t2">
			<div class="">
			<h3>업로드 공고 리스트</h3>
				<table border="1">
					<c:forEach var="" items="">
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
						</tr>
					</c:forEach>
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
						</tr>
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
						</tr>
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
						</tr>
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
						</tr>
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
						</tr>
				</table>
				</div>
<!-- 			<div class=""> -->
			<!-- 페이지 번호 -->
<%-- 			<c:if test=""> --%>
<!-- 				<a href="">[이 전]</a> -->
<%-- 			</c:if> --%>

<%-- 			<c:forEach var="" begin="" end="" step="1"> --%>
<!-- 				<a href="">1 | 2 | 3 | 4 | 5</a> -->
				<div class="page-numbers">
				  <a href="">[이 전]</a>
				  <a href="">1</a>
				  <a href="">2</a>
				  <a href="">3</a>
				  <a href="">4</a>
				  <a href="">5</a>
				  <a href="">[다 음]</a>
				</div>
<%-- 			</c:forEach> --%>
			<!-- 페이지 번호 -->
<%-- 			<c:if test=""> --%>
<!-- 				<a href="">[다 음]</a> -->
<%-- 			</c:if> --%>
<!-- 			</div> -->
		</div>
		<div class="">
			<input type="button" value="공고 작성">
			<input type="button" value="공고 수정">
			<input type="button" value="공고 삭제">
		</div>


	</header>
</body>
</html>