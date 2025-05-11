<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 자기소개서</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/my-introduce.css">
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
                <li class="banner-introduce active"><a href="${pageContext.request.contextPath}/mypage/my-introduce">자기소개서</a></li>
                <li class="banner-ing"><a href="${pageContext.request.contextPath}/mypage/my-ing">지원현황</a></li>
            </ul>
        </div>
    </div>

    <div class="box">

        <c:forEach var="introduce" items="${introduceList}">
    		<div class="inbox">
    			
        		<div>
    			${introduce.cvFileName}
<%--     			<a href="${pageContext.request.contextPath}/mypage/introduce/view?filePath=${introduce.cvFileName}" target="_blank">파일 보기</a> --%>
				</div>

        		
        		<c:if test="${not empty introduce.cvContent }">
        			<button onclick="location.href='${pageContext.request.contextPath }'">수정</button>
        		</c:if>
        		
        		<form action="${pageContext.request.contextPath }/mypage/deleteIntroduce" method="post" style="display:inline;">
        			<input type="hidden" name="cvId" value="${introduce.cvId}">
                    <input type="hidden" name="cvFilePath" value="${introduce.cvFilePath}">
                    <button type="submit">삭제</button>
        		</form>
    			
    		</div>
		</c:forEach>
		
		<form id="fileForm" action="${pageContext.request.contextPath}/mypage/uploadIntroduceFile" method="post" enctype="multipart/form-data">
<%-- 		<form action="${pageContext.request.contextPath}/mypage/uploadIntroduceFile" method="post" enctype="multipart/form-data"> --%>
    	<div class="actions">       
            <label for="introduceFile" class="file-btn">파일로 등록</label>
    		<input type="file" id="introduceFile" name="introduceFile" style="display: none;" onchange="document.getElementById('fileForm').submit()">
            
            <a href="${pageContext.request.contextPath }/first/filtering" class="new-btn">새 자소서 (첨삭)</a>	       
        </div>
<!--         </form> -->

		
		</form>

    </div>
</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>