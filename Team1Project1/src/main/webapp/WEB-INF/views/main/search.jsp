<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>출근</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recruit.css">


</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>


<div class="card-container">

	<!-- 검색 결과가 없을 경우 -->
	<c:if test="${empty result}">
		<h1>검색 결과가 존재하지 않습니다.</h1>
	</c:if>

	<!-- 검색 결과가 있을 경우 -->
	<c:forEach var="result" items="${result}">
		<div class="job-card">
			<div class="job-image">
				<img src="${pageContext.request.contextPath}/resources/upload/${result.recruit_photo}" alt="회사 이미지">
			</div> 
			<div class="job-info">
				<h3 class="job-title">
					<a href="${pageContext.request.contextPath}/recruit_info/always_content?recruitId=${result.recruit_id}">
						${result.recruit_name}
					</a>
				</h3>
				<p class="corp-name">${result.corporation_name}</p>
				<p class="tech-stack">${result.occupation_name} · ${result.job_name}</p>
				<p class="location">${result.recruit_location} · ${result.careear_name}</p>
				<p class="deadline">${result.recruit_deatline}</p>
			</div>
		</div>
	</c:forEach>
	
</div>

	


	<jsp:include page="../inc/footer.jsp"></jsp:include>
	
	
</body>
</html>