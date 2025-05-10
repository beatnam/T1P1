<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 공고 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/corp.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 다른계획있을시 수정 -->
	<div class="all">
		<jsp:include page="../inc/corptop.jsp"></jsp:include>
		<div class="box">
			<div class="parent_div">
				<h1>공고 수정</h1>
				<form action="${pageContext.request.contextPath}/corplist/updatepro"
					method="post" id="appForm" enctype="multipart/form-data">
					<input type="hidden" name="recruitId"
						value="${recruitDTO.recruitId}">
					<div class="main_content">
						<table border="1">
							<tr>
								<td>제목입력</td>
								<td><input type="text" id="" name="recruitName"
										value="${recruitDTO.recruitName}"></td>
							</tr>
							<tr>
								<td>사진 첨부파일 수정 <img
									src="${pageContext.request.contextPath}/resources/upload/${recruitDTO.recruitPhoto }"
									width="200" height="200"></td>
								<td><input type="file" name="recruitPhoto"> <input
										type="hidden" name="oldRecruitPhoto"
										value="${recruitDTO.recruitPhoto }"></td>
							</tr>
							<tr>
								<td>학력</td>
								<td><select name="recruitEduhigh" id="Levels">
										<option value="">-- 선택 --</option>
										<option value="1">학력무관</option>
										<option value="2">고등학교졸업</option>
										<option value="3">대학졸업(2,3년)</option>
										<option value="4">대학교졸업(4년)</option>
										<option value="5">석사졸업</option>
										<option value="6">박사졸업</option>

								</select></td>
							</tr>
							<tr>
								<td>직종 직무</td>
								<td>
									<!-- 직종 리스트 --> <label for="occupation-select"></label> <select
									id="occupation-select" name="recruitOccupation"
									onchange="loadJobs(this.value)">
										<option value="">직무를 선택하세요</option>
										<c:forEach var="occupation" items="${occupations}">
											<option value="${occupation.occupationId}">${occupation.occupationName}</option>
										</c:forEach>
								</select> <label for="job-select"></label> <select id="job-select"
									name="recruitJob">
										<option value="">먼저 직무를 선택하세요</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>연봉</td>
								<td><input type="text" id="" name="recruitSalary"
										value="${recruitDTO.recruitSalary}"></td>
							</tr>

							<tr>
								<td>경력</td>
								<td><select name="recruitCareear" id="recruitCareer"
									required>
										<option value="">-- 선택 --</option>
										<option value="1">경력 무관</option>
										<option value="2">1년 미만</option>
										<option value="3">1년 ~ 3년</option>
										<option value="4">3년 ~ 5년</option>
										<option value="5">5년 ~ 7년</option>
										<option value="6">7년 이상</option>
								</select></td>
							</tr>
							<tr>
								<td>근무지역</td>
								<td><input type="text" id="" name="recruitLocation"
										value="${recruitDTO.recruitLocation}"></td>
							</tr>
							<tr>
								<td>마감일자</td>
								<td><input type="date" id="recruitDeatline"
										name="recruitDeatline" value="${recruitDTO.recruitDeatline}"></td>
							</tr>
							<tr>
								<td>근무일수</td>
								<td><input type="text" id="" name="recruitWorkday"
										value="${recruitDTO.recruitWorkday}"></td>
							</tr>
							<tr>
								<td>상세내용</td>
								<td><textarea rows="50" cols="50" name="recruitContent">${recruitDTO.recruitContent}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 로그인 되어있고(세션값이 있으면) => 로그인표시값, 글쓴이 일치 => 글수정, 글삭제 버튼 보이기 -->
									<div class="apply_btn" id="apply_btn">
										<input type="submit" value="공고 올리기">
										<input type="button" value="공고 삭제"
											onclick="location.href='${pageContext.request.contextPath}/corplist/delete?recruitId=${recruitDTO.recruitId}'">
										<input type="button" value="공고 리스트"
											onclick="location.href='${pageContext.request.contextPath}/corplist/list'">
									</div>
								</td>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script>
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
					url : '${pageContext.request.contextPath}/corplist/job',
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
	</script>
</body>
</html>