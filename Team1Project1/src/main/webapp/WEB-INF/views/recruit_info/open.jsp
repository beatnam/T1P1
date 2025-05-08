<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>취업 정보 | 공개 채용</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/recruit_info.jsp"></jsp:include>

	<c:if test="${sessionScope.type eq 100 }">
		<a href="${pageContext.request.contextPath }/manager/openrecruit_mng">관리자
			페이지</a>
		<!-- 관리자 페이지로 이동-->
	</c:if>
	<div class="recruit-list">
		<h2>채용 정보</h2>
		
		
		
		<!-- 	pagination -->
		<div class="pagination">
			<a
				href="${pageContext.request.contextPath}/recruit_info/open?pageNum=1"
				class="firstpage  pbtn">
				<strong> 맨 앞으로 </strong>
			</a>

			<c:if test="${pageDTO.currentPage > pageDTO.startPage }">
				<a
					href="${pageContext.request.contextPath}/recruit_info/open?pageNum=${pageDTO.currentPage -1 }"
					class="prevpage  pbtn">
					<strong> 하나 뒤로 </strong>
				</a>
			</c:if>

			<c:forEach var="i" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }" step="1">
				<c:if test="${i eq pageDTO.currentPage }">
					<a
						href="${pageContext.request.contextPath}/recruit_info/open?pageNum=${i}">
						<span class="pagenum currentpage">${i }</span>
					</a>

				</c:if>
				<c:if test="${i ne pageDTO.currentPage }">

					<a
						href="${pageContext.request.contextPath}/recruit_info/open?pageNum=${i}">
						<span class="pagenum">${i }</span>
					</a>
				</c:if>
			</c:forEach>


			<c:if test="${pageDTO.currentPage < pageDTO.pageCount }">
				<a
					href="${pageContext.request.contextPath}/recruit_info/open?pageNum=${pageDTO.currentPage +1}"
					class="nextpage  pbtn">
					<strong> 하나 다음 </strong>
				</a>
			</c:if>

			<a
				href="${pageContext.request.contextPath}/recruit_info/open?pageNum=${pageDTO.pageCount}"
				class="lastpage  pbtn">
				<strong>제일 뒤로</strong>
			</a>
		</div>
		<!-- 				pagination -->
		<table border="1">

			<tr>

				<td>공고명</td>
				<!-- -->
				<td>회사명</td>
				<td>직종</td>
				<td>직무</td>
				<td>경력</td>
				<td>마감일</td>

			</tr>


			<c:forEach var="openrecruit" items="${ORlist }">
				<tr>
					<td>${openrecruit.or_name }</td>
					<td><a href="${openrecruit.or_url}">${openrecruit.or_corporation_name }</a></td>
					<td>${openrecruit.occupation_name}</td>
					<td>${openrecruit.job_name }</td>
					<td>${openrecruit.careear_name }</td>
					<td>${openrecruit.or_deadline }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>

</html>