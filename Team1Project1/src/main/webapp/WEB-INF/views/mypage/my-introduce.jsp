<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 자기소개서</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-introduce.css">

</head>
<body>

<%@ include file="../inc/top.jsp" %>

<div class="all">
    <div class="banner">
        <h2><a href="#">마이페이지</a></h2>
        <div class="banner1">
            <ul class="banner-list">
                <li class="banner-profile"><a href="${pageContext.request.contextPath}/mypage/my-profile">프로필</a></li>
                <li class="banner-resume"><a href="${pageContext.request.contextPath}/mypage/my-resume">이력서</a></li>
                <li class="banner-introduce active"><a href="${pageContext.request.contextPath}/mypage/my-introduce">자기소개서</a></li>
                <li class="banner-ing"><a href="${pageContext.request.contextPath}/mypage/my-ing">지원현황</a></li>
            </ul>
        </div>
    </div>

    <div class="box">

        <c:forEach var="intro" items="${introList}">
    		<div class="inbox">
        		<div>${intro.title}</div>
        		<button onclick="location.href='/introduce/edit?id=${intro.id}'">수정</button>
    		</div>
		</c:forEach>

        <div class="actions">
            <label for="resumeFile" class="file-btn">파일로 등록</label>
    		<input type="file" id="resumeFile" name="resumeFile" style="display: none;">
            <a href="#" class="new-btn">새 자소서 (첨삭)</a>	
        </div>

    </div>
</div>

<%@ include file="../inc/footer.jsp" %>

</body>
</html>