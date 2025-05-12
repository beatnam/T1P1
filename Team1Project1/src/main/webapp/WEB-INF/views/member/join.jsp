<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="ko">
<head>
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">


		<!-- 회원가입 양식 -->
		<form action="${pageContext.request.contextPath}/member/joinPro"
			method="post" id="joinMember">
			<fieldset>
				<legend>회원가입</legend>
				<ul class="joinList">

					<li class="start">
						<div class="join_content">
							<input type="text" name="memberId" id="id_lbl"
								placeholder="아이디 5 ~ 20자리" required />
							<div id="idcheck"></div>
						</div>
					</li>


					<li class="start">
						<div class="join_content">
							<input type="password" name="memberPasswd" id="pwd_lbl"
								placeholder="비밀번호 특수문자와 영어소문자 숫자 8~16자리" required />
							<div id="pwdcheck"></div>
						</div>
					</li>


					<li class="start">
						<div class="join_content">
							<div class="jumin_area">
								<input type="text" name="memberJumin1" id="jumin_lbl1"
									placeholder="주민등록번호 앞자리" required />
								<input type="password" name="memberJumin2" id="jumin_lbl2"
									placeholder="주민등록번호 뒷자리" required />
								<div id="jumincheck"></div>
							</div>
						</div>
					</li>

					<!-- 이메일 -->
					<li class="start">
						<div class="join_content email_area">
							<input type="text" name="memberEmail1" id="email_lbl"
								placeholder="이메일 주소" required />
							<span>@</span>
							<input type="text" name="memberEmail2" id="email_lbl2"
								class="w160" placeholder="이메일주소" required />
							
							<div class="select_common">
								<select
									onchange="document.getElementsByName('memberEmail2')[0].value=this.value">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
							</div>
						</div>
					</li>
					<li class= "start">
						<div id="emailcheck"></div>
					</li>
					
					<!-- 이름 -->
					<li class="start">
						<div class="join_content">
							<input type="text" name="memberName" id="name_lbl"
								placeholder="이름" required />
						</div>
					</li>

					<!-- 주소 -->
					<li class="start">
						<div class="join_content">
							<input type="text" name="memberPostcode" id="postcode_lbl"
								placeholder="우편번호" readonly required />
							<input type="text" name="memberAddress" id="address_lbl"
								placeholder="주소" readonly required />
							<button type="button" class="aceept_content"
								onclick="execDaumPostcode()">주소검색</button>
						</div>
					</li>

					<!-- 휴대폰 인증 -->
					<li class="start">
						<div class="join_content">
							<input type="tel" name="memberPhone" id="phone_lbl"
								placeholder="휴대전화" required />
							<div id="phonecheck"></div>
							<button type="button" class="aceept_content" id="phone_lbl1"
								onclick="sendSMS()">인증번호 전송</button>
							<!-- 인증 여부 숨김 필드 -->
							<input type="hidden" name="smsVerified" id="smsVerified"
								value="false" />
						</div>
					</li>

					<!-- 인증번호 입력 -->
					<li class="start" id="verify_section" style="display: none;">
						<div class="join_content">
							<input type="text" id="verifyCodeInput" placeholder="인증번호 입력" />
							<button type="button" onclick="verifyCode()">인증 확인</button>
						</div>
					</li>

					<!-- 개인정보 동의 -->
					<li class="start">
					  <div class="join_content checkbox_area">
					    <input type="checkbox" name="memberInfo" id="info" required />
					    <label for="info">
					      <strong>[필수]</strong> 개인정보 수집 및 이용에 동의합니다.
					    </label>
					    <a href="${pageContext.request.contextPath}/customerService/customerService" target="_blank" class="link">내용 보기</a>
					  </div>
					</li>
					
					<li class="start">
						<div class="join_content checkbox_area">
							<label>
								<input type="checkbox" name="memberInfoC" id="infoC"
									value="true" />
								<strong>[선택]</strong> 광고성 정보 수신에 동의합니다.
							</label>
						</div>
					</li>

				</ul>



				<!-- 회원가입 버튼 -->
				<p class="btn_line">
					<button type="button" class="btn_baseColor" id="submitBtn">회원가입</button>
				</p>
			</fieldset>
		</form>
		
		

	</div>
	<script> const contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
</body>
</html>  

