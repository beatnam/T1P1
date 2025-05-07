<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String kakaoUrl = "https://kauth.kakao.com/oauth/authorize"
                    + "?client_id=69648cd5739ce310afc751e72d423fca"
                    + "&redirect_uri=http://localhost:8080/teamone/member/kakaoLogin"
                    + "&response_type=code";
%>


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
		<form action="${pageContext.request.contextPath}/member/loginPro" method="post" class="appForm" id="appForm">
			<fieldset>
				<legend>인증번호</legend>
				<p class="joinLogin">개인회원</p>

				<ul>
					<li>
					 <input type="text" name="memberId" id="id_lbl" placeholder="아이디" />
					</li>
					
					<li><input type="password" name="memberPasswd" id="pwd_lbl"
						placeholder="비밀번호" />
					</li>
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
				<a href="<%= kakaoUrl %>">
        			<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png" alt="카카오 로그인" />
    			</a>	
				</div>

				<button type="submit" id = "submitBtn">로그인</button>
			</fieldset>
		</form>
	</div>

</body>
<script type="text/javascript">



</script>



</html>