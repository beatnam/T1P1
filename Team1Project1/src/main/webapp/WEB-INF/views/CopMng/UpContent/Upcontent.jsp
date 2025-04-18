<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpContent/Upcontent</title>
</head>
<body>

	<jsp:include page="../inc/CopTop.jsp"></jsp:include>

	<h1>공고 내용</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<td>회사명</td>
				<td><input type="text" name="name" value="" readonly></td>
			</tr>
			<tr>
				<td>공고제목</td>
				<td><input type="text" name="subject" readonly></td>
			</tr>
			<tr>
				<td>세부내용</td>
				<td><img alt="" src=""></td>
				<td><textarea name="content" rows="300" cols="500" readonly></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="수정하기"><input type="button" value="삭제하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>