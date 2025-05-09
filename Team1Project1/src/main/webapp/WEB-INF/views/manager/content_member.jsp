<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_mng.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>

		<div class="box">


			<ul>
				<li>아이디 : ${contentMember.member_id}</li>
				<li>이름 : ${contentMember.member_name}</li>
				<li>이메일 : ${contentMember.member_email}</li>
				<li>주소 : ${contentMember.member_address}</li>

				<li>지원 내역</li>
				<li>게시글 내역</li>

			</ul>

		</div>
	</div>

</body>
</html>