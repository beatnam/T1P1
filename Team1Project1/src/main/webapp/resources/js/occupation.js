function loadJobs(occupationId) {
			const jobSelect = document.getElementById('job-select');
			jobSelect.innerHTML = '<option value="">먼저 직무를 선택하세요</option>';
			if (occupationId) {
				$.ajax({
					type : "GET",
					url : contextPath + '/corplist/job',
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
					},
				});//ajax()
			}
		}