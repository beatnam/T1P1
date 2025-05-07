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
</head>
<style>
    .container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        /* 간격 조절 */
    }

    .box {
        width: calc(50% - 20px);
        /* 2열이므로 50%에서 간격을 제외 */
        height: 200px;
        border: 1px solid black;
        text-align: center;
        padding: 10px;
        box-sizing: border-box;
    }
</style>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
    <h1>채용 정보</h1>

    <div class="container">
        <div class="box">
            <a href="${pageContext.request.contextPath }/rvborad/rilist">
                <h3>면접 후기 게시판</h3>
            </a>
        </div>
        <div class="box">
            <a href="${pageContext.request.contextPath }/rvborad/rclist">
                <h3>취업 후기 게시판</h3>
            </a>
        </div>
        <div class="box">
            <a href="${pageContext.request.contextPath }/rvborad/FAQ">
                <h3>자주 묻는 질문</h3>
            </a>
        </div>
    </div>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    
</body>

</html>