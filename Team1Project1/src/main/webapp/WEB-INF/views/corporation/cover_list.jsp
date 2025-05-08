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