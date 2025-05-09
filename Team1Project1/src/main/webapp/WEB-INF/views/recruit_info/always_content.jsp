<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상시 채용 | ${recruitContent.recruit_name}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/recruit.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/recruit_info.jsp"></jsp:include>


		<div class="recruit-detail-card">
			<!-- 상단 제목과 이미지 -->
			<div class="recruit-header">
				<div class="recruit-title-box">
					<h2 class="recruit-title">${recruitContent.recruit_name}</h2>
					<p class="corp-name">${recruitContent.corporation_name}</p>
					<a
						href="${pageContext.request.contextPath }/recruit_info/corp_info?corpName=${recruitContent.corporation_name}"
						class="corp-link"> 회사 정보 보기 → </a>
				</div>
				<div class="recruit-image">
					<c:if test="${not empty recruitContent.recruit_photo}">
						<img
							src="${pageContext.request.contextPath}/resources/upload/${recruitContent.recruit_photo}"
							alt="채용 이미지">
					</c:if>
				</div>
			</div>

			<!-- 주요 정보 섹션 -->
			<div class="recruit-info">
				<div>
					<strong>직종:</strong> ${recruitContent.occupation_name}
				</div>
				<div>
					<strong>직무:</strong> ${recruitContent.job_name}
				</div>
				<div>
					<strong>근무지:</strong> ${recruitContent.recruit_location}
				</div>
				<div>
					<strong>학력:</strong> ${recruitContent.eduhigh_name}
				</div>
				<div>
					<strong>경력:</strong> ${recruitContent.careear_name}
				</div>
				<div>
					<strong>연봉:</strong> ${recruitContent.recruit_salary}
				</div>
				<div>
					<strong>마감일:</strong> ${recruitContent.recruit_deatline}
				</div>
			</div>

			<!-- 공고 내용 -->
			<div class="recruit-description">
				<h4>상세 내용</h4>
				<p>${recruitContent.recruit_content}</p>
			</div>
		</div>

	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>