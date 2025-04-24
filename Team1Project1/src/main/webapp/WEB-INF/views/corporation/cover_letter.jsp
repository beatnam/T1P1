<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 지원 자소서 모음</title>
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

/* Page numbers */
.page_numbers {
    text-align: center;
    margin: 10px 0;
}

.page_numbers a {
    margin: 0 5px;
    padding: 5px 10px;
    color: #007BFF;
    text-decoration: none;
    border: 1px solid #ddd;
    border-radius: 3px;
}

.page_numbers a:hover {
    background-color: #007BFF;
    color: white;
}
</style>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
	<header id="base">

		<div class="parent_div">
			<!-- 좌측 메뉴 영역 -->
			
		</div>
		<!-- 본문 영역 -->
		<div class="main_content">
			<h3>지원 자소서 모음</h3>
			<table border="1">
<%-- 				<c:forEach var="" items=""> --%>
					<tr>
						<td>번호</td>
						<td>자소서이름</td>
						<td>마감일자</td>
					</tr>
<%-- 				</c:forEach> --%>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
			</table>
			<!-- 			<div class=""> -->
			<!-- 페이지 번호 -->
			<%-- 			<c:if test=""> --%>
			<!-- 				<a href="">[이 전]</a> -->
			<%-- 			</c:if> --%>

			<%-- 			<c:forEach var="" begin="" end="" step="1"> --%>
			<!-- 				<a href="">1 | 2 | 3 | 4 | 5</a> -->
			<div class="page_numbers">
				<a href="">[이 전]</a> <a href="">1</a> <a href="">2</a> <a href="">3</a>
				<a href="">4</a> <a href="">5</a> <a href="">[다 음]</a>
			</div>
			<%-- 			</c:forEach> --%>
			<!-- 페이지 번호 -->
			<%-- 			<c:if test=""> --%>
			<!-- 				<a href="">[다 음]</a> -->
			<%-- 			</c:if> --%>
			<!-- 			</div> -->

		</div>
	</header>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>