<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>출발</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">


</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>


	<section>
		<h1>광고1?</h1>

	</section>



	<section>
		<h1>
			<a href="${pageContext.request.contextPath }/first/filtering">출근</a>
		</h1>
	</section>


	<section>
		<h1>광고2?</h1>

	</section>


	<jsp:include page="../inc/footer.jsp"></jsp:include>

<c:if test="${deleted eq 'true'}">
	<script>
	    alert("탈퇴되었습니다.");
	</script>
</c:if>
	
	
</body>
</html>
