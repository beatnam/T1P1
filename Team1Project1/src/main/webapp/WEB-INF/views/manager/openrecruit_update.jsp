<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>관리자 페이지 | 공개 채용 수정</title>

</head>

<body>
 <jsp:include page="../inc/top.jsp"></jsp:include>
	<ul>
		<li><a href="member_mng.html">회원 관리</a></li>

		<li><a href="openrecruit_mng.html">채용 공고 관리</a>
			<ul>
				<li><a href="openrecruit_mng.html">공개 채용 관리</a></li>
				<li><a href="alwaysrecruit_mng.html">상시 채용 관리</a></li>
			</ul></li>

		<li><a href="board_mng.html">게시판 관리</a>
			<ul>
				<li><a href="review_employment_mng.html">취업 후기 게시판 관리</a></li>
				<li><a href="review_interview_mng.html">면접 후기 게시판 관리</a></li>
				<li><a href="FAQ_mng.html">FAQ 게시판 관리</a></li>
			</ul></li>

		<li><a href="fair_mng.html">취업 박람회 관리</a></li>
	</ul>
	<div>

		<h1>공개 채용 수정</h1>
		<form action="#" method="post">
			<label for="or_corporation_name">회사명:</label> <input type="text"
				id="or_corporation_name" name="or_corporation_name"
				placeholder="회사명" required><br> <label for="or_name">공고명:</label>
			<input type="text" id="or_name" name="or_name" placeholder="공고명"
				required><br> <label for="or_occupation">직종:</label> <input
				type="text" id="or_occupation" name="or_occupation" placeholder="직종"
				required><br> <label for="or_job">직무:</label> <input
				type="text" id="or_job" name="or_job" placeholder="직무" required><br>

			<label for="or_eduhigh">학력:</label> <input type="text"
				id="or_eduhigh" name="or_eduhigh" placeholder="학력" required><br>

			<label for="or_location">지역:</label> <input type="text"
				id="or_location" name="or_location" placeholder="지역" required><br>

			<label for="or_salary">연봉:</label> <input type="text" id="or_salary"
				name="or_salary" placeholder="연봉" required><br> <label
				for="or_url">회사 홈페이지:</label> <input type="text" id="or_url"
				name="or_url" placeholder="회사 홈페이지" required><br> <label
				for="or_deadline">마감일:</label> <input type="text" id="or_deadline"
				name="or_deadline" placeholder="마감일" required><br> <input
				type="submit" value="수정"> <input type="reset" value="초기화"><br>
		</form>
	</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>