<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body>

	<div class="container">
		<form action="" method="">
			<fieldset>
				<legend>로그인</legend>
				<p class="joinLogin">개인회원 | 기업회원</p>
			<input type="radio" name="mt_id" value="200" /> 개인
    <input type="radio" name="mt_id" value="300" /> 기업
				<ul>
					<li><input type="text" name="memberId" id="id_lbl"
						placeholder="아이디" /></li>
					<li><input type="password" name="memberPasswd" id="pwd_lbl"
						placeholder="비밀번호" /></li>
				</ul>

				<div class="checkbox-group">
					<label><input type="checkbox" name="keepLogin" /> 로그인 유지</label><br>
					<label><input type="checkbox" name="saveId" /> 아이디 저장</label>
				</div>

				<div class="links">
					<a href="${pageContext.request.contextPath}/member/login1-1">아이디찾기</a>
					<a href="${pageContext.request.contextPath}/member/login1-2">비밀번호찾기</a>
				</div>

				<div class="social-login">
					<label>카카오 로그인</label>
					<!-- 실제 버튼이나 이미지로 구현 가능 -->
				</div>

				<button type="submit">로그인</button>
			</fieldset>
		</form>
	</div>

</body>
</html>