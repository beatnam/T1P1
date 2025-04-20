<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- <!DOCTYPE html> -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<html>
<head>
<meta charset="UTF-8">

<title>취업 정보 | 취업 박람회</title>
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
	<h1>취업 박람회</h1>
	<a href="../manager/fair_mng.html">박람회 관리</a>
	<!-- 관리자 페이지로 이동-->

	<input type="text" placeholder="검색어를 입력하세요.">
	<button type="button">검색</button>
	<!-- 검색 기능 추가 -->
	<div class="menu">
		<ul>
			<li><a href="open.html">공개 채용</a></li>
			<li><a href="always.html">상시 채용</a></li>
			<li><a href="fair.html">취업 박람회</a></li>
			<li><a href="50.html">50대 기업</a></li>
		</ul>
	</div>

	<tr>
		<td>박람회 사진1</td>
		<td>박람회 사진 2</td>
	</tr>
	밑으로 쭉 내려가고 사진 누르면 박람회 홈페이지로 이동

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>