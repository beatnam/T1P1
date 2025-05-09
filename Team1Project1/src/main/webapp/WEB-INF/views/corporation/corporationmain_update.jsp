<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
				<!-- 다른계획있을시 수정 -->
<div class="all">
<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
<div class="parent_div">
 	<form action="${pageContext.request.contextPath}/corpmain/updatepro" method="post">
 		<div class="main_content">
 		<h3>회사 정보 수정</h3>
 			<ul>
 				<li><a href="">기업 아이디</a><input type="text" id="corpId" name="corporationMemberId" value="${corporationDTO.corporationMemberId}" readonly></li>
 				<li><a href="">비밀번호</a><input type="password" id="corpPasswd" name="corporationMemberPasswd" value="${corporationDTO.corporationMemberPasswd}" ></li>
 				<li><a href="">기업 이름</a><input type="text" id="corpName" name="corporationName" value="${corporationDTO.corporationName}" ></li>
 				<li><a href="">사업자 번호</a><input type="text" id="registration" name="corporationRegistration" value="${corporationDTO.corporationRegistration}" readonly></li>
 				<li><a href="">소재지</a><input type="text" id="corpAddress" name="corporationAddress" value="${corporationDTO.corporationAddress}" ></li>
 				<li><a href="">전화번호</a><input type="tel" id="corpPhone" name="corporationPhone" value="${corporationDTO.corporationPhone}" ></li>
 				<li><a href="">홈페이지</a><input type="url" id="corpUrl" name="corporationUrl" value="${corporationDTO.corporationUrl}" ></li>
 				<li><a href="">회사소개</a><input type="text" id="corpIntro" name="corporationIntro" value="${corporationDTO.corporationIntro}" ></li>
 				<li><a href="">인사담당자</a><input type="text" id="corpMemName" name="corporationMemberName" value="${corporationDTO.corporationMemberName}" ></li>
 				<li><a href="">인사담당자 전화번호</a><input type="tel" id="corpMemPhone" name="corporationMemberPhone" value="${corporationDTO.corporationMemberPhone}" ></li>
 				<li><a href="">인사담당자 이메일</a><input type="email" id="corpMemEmail" name="corporationMemberEmail" value="${corporationDTO.corporationMemberEmail}" ></li>
 			</ul>
 		</div>
 		
 		<div class="apply_btn">
 			<input type="submit" value="변경하기">
 		</div>
 	</form>
</div>
</div>
</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>