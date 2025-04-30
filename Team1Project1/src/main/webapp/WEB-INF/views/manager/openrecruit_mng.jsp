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
	<a href="${pageContext.request.contextPath }/manager/openrecruit_write">공개
		채용 작성</a>
	<h5>회사명을 클릭하면 해당 인사페이지로 이동합니다</h5>
	<input type="text" placeholder="검색어를 입력하세요.">
	<button>검색</button>
	<table border="1">

		<tr>
			<td>공고 번호</td>
			<td>공고명</td>
			<td>회사명</td>
			<td>직종</td>
			<td>직무</td>
			<td>요구 경력</td>
			<td>주 근무일</td>
			<td>마감일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="openrecruit" items="${ORlist }">
			<tr>

				<td>${openrecruit.or_id }</td>
				<td>${openrecruit.or_name }</td>
				<td>${openrecruit.or_corporation_name }</td>
				<td>${openrecruit.occupation_name}</td>
				<td>${openrecruit.job_name }</td>
				<td>${openrecruit.careear_name}</td>
				<td>${openrecruit.or_workday }</td>
				<td>${openrecruit.or_deadline }</td>
				<td><a
						href="${pageContext.request.contextPath}/manager/openrecruit_update?orId=
									${openrecruit.or_id }">글수정</a></td>
				<td><a
						href="
						${pageContext.request.contextPath}/manager/openrecruit_delete?orId=${openrecruit.or_id}">삭제</a></td>

			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>

</html>