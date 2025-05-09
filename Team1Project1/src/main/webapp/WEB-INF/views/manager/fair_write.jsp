<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>관리자 | 취업박람회 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
	<jsp:include page="../inc/mng.jsp"></jsp:include>
	<div class="box">
		<h1>취업 박람회 등록</h1>

		<form action="#" method="post">
			<label for="convention_name">박람회명:</label>
			<br>
			<input type="text" id="convention_name" name="conventionName"
				required>
			<br>
			<br>

			<input type="file" id="convention_photo" name="conventionPhoto"
				accept="image/*">
			<br>
			<br>

			<label for="convention_location">박람회 장소:</label>
			<br>
			<input type="text" id="convention_location" name="conventionLocation"
				required>
			<br>
			<br>

			<label for="convention_url">박람회 홈페이지:</label>
			<br>
			<input type="url" id="convention_url" name="conventionUrl" required>
			<br>
			<br>

			<label for="convention_startdate">박람회 시작 날짜:</label>
			<br>
			<input type="date" id="convention_startdate"
				name="conventionStartdate" required>
			<br>
			<br>

			<label for="convention_enddate">박람회 종료 날짜:</label>
			<br>
			<input type="date" id="convention_enddate" name="conventionEnddate"
				required>
			<br>
			<br>

			<input type="submit" value="등록">
		</form>
	</div></div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>