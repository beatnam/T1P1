<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 지원 자소서 모음</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
	<div class="parent_div">
		<!-- 본문 영역 -->
		<div class="main_content">
			<h3>지원 자소서 모음</h3>
			<table border="1">
				<tr>
					<td>번호</td>
					<td>자소서이름</td>
					<td>마감일자</td>
				</tr>
				
				<c:forEach var="item" items="${listResume}">
				<tr>
					<td>${item.application_id}</td>
					<td><a href="/cover_letter/${item.cv_pdf}">${item.member_name} 님의 자소서</a></td>
					<td>${item.application_date}</td>
				</tr>
				</c:forEach>
				
			</table>
			
			<div class="page_numbers">
				<a href="${pageContext.request.contextPath}/corpmain/coverletter?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/corpmain/coverletter?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${ i eq pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/corpmain/coverletter?pageNum=${i }"><span class="pagenum currentpage">${i }</span></a>
					</c:if>
					<c:if test="${ i ne pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/corpmain/coverletter?pageNum=${i }"><span class="pagenum">${i }</span></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/corpmain/coverletter?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
				
				<a href="${pageContext.request.contextPath}/corpmain/coverletter?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>

		</div>
	</div>
</div>
</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>