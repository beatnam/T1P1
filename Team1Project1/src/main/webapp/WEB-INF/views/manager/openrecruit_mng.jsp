<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 공개 채용 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css"><link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_mng.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include><div class="all">
	<jsp:include page="../inc/mng.jsp"></jsp:include>
	<div class="box">
	<h1>공개 채용 관리</h1>
	<a href="${pageContext.request.contextPath }/manager/openrecruit_write">공개
		채용 작성</a>

	<!-- 	pagination -->
	<div class="pagination">
		<a
			href="${pageContext.request.contextPath}/manager/openrecruit_mng?pageNum=1"
			class="firstpage  pbtn">
			<strong> 맨 앞으로 </strong>
		</a>

		<c:if test="${pageDTO.currentPage > pageDTO.startPage }">
			<a
				href="${pageContext.request.contextPath}/manager/openrecruit_mng?pageNum=${pageDTO.currentPage -1 }"
				class="prevpage  pbtn">
				<strong> 하나 뒤로 </strong>
			</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<c:if test="${i eq pageDTO.currentPage }">
				<a
					href="${pageContext.request.contextPath}/manager/openrecruit_mng?pageNum=${i}">
					<span class="pagenum currentpage">${i }</span>
				</a>

			</c:if>
			<c:if test="${i ne pageDTO.currentPage }">

				<a
					href="${pageContext.request.contextPath}/manager/openrecruit_mng?pageNum=${i}">
					<span class="pagenum">${i }</span>
				</a>
			</c:if>
		</c:forEach>


		<c:if test="${pageDTO.currentPage < pageDTO.pageCount }">
			<a
				href="${pageContext.request.contextPath}/manager/openrecruit_mng?pageNum=${pageDTO.currentPage +1}"
				class="nextpage  pbtn">
				<strong> 하나 다음 </strong>
			</a>
		</c:if>

		<a
			href="${pageContext.request.contextPath}/manager/openrecruit_mng?pageNum=${pageDTO.pageCount}"
			class="lastpage  pbtn">
			<strong>제일 뒤로</strong>
		</a>
	</div>
	<!-- 				pagination -->
	<table border="1">

		<tr>
			<td>공고 번호</td>
			<td>공고명</td>
			<td>회사명</td>
			<td>직종</td>
			<td>직무</td>
			<td>요구 경력</td>
			<td>주 근무일</td>
			<td>마감일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="openrecruit" items="${ORlist }">
			<tr>

				<td>${openrecruit.or_id }</td>
				<td>${openrecruit.or_name }</td>
				<td>${openrecruit.or_corporation_name }</td>
				<td>${openrecruit.occupation_name}</td>
				<td>${openrecruit.job_name }</td>
				<td>${openrecruit.careear_name}</td>
				<td>${openrecruit.or_workday }</td>
				<td>${openrecruit.or_deadline }</td>
				<td><a
						href="${pageContext.request.contextPath}/manager/openrecruit_update?orId=
									${openrecruit.or_id }">글수정</a></td>
				<td><a
						href="
						${pageContext.request.contextPath}/manager/openrecruit_delete?orId=${openrecruit.or_id}">삭제</a></td>

			</tr>
		</c:forEach>
	</table>
	</div></div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>

</html>