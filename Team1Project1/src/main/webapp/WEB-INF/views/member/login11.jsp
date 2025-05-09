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
<style>
body, html {
	height: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f5f5f5;
}

.container-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}

.login-box {
	width: 400px;
	background: white;
	padding: 30px 20px 20px;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.tab-buttons {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.tab-button {
	padding: 6px 14px;
	font-size: 0.9em;
	margin: 0 5px;
	border: 1px solid #2ecc71;
	border-radius: 15px;
	background-color: white;
	color: #2ecc71;
	cursor: pointer;
	transition: all 0.3s ease;
}

.tab-button.active {
	background-color: #2ecc71;
	color: white;
}

.login_container {
	display: none;
}

.login_container.active {
	display: block;
}

fieldset {
	border: none;
	padding: 0;
}

legend, .joinLogin {
	text-align: center;
	font-size: 1.4em;
	color: #27ae60;
	margin-bottom: 15px;
}

ul {
	list-style: none;
	padding: 0;
	margin-bottom: 15px;
}

li {
	margin-bottom: 12px;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 10px;
    font-size: 1em;
    box-sizing: border-box; /* 박스 사이즈를 포함하여 padding 조정 */
}

.checkbox-group {
	margin-bottom: 15px;
	font-size: 0.9em;
}

.links {
	display: flex;
	justify-content: space-between;
	font-size: 0.9em;
	margin-bottom: 15px;
}

.social-login {
	text-align: center;
	margin-bottom: 20px;
}

button#submitBtn {
	width: 100%;
	background-color: #2ecc71;
	color: white;
	border: none;
	border-radius: 25px;
	padding: 12px;
	font-size: 1em;
	cursor: pointer;
	transition: background 0.3s ease;
}

button#submitBtn:hover {
	background-color: #27ae60;
}

a {
	color: #27ae60;
	text-decoration: none;
	font-size: 0.9em;
}

a:hover {
	text-decoration: underline;
}

.register {
	display: block;
	text-align: center;
	margin-top: 15px;
	font-size: 0.95em;
	color: #27ae60;
	text-decoration: none;
}
</style>
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

	<script type="text/javascript">
    const tabButtons = document.querySelectorAll('.tab-button');
    const tabContents = document.querySelectorAll('.login_container');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const targetTab = button.getAttribute('data-tab');
            tabButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            tabContents.forEach(content => {
                content.classList.remove('active');
            });

            document.getElementById(targetTab).classList.add('active');
        });
    });

    document.querySelector("#submitBtn").onclick = function () {
        const id_lbl = document.querySelector("#id_lbl");
        if (id_lbl && id_lbl.value === "") {
            alert("아이디를 입력하시오");
            id_lbl.focus();
            return false;
        }
    };
</script>

</body>
</html>
