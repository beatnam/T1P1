<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login1-2.css">
</head>
<body>
	<div class="container">
		<form action="">
			<h2>비밀번호 찾기</h2>
			<label for="username">아이디</label> <input type="text" id="username"
				name="username" required> <label for="phone">휴대전화</label> <input
				type="text" id="phone" name="phone" required> <label
				for="verification-code">인증번호</label> <input type="text"
				id="verification-code" name="verification-code" required>

			<button type="button">인증번호 받기</button>

			<div class="footer">
				<p>비밀번호를 잊으셨나요?</p>
			</div>
		</form>
	</div>

</body>
</html>