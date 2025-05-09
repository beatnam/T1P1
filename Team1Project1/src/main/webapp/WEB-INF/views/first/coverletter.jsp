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
/* 전체 레이아웃: 7등분 기반으로 상단 3:1:3 */
.grid-container {
	display: grid;
	grid-template-columns: repeat(7, 1fr); /* 7등분 */
	grid-template-rows: auto auto;
	gap: 20px;
	padding: 20px;
	width: 100%;
	box-sizing: border-box;
}

#open_recruit {
	grid-column: 1/span 3;
}

#gpt_comment {
	grid-column: 4/span 1;
}

#recruit {
	grid-column: 5/span 3;
}

#resume {
	grid-column: 1/span 7; /* 하단 영역 전체 사용 */
}

#gpt_result {
	grid-column: 1/span 7; /* 필요 시 추가로 전체 사용 */
}

/* 기타 스타일 유지 */
.two-column {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* 2열 배치 */
	gap: 12px;
}

.item-card {
	background-color: #ffffff;
	border: 1px solid #cccccc;
	border-radius: 10px;
	padding: 12px;
	box-shadow: 1px 1px 6px rgba(0, 0, 0, 0.05);
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
			<form id="resumeForm" action="#" method="post">

				<label for="coverLetter">자기소개서:</label>
				<br>
				<textarea id="coverLetter" name="coverLetter" rows="10" cols="60"
					required></textarea>


				<input type="submit" value="gpt 보내기">
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
	</script>
</body>
</html>