  const steps = ['jobCategoryDiv', 'educationDiv', 'careerDiv', 'salaryDiv', 'workingDaysDiv', 'submitDiv'];
	  let currentStep = 0;

	  function showStep(index) {
	    steps.forEach((stepId, i) => {
	      const el = document.getElementById(stepId);
	      if (el) el.classList.toggle('hidden', i !== index);
	    });
	    currentStep = index;
	  }

	  function nextStep() {
	    if (currentStep < steps.length - 1) {
	      showStep(currentStep + 1);
	    }
	  }

	  function prevStep() {
	    if (currentStep > 0) {
	      showStep(currentStep - 1);
	    }
	  }

	  function loadJobs(occupationId) {
	    const jobSelect = document.getElementById('job-select');
	    jobSelect.innerHTML = '<option value="">먼저 직무를 선택하세요</option>';
	    if (occupationId) {
	      $.ajax({
	        type: "GET",
	        url: contextPath+'/corplist/job',
	        data: { 'occupationId': occupationId },
	        dataType: 'json',
	        success: function(result) {
	          $('#job-select').html('<option value="">직무를 선택하세요</option>');
	          $.each(result, function(index, item) {
	            $('#job-select').append(
	              '<option value="' + item.jobId + '">' + item.jobName + '</option>'
	            );
	          });
	        }
	      });
	    }
	  }

	  document.addEventListener('DOMContentLoaded', function () {
	    document.getElementById('job-select').addEventListener('change', function () {
	      if (this.value) {
	        nextStep();
	      }
	    });

	    showStep(0);
	  });