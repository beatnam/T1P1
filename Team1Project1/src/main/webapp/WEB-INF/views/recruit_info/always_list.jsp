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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/recruit.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/recruit_info.jsp"></jsp:include>



		<div class="recruit-list">
			<h4>상시 채용</h4>
			<c:if test="${sessionScope.type eq 100 }">
				<a href="${pageContext.request.contextPath }/manager/recruit_mng"
					class="manager">관리자 페이지</a>
			</c:if>
			<div class="card-container">
				<c:forEach var="recruit" items="${recruitList}">
					<div class="job-card">
						<div class="job-image">
							<!-- 예시 이미지, 추후 회사 이미지가 있다면 동적으로 바꾸세요 -->
							<img src="${recruit.recruit_photo }" alt="회사 이미지">
						</div>
						<div class="job-info">
							<h3 class="job-title">
								<a
									href="${pageContext.request.contextPath}/recruit_info/always_content?recruitId=${recruit.recruit_id}">
									${recruit.recruit_name} </a>
							</h3>
							<p class="corp-name">${recruit.corporation_name}</p>
							<p class="tech-stack">${recruit.occupation_name}·
								${recruit.job_name}</p>
							<p class="location">${recruit.recruit_location}·
								${recruit.careear_name}</p>
							<p class="deadline">${recruit.recruit_deatline }</p>
						</div>
					</div>
				</c:forEach>


			</div>
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
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>