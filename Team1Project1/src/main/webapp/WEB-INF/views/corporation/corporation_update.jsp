<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/selfintroductionletter.css"> --%>
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
				<!-- 다른계획있을시 수정 -->
<jsp:include page="../inc/coptop.jsp"></jsp:include>

 <header>
 	<div class="">
 		<img alt="" src="">
 		<input type="button" id="" name="" value="첨부 파일">
 	</div>
 	<form action="" method="post" enctype="multipart/form-data">
 		<div class="">
 			<ul> 
 				<li><a href="">기업 아이디</a><input type="text" id="" name="" value="" ></li>
 				<li><a href="">기업 이름</a><input type="text" id="" name="" value="" ></li>
 				<li><a href="">사업자 번호</a><input type="text" id="" name="" value="" ></li>
 				<li><a href="">소재지</a><input type="text" id="" name="" value="" ></li>
 				<li><a href="">전화번호</a><input type="tel" id="" name="" value="" ></li>
 				<li><a href="">홈페이지</a><input type="url" id="" name="" value="" ></li>
 				<li><a href="">사업자등록증</a><input type="tel" id="" name="" value="" ></li>
 				<li><a href="">회사소개</a><input type="text" id="" name="" value="" ></li>
 				<li><a href="">인사담당자</a><input type="text" id="" name="" value="" ></li>
 			</ul>
 		</div>
 		
 		<div class="">
 			<input type="submit" value="변경하기" onclick="location.href='${pageContext.request.contextPath}/copmain/updatepro'">
 		</div>
 	</form>
 </header>
 <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>