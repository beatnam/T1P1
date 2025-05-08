<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>기업 관리 | 지원 이력서 모음</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
<div class="parent_div">
		<div>
			<button name="refresh" id="refresh" onclick="location.reload()">화면갱신</button>
		</div>
		<!-- 본문 영역 -->
		<div class="main_content">
			<h3>지원 자소서 모음</h3>
			<table border="1">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>지원자</td>
					<td>공고이름</td>
				</tr>
<%-- 				<c:forEach var="" items=""> --%>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>지원자</td>
						<td>공고이름</td>
					</tr>
<%-- 				</c:forEach> --%>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>지원자</td>
					<td>공고이름</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>지원자</td>
					<td>공고이름</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>지원자</td>
					<td>공고이름</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>지원자</td>
					<td>공고이름</td>
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

			<div class="apply_btn" id="apply_btn">
				<input type="button" id="m_btn" value="메시지 보내기">
				<input type="button" id="a_btn" value="합격 처리">
				<input type="button" id="na_btn" value="불합격 처리">
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>