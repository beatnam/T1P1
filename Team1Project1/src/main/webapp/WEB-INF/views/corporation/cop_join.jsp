<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>기업 | 회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<div class="container">
		<form
			action="${pageContext.request.contextPath}/corporation/copJoinPro"
			method="post" id="copJoinForm">

			<ul class="joinList">
				<li class="start">
					<div class="join_content">
						<input type="text" name="corporationMemberId" class="w100p"
							id="id_lbl" placeholder="아이디" required />
					</div>
					<div id="idCheck"></div>
				</li>

				<li class="start"><label for="id_lbl"
						class="tit_lbl pilsoo_item"></label>
					<div class="join_content" id="idCheck"></div></li>

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
				</li>

				<li class="start">
					<div class="join_content">
						<input type="password" class="w100p" id="pwd_lbl2"
							placeholder="비밀번호 확인" required />
					</div>
				</li>

				<li class="start">
					<div class="join_content email_area">
						<input type="text" name="email1" class="w100p" id="email_lbl"
							title="이메일 주소" placeholder="이메일 주소 입력" required />
						<span class="ico_space">@</span>
						<input type="text" name="email2" class="w160" title="이메일 제공업체 입력"
							required />
						<div class="select_common">
							<select title="이메일 제공업체 목록">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
					</div>
				</li>

				<li class="start">
					<div class="join_content">
						<input type="text" name="corporationName" class="w100p"
							id="corpname_lbl" placeholder="회사 이름" required />
					</div>
					<div id="corpnameCheck"></div>
				</li>

				<li class="start">
					<div class="join_content">
						<input type="text" name="corporationPostcode" id="postcode_lbl"
							placeholder="우편번호" readonly required />
					</div>
				</li>
				<li class="start">
					<div class="join_content">
						<input type="text" name="corporationAddress" id="address_lbl"
							placeholder="주소" readonly required />
					</div>
				</li>
				<li class="start">
					<div class="join_content">
						<button type="button" class="aceept_content"
							onclick="execDaumPostcode()">주소검색</button>
					</div>
				</li>

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
							id="url_lbl" placeholder="회사 홈페이지" />
					</div>
				</li>

				<li class="start">
					<div class="join_content">
						<input type="text" name="corporationRegistration" class="w100p"
							id="registration_lbl" placeholder="사업자 등록 번호" required />
					</div>
				</li>

				<li class="start">
					<div class="join_content">
						<input type="text" name="corporationIntro" class="w100p"
							id="intro_lbl" placeholder="회사 소개" />
					</div>
				</li>

				<!-- 개인정보 동의 -->
					<li class="start">
					  <div class="join_content checkbox_area">
					    <input type="checkbox" name="corpInfo" id="info" required />
					    <label for="info">
					      <strong>[필수]</strong> 개인정보 수집 및 이용에 동의합니다.
					    </label>
					    <a href="${pageContext.request.contextPath}/customerService/customerService" target="_blank" class="link">내용 보기</a>
					  </div>
					</li>
					
					<li class="start">
						<div class="join_content checkbox_area">
							<label>
								<input type="checkbox" name="corpInfoC" id="infoC"
									value="true" />
								<strong>[선택]</strong> 광고성 정보 수신에 동의합니다.
							</label>
						</div>
					</li>

				</ul>
			</ul>

			<p class="btn_line">

				<button type="submit" class="btn_baseColor" id="submitBtn">회원
					가입</button>
			</p>

		</form>
	</div>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		const contextPath = "${pageContext.request.contextPath}";
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/js/cop_join.js"></script>
</body>
</html>