<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- <!DOCTYPE html> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">

<title>취업 정보 | 취업 박람회</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/recruit_info.jsp"></jsp:include>

	<c:if test="${sessionScope.type eq 100 }">
		<a href="${pageContext.request.contextPath }/manager/fair_mng">관리자
			페이지</a>
	</c:if>
	<input type="text" placeholder="검색어를 입력하세요.">
	<button type="button">검색</button>
	<!-- 검색 기능 추가 -->
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

	<tr>
		<td>박람회 사진1</td>
		<td>박람회 사진 2</td>
	</tr>
	밑으로 쭉 내려가고 사진 누르면 박람회 홈페이지로 이동

	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>