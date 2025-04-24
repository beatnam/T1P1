<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 공고 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corptop.css">
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
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
	<div class="parent_div">
		<h1>공고 내용</h1>
		<form action="" method="get">
			<div class="main_content">
				<table border="1">
					<tr>
						<td>제목입력</td>
						<td><input type="text" id="" name="" value=""></td>
					</tr>
					<tr>
						<td>사진<img alt="" src=""></td>
						<td></td>
					</tr>
					<tr>
						<td>경력</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>학력</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>직종</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>직무</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>연봉</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>근무지역</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>게시날짜</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>근무일수</td>
						<td><input type="text" id="" name="" value="" readonly></td>
					</tr>
					<tr>
						<td>상세내용</td>
						<td><textarea rows="50" cols="50" readonly></textarea></td>
					</tr>
					<tr>
						<td>기업 홈페이지 주소</td>
						<td><input type="text" id="" name="" value="" readonly>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<div class="apply_btn" id="apply_btn">
						<input type="button" value="공고 수정" onclick="location.href='${pageContext.request.contextPath}/corplist/update'">
						<input type="button" value="공고 삭제" onclick="location.href='${pageContext.request.contextPath}/corplist/deletepro'">
						</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>