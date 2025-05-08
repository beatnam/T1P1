<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 보내기</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/my-resume.css">
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
    <h2>이메일 보내기</h2>
    <form action="EmailServlet" method="post">
        <label>수신자 이메일:</label>
        <input type="email" name="to" required><br>
        
        <label>제목:</label>
        <input type="text" name="subject" required><br>
        
        <label>메시지:</label>
        <textarea name="message" required></textarea><br>
        
        <button type="submit">이메일 보내기</button>
    </form>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>