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
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
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


	<ul>
		<li>${recruitContent.recruit_name}</li>
		<li>${recruitContent.corporation_name}</li>
		<li>${recruitContent.occupation_name}</li>
		<li>${recruitContent.job_name}</li>
		<li>${recruitContent.recruit_location}</li>
		<li>${recruitContent.eduhigh_name}</li>
		<li>${recruitContent.recruit_salary}</li>
		<li>${recruitContent.recruit_photo}</li>
		<li>${recruitContent.recruit_content}</li>
		<li>${recruitContent.recruit_deatline}</li>
	</ul>


	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>