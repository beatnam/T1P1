<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 새공고 업로드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
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
</style>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
			<!-- 다른계획있을시 수정 -->
	<jsp:include page="../inc/coptop.jsp"></jsp:include>
<div class="parent_div">
	<h1>새공고 업로드</h1>
	<form action="write" method="post" enctype="multipart/form-data">
		<div class="main_content">
		<table border="1">
			<tr>
				<td>제목입력</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>사진 첨부파일<input type="file" name="file" /></td>
				<td></td>
			</tr>
			<tr>
				<td>경력</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>학력</td>
				<td>
					<label for="job-category">직종:</label>
			        <select id="job-category" name="job-category" onchange="loadPositions()">
			            <option value="">직종을 선택하세요</option>
			        </select>
			
			        <label for="job-position">직무:</label>
			        <select id="job-position" name="job-position">
			            <option value="">직종을 먼저 선택하세요</option>
			        </select>
				</td>
			</tr>
			<tr>
				<td>직종</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>직무</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>연봉</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>근무지역</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>게시날짜</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>근무일수</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>상세내용</td>
				<td><textarea rows="50" cols="50"></textarea> </td>
			</tr>
			<tr>
				<td>기업 홈페이지 주소</td>
				<td><input type="text" id="" name="" value=""> </td>
			</tr>
				<tr>
				
				<td colspan="2">
					<!-- 로그인 되어있고(세션값이 있으면) => 로그인표시값, 글쓴이 일치 => 글수정, 글삭제 버튼 보이기 --> 
					<div class="apply_btn" id="apply_btn">
					<c:if test="">
					<input type="button" value="공고 올리기" onclick="location.href='${pageContext.request.contextPath}/coplist/updatepro'">
					</c:if>
					<input type="button" value="공고 리스트" onclick="location.href='${pageContext.request.contextPath}/coplist/list'">
					</div>
				</td>
		</table>
		</div>
	</form>
</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
 <script>
        // 직종 데이터 로드
        async function loadCategories() {
            const response = await fetch('/jobs/categories');
            const categories = await response.json();
            const categorySelect = document.getElementById('job-category');

            categories.forEach(category => {
                const option = document.createElement('option');
                option.value = category.id;
                option.textContent = category.name;
                categorySelect.appendChild(option);
            });
        }

        // 직무 데이터 로드
        async function loadPositions() {
            const categoryId = document.getElementById('job-category').value;
            const positionSelect = document.getElementById('job-position');

            // 초기화
            positionSelect.innerHTML = '<option value="">직무를 선택하세요</option>';

            if (categoryId) {
                const response = await fetch(`/jobs/positions?categoryId=${categoryId}`);
                const positions = await response.json();

                positions.forEach(position => {
                    const option = document.createElement('option');
                    option.value = position.id;
                    option.textContent = position.name;
                    positionSelect.appendChild(option);
                });
            }
        }

        // 초기화
        document.addEventListener('DOMContentLoaded', loadCategories);
    </script>
</body>
</html>