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
	<h1>상시 채용</h1>

	<div class="include_menu">
		<ul>
			<li><a
					href="${pageContext.request.contextPath }/recruit_info/open">공개
					채용</a></li>
			<li><a
					href="${pageContext.request.contextPath }/recruit_info/always_list">상시
					채용</a></li>
			<li><a
					href="${pageContext.request.contextPath }/recruit_info/fair">취업
					박람회</a></li>
			<li><a
					href="${pageContext.request.contextPath }/recruit_info/50">50대
					기업</a></li>
		</ul>
	</div>

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
				href="${pageContext.request.contextPath}${pageContext.request.contextPath }/recruit_info/always?pageNum=1"
				class="firstpage  pbtn">
				<strong> 맨 앞으로 </strong>
			</a>

			<c:if test="${pageDTO.currentPage > pageDTO.startPage }">
				<a
					href="${pageContext.request.contextPath}/${pageContext.request.contextPath }/recruit_info/always?pageNum=${pageDTO.currentPage -1 }"
					class="prevpage  pbtn">
					<strong> 하나 뒤로 </strong>
				</a>
			</c:if>

			<c:forEach var="i" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }" step="1">
				<c:if test="${i eq pageDTO.currentPage }">
					<a
						href="${pageContext.request.contextPath}/${pageContext.request.contextPath }/recruit_info/always?pageNum=${i}">
						<span class="pagenum currentpage">${i }</span>
					</a>

				</c:if>
				<c:if test="${i ne pageDTO.currentPage }">

					<a
						href="${pageContext.request.contextPath}/${pageContext.request.contextPath }/recruit_info/always?pageNum=${i}">
						<span class="pagenum">${i }</span>
					</a>
				</c:if>
			</c:forEach>


			<c:if test="${pageDTO.currentPage < pageDTO.pageCount }">
				<a
					href="${pageContext.request.contextPath}/${pageContext.request.contextPath }/recruit_info/always?pageNum=${pageDTO.currentPage +1}"
					class="nextpage  pbtn">
					<strong> 하나 다음 </strong>
				</a>
			</c:if>

			<a
				href="${pageContext.request.contextPath}/${pageContext.request.contextPath }/recruit_info/always?pageNum=${pageDTO.pageCount}"
				class="lastpage  pbtn">
				<strong>제일 뒤로</strong>
			</a>
		</div>
		<!-- 				pagination -->
		<tr>
			<td>공고번호</td>
			<td>공고명</td>
			<td>회사명</td>
			<td>직종</td>
			<td>직무</td>
			<td>지역</td>
			<td>학력</td>
			<td>제시 급여</td>
		</tr>

		<c:forEach var="recruit" items="${recruitList }">
			<tr>
				<td>${recruit.recruit_id }</td>
				<td><a
						href="${pageContext.request.contextPath }/recruit_info/always_content?recruitId=${recruit.recruit_id}">${recruit.recruit_name}</a></td>
				<td>${recruit.corporation_name}</td>
				<td>${recruit.occupation_name}</td>
				<td>${recruit.job_name}</td>
				<td>${recruit.recruit_location}</td>
				<td>${recruit.eduhigh_name}</td>
				<td>${recruit.recruit_salary}</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>