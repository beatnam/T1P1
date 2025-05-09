<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="ko">
<head>
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
							<div id="emailcheck"></div>
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
							<label>
								<input type="checkbox" name="memberInfo" id="info" required />
								<strong>[필수]</strong> 개인정보 수집 및 이용에 동의합니다.
							</label>
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

	<!-- 다음 주소 API -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
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

	<!-- 휴대폰 인증 관련 스크립트 -->
	<!--  <script type="text/javascript">
  function sendSMS() {
    const phone = document.getElementById('phone_lbl').value;

    if (!phone) {
      alert("전화번호를 입력해주세요.");
      return;
    }

    fetch("${pageContext.request.contextPath}/member/sendSMS", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ phoneNumber: phone })
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === "success") {
        alert("인증번호가 전송되었습니다.");
        document.getElementById("verify_section").style.display = "block";
      } else {
        alert("전송 실패. 번호를 다시 확인해주세요.");
      }
    })
    .catch(error => {
      console.error("전송 오류:", error);
      alert("인증번호 전송 실패");
    });
  }

  function verifyCode() {
    const code = document.getElementById("verifyCodeInput").value;

    fetch("${pageContext.request.contextPath}/member/verifySMS", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ code: code })
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === "success") {
        alert("✅ 인증 성공");
        document.getElementById("verify_section").style.display = "none";
        document.getElementById("smsVerified").value = "true";
      } else {
        alert("❌ 인증 실패. 다시 시도해주세요.");
        document.getElementById("smsVerified").value = "false";
      }
    })
    .catch(error => {
      console.error("검증 오류:", error);
    });
  }
 </script> -->




	<script type="text/javascript">
		$(function() {

			$('#id_lbl').blur(function() {

				//아이디 => 영문 대소문자, 숫자, 특수문자, _, - 입력가능
				//5 ~ 20 자리 입력 체크
				let idCheck = RegExp(/^[a-zA-Z0-9_\-]{5,20}$/);
				if (!idCheck.test($('#id_lbl').val())) {

					$('#idcheck').html("아이디 형식이 아닙니다").css('color', 'red');
					$('#id_lbl').focus();
					return false;
				}
				$.ajax({
					type : "GET",
					url : '${pageContext.request.contextPath}/member/idCheck',
					data : {
						'id' : $('#id_lbl').val()
					},
					success : function(result) {
						//alert(result);
						if (result == 'iddup') {
							alert('아이디 중복');
							$('#id_lbl').val('');

						} else {
							result = "사용가능한 아이디 입니다";
							$('#idcheck').html(result).css('color', 'blue');
						}
					}//success
				});//ajax
			});//blur()
		}); //ready 

		$(function() {
			$('#pwd_lbl')
					.blur(
							function() {
								//비밀번호 => 영문 소문자, 숫자, 특수문자( !@#$%^* ), _, - 입력가능
								//8 ~ 16 자리 입력 체크
								let passCheck = RegExp(/^(?=.*[a-z])(?=.*[!@#$%^*])(?=.*[0-9]).{8,16}$/);
								if (!passCheck.test($('#pwd_lbl').val())) {

									$('#pwdcheck').html("비밀번호 형식이 아닙니다").css(
											'color', 'red');
									$('#pwd_lbl').focus();
									return false;
								} else {

									$('#pwdcheck').html("");
								}
							});
		});

		$(function() {
			$('#jumin_lbl1')
					.blur(
							function() {
								let jumin1Check = RegExp(/^\d{6}$/);
								if (!jumin1Check.test($('#jumin_lbl1').val())) {
									$('#jumincheck').html(
											"주민번호를 앞자리를 올바르게 입력하세요").css(
											'color', 'red');
									$('#jumin_lbl1').focus();
									return false;
								} else {
									$('#jumincheck').html("");
								}

								$('#jumin_lbl2')
										.blur(
												function() {
													let jumin2Check = RegExp(/^\d{7}$/);
													if (!jumin2Check.test($(
															'#jumin_lbl2')
															.val())) {
														$('#jumincheck')
																.html(
																		"주민번호를 뒷자리를 올바르게 입력하세요")
																.css('color',
																		'red');
														$('#jumin_lbl2')
																.focus();
														return false;
													} else {
														$('#jumincheck').html(
																"");
													}

													let j1 = $('#jumin_lbl1')
															.val();
													let j2 = $('#jumin_lbl2')
															.val();

													$
															.ajax({
																type : "GET",
																url : '${pageContext.request.contextPath}/member/jumincheck',
																data : {
																	'jumin' : j1
																			+ j2
																},
																success : function(
																		result) {
																	if (result != 'jumin') {
																		result = "주민번호를 올바르게 입력하세요";
																		$(
																				'#jumincheck')
																				.html(
																						result)
																				.css(
																						'color',
																						'red');
																	} else {
																		$(
																				'#jumincheck')
																				.html(
																						"");
																	}
																}//success
															});//ajax
												});//blur()
							});
		});//ready 

		/* 이메일 */
		$(function() {
			$('#email_lbl')
					.blur(
							function() {

								let email1Check = RegExp(/^[a-zA-Z0-9_\.\-]/);
								if (!email1Check.test($('#email_lbl').val())) {
									$('#emailcheck').html("이메일을 올바르게 하세요").css(
											'color', 'red');
									$('#email_lbl').focus();
									return false;
								} else {
									$('#emailcheck').html("");
								}

								$('#email_lbl2')
										.blur(
												function() {

													let email2Check = RegExp(/^[a-zA-Z0-9_\.\-]/);
													if (!email2Check.test($(
															'#email_lbl2')
															.val())) {
														$('#emailcheck')
																.html(
																		"이메일을 올바르게 하세요")
																.css('color',
																		'red');
														$('#email_lbl2')
																.focus();
														return false;
													} else {
														$('#emailcheck').html(
																"");
													}

													let e1 = $('#email_lbl')
															.val();
													let e2 = $('#email_lbl2')
															.val();

													$
															.ajax({
																type : "GET",
																url : '${pageContext.request.contextPath}/member/emailcheck',
																data : {
																	'email' : e1
																			+ e2
																},

																success : function(
																		result) {
																	if (result != 'email') {
																		result = "이메일이 중복되어 있습니다";
																		$(
																				'#emailcheck')
																				.html(
																						result)
																				.css(
																						'color',
																						'red');
																	} else {
																		$(
																				'#emailcheck')
																				.html(
																						"");
																	}
																}//success
															});//ajax	
												});//blur()1
							});//blur()2
		}); //ready 

		$(function() {
			$('#phone_lbl')
					.blur(
							function() {

								//핸드폰 체크	         
								let phoneNumCheck = RegExp(/^[0-9]{11}$/);
								if (!phoneNumCheck.test($('#phone_lbl').val())) {

									$('#phonecheck').html("휴대폰 번호를 올바르게 입력하세요")
											.css('color', 'red');
									$('#phone_lbl').focus();
									return false;
								} else {
									$('#phonecheck').html("");
								}

								$
										.ajax({
											type : "GET",
											url : '${pageContext.request.contextPath}/member/phonecheck',
											data : {
												'phone' : $('#phone_lbl').val()
											},

											success : function(result) {
												if (result != 'phone') {
													result = "휴대폰 번호를올바르게 입력하세요";
													$('#phonecheck').html(
															result).css(
															'color', 'red');
												} else {
													$('#phonecheck').html("");
												}
											}//success
										});//ajax
							});//blur()
		}); //ready 	

		$(function() {
			$('#submitBtn').click(function() {

				//작성자명 => 한글 2~6 자 = "name_lbl"
				let nameCheck = RegExp(/^[가-힣]{2,6}$/);
				if (!nameCheck.test($('#name_lbl').val())) {

					alert("이름을 똑바로 입력해주세요");
					$('#name_lbl').focus();
					return false;

				}

				//주소 체크	        
				if ($('#address_lbl').val().trim() === "") {
					alert("주소를 입력해주세요");
					$('#address_lbl').focus();
					return false;

				}

				//필수 동의여부 체크 
				if ($('#info').is(':checked') == false) {

					alert('필수 동의를 체크해주세요');
					return false;
				}

				$('#joinMember').submit();
			});
		});
	</script>

</body>
</html>
