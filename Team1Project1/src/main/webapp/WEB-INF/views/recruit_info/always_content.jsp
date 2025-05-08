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
	<div class="all">
	<jsp:include page="../inc/recruit_info.jsp"></jsp:include>


	<ul>
		<li>${recruitContent.recruit_name}</li>
		<li>${recruitContent.corporation_name}</li>
		<li>${recruitContent.occupation_name}</li>
		<li>${recruitContent.job_name}</li>
		<li>${recruitContent.recruit_location}</li>
		<li>${recruitContent.eduhigh_name}</li>
		<li>${recruitContent.careear_name }</li>
		<li>${recruitContent.recruit_salary}</li>
		<li>${recruitContent.recruit_photo}</li>
		<li>${recruitContent.recruit_content}</li>
		<li>${recruitContent.recruit_deatline}</li>
	</ul>

</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>