<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 선택 / 자소서 작성</title>
</head>
<body>

	<div>
		<h4>공개 채용</h4>
		<div>
			<c:forEach var="OR" items="${resultOR }">
			${OR.or_corporation_name }
			</c:forEach>
		</div>
		<div>
			<h4>상시 채용</h4>
		</div>
		<div>회사1</div>
		<div>회사1</div>
	</div>


	<form id="resumeForm" action="#" method="post">


		<div>
			<label for="coverLetter">자기소개서:</label>
			<br>
			<textarea id="coverLetter" name="coverLetter" rows="10" cols="60"
				required></textarea>

		</div>
		<input type="submit">
		GPT 보내기




		<div>
			<label for="gptResult">GPT가 준 결과</label>
			<br>
			<textarea id="gptResult" name="gptResult" rows="10" cols="60"
				readonly required></textarea>

		</div>

		<input type="hidden" id="actionType" name="actionType" value="">
		<button type="submit" onclick="setAction('apply')">저장 + 지원하기</button>
		<button type="submit" onclick="setAction('home')">저장 + 홈으로</button>
		<button type="submit" onclick="setAction('draft')">임시저장</button>
	</form>


	<script>
		function setAction(action) {
			document.getElementById('actionType').value = action;
		}
	</script>
</body>
</html>