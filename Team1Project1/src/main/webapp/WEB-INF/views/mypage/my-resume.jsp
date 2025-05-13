<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 이력서</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-resume.css">
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
                <li class="banner-resume active"><a href="${pageContext.request.contextPath}/mypage/my-resume">이력서</a></li>
                <li class="banner-introduce"><a href="${pageContext.request.contextPath}/mypage/my-introduce">자기소개서</a></li>
                <li class="banner-ing"><a href="${pageContext.request.contextPath}/mypage/my-ing">지원현황</a></li>
            </ul>
        </div>
    </div>

    <div class="box">
        <c:forEach var="resume" items="${resumeList}">
            <div class="inbox">
                <div>${resume.resumePhoto}</div>
                
                <div style="margin-top: 10px;">
            		<a href="${pageContext.request.contextPath}/resources/resume/${resume.resumePhoto}" target="_blank">
                	<button>📄 보기</button>
            		</a>
            		<a href="${pageContext.request.contextPath}/resources/resume/${resume.resumePhoto}" download>
                	<button>📥 다운로드</button>
            		</a>
            		
            		<form action="${pageContext.request.contextPath}/resume/delete" method="post" style="display: inline;" 
                  		onsubmit="return confirm('정말 삭제하시겠습니까?');">
                		<input type="hidden" name="resumeID" value="${resume.resumeID}">
                		<input type="hidden" name="resumePhoto" value="${resume.resumePhoto}">
                		<input type="hidden" name="memberNum" value="${member.memberNum}">
                		<button type="submit">🗑 삭제</button>
            		</form>
        		</div>
            </div>
        </c:forEach>

        <div class="agree">
            <div class="text">
                귀하는 개인정보 제공에 동의하셨습니다.
            </div>

			<c:if test="${empty resumeList }">
            <div class="new">
                <button onclick="location.href='${pageContext.request.contextPath}/resume/my-resume-edit'">새 이력서</button>
            </div>
            </c:if>
            
        </div>
    </div>
</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>