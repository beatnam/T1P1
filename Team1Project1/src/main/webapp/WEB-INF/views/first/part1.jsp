<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 조건 선택</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/partone.css">
</head>
<body>
	<div class="card">
		<h2>희망 조건을 선택하세요</h2>

		<form action="${pageContext.request.contextPath}/first/filteringPro"
			method="post">

			<div id="jobCategoryDiv" class="">
				<label for="occupation-select">직종 선택</label>
				<select id="occupation-select" name="Occupation"
					onchange="loadJobs(this.value)">
					<option value="">직종을 선택하세요</option>
					<c:forEach var="occupation" items="${occupations}">
						<option value="${occupation.occupationId}">${occupation.occupationName}</option>
					</c:forEach>
				</select>

				<label for="job-select">직무 선택</label>
				<select id="job-select" name="Job">
					<option value="">먼저 직무를 선택하세요</option>
				</select>
			</div>

			<div id="educationDiv" class="hidden">
				<label for="education">학력</label>
				<select name="Eduhigh" id="education" onchange="nextStep()" required>
					<option value="">-- 선택 --</option>
					<option value="1">학력무관</option>
					<option value="2">고등학교졸업</option>
					<option value="3">대학졸업(2,3년)</option>
					<option value="4">대학교졸업(4년)</option>
					<option value="5">석사졸업</option>
					<option value="6">박사졸업</option>
				</select>
				<button type="button" onclick="prevStep()">이전으로</button>
			</div>

			<div id="careerDiv" class="hidden">
				<label for="career">경력</label>
				<select name="Careear" id="career" onchange="nextStep()" required>
					<option value="">-- 선택 --</option>
					<option value="1">경력 무관</option>
					<option value="2">1년 미만</option>
					<option value="3">1년 ~ 3년</option>
					<option value="4">3년 ~ 5년</option>
					<option value="5">5년 ~ 7년</option>
					<option value="6">7년 이상</option>
				</select>
				<button type="button" onclick="prevStep()">이전으로</button>
			</div>

			<div id="salaryDiv" class="hidden">
				<label for="Salary">희망 연봉 (만원)</label>
				<input type="number" name="Salary" id="salary" min="0"
					onchange="nextStep()" required>
				<button type="button" onclick="prevStep()">이전으로</button>
			</div>

			<div id="workingDaysDiv" class="hidden">
				<label for="workingDays">희망 근무일수</label>
				<select name="WorkingDay" id="workingDays" onchange="nextStep()"
					required>
					<option value="">-- 선택 --</option>
					<option value="3">주 3일</option>
					<option value="4">주 4일</option>
					<option value="5">주 5일</option>
				</select>
				<button type="button" onclick="prevStep()">이전으로</button>
			</div>

			<div id="submitDiv" class="hidden">
				<button type="submit">조건에 맞는 회사 검색</button>
				<button type="button" onclick="prevStep()">이전으로</button>
			</div>
		</form>
	</div>

	<script>
		const contextPath = '${pageContext.request.contextPath}';
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/partone.js"></script>
</body>
</html>
