
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById("postcode_lbl").value = data.zonecode;
							document.getElementById("address_lbl").value = data.address;
						}
					}).open();
		}



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
            url: contextPath+'/copmember/idCheck',
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
            url: contextPath+'/copmember/copnameCheck',
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

    // 이메일 select 연동
    $('select[title="이메일 제공업체 목록"]').change(function() {
        let selected = $(this).val();
        $('input[name="email2"]').val(selected);
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

    // 전체 유효성 검사 및 제출
    $('#submitBtn').click(function() {
        if ($('#id_lbl').val().trim() === "") {
            alert('아이디를 입력해주세요');
            $('#id_lbl').focus();
            return false;
        }

        let passCheck = /^(?=.*[a-z])(?=.*[!@#$%^*])(?=.*[0-9]).{8,16}$/;
        if (!passCheck.test($('#pwd_lbl').val())) {
            alert('비밀번호를 올바르게 입력해주세요');
            $('#pwd_lbl').focus();
            return false;
        }

        if ($('#jumin_lbl1').val().trim() === "" || $('#jumin_lbl2').val().trim() === "") {
            alert('주민번호를 입력해주세요');
            $('#jumin_lbl1').focus();
            return false;
        }

        if ($('#email_lbl').val().trim() === "" || $('#email_lbl2').val().trim() === "") {
            alert('이메일을 입력해주세요');
            $('#email_lbl').focus();
            return false;
        }

        if ($('#address_lbl').val().trim() === "") {
            alert("주소를 입력해주세요");
            $('#address_lbl').focus();
            return false;
        }

        if ($('#phone_lbl').val().trim() === "") {
            alert('휴대전화를 입력해주세요');
            $('#phone_lbl').focus();
            return false;
        }

        if (!$('#info').is(':checked')) {
            alert('필수 동의를 체크해주세요');
            return false;
        }

        $('#copJoinForm').submit();
    });
});
