<!-- 다음 주소 API -->


  function execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        document.getElementById("postcode_lbl").value = data.zonecode;
        document.getElementById("address_lbl").value = data.address;
      }
    }).open();
  }


<!-- 휴대폰 인증 관련 스크립트 -->

  function sendSMS() {
    let phone = document.getElementById('phone_lbl').value;

    if (!phone) {
      alert("전화번호를 입력해주세요.");
      return;
    }

    fetch(contextPath + "/member/verifySMS", {
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

    fetch(contextPath + "/member/verifySMS", {
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
 
 
 
 
 
 
 $(function() {

		$('#id_lbl').blur(function() {
			
			  //아이디 => 영문 대소문자, 숫자, 특수문자, _, - 입력가능
	         //5 ~ 20 자리 입력 체크
			let idCheck = RegExp(/^[a-zA-Z0-9_\-]{5,20}$/);
	        if(! idCheck.test($('#id_lbl').val())){
	   
	            $('#idcheck').html("아이디 형식이 아닙니다").css('color', 'red');
	            $('#id_lbl').focus();
	            return false;
	        }
			$.ajax({
				type : "GET",
				url: contextPath + "/member/idCheck",
				data : {
					'id' : $('#id_lbl').val()
				},
				success : function(result) {
					//alert(result);
					if (result == 'iddup') {
						$('#idcheck').html("");
						alert('아이디 중복');
						$('#id_lbl').val('');
						
					}else{
						result = "사용가능한 아이디 입니다";
						$('#idcheck').html(result).css('color', 'blue');
					}
				}//success
			});//ajax
		});//blur()
	}); //ready 
	


	

	
	
	$(function () {
		let juminValid = false;
		let emailValid = false;
		let phoneValid = false;

		function toggleJoinButton() {
			$('#submitBtn').prop('disabled', !(juminValid && emailValid && phoneValid));
		}

		// -------------------- 주민번호 --------------------
		$('#jumin_lbl1, #jumin_lbl2').on('input', function () {
			juminValid = false;
			toggleJoinButton();
		});

		$('#jumin_lbl1, #jumin_lbl2').on('blur', function () {
			const j1 = $('#jumin_lbl1').val();
			const j2 = $('#jumin_lbl2').val();

			if (!/^\d{6}$/.test(j1) || !/^\d{7}$/.test(j2)) {
				$('#jumincheck').html("주민번호를 올바르게 입력하세요").css('color', 'red');
				juminValid = false;
				toggleJoinButton();
				return;
			}

			$.ajax({
				type: "GET",
			 url: contextPath + "/member/jumincheck",
			data: { 'jumin': j1 + j2 },
				success: function (result) {
					if (result === 'juminup') {
						$('#jumincheck').html("이미 가입된 주민번호입니다.").css('color', 'red');
						juminValid = false;
					} else {
						$('#jumincheck').html("");
						juminValid = true;
					}
					toggleJoinButton();
				}
			});
		});

		// -------------------- 이메일 --------------------
		$('#email_lbl, #email_lbl2').on('input', function () {
			emailValid = false;
			toggleJoinButton();
		});

		$('#email_lbl, #email_lbl2').on('blur', function () {
			const e1 = $('#email_lbl').val();
			const e2 = $('#email_lbl2').val();

			if (!/^[a-zA-Z0-9_\.\-]+$/.test(e1) || !/^[a-zA-Z0-9_\.\-]+$/.test(e2)) {
				$('#emailcheck').html("이메일을 올바르게 입력하세요").css('color', 'red');
				emailValid = false;
				toggleJoinButton();
				return;
			}

			$.ajax({
				type: "GET",
				url: contextPath + "/member/emailcheck",

				data: { 'email': e1 + e2 },
				success: function (result) {
					if (result === 'emailup') {
						$('#emailcheck').html("이메일이 중복되어 있습니다.").css('color', 'red');
						emailValid = false;
					} else {
						$('#emailcheck').html("");
						emailValid = true;
					}
					toggleJoinButton();
				}
			});
		});

		// -------------------- 휴대폰 --------------------
		$('#phone_lbl').on('input', function () {
			phoneValid = false;
			toggleJoinButton();
		});

		$('#phone_lbl').on('blur', function () {
			const phone = $('#phone_lbl').val();

			if (!/^[0-9]{11}$/.test(phone)) {
				$('#phonecheck').html("휴대폰 번호를 올바르게 입력하세요").css('color', 'red');
				phoneValid = false;
				toggleJoinButton();
				return;
			}

			$.ajax({
				type: "GET",
				url: contextPath + "/member/phonecheck",
				data: { 'phone': phone },
				success: function (result) {
					if (result === 'phoneup') {
						$('#phonecheck').html("이미 존재하는 휴대폰 번호입니다.").css('color', 'red');
						phoneValid = false;
					} else {
						$('#phonecheck').html("");
						phoneValid = true;
					}
					toggleJoinButton();
				}
			});
		});

	});

			
	
	$(function() {
	      $('#submitBtn').click(function(){
	      	
	    	 if($('#id_lbl').val().trim() === ""){
	      		alert('아이디를 입력해주세요');
	      		$('#id_lbl').focus();
	      		return false;
	      	}
	      	
	    
	    	//비밀번호 => 영문 소문자, 숫자, 특수문자( !@#$%^* ), _, - 입력가능
	    	//8 ~ 16 자리 입력 체크
	    	let passCheck = RegExp(/^(?=.*[a-z])(?=.*[!@#$%^*])(?=.*[0-9]).{8,16}$/);
	    	if(! passCheck .test($('#pwd_lbl').val())){
	    		alert('비밀번호를 올바르게 입력해주세요');
	    	       $('#pwd_lbl').focus();
	    	           return false;
	    	     }
	    	
	    	
	    	//주민
	    	 if($('#jumin_lbl1').val().trim() === "" || $('#jumin_lbl2').val().trim() === "" ){
		      		alert('주민번호를 입력해주세요');
		      		$('#jumin_lbl1').focus();
		      		return false;
		      	}
	    	
	    	//이메일
		    	 if($('#email_lbl').val().trim() === "" || $('#email_lbl2').val().trim() === "" ){
		      		alert('이메일을 입력해주세요');
		      		$('#email_lbl').focus();
		      		return false;
		      	}
	    		
	      
	         
	        //작성자명 => 한글 2~6 자 = "name_lbl"
	        let nameCheck = RegExp(/^[가-힣]{2,6}$/);
			if(! nameCheck .test($('#name_lbl').val())){
						            
				alert("이름을 올바르게 입력해주세요");
				$('#name_lbl').focus();
			return false;
						            
		}
			
			//주소 체크	        
	         if($('#address_lbl').val().trim() === ""){
	            alert("주소를 입력해주세요");
	            $('#address_lbl').focus();
	            return false;
	            
	         }  	

			 
	       //전화
	    	 if($('#phone_lbl').val().trim() === ""){
		      		alert('휴대전화를 입력해주세요');
		      		$('#phone_lbl').focus();
		      		return false;
		      	}
			
			
			
			
	         //필수 동의여부 체크 
	         if($('#info').is(':checked')==false){
	        	
	        	 alert('필수 동의를 체크해주세요');
	        	return false;	 
	         }
	         
	         
	         
	        $('#joinMember').submit();
	      });
	   });
