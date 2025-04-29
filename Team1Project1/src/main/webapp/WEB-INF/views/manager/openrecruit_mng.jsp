<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 공개 채용 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/mng.jsp"></jsp:include>
	<h1>공개 채용 관리</h1>
	<input type="text" placeholder="검색어를 입력하세요.">
	<button>검색</button>
	<a href="${pageContext.request.contextPath }/manager/openrecruit_write">공고
		작성</a>

	<table border="1">

		<tr>

			<td>공고명</td>
			<!-- -->
			<td>회사명</td>
			<td>직종</td>
			<td>직무</td>
			<td>마감일</td>

			<!-- 			<td>수정</td> -->
			<!-- 			<td>삭제</td> -->
		</tr>
		<tr>
			<c:forEach var="orMap" items="${ORlist }">
				<td>${orMap.or_name }</td>
				<td>${orMap.or_corporation_name }</td>
				<td>${orMap.occupation_name}</td>
				<td>${orMap.job_name }</td>
				<td>${orMap.or_deadline }</td>

				<%-- 			<td><a href="${pageContext.request.contextPath }/manager/openrecruit_update">수정</a></td> --%>
				<!-- 			<td><button>삭제</button></td> -->
			</c:forEach>
		</tr>

	</table>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>