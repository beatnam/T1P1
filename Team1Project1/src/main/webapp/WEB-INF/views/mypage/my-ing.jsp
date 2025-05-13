<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 지원현황</title>

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-ing.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">

 
</head>
<body>

<jsp:include page="../inc/top.jsp"></jsp:include>

<div class="all">    
    <div class="banner">
        <h2><a href="${pageContext.request.contextPath}/mypage/my-profile">마이페이지</a></h2>
        <div class="banner1">
            <ul class="banner-list">
                <li class="banner-profile"><a href="${pageContext.request.contextPath}/mypage/my-profile">프로필</a></li>
                <li class="banner-resume"><a href="${pageContext.request.contextPath}/mypage/my-resume">이력서</a></li>
                <li class="banner-introduce"><a href="${pageContext.request.contextPath}/mypage/my-introduce">자기소개서</a></li>
                <li class="banner-ing active"><a href="${pageContext.request.contextPath}/mypage/my-ing">지원현황</a></li>
            </ul>
        </div>
    </div>

    <div class="box">

        <c:forEach var="resumeList" items="${resumeList}">
    		<div class="inbox">
        		<div>${resumeList.member_name}</div>
        		<div>${resumeList.corporation_name}</div>
        		<div>${resumeList.recruit_name}</div>
        		<div>${resumeList.approved}</div>
    		</div>
		</c:forEach>

    </div>
</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>