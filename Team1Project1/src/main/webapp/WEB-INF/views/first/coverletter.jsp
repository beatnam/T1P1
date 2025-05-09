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
  background-color: #f5f7fa;
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 0;
}

.grid-container {
  display: grid;
  grid-template-columns: 2fr 1fr 2fr;
  gap: 20px;
  padding: 40px;
  max-width: 1300px;
  margin: 0 auto;
  box-sizing: border-box;
  align-items: stretch;      /* ✅ 중앙 박스 포함 전체 높이 정렬 */
  margin-bottom: 60px;
}

#open_recruit, #recruit {
  display: flex;
  flex-direction: column;
  height: 100%;              /* ✅ 높이 기준 공유 */
}

.two-column {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

.item-card {
  background-color: white;
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
  line-height: 1.6;
}

.item-card strong {
  font-size: 16px;
  color: #333;
}

#gpt_comment {
  background-color: #eaf6ea;
  padding: 20px;
  border-radius: 15px;
  text-align: center;
  font-size: 15px;
  color: #333;
  box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
  display: flex;
  align-items: flex-start;    /* ✅ 위로 딱 붙이기 */
  justify-content: center;
  height: 100%;               /* ✅ 높이 동일하게 맞춤 */
}

.bottom-form-container {
  display: flex;
  justify-content: space-between;
  gap: 20px;
  margin-top: 40px;
  grid-column: 1 / 4;
}

.bottom-form-container form {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.bottom-form-container textarea {
  width: 100%;
  height: 250px;
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 10px;
  resize: none;
  font-size: 14px;
  box-sizing: border-box;
}

.bottom-button-group {
  margin-top: 15px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.bottom-button-group button,
.bottom-button-group input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 16px;
  border: none;
  border-radius: 10px;
  font-size: 15px;
  cursor: pointer;
}

a {
  display: block;
  margin-top: 20px;
  font-weight: bold;
  color: #4CAF50;
  text-decoration: none;
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

		<div class="bottom-form-container">
	<!-- 왼쪽: 자기소개서 -->
	<form id="resumeForm"
		action="${pageContext.request.contextPath}/first/coverletter"
		method="get">
		<label for="coverLetter">자기소개서:</label><br>
		<textarea id="coverLetter" name="coverLetter" rows="10" required></textarea>
		
		<div class="bottom-button-group">
			<input type="submit" value="gpt 보내기">
		</div>
	</form>

	<!-- 오른쪽: GPT 결과 -->
	<form action="#" method="post">
		<label for="gptResult">GPT가 준 결과</label><br>
		<textarea id="gptResult" name="gptResult" rows="10" required></textarea>

		<input type="hidden" id="actionType" name="actionType" value="">
		<div class="bottom-button-group">
			<button type="submit" onclick="setAction('apply')">저장 + 지원하기</button>
			<button type="submit" onclick="setAction('home')">저장 + 홈으로</button>
			<button type="submit" onclick="setAction('draft')">임시저장(저장만)</button>
		</div>
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