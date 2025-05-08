<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corptop.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
				<!-- 다른계획있을시 수정 -->
<jsp:include page="../inc/corptop.jsp"></jsp:include>
 <header id="base">
 	<div class="parent_div">
 	
 	</div>
 	<form action="${pageContext.request.contextPath}/corpmain/main" method="get">
 		<div class="main_content">
 			<img alt="" src="">
 			<input type="button" id="cop_file" name="cop_file" value="첨부 파일">
 			<ul> 
 				<li><a href="">기업 아이디</a><input type="text" id="corpId" name="corpId" value="${corporationDTO.corporationMemberId}" readonly></li>
 				<li><a href="">기업 이름</a><input type="text" id="corpName" name="corpName" value="${corporationDTO.corporationName}" readonly></li>
 				<li><a href="">사업자 번호</a><input type="text" id="registration" name="registration" value="${corporationDTO.corporationRegistration}" readonly></li>
 				<li><a href="">소재지</a><input type="text" id="corpAddress" name="corpAddress" value="${corporationDTO.corporationAddress}" readonly></li>
 				<li><a href="">전화번호</a><input type="tel" id="corpPhone" name="corpPhone" value="${corporationDTO.corporationPhone}" readonly></li>
 				<li><a href="">홈페이지</a><input type="url" id="corpUrl" name="corpUrl" value="${corporationDTO.corporationUrl}" readonly></li>
 				<li><a href="">회사소개</a><input type="text" id="corpIntro" name="corpIntro" value="${corporationDTO.corporationIntro}" readonly></li>
 				<li><a href="">인사담당자</a><input type="text" id="corpMemName" name="corpMemName" value="${corporationDTO.corporationMemberName}" readonly></li>
 				<li><a href="">인사담당자 전화번호</a><input type="tel" id="corpMemPhone" name="corpMemPhone" value="${corporationDTO.corporationMemberPhone}" readonly></li>
 				<li><a href="">인사담당자 이메일</a><input type="email" id="corpMemEmail" name="corpMemEmail" value="${corporationDTO.corporationMemberEmail}" readonly></li>
 			</ul>
 		</div>
 		
 		<div class="apply_btn">
 			<a href="${pageContext.request.contextPath}/corpmain/update">내용 수정</a>
 		</div>
 	</form>
 </header>
 <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>