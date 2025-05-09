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
	<jsp:include page="../inc/top.jsp"></jsp:include><div class="all">
		<jsp:include page="../inc/recruit_info.jsp"></jsp:include>

		<c:if test="${sessionScope.type eq 100 }">
			<a href="${pageContext.request.contextPath }/manager/fair_mng">관리자
				페이지</a>
		</c:if>


	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>