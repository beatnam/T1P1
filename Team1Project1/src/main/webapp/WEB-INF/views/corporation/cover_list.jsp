<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 업로드 공고 리스트</title>
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

/* Apply buttons */
.apply_btn {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 20px;
}

.apply_btn a {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.apply_btn a#btn_srch {
    background-color: #dc3545;
}

.apply_btn a:hover {
    filter: brightness(0.9);
}
</style>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
	<header id="base">
		<!-- 본문 영역 -->
		<div class="main_content">
			<h3>업로드 공고 리스트</h3>
			<table border="1">
				<tr>
					<td>번호</td>
					<td>공고이름</td>
					<td>마감일자</td>
				</tr>
				
				<c:forEach var="recruitDTO" items="${listCover}">
				<tr>
					<td>${recruitDTO.recruitId}</td>
					<td><a href="${pageContext.request.contextPath}/corplist/content?recruitId=${recruitDTO.recruitId}">${recruitDTO.recruitName}</a></td>
					<td>${recruitDTO.recruitDeatline}</td>
				</tr>
				</c:forEach>
			</table>
			<div class="page_numbers">
				<a href="${pageContext.request.contextPath}/corplist/list?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${ i eq pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${i }"><span class="pagenum currentpage">${i }</span></a>
					</c:if>
					<c:if test="${ i ne pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${i }"><span class="pagenum">${i }</span></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
				
				<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			
			<div class="apply_btn" id="apply_btn">
				<a href="${pageContext.request.contextPath}/corplist/write" class="btn_srch">글쓰기</a>
			</div>
		</div>

	</header>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>