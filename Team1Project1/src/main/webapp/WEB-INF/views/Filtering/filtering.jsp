<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 조건 선택</title>
<style>
.hidden {
	display: none;
	margin-top: 10px;
}

select, input {
	width: 200px;
}
</style>
</head>
<body>
	<h2>희망 조건을 선택하세요</h2>

	<form action="#" method="post">
		<!-- 1. 직종 -->
		<label for="jobCategory">직종:</label> <select id="jobCategory"
			name="jobCategory" onchange="onCategoryChange()" required>
			<option value="">-- 선택 --</option>
			<option value="IT">IT</option>
			<option value="디자인">디자인</option>
		</select><br>
		<br>

		<!-- 2. 직무 -->
		<div id="jobRoleDiv" class="hidden">
			<label for="jobRole">직무:</label> <select id="jobRole" name="jobRole"
				onchange="showNext('educationDiv')" required>
				<option value="">-- 선택 --</option>
			</select><br>
			<br>
		</div>

		<!-- 3. 학력 -->
		<div id="educationDiv" class="hidden">
			<label for="education">학력:</label> <select name="education"
				id="education" onchange="showNext('careerDiv')" required>
				<option value="">-- 선택 --</option>
				<option value="고졸">고졸</option>
				<option value="학사">학사</option>
				<option value="석사">석사</option>
			</select><br>
			<br>
		</div>

		<!-- 4. 경력 -->
		<div id="careerDiv" class="hidden">
			<label for="career">경력:</label> <select name="career" id="career"
				onchange="showNext('salaryDiv')" required>
				<option value="">-- 선택 --</option>
				<option value="신입">신입</option>
				<option value="1-3년">1~3년</option>
				<option value="4-6년">4~6년</option>
				<option value="7년 이상">7년 이상</option>
			</select><br>
			<br>
		</div>

		<!-- 5. 희망 연봉 -->
		<div id="salaryDiv" class="hidden">
			<label for="salary">희망 연봉 (만원):</label> <input type="number"
				name="salary" id="salary" min="0"
				onchange="showNext('workingDaysDiv')" required><br>
			<br>
		</div>

		<!-- 6. 근무일수 -->
		<div id="workingDaysDiv" class="hidden">
			<label for="workingDays">희망 근무일수:</label> <select name="workingDays"
				id="workingDays" onchange="showNext('submitDiv')" required>
				<option value="">-- 선택 --</option>
				<option value="3">주 3일</option>
				<option value="4">주 4일</option>
				<option value="5">주 5일</option>
			</select><br>
			<br>
		</div>

		<!-- 7. 제출 버튼 -->
		<div id="submitDiv" class="hidden">
			<button type="submit">조건에 맞는 회사 검색</button>
		</div>
	</form>

	<script>
        const jobRoles = {
            "IT": ["백엔드 개발자", "프론트엔드 개발자", "데이터 엔지니어"],
            "디자인": ["UI/UX 디자이너", "그래픽 디자이너"]
        };

        function onCategoryChange() {
            const selected = document.getElementById("jobCategory").value;
            const roleSelect = document.getElementById("jobRole");
            roleSelect.innerHTML = '<option value="">-- 선택 --</option>';

            if (selected && jobRoles[selected]) {
                jobRoles[selected].forEach(role => {
                    const opt = document.createElement("option");
                    opt.value = role;
                    opt.textContent = role;
                    roleSelect.appendChild(opt);
                });
                showNext("jobRoleDiv");
            }
        }

        function showNext(id) {
            const div = document.getElementById(id);
            if (div) {
                div.classList.remove("hidden");
            }
        }
    </script>
</body>
</html>
