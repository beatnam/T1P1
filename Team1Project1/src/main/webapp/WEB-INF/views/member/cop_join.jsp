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
		<form action="copLoginPro" class="joinMember" method="post"
			enctype="multipart/form-data" id="joinMember">
			<fieldset>
				<legend>회원가입</legend>

				<ul class="joinList">
					<div class="container1">
						<li class="start">
							<div class="join_content">
								<input type="text" name="coporationMemberId" class="w100p"
									id="id_lbl" placeholder="아이디" />
							</div>
						</li>

						<li class="start"><label for="id_lbl"
								class="tit_lbl pilsoo_item"></label>
							<div class="join_content" id="idCheck"></div></li> <br>

						<li class="start">
							<div class="join_content">
								<input type="password" name="coporationMemberPasswd"
									class="w100p" id="pwd_lbl" placeholder="비밀번호" />
							</div> <br>

							<div class="join_content">
								<input type="password" class="w100p" id="pwd_lbl2"
									placeholder="비밀번호 확인" />
							</div>
						</li> <br>

						<li class="start">
							<div class="join_content email_area">
								<input type="text" name="coporationMemberEmail" class="w100p"
									id="email_lbl" title="이메일 주소" placeholder="이메일 주소 입력" />
								<span class="ico_space">@</span>
								<input type="text" name="email2" class="w160"
									title="이메일 제공업체 입력" />
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
								<input type="text" name="coporationName" class="w100p"
									id="name_lbl" placeholder="이름" />
							</div>
						</li> <br>


						<li class="start">
							<div class="join_content">
								<input type="text" name="coporationLocation" class="w100p"
									id="address_lbl" placeholder="주소" />
							</div> <br>


						</li>

						<li class="start">
							<div class="join_content">
								<input type="tel" name="coporationMemberPhone" class="w100p"
									id="phone_lbl" placeholder="휴대전화" />
							</div>
							<button type="button" class="aceept_content" id="phone_lbl1">
								<span>인증번호 전송</span>
							</button>
						</li>
						<li class="start">
							<div class="join_content">
								<input type="text" name="coporationUrl" class="w100p"
									id="phone_lbl" placeholder="회사 홈페이지" />
							</div>
						</li>
						<li class="start">
							<div class="join_content">
								회사 대표 이미지
								<input type="file" name="coporationPhoto" class="w100p"
									id="phone_lbl" placeholder="회사 대표 이미지" />
							</div>
						</li>
						<li class="start">
							<div class="join_content">
								<input type="text" name="coporationRegistration" class="w100p"
									id="phone_lbl" placeholder="사업자 등록 번호" />
							</div>
						</li>
						<li class="start">
							<div class="join_content">
								사업자 등록증 사본
								<input type="file" name="coporationRegistrationPdf"
									class="w100p" id="phone_lbl" placeholder="사업자 등록증" />
							</div>
						</li>
						</li>
						<li class="start">
							<div class="join_content">
								<input type="text" name="coporationIntro" class="w100p"
									id="phone_lbl" placeholder="회사 소개" />
							</div>
						</li>
					</div>

					<li class="start"><span class="join_content checkbox_area">필수동의
							항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신 <br> (선택)에 모두 동의합니다.
					</span></li>

				</ul>
				<p class="btn_line">
					<a href="javascript:;" class="btn_baseColor" id="submitBtn">회원가입</a>
				</p>
			</fieldset>
		</form>


	</div>

</body>
</html>