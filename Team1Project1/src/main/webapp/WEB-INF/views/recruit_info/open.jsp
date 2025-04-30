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
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<h1>공개 채용</h1>
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

	<c:if test="${sessionScope.type eq 100 }">
		<a href="${pageContext.request.contextPath }/manager/openrecruit_mng">관리자
			페이지</a>
		<!-- 관리자 페이지로 이동-->
	</c:if>
	<div class="recruit-list">
		<h2>채용 정보</h2>
		<table border="1">

			<tr>

				<td>공고명</td>
				<!-- -->
				<td>회사명</td>
				<td>직종</td>
				<td>직무</td>
				<td>마감일</td>

			</tr>

			<tr>
				<c:forEach var="openrecruit" items="${ORlist }">

					<td>${openrecruit.or_name }</td>
					<td><a href="${openrecruit.or_url}">${openrecruit.or_corporation_name }</a></td>
					<td>${openrecruit.occupation_name}</td>
					<td>${openrecruit.job_name }</td>
					<td>${openrecruit.or_deadline }</td>

				</c:forEach>
			</tr>

		</table>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>

</html>