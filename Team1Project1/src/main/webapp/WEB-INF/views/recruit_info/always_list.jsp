<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>취업정보 | 상시채용</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/recruit_info.jsp"></jsp:include>

	<input type="text" placeholder="검색어를 입력하세요.">
	<button>검색</button>
	<c:if test="${sessionScope.type eq 100 }">
		<a href="${pageContext.request.contextPath }/manager/recruit_mng">관리자
			페이지</a>
	</c:if>
	<table border="1">

		<!-- 	pagination -->
		<div class="pagination">
			<a
				href="${pageContext.request.contextPath }/recruit_info/always_list?pageNum=1"
				class="firstpage  pbtn">
				<strong> 맨 앞으로 </strong>
			</a>

			<c:if test="${pageDTO.currentPage > pageDTO.startPage }">
				<a
					href="${pageContext.request.contextPath }/recruit_info/always_list?pageNum=${pageDTO.currentPage -1 }"
					class="prevpage  pbtn">
					<strong> 하나 뒤로 </strong>
				</a>
			</c:if>

			<c:forEach var="i" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }" step="1">
				<c:if test="${i eq pageDTO.currentPage }">
					<a
						href="${pageContext.request.contextPath }/recruit_info/always_list?pageNum=${i}">
						<span class="pagenum currentpage">${i }</span>
					</a>

				</c:if>
				<c:if test="${i ne pageDTO.currentPage }">

					<a
						href="${pageContext.request.contextPath }/recruit_info/always_list?pageNum=${i}">
						<span class="pagenum">${i }</span>
					</a>
				</c:if>
			</c:forEach>


			<c:if test="${pageDTO.currentPage < pageDTO.pageCount }">
				<a
					href="${pageContext.request.contextPath }/recruit_info/always_list?pageNum=${pageDTO.currentPage +1}"
					class="nextpage  pbtn">
					<strong> 하나 다음 </strong>
				</a>
			</c:if>

			<a
				href="${pageContext.request.contextPath }/recruit_info/always_list?pageNum=${pageDTO.pageCount}"
				class="lastpage  pbtn">
				<strong>제일 뒤로</strong>
			</a>
		</div>
		<!-- 				pagination -->

		<c:forEach var="recruit" items="${recruitList }">
			<tr>
				<td id="hidden">${recruit.recruit_id }</td>
				<td><a
						href="${pageContext.request.contextPath }/recruit_info/always_content?recruitId=${recruit.recruit_id}">${recruit.recruit_name}</a></td>
				<td>${recruit.corporation_name}</td>
				<td>${recruit.occupation_name}</td>
				<td>${recruit.job_name}</td>
				<td>${recruit.recruit_location}</td>
				<td>${recruit.eduhigh_name}</td>
				<td>${recruit.careear_name}</td>
				<td>${recruit.recruit_salary}</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>