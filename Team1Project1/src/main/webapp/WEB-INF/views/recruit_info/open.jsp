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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/recruit.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include><div class="all">
		<jsp:include page="../inc/recruit_info.jsp"></jsp:include>


		<div class="recruit-list">

			<h4>공개 채용</h4>

			<c:if test="${sessionScope.type eq 100 }">
				<a
					href="${pageContext.request.contextPath }/manager/openrecruit_mng"
					class="manager">관리자 페이지</a>
				<!-- 관리자 페이지로 이동-->
			</c:if>
			<div class="card-container">
				<c:forEach var="openrecruit" items="${ORlist}">
					<a href="${openrecruit.or_url}" target="_blank">
						<div class="job-card">
							<div class="job-info">
								<h3 class="job-title">${openrecruit.or_name}</h3>
								<p class="corp-name">${openrecruit.or_corporation_name}</p>
								<p class="job-detail">
									<strong>직종:</strong> ${openrecruit.occupation_name}<br> <strong>직무:</strong>
									${openrecruit.job_name}
								</p>
								<p class="edu-career">
									<strong>학력:</strong> ${openrecruit.eduhigh_name}<br> <strong>경력:</strong>
									${openrecruit.careear_name}
								</p>
								<p class="deadline">
									<strong>마감일:</strong> ${openrecruit.or_deadline}
								</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>

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
		</div>
	</div>

	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>

</html>