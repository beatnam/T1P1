<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 상시 채용 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/recruit.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/recruit_info.jsp"></jsp:include>


		<div class="company-detail-card">
			<!-- 회사 로고 및 이름 -->
			<div class="company-header">
				<div class="company-logo">
					<c:if test="${not empty info.corporation_photo}">
						<img
							src="${pageContext.request.contextPath}/resources/upload/${info.corporation_photo}"
							alt="회사 로고">
					</c:if>
				</div>
				<div class="company-info">
					<h2 class="company-name">${info.corporation_name}</h2>
					<p class="company-email">${info.corporationmember_email}</p>
					<a href="${info.corporation_url}" target="_blank"
						class="company-website">공식 홈페이지 방문 →</a>
				</div>
			</div>

			<!-- 회사 소개 -->
			<div class="company-intro">
				<h4>회사 소개</h4>
				<p>${info.corporation_intro}</p>
			</div>

			<!-- 위치 정보 -->
			<div class="company-address">
				<h4>주소</h4>
				<p>${info.corporation_address}</p>
			</div>
		</div>

	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>