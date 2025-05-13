<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 선택 | 자소서 작성</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cover_letter.css">

</head>
<body>

	<div class="grid-container">
		<div id="open_recruit">
			<h4>공개 채용</h4>
			<div class="two-column">
				<c:forEach var="OR" items="${resultOR}">
					<div class="item-card">
						<a href="javascript:;" class="company-link"
							data-name="${OR.or_corporation_name}" data-type="OR"
							data-url="${OR.or_url}">
							<strong>기업명: ${OR.or_corporation_name}</strong>
						</a>
						<br>
						<div class="content">
							직종 : ${OR.occupation_name}<br> 직무 : ${OR.job_name}<br>
							최소 학력: ${OR.eduhigh_name}<br> 최소 경력: ${OR.careear_name}<br>
							최대 월급: ${OR.or_salary}<br> 최소 근무: ${OR.or_workday}일 이상<br>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div id="gpt_comment">회사명을 클릭하면 인재상이 나타납니다.</div>

		<div id="recruit">
			<h4>상시 채용</h4>
			<div class="two-column">
				<c:forEach var="recruit" items="${resultRecruit}">
					<div class="item-card">
						<a href="javascript:;" class="company-link"
							data-name="${recruit.corporation_name}" data-type="recruit"
							data-url="${recruit.or_url}">
							<strong>기업명: ${recruit.corporation_name}</strong>

						</a>
						<br>
						<div class="content">
							직종 : ${recruit.occupation_name}<br> 직무 : ${recruit.job_name}<br>
							최소 학력: ${recruit.eduhigh_name}<br> 최소 경력:
							${recruit.careear_name}<br> 최대 월급: ${recruit.recruit_salary}<br>
							최소 근무: ${recruit.recruit_workday}일 이상<br>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<a href="${pageContext.request.contextPath }/main/main">홈으로</a>

		<div class="bottom-form-container">
			<!-- 왼쪽: 자기소개서 -->
			<form id="resumeForm"
				action="${pageContext.request.contextPath}/first/coverletter"
				method="get">
				<label for="coverLetter">자기소개서:</label>
				<br>
				<textarea id="coverLetter" name="coverLetter" rows="10" required></textarea>

				<div class="bottom-button-group">
					<input type="submit" value="gpt 보내기">
				</div>
			</form>

			<!-- 오른쪽: GPT 결과 -->
			<form action="#" method="post">
				<!-- 🔹 선택한 기업명 전달용 hidden input 추가 -->
				<input type="hidden" id="selectedCompany" name="companyName"
					value="">
				<input type="hidden" id="selectedCompanyUrl" name="companyUrl"
					value="">

				<!-- 🔹 기존 히든 input -->
				<input type="hidden" id="actionType" name="actionType" value="">

				<label for="gptResult">GPT가 준 결과</label>
				<br>
				<textarea id="gptResult" name="gptResult" rows="10" required></textarea>

				<div class="bottom-button-group" id="regular-buttons">
					<button type="submit" onclick="setAction('apply')">저장 +
						지원하기</button>
					<button type="submit" onclick="setAction('home')">저장 + 홈으로</button>
				</div>

				<div class="bottom-button-group" id="open-buttons"
					style="display: none;">
					<button type="button" onclick="setAction('goToHomepage')">저장
						+ 기업 홈페이지로 이동</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		const contextPath = "${pageContext.request.contextPath}";
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/application.js">
	</script>

</body>
</html>
