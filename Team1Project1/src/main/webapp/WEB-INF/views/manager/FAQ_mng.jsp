
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 | FAQ 관리</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
 <jsp:include page="../inc/top.jsp"></jsp:include>
 <jsp:include page="../inc/mng.jsp"></jsp:include>
    <h1>FAQ 관리</h1>
    <table border="1">
        <input type="text" placeholder="검색어를 입력하세요."> <button>검색</button>
        <button type="button" onclick="location.href='faq_write.html'">글쓰기</button>
        <tr>
            <td>질문 내용</td> <!-- -->
            <td>답변</td>
            <td>수정</td>
            <td>삭제</td>
        </tr>
        <tr>
            <td>내용</td>
            <td>답변</td>
            <td><a href="${pageContext.request.contextPath }/manager/FAQ_mng">수정</a></td>
            <td><button>삭제</button></td>
        </tr>

    </table>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>