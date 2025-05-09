<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>출근 | 취업 정보</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
	    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/recruit.css">
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
    <h1>채용 정보</h1>

    <div class="container">
        <div class="box">
            <a href="${pageContext.request.contextPath }/recruit_info/open">
                <h3>공개 채용</h3>
                <p>준비된 당신에게</p>
                <p>#대기업, #중견기업, #스타트업</p>
            </a>
        </div>
        <div class="box">
            <a href="${pageContext.request.contextPath }/recruit_info/always_list">
                <h3>상시 채용</h3>
                <p>간편한 입사 지원</p>
            </a>
        </div>

        <div class="box">
            <a href="${pageContext.request.contextPath }/recruit_info/fair">
                <h3>취업 박람회</h3>
            </a>
        </div>

        <div class="box">
            <a href="${pageContext.request.contextPath }/recruit_info/50">
                <h3>50대 기업</h3>
            </a>
        </div>
    </div>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    
</body>

</html>