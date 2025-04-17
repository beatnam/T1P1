<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CopMng/up</title>
</head>
<body>
				<!-- 다른계획있을시 수정 -->
	<jsp:include page="../inc/CopTop.jsp"></jsp:include>

	<header>
		<div class="">
			<h3>업로드 했던 공고리스트</h3>
			<div class="">
				<table border="1">
					<c:forEach var="" items="">
						<tr>
							<td>${번호}</td>
							<td>${공고이름}</td>
							<td>${마감일자}</td>
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
		<div class="">
			<input type="button" value="공고 작성">
			<input type="button" value="공고 수정">
			<input type="button" value="공고 삭제">
		</div>


	</header>
</body>
</html>