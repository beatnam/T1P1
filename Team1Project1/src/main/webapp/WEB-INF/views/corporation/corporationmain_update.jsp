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
<style>
/* General reset and styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
}

/* Parent container styling */
.parent_div {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #ffffff;
    padding: 10px;
    border: 1px solid #ddd;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.parent_div input#cop_file {
    padding: 5px 10px;
    background-color: #007BFF;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.parent_div input#cop_file:hover {
    background-color: #0056b3;
}

/* Main content styling */
.main_content {
    margin: 20px;
    padding: 15px;
    background-color: #ffffff;
    border-radius: 10px;
    border: 1px solid #ddd;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

/* List styling */
.main_content ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.main_content ul li {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.main_content ul li:last-child {
    border-bottom: none;
}

.main_content ul a {
    color: #007BFF;
    text-decoration: none;
    margin-right: 10px;
    font-weight: bold;
}

.main_content ul a:hover {
    text-decoration: underline;
}

.main_content ul input[type="text"],
.main_content ul input[type="tel"],
.main_content ul input[type="url"],
.main_content ul input[type="email"],
.main_content ul input[type="password"] {
    width: 70%;
    padding: 5px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
    color: #333;
}

/* Apply button styling */
.apply_btn {
    text-align: right; /* 버튼을 가운데 정렬 */
    margin-top: 20px; /* 위쪽 여백 추가 */
    margin-bottom: 20px;
    margin-right: 20px;
}

.apply_btn input[type="submit"] {
    background-color: #007BFF; /* 버튼 배경색 (파란색) */
    color: #fff; /* 글자 색 (흰색) */
    font-size: 16px; /* 글자 크기 */
    font-weight: bold; /* 글자 굵게 */
    padding: 10px 20px; /* 버튼 내부 여백 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 테두리 */
    cursor: pointer; /* 마우스를 올리면 클릭 가능하도록 변경 */
    transition: background-color 0.3s ease-in-out;
}

#cop_file {
background-color: #007BFF; /* 버튼 배경색 */
color: white; /* 텍스트 색상 */
border: none; /* 테두리 제거 */
border-radius: 8px; /* 둥근 모서리 */
padding: 10px 20px; /* 버튼 크기 조정 */
font-size: 16px; /* 글꼴 크기 */
cursor: pointer; /* 마우스 포인터 변경 */
transition: background-color 0.3s ease; /* 호버 효과 */
}

#cop_file:hover {
background-color: #0056b3; /* 호버 시 배경색 */
}

#cop_file:active {
background-color: #004085; /* 클릭 시 배경색 */
}
</style>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
				<!-- 다른계획있을시 수정 -->
<jsp:include page="../inc/corptop.jsp"></jsp:include>
 <header id="base">
 	<div class="parent_div">
 		<img alt="" src="">
 	</div>
 	<form action="${pageContext.request.contextPath}/corpmain/updatepro" method="post">
 		<div class="main_content">
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
 </header>
 <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>