<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 보내기</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
    <div class="parent_div">
    <h2>이메일 보내기</h2>
    <form action="${pageContext.request.contextPath}/email/send" method="post" class="" id="">
        <div class="main_content">
        <table>
	        <tr>
	            <td>수신자 이메일:</td>
	            <td><input type="email" name="to" size="35px" placeholder="이메일을 입력하세요." required></td>
	        </tr>
	        <tr>
	            <td>제목:</td>
	            <td><input type="text" name="subject" size="35px" placeholder="제목입력란" required></td>
	        </tr>
	        <tr>
	            <td>메시지:</td>
	            <td><textarea name="message" cols="40px" rows="20px" required></textarea></td>
	        </tr>
	        <tr>
	            <td colspan="2"><input type="submit" value="전송"></td>
	        </tr>
	    </table>
        </div>
    </form>
    </div>
</div>
</div>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>