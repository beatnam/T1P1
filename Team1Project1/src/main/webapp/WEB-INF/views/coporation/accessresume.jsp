<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 이력서 열람실</title>
</head>
<body>
	
	
	<jsp:include page="../inc/coptop.jsp"></jsp:include>

	<header>
		<div class="">
			<h3>이력서 열람실</h3>
			<div class="">
				<table border="1">
				<tr><td>번호</td><td>제목</td><td>직무</td></tr>
					<c:forEach var="" items="">
						<tr>
							<td>${번호}</td>
							<td>${제목}</td>
							<td>${공고이름}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- 페이지 번호 -->
			<c:if test="">
				<a href="">[이 전]</a>
			</c:if>

			<c:forEach var="" begin="" end="" step="1">
				<a href="">1 | 2 | 3 | 4 | 5</a>
			</c:forEach>
			<!-- 페이지 번호 -->
			<c:if test="">
				<a href="">[다 음]</a>
			</c:if>
		</div>
	</header>
	
	
	
</body>
</html>