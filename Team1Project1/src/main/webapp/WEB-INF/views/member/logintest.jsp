<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String kakaoUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=69648cd5739ce310afc751e72d423fca"
		+ "&redirect_uri=http://localhost:8080/teamone/member/kakaoLogin" + "&response_type=code";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</head>
<body>

	<div class="container-wrapper">
		<div class="login-box">
			<div class="tab-buttons">
				<button class="tab-button active" data-tab="personal">개인회원</button>
				<button class="tab-button" data-tab="corporation">기업회원</button>
			</div>

			<div class="login_container active" id="personal">
				<form action="${pageContext.request.contextPath}/member/loginPro"
					method="post" class="tab-content login-form">
					<fieldset>
						<legend>로그인</legend>
						<ul>
							<li><input type="text" name="memberId" id="id_lbl"
									placeholder="아이디" /></li>
							<li><input type="password" name="memberPasswd" id="pwd_lbl"
									placeholder="비밀번호" /></li>
						</ul>
						<div class="checkbox-group">
							<label>
								<input type="checkbox" name="keepLogin" />
								로그인 유지
							</label>
							<br>
							<label>
								<input type="checkbox" name="saveId" />
								아이디 저장
							</label>
						</div>
						<div class="links">
							<a href="${pageContext.request.contextPath}/member/login1-1">아이디찾기</a>
							<a href="${pageContext.request.contextPath}/member/login1-2">비밀번호찾기</a>
						</div>
						<div class="social-login">
							<a href="<%=kakaoUrl%>">
								<img
									src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png"
									alt="카카오 로그인" />
							</a>
						</div>
						<button type="submit" id="submitBtn">로그인</button>
						<a href="${pageContext.request.contextPath}/main/join" class="register">개인 회원
							가입</a>
					</fieldset>
				</form>
			</div>

			<div class="login_container" id="corporation">
				<form
					action="${pageContext.request.contextPath}/corporation/copLoginPro"
					method="post" class="tab-content login-form">
					<fieldset>
						<legend>로그인</legend>
						<ul>
							<li><input type="text" name="corporationMemberId"
									placeholder="아이디" /></li>
							<li><input type="password" name="corporationMemberPasswd"
									placeholder="비밀번호" /></li>
						</ul>
						<button type="submit" id="submitBtn">로그인</button>
						<a href="${pageContext.request.contextPath}/main/cop_join" class="register">기업
							회원 가입</a>
					</fieldset>
				</form>
			</div>
		</div>
	</div>


</body>
</html>
