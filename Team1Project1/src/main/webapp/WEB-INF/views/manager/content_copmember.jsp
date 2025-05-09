<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_mng.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>
		<div class="box">
			<a
				href="${pageContext.request.contextPath }/manager/upgradeCorp?corpId=${corporation.corporationmember_id }">
				정식 기업 회원으로 승인하기. </a>

			<a
				href="${pageContext.request.contextPath }/manager/downgradeCorp?corpId=${corporation.corporationmember_id }">
				사업자 등록증 제출 전으로 강등하기. </a>
			<ul>
				<li>회사명 : ${corporation.corporation_name }</li>
				<li>회원유형 : ${corporation.mt_name }</li>
				<li>아이디 : ${corporation.corporationmember_id }</li>
				<li>전화번호 : ${corporation.corporationmember_phone }</li>
				<li>이메일 : ${corporation.corporationmember_email }</li>
				<li>소재지 : ${corporation.corporation_address }</li>
				<li>사업자 번호 : ${corporation.corporation_registration }</li>
				<li>사업자 등록증 사본 : <img
					src="${corporation.corporation_registrationPdf }"></li>
			</ul>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>