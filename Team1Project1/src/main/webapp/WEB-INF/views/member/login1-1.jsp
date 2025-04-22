<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login1-1.css">
</head>
<body>
	<form action="">
		<h2>아이디 찾기</h2>
		<label>이름</label> <input type="text" placeholder="이름을 입력하세요">
		<label>휴대전화</label> <input type="text" placeholder="휴대전화 번호를 입력하세요">
		<label>인증번호</label> <input type="text" placeholder="인증번호를 입력하세요">
		<button type="button">인증번호 받기</button>
		<div class="footer">이메일로도 아이디를 찾을 수 있습니다.</div>
	</form>
</body>
</html>