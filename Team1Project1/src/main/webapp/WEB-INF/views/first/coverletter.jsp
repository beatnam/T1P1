<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 선택 | 자소서 작성</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>

<style>
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f4f6f9;
  margin: 0;
  padding: 0;
}

.grid-container {
  display: grid;
  grid-template-columns: 2fr 1fr 2fr;
  grid-template-rows: auto auto;
  gap: 24px;
  padding: 30px;
  max-width: 1200px;
  margin: auto;
}

h4 {
  font-size: 20px;
  margin-bottom: 16px;
  color: #333;
  border-left: 5px solid #4CAF50;
  padding-left: 10px;
}

.item-card {
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
  transition: transform 0.2s ease;
  cursor: pointer;
}

.item-card:hover {
  transform: translateY(-4px);
}

.item-card strong {
  display: block;
  font-size: 16px;
  color: #2c3e50;
  margin-bottom: 10px;
}

.item-card .content {
  font-size: 14px;
  color: #555;
  line-height: 1.6;
}

#gpt_comment {
  background-color: #e8f5e9;
  border: 1px solid #c8e6c9;
  color: #256029;
  padding: 20px;
  border-radius: 12px;
  font-size: 14px;
  line-height: 1.6;
  box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

textarea {
  width: 100%;
  padding: 12px;
  font-size: 14px;
  line-height: 1.5;
  border: 1px solid #ccc;
  border-radius: 10px;
  resize: vertical;
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  transition: border-color 0.2s ease;
}

textarea:focus {
  border-color: #4CAF50;
  outline: none;
  box-shadow: 0 0 5px rgba(76, 175, 80, 0.4);
}

input[type="submit"], button {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 10px 18px;
  border-radius: 8px;
  font-size: 14px;
  cursor: pointer;
  margin-top: 12px;
  margin-right: 8px;
  transition: background-color 0.2s ease;
}

input[type="submit"]:hover, button:hover {
  background-color: #388e3c;
}

a {
  display: inline-block;
  margin-top: 20px;
  color: #4CAF50;
  font-weight: bold;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}


</style>
</head>
<body>

	<div class="grid-container">
		<div id="open_recruit">
			<h4>공개 채용</h4>
			<div class="two-column">
				<c:forEach var="OR" items="${resultOR}">
					<div class="item-card">
						<a href="javascript:;" class="company-link"
							data-name="${OR.or_corporation_name}">
							<strong>기업명: ${OR.or_corporation_name}</strong>
						</a>
						<br>
						<div class="content">
							직종 : ${OR.occupation_name}<br> 직무 : ${OR.job_name}<br>
							최소 학력: ${OR.eduhigh_name}<br> 최소 경력: ${OR.careear_name}<br>
							최대 월급: ${OR.or_salary}<br> 최소 근무: ${OR.or_workday}일 이상<br>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>

		<div id="gpt_comment">회사명을 클릭하면 인재상이 나타납니다.</div>

		<div id="recruit">
			<h4>상시 채용</h4>
			<div class="two-column">
				<c:forEach var="recruit" items="${resultRecruit}">
					<div class="item-card">
						<a href="javascript:;" class="company-link"
							data-name="${recruit.corporation_name}">
							<strong>기업명: ${recruit.corporation_name}</strong>
						</a>
						<br>
						<div class="content">
							직종 : ${recruit.occupation_name}<br> 직무 : ${recruit.job_name}<br>
							최소 학력: ${recruit.eduhigh_name}<br> 최소 경력:
							${recruit.careear_name}<br> 최대 월급: ${recruit.recruit_salary}<br>
							최소 근무: ${recruit.recruit_workday}일 이상<br>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<a href="${pageContext.request.contextPath }/main/main">홈으로</a>

		<div id="resume">
			<form id="resumeForm"
				action="${pageContext.request.contextPath}/first/coverletter"
				method="get">

				<label for="coverLetter">자기소개서:</label>
				<br>
				<textarea id="coverLetter" name="coverLetter" rows="10" cols="60"
					required></textarea>


				<input type="submit" value="gpt 보내기">
			</form>
		</div>

		<div id="gpt_result">
			<form action="#" method="post">
				<label for="gptResult">GPT가 준 결과</label>
				<br>
				<textarea id="gptResult" name="gptResult" rows="10" cols="60"
					required></textarea>


				<input type="hidden" id="actionType" name="actionType" value="">
				<button type="submit" onclick="setAction('apply')">저장 +
					지원하기</button>
				<button type="submit" onclick="setAction('home')">저장 + 홈으로</button>
				<button type="submit" onclick="setAction('draft')">임시저장(저장만)</button>
			</form>
		</div>



	</div>
	<script>
		$(document).ready(function() {
			$(".company-link").click(function() {
				const contextPath = '${pageContext.request.contextPath}';
				var companyName = $(this).data("name");

				$.ajax({
					method : "GET",
					url : contextPath + "/first/keyword",
					data : {
						name : companyName
					},
					dataType : 'text',
					success : function(result) {
						console.log(result);
						$("#gpt_comment").html(result);

					}
				});
			});
		});
		// 자기소개서 전송 시 GPT 결과 받기
		$("#resumeForm").submit(function(e) {
			e.preventDefault(); // 기본 제출 막기
			const contextPath = '${pageContext.request.contextPath}';
			var coverLetter = $("#coverLetter").val();
			$.ajax({
				method: "GET",
				url: contextPath + "/first/coverletter",
				data: { coverLetter: coverLetter },
				dataType: 'text',
				success: function(result2) {
					console.log(result2);
					$("#gptResult").val(result2); // 결과 textarea에 출력
				}
			});
		});
</script>
</body>
</html>