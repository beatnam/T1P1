<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 공고 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corptop.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<style>
/* General reset and styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
}

/* Parent container styles */
.parent_div {
    margin: 20px;
    padding: 10px;
    background-color: #ffffff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Button styles */
button#refresh {
    margin: 10px 0;
    padding: 10px 20px;
    background-color: #007BFF;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button#refresh:hover {
    background-color: #0056b3;
}

/* Main content styles */
.main_content {
    margin: 20px 0;
    padding: 10px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {
    text-align: left;
    padding: 10px;
    border: 1px solid #ddd;
}

table th {
    background-color: #007BFF;
    color: white;
}

table tr:nth-child(even) {
    background-color: #f9f9f9;
}
.apply_btn input[type="button"] {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.apply_btn input[type="button"]:hover {
    filter: brightness(0.9);
}

select {
      width: 250px; /* 너비 설정 */
      padding: 10px; /* 내부 여백 */
      font-size: 16px; /* 글꼴 크기 */
      color: #333; /* 글자 색상 */
      background-color: #f9f9f9; /* 배경 색상 */
      border: 2px solid #007BFF; /* 테두리 색상 */
      border-radius: 8px; /* 둥근 모서리 */
      appearance: none; /* 기본 화살표 제거 */
      cursor: pointer; /* 마우스 포인터 변경 */
      transition: border-color 0.3s ease, background-color 0.3s ease; /* 효과 추가 */
    }

    select:hover {
      border-color: #0056b3; /* 호버 시 테두리 색상 */
      background-color: #e6f2ff; /* 호버 시 배경 색상 */
    }

    select:focus {
      border-color: #004085; /* 포커스 시 테두리 색상 */
      background-color: #dce4f7; /* 포커스 시 배경 색상 */
      outline: none; /* 포커스 시 외곽선 제거 */
    }

    label {
      font-size: 14px; /* 라벨 글꼴 크기 */
      color: #555; /* 라벨 색상 */
      margin-bottom: 10px; /* 라벨 아래 여백 */
      display: block; /* 블록 스타일 */
    }

</style>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 다른계획있을시 수정 -->
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
	<div class="parent_div">
	<h1>공고 수정</h1>
	<form action="${pageContext.request.contextPath}/corplist/updatepro" method="post" id="appForm" enctype="multipart/form-data">
	<input type="hidden" name="recruitId" value="${recruitDTO.recruitId}">
		<div class="main_content">
		<table border="1">
			<tr>
				<td>제목입력</td>
				<td><input type="text" id="" name="recruitName" value="${recruitDTO.recruitName}"></td>
			</tr>
			<tr>
				<td>사진 첨부파일 수정 <img src="${pageContext.request.contextPath}/resources/upload/${recruitDTO.recruitPhoto }" width="200" height="200"></td>
				<td><input type="file" name="recruitPhoto">
				<input type="hidden" name="oldRecruitPhoto" value="${recruitDTO.recruitPhoto }">
				</td>
			</tr>
			<tr>
				<td>학력</td>
				<td>
				<select name="recruitEduhigh" id="Levels">
					<option value="1">학력무관</option>
					<option value="2">고등학교졸업</option>
					<option value="3">대학졸업(2,3년)</option>
					<option value="4">대학교졸업(4년)</option>
					<option value="5">석사졸업</option>
					<option value="6">박사졸업</option>
					<option value="7">고등학교졸업이상</option>
					<option value="8">대학졸업(2,3년)이상</option>
					<option value="9">대학교졸업(4년)이상</option>
					<option value="10">석사졸업이상</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>직종 직무</td>
				<td>
					<input type="text" id="" name="occupationName" value="${occupationDTO.occupationName}" readonly>
					<input type="text" id="" name="jobName" value="${jobDTO.jobName}" readonly>
				<!-- 직종 리스트 -->
				    <label for="occupation-select"></label>
					<select id="occupation-select" name="recruitOccupation" onchange="loadJobs(this.value)">
					    <option value="">직무를 선택하세요</option>
					    <c:forEach var="occupation" items="${occupations}">
					        <option value="${occupation.occupationId}">${occupation.occupationName}</option>
					    </c:forEach>
					</select>
					
					<label for="job-select"></label>
					<select id="job-select" name="recruitJob">
					    <option value="">먼저 직무를 선택하세요</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>연봉</td>
				<td><input type="text" id="" name="recruitSalary" value="${recruitDTO.recruitSalary}"></td>
			</tr>
			<tr>
				<td>근무지역</td>
				<td><input type="text" id="" name="recruitLocation" value="${recruitDTO.recruitLocation}"></td>
			</tr>
			<tr>
				<td>마감일자</td>
				<td><input type="date" id="recruitDeatline" name="recruitDeatline" value="${recruitDTO.recruitDeatline}"></td>
			</tr>
			<tr>
				<td>근무일수</td>
				<td><input type="text" id="" name="recruitWorkday" value="${recruitDTO.recruitWorkday}"></td>
			</tr>
			<tr>
				<td>상세내용</td>
				<td><textarea rows="50" cols="50" name="recruitContent">${recruitDTO.recruitContent}</textarea> </td>
			</tr>
				<tr>
				<td colspan="2">
					<!-- 로그인 되어있고(세션값이 있으면) => 로그인표시값, 글쓴이 일치 => 글수정, 글삭제 버튼 보이기 --> 
					<div class="apply_btn" id="apply_btn">
					<input type="submit" value="공고 올리기">
					<input type="button" value="공고 리스트" onclick="location.href='${pageContext.request.contextPath}/corplist/list'">
					</div>
				</td>
		</table>
		</div>
	</form>
</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
<script>
    function loadJobs(occupationId) {
        const jobSelect = document.getElementById('job-select');
        jobSelect.innerHTML = '<option value="">먼저 직무를 선택하세요</option>';
        if (occupationId) {
        	$.ajax({
    			type : "GET",
    			url:'${pageContext.request.contextPath}/corplist/job',
    			data: {'occupationId' : occupationId},
    			dataType:'json',
    			success:function(result){
    				$('#job-select').html('');
    				$.each(result, function(index,item){
    					$('#job-select').append('<option value="' + item.jobId + '">' + item.jobName + '</option>');
    				});
    			},
    		});//ajax()
        }
    }
</script>
</body>
</html>