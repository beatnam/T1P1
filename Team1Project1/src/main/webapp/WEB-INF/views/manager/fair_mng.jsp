<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 채용 박람회 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css"><link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_mng.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>
		<div class="box">
			<h1>채용 박람회 관리</h1>
			<table border="1">
				<input type="text" placeholder="검색어를 입력하세요.">
				<button>검색</button>
				<tr>
					<td>박람회 명</td>
					<!-- -->
					<td>URL</td>
					<td>마감일</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				<tr>
					<td>박람회 이름</td>
					<td>URL</td>
					<td>날짜</td>
					<td><a
							href="${pageContext.request.contextPath }/manager/fair_update">수정</a></td>
					<td><button>삭제</button></td>
				</tr>

			</table>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>