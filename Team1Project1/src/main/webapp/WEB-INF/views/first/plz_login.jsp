<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 요청</title>
</head>
<body>
	<script type="text/javascript">
		alert('로그인 하셔야 사용 가능하십니다.');
		location.href = "${pageContext.request.contextPath}/main/login";
	</script>
</body>
</html>