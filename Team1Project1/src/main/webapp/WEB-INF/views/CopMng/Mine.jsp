<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CopMng/Mine</title>
</head>
<body>

	<jsp:include page="../inc/CopTop.jsp"></jsp:include>

	<header>
		<div class="">
			<h3>지원 자소서 모음</h3>
			<div class="">
				<table border="1">
				<tr><td>번호</td><td>제목</td><td>지원자</td><td>공고이름</td></tr>
					<c:forEach var="" items="">
						<tr>
							<td>${번호}</td>
							<td>${제목}</td>
							<td>${지원자}</td>
							<td>${공고이름}</td>
						</tr>
					</c:forEach>
			</div>
			</table>

			<!-- 페이지 번호 -->
			<c:if test="">
				<a href="">[이 전]</a>
			</c:if>

			<c:forEach var="" begin="" end="" step="1">
				<a href=""> $i}</a>
			</c:forEach>
			<!-- 페이지 번호 -->
			<c:if test="">
				<a href="">[다 음]</a>
			</c:if>
		</div>
</body>
</html>