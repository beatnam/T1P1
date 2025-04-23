<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join.css">
<link rel="stylesheet" href="/css/join.css">

</head>
<body>
	<div class="container">
		<input type="radio" name="mtId" value="200" />
		개인
		<input type="radio" name="mtId" value="300" />
		기업
		<form
			action="${pageContext.request.contextPath}/corporation/copJoinPro"
			class="joinMember" method="post" id="copJoinForm" enctype="multipart/form-data">
			<!-- 			enctype="multipart/form-data" -->

			<fieldset>
				<legend>회원가입</legend>

				<ul class="joinList">
					<div class="container1">
						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationMemberId" class="w100p"
									id="id_lbl" placeholder="아이디" required />
							</div>
						</li>

						<li class="start">
							<label for="id_lbl" class="tit_lbl pilsoo_item"></label>
							<div class="join_content" id="idCheck"></div>
						</li>
						<br>

						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationMemberName" class="w100p"
									id="name_lbl" placeholder="기업 담당자명" required />
							</div>
						</li>
						<li class="start">
							<div class="join_content">
								<input type="password" name="corporationMemberPasswd"
									class="w100p" id="pwd_lbl" placeholder="비밀번호" required />
							</div>
							<br>

							<div class="join_content">
								<input type="password" class="w100p" id="pwd_lbl2"
									placeholder="비밀번호 확인" required />
							</div>
						</li>
						<br>

						<li class="start">
							<div class="join_content email_area">
								<input type="text" name="corporationMemberEmail" class="w100p"
									id="email_lbl" title="이메일 주소" placeholder="이메일 주소 입력" required />
								<span class="ico_space">@</span>
								<input type="text" name="email2" class="w160"
									title="이메일 제공업체 입력" required />
								<div class="select_common">
									<select title="이메일 제공업체 목록">
										<option value="">직접입력</option>
										<option value="">naver.com</option>
										<option value="">hanmail.net</option>
									</select>
								</div>
							</div>
						</li>
					</div>


					<br>
					<div class="container2">
						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationName" class="w100p"
									id="name_lbl" placeholder="회사 이름" required />
							</div>
						</li>
						<br>


						</li>
						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationPostcode" class="w100p"
									id="address_lbl" placeholder="우편번호" required />
							</div>
							<br>

						</li>

						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationAddress" class="w100p"
									id="address_lbl" placeholder="기업 주소" required />
							</div>
							<br>
						<li class="start">
							<div class="join_content">
								<input type="tel" name="corporationMemberPhone" class="w100p"
									id="phone_lbl" placeholder="휴대전화" />
							</div>
							<button type="button" class="aceept_content" id="phone_lbl1">
								<span>인증번호 전송</span>
							</button>
						</li>
						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationUrl" class="w100p"
									id="phone_lbl" placeholder="회사 홈페이지" />
							</div>
						</li>
						<li class="start">
							<div class="join_content">
								회사 대표 이미지
								<input type="file" name="corporationPhoto" class="w100p"
									id="phone_lbl" placeholder="회사 대표 이미지" />
							</div>
						</li>
						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationRegistration" class="w100p"
									id="phone_lbl" placeholder="사업자 등록 번호" required />
							</div>
						</li>

						<li class="start">
							<div class="join_content">
								사업자 등록증 사본
								<input type="file" name="corporationRegistrationPdf"
									class="w100p" id="phone_lbl" placeholder="사업자 등록증" />
							</div>
						</li>

						<li class="start">
							<div class="join_content">
								<input type="text" name="corporationIntro" class="w100p"
									id="phone_lbl" placeholder="회사 소개" />
							</div>
						</li>
					</div>

					<li class="start">
						<span class="join_content checkbox_area">필수동의 항목 및 개인정보 수집
							및 이용 동의(선택), 광고성 정보 수신 <br> (선택)에 모두 동의합니다.
						</span>
					</li>

				</ul>
				<p class="btn_line">
					<a href="javascript:;" class="btn_baseColor" id="submitBtn">회원가입</a>
				</p>
			</fieldset>
		</form>


	</div>

	<script type="text/javascript">
		let submitBtn = document.querySelector("#submitBtn");
		let copJoinForm = document.querySelector("#copJoinForm");

		submitBtn.onclick = function() {

			//alert("전송");	
			//id="appForm" 전송
			copJoinForm.submit();
		}
	</script>

</body>
</html>