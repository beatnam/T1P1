<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 취업 후기 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/community.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

<div class="main-content">
<h3>취업 후기 게시판</h3>
<form action="#" class="rboard">
	<fieldset>
		<legend>검색</legend>
		<input type="text" class="search" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
			<a href="#" class="search">검색</a>
			<c:if test="">
					<a href="${pageContext.request.contextPath}/rvborad/rcwrite" class="">글쓰기</a>
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
					<c:forEach var="item" items="${listRcbo}">
					<tr>
						<td>${item.re_num}</td>
						<td><a href="${pageContext.request.contextPath}/rvborad/rccontent?reNum=${item.re_num}">${item.re_subject}</a></td>
						<td>${item.member_id}</td>
						<td>${item.re_date}</td>
						<td>${item.re_readcount}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page_numbers">
				<a href="${pageContext.request.contextPath}/rvborad/rclist?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/rvborad/rclist?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${ i eq pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/rvborad/rclist?pageNum=${i }"><span class="pagenum currentpage">${i }</span></a>
					</c:if>
					<c:if test="${ i ne pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/rvborad/rclist?pageNum=${i }"><span class="pagenum">${i }</span></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/rvborad/rclist?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
				
				<a href="${pageContext.request.contextPath}/rvborad/rclist?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<div class="btn_a">
			<c:if test="${! empty sessionScope.id }">
				<c:if test="${sessionScope.type eq 200}">
			    <a href="${pageContext.request.contextPath}/rvborad/rcwrite" class="btn_srch">글쓰기</a>
				</c:if>
			</c:if>
			</div>
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>