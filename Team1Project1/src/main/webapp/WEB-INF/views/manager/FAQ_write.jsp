<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>관리자 | FAQ 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="include_menu">
    <ul>
    
        <li>
        
        
            <a href="${pageContext.request.contextPath }/manager/manager/member_mng">회원 관리</a>
            <ul>
                <li><a href="${pageContext.request.contextPath }/manager/member_mng">일반 회원 관리</a></li>
                <li><a href="${pageContext.request.contextPath }/manager/alwaysrecruit_mng">기업 회원 관리</a></li>
            </ul>
        </li>
    
        <li>
        
        
            <a href="${pageContext.request.contextPath }/manager/openrecruit_mng">채용 공고 관리</a>
            <ul>
                <li><a href="${pageContext.request.contextPath }/manager/openrecruit_mng">공개 채용 관리</a></li>
                <li><a href="${pageContext.request.contextPath }/manager/alwaysrecruit_mng">상시 채용 관리</a></li>
            </ul>
        </li>
    
    
    
        <li>
            <a href="${pageContext.request.contextPath }/manager/board_mng">게시판 관리</a>
            <ul>
                <li><a href="${pageContext.request.contextPath }/manager/review_employment_mng">취업 후기 게시판 관리</a></li>
                <li><a href="${pageContext.request.contextPath }/manager/review_interview_mng">면접 후기 게시판 관리</a></li>
                <li><a href="${pageContext.request.contextPath }/manager/FAQ_mng">FAQ 게시판 관리</a></li>
            </ul>
        </li>
    
        <li><a href="${pageContext.request.contextPath }/manager/fair_mng">취업 박람회 관리</a></li>
    </ul>
    </div>

	<h1>FAQ 등록</h1>

	<form action="#" method="post">
		<label for="faq_subject">faq_subject:</label>
		<br>
		<input type="text" id="faq_subject" name="faqSubject" required>
		<br> <br>
		<label for="faq_content">faq_content:</label>
		<br>
		<input type="text" id="faq_content" name="faqContent" required>
		<br> <br>
		<input type="submit" value="등록">
		<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>