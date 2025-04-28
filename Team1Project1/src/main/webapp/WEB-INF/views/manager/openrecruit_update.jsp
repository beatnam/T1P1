<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>관리자 페이지 | 공개 채용 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/mng.jsp"></jsp:include>

		<h1>공개 채용 수정</h1>
		<form action="#" method="post">
			<label for="or_corporation_name">회사명:</label>
			<input type="text" id="or_corporation_name"
				name="orCorporationName" placeholder="회사명" required>
			<br>
			<label for="or_name">공고명:</label>
			<input type="text" id="or_name" name="orName" placeholder="공고명"
				required>
			<br>
			<label for="or_occupation">직종:</label>
			<input type="text" id="or_occupation" name="orOccupation"
				placeholder="직종" required>
			<br>
			<label for="or_job">직무:</label>
			<input type="text" id="or_job" name="orJob" placeholder="직무"
				required>
			<br>

			<label for="or_eduhigh">학력:</label>
			<input type="text" id="or_eduhigh" name="orEduhigh" placeholder="학력"
				required>
			<br>

			<label for="or_location">지역:</label>
			<input type="text" id="or_location" name="orLocation"
				placeholder="지역" required>
			<br>

			<label for="or_salary">연봉:</label>
			<input type="text" id="or_salary" name="orSalary" placeholder="연봉"
				required>
			<br>
			<label for="or_url">회사 홈페이지:</label>
			<input type="text" id="or_url" name="orUrl" placeholder="회사 홈페이지"
				required>
			<br>
			<label for="or_deadline">마감일:</label>
			<input type="text" id="or_deadline" name="orDeadline"
				placeholder="마감일" required>
			<br>
			<input type="submit" value="수정">
			<input type="reset" value="초기화">
			<br>
		</form>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>