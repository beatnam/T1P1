$(document).ready(function() {
			$(".company-link").click(function() {
				const companyName = $(this).data("name");
				const companyType = $(this).data("type"); // open 또는 regular
				const companyUrl = $(this).data("url"); // 기업 URL

				// 기업명 저장
				$("#selectedCompany").val(companyName);
				$("#selectedCompanyUrl").val(companyUrl);
				// 🔹 버튼 표시 전환
				if (companyType === "OR") {
					$("#regular-buttons").hide();
					$("#open-buttons").show();
				} else {
					$("#regular-buttons").show();
					$("#open-buttons").hide();
				}

				// 🔹 선택한 기업명을 hidden input에 저장
				$("#selectedCompany").val(companyName);

				// 🔹 선택한 기업 URL을 세션 스토리지에 저장
				sessionStorage.setItem("selectedCompanyUrl", companyUrl);

				$.ajax({
					method : "GET",
					url : contextPath + "/first/keyword",
					data : {
						name : companyName
					},
					dataType : 'text',
					success : function(result) {
						$("#gpt_comment").html(result);
					}
				});
			});
		});

		// 자기소개서 전송 시 GPT 결과 받기
		$("#resumeForm").submit(function(e) {
			e.preventDefault(); // 기본 제출 막기
			var coverLetter = $("#coverLetter").val();

			$.ajax({
				method : "GET",
				url : contextPath + "/first/coverletter",
				data : {
					coverLetter : coverLetter
				},
				dataType : 'text',
				success : function(result2) {
					$("#gptResult").val(result2); // 결과 textarea에 출력
				}
			});
		});

		// 🔹 오른쪽 form action 설정 + 전송
		function setAction(actionType) {
			const form = document.querySelector("#gptResult").closest("form"); // 🔹 form 제대로 선택

			// 선택된 회사 URL 가져오기
			const url = sessionStorage.getItem("selectedCompanyUrl");

			switch (actionType) {
			case 'apply':
				alert("지원서를 저장하고 지원합니다.");
				form.action = contextPath + "/first/submit_application";
				break;
			case 'home':
				alert("저장 후 홈으로 이동합니다.");
				form.action = contextPath + "/first/save_and_home";
				break;
			case 'goToHomepage':
				alert("저장 후 홈페이지로 이동합니다.");
				form.action = contextPath + "/first/save_and_page";

				// URL을 hidden input에 저장
				if (url) {
					document.querySelector("#selectedCompanyUrl").value = url;
				} else {
					alert("홈페이지 주소를 찾을 수 없습니다.");
				}
				break;
			default:
				console.error("알 수 없는 액션입니다:", actionType);
			}

			form.submit();
		}