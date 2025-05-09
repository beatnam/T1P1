<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>출근 | 커뮤니티</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/community.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
    <div class="cm_main">
    <h1>커뮤니티</h1>

    <div class="community_main">
        <div class="box_1">
            <a href="${pageContext.request.contextPath }/rvborad/rilist">
                <h3>면접 후기 게시판</h3>
            </a>
        </div>
        <div class="box_2">
            <a href="${pageContext.request.contextPath }/rvborad/rclist">
                <h3>취업 후기 게시판</h3>
            </a>
        </div>
        <div class="box_3">
            <a href="${pageContext.request.contextPath }/rvborad/FAQ">
                <h3>자주 묻는 질문</h3>
            </a>
        </div>
    </div>
    </div>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    
</body>

</html>