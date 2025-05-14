document.addEventListener("DOMContentLoaded", function() {
			var selectedValue = `${recruitDTO.recruitEduhigh}`;
			var selectElement = document.getElementById("Levels");

			if (selectElement && selectedValue) {
				selectElement.value = selectedValue;
				console.log("선택된 값 설정 완료:", selectedValue);
			} else {
				console.error("선택 요소를 찾을 수 없거나 값이 없습니다!");
			}
		});
		// 	window.onload = function() {
		// 	    var selectedValue = `${recruitDTO.recruitEduhigh}`;
		// 	    var selectElement = document.getElementById("Levels");

		// 	    if (selectElement && selectedValue) {
		// 	        selectElement.value = selectedValue;
		// 	        console.log("선택된 값 설정 완료:", selectedValue);
		// 	    } else {
		// 	        console.error("선택 요소를 찾을 수 없거나 값이 없습니다!");
		// 	    }
		// 	};

		function loadJobs(occupationId, selectedJob) {
			const jobSelect = document.getElementById('job-select');
			jobSelect.innerHTML = '<option value="">먼저 직무를 선택하세요</option>';

			if (occupationId) {
				$.ajax({
					type : "GET",
					url : contextPath+'/corplist/job',
					data : {
						'occupationId' : occupationId
					},
					dataType : 'json',
					success : function(result) {
						$('#job-select').html('');
						$.each(result, function(index, item) {
							$('#job-select').append(
									'<option value="' + item.jobId + '">'
											+ item.jobName + '</option>');
						});

						// AJAX 요청 완료 후 recruitDTO.recruitJob 값으로 자동 선택
						if (selectedJob) {
							jobSelect.value = selectedJob;
						}
					}
				});
			}
		}
		window.onload = function() {
			var selectedOccupation = `${recruitDTO.recruitOccupation}`;
			var selectedJob = `${recruitDTO.recruitJob}`;
			var occupationSelect = document.getElementById("occupation-select");

			if (occupationSelect && selectedOccupation) {
				occupationSelect.value = selectedOccupation;

				// `loadJobs` 함수에 selectedJob을 추가하여 AJAX 요청 후 자동 선택되도록 설정
				loadJobs(selectedOccupation, selectedJob);
			}
		};