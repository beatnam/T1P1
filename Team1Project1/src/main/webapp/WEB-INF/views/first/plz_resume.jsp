<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert('이력서가 없습니다. 이력서 작성 페이지로 넘어갑니다');
		location.href = '${pageContext.request.contextPath}/mypage/my-resume';
	</script>
</body>
</html>