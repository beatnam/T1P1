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

				<li class="start"><span class="join_content checkbox_area">
						필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신<br>(선택)에 모두 동의합니다.
				</span></li>
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
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById("postcode_lbl").value = data.zonecode;
							document.getElementById("address_lbl").value = data.address;
						}
					}).open();
		}
	</script>



<script>
$(function() {
	// ID 유효성 및 중복 체크
	$('#id_lbl').blur(function() {
		let idCheck = /^[a-zA-Z0-9_\-]{5,20}$/;
		let idVal = $('#id_lbl').val();
		if (!idCheck.test(idVal)) {
			$('#idCheck').text('잘못된 형식입니다.').css('color', 'red');
			return;
		}
		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/copmember/idCheck',
			data: { 'id': idVal },
			success: function(result) {
				if (result === 'iddup') {
					$('#idCheck').text('이미 사용중인 아이디입니다.').css('color', 'red');
				} else {
					$('#idCheck').text('사용 가능한 아이디입니다.').css('color', 'blue');
				}
			}
		});
	});

	// 회사명 중복 체크
	$('#corpname_lbl').blur(function() {
		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/copmember/copnameCheck',
			data: { 'name': $('#corpname_lbl').val() },
			success: function(result) {
				if (result === 'namedup') {
					$('#corpnameCheck').text('이미 등록된 회사입니다.').css('color', 'red');
				} else {
					$('#corpnameCheck').text('등록 가능한 회사입니다.').css('color', 'blue');
				}
			}
		});
	});

	// 비밀번호 일치 확인
	$('#copJoinForm').on('submit', function(e) {
		let pw1 = $('#pwd_lbl').val();
		let pw2 = $('#pwd_lbl2').val();
		if (pw1 !== pw2) {
			alert("비밀번호가 일치하지 않습니다.");
			e.preventDefault();
		}
	});

	// 이메일 select 연동
	$('select[title="이메일 제공업체 목록"]').change(function() {
		let selected = $(this).val();
		if (selected !== "") {
			$('input[name="email2"]').val(selected);
		} else {
			$('input[name="email2"]').val('');
		}
	});
});
</script>

</body>
</html>