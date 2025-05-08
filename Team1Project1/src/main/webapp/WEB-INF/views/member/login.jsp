<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String kakaoUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=69648cd5739ce310afc751e72d423fca"
    + "&redirect_uri=http://localhost:8080/teamone/member/kakaoLogin" + "&response_type=code";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 40px;
}

.tab-buttons {
    text-align: center;
    margin-bottom: 20px;
}

.tab-button {
    padding: 12px 24px;
    margin: 0 10px;
    border: none;
    border-radius: 25px;
    background-color: #dff0df;
    color: #2ecc71;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s ease;
}

.tab-button.active {
    background-color: #2ecc71;
    color: white;
}

.login_container {
    display: none;
    max-width: 400px;
    margin: 0 auto;
    background: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
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
    font-size: 1.5em;
    color: #27ae60;
    margin-bottom: 20px;
}

ul {
    list-style: none;
    padding: 0;
    margin-bottom: 20px;
}

li {
    margin-bottom: 15px;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 10px;
    font-size: 1em;
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
</style>
</head>
<body>

<div class="tab-buttons">
    <button class="tab-button active" data-tab="personal">개인회원</button>
    <button class="tab-button" data-tab="corporation">기업회원</button>
</div>

<div class="login_container active" id="personal">
    <form action="${pageContext.request.contextPath}/member/loginPro" method="post" class="tab-content login-form">
        <fieldset>
            <legend>로그인</legend>
            <p class="joinLogin">개인회원</p>
            <ul>
                <li><input type="text" name="memberId" id="id_lbl" placeholder="아이디" /></li>
                <li><input type="password" name="memberPasswd" id="pwd_lbl" placeholder="비밀번호" /></li>
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
                <a href="<%=kakaoUrl%>">
                    <img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png" alt="카카오 로그인" />
                </a>
            </div>
            <button type="submit" id="submitBtn">로그인</button>
            <a href="${pageContext.request.contextPath}/main/join">개인 회원 가입</a>
        </fieldset>
    </form>
</div>

<div class="login_container" id="corporation">
    <form action="${pageContext.request.contextPath}/corporation/copLoginPro" method="post" class="tab-content login-form">
        <fieldset>
            <legend>로그인</legend>
            <p class="joinLogin">기업회원</p>
            <ul>
                <li><input type="text" name="corporationMemberId" id="id_lbl" placeholder="아이디" /></li>
                <li><input type="password" name="corporationMemberPasswd" id="pwd_lbl" placeholder="비밀번호" /></li>
            </ul>
            <button type="submit" id="submitBtn">로그인</button>
            <a href="${pageContext.request.contextPath}/main/cop_join">기업 회원 가입</a>
        </fieldset>
    </form>
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

        const activeTabContent = document.getElementById(targetTab);
        activeTabContent.classList.add('active');
    });
});

document.querySelector("#submitBtn").onclick = function () {
    let id_lbl = document.querySelector("#id_lbl");
    if (id_lbl.value === "") {
        alert("아이디를 입력하시오");
        id_lbl.focus();
        return false;
    }
};
</script>

</body>
</html>
