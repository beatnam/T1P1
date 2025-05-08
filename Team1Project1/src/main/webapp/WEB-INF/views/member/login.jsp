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
.login_container {
	display: none;
}

.login_container.active {
	display: block;
}
</style>

</head>
<body>
	<div class="tab-buttons">
		<button class="tab-button active" data-tab="personal">개인회원</button>
		<button class="tab-button" data-tab="corporation">기업회원</button>
	</div>
	
	<div class="login_container active" id="personal">
		<form action="${pageContext.request.contextPath}/member/loginPro"
			method="post" class="tab-content login-form">
			<fieldset>
				<legend>로그인</legend>
				<p class="joinLogin">개인회원</p>

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
					<a href="<%=kakaoUrl%>">
						<img
							src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png"
							alt="카카오 로그인" />
					</a>
				</div>

				<button type="submit" id="submitBtn">로그인</button>
				<a href="${pageContext.request.contextPath}/main/join">개인 회원 가입</a>
			</fieldset>
		</form>
	</div>

	<div class="login_container" id="corporation">
		<form
			action="${pageContext.request.contextPath}/corporation/copLoginPro"
			method="post" class="tab-content login-form">
			<fieldset>
				<legend>로그인</legend>
				<p class="joinLogin">기업회원</p>
				<ul>
					<li><input type="text" name="corporationMemberId" id="id_lbl"
							placeholder="아이디" /></li>
					<li><input type="password" name="corporationMemberPasswd"
							id="pwd_lbl" placeholder="비밀번호" /></li>
				</ul>

				<button type="submit" id="submitBtn">로그인</button>

				<a href="${pageContext.request.contextPath}/main/cop_join">기업 회원
					가입</a>
			</fieldset>
		</form>
	</div>

</body>
<script type="text/javascript">

// 버튼과 콘텐츠를 선택
const tabButtons = document.querySelectorAll('.tab-button');
const tabContents = document.querySelectorAll('.container'); // .container를 선택

// 각 탭 버튼에 클릭 이벤트 설정
tabButtons.forEach(button => {
  button.addEventListener('click', () => {
    const targetTab = button.getAttribute('data-tab');

    // 모든 버튼에서 active 제거
    tabButtons.forEach(btn => btn.classList.remove('active'));
    button.classList.add('active');

    // 모든 콘텐츠 숨기고 선택된 탭만 표시
    tabContents.forEach(content => {
      content.classList.remove('active'); // 기존 active 제거
      content.style.display = "none"; // 숨기기
    });

    // 선택된 탭의 콘텐츠만 보이게
    const activeTabContent = document.getElementById(targetTab);
    activeTabContent.classList.add('active'); // active 클래스 추가
    activeTabContent.style.display = "block"; // 보이도록 설정
  });
});
</script>

<script type="text/javascript">
let submitBtn = document.querySelector("#submitBtn");
let appForm =  document.querySelector(".login-form");
let id_lbl = document.querySelector("#id_lbl");

submitBtn.onclick = function () {
	if(id_lbl.value ==""){
		alert("아이디를 입력하시오");
		 id_lbl.focus();
		 return;
	}
	appForm.submit();
};
</script>

</html>
