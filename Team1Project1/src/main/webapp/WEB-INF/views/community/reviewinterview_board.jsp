<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 면접 후기 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<style>
/* rboard 기본 스타일 적용 */
.rboard {
    margin-left: 10px;
    margin-right: 10px;
    padding: 10px;
}

/* 검색 필드셋 스타일 */
.rboard fieldset {
    border: 1px solid #ccc;
    padding: 10px;
}

/* 검색 입력란 및 버튼 스타일 */
.rboard .s {
    margin: 5px;
}

/* 테이블 스타일링 */
.table_t1 {
    border-collapse: collapse;
    width: 100%;
    margin: 10px auto;
}

.table_t1 th, .table_t1 td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

.table_t1 th {
    background-color: #f4f4f4;
}

/* 링크 스타일링 */
.tit_bo a, .tit_notice a {
    color: #007acc;
    text-decoration: none;
}

.tit_bo a:hover, .tit_notice a:hover {
    text-decoration: underline;
}

/* 페이지 번호 중앙 정렬 */
.page_numbers {
    text-align: center;
}

.page_numbers a {
    margin: 0 5px;
    padding: 5px 10px;
    text-decoration: none;
    color: #007acc;
    border: 1px solid #ccc;
}

.page_numbers a:hover {
    background-color: #f4f4f4;
}

/* 버튼 우측 배치 */
.btn_a {
    text-align: right;
}

.btn_a .btn_srch {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007acc;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

.btn_a .btn_srch:hover {
    background-color: #005a99;
}
</style>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<h3>면접 후기 게시판</h3>
<form action="#" class="rboard">
	<fieldset>
		<legend>검색</legend>
		<input type="text" class="s" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
			<a href="#" class="s">검색</a>
			<c:if test="">
					<a href="${pageContext.request.contextPath}/rvborad/riwite" class="">글쓰기</a>
					</c:if>
				</fieldset>
			</form>
			<table class="table_t1" summary="">
				<caption class="">게시글 목록</caption>
				<thead>
					<tr>
						<th scope="s1">글번호</th>
						<th scope="s1">글제목</th>
						<th scope="s1">글쓴이</th>
						<th scope="s1">작성일시</th>
						<th scope="s1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="riboardDTO" items="${listRibo}">
					<tr>
						<td>${riboardDTO.riNum}</td>
						<td><a href="${pageContext.request.contextPath}/rvborad/ricontent?riNum=${riboardDTO.riNum}">${riboardDTO.riSubject}</a></td>
						<td>${riboardDTO.memberNum}</td>
						<td>${riboardDTO.riDate}</td>
						<td>${riboardDTO.riReadcount}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page_numbers">
				<a href="${pageContext.request.contextPath}/rvborad/rilist?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/rvborad/rilist?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${ i eq pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/rvborad/rilist?pageNum=${i }"><span class="pagenum currentpage">${i }</span></a>
					</c:if>
					<c:if test="${ i ne pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/rvborad/rilist?pageNum=${i }"><span class="pagenum">${i }</span></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/rvborad/rilist?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
				
				<a href="${pageContext.request.contextPath}/rvborad/rilist?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<div class="btn_a">
				<a href="${pageContext.request.contextPath}/rvborad/riwrite" class="btn_srch">글쓰기</a>
			</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>