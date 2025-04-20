<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 공고 리스트 | 공고 내용</title>
</head>
<body>

	<jsp:include page="../inc/coptop.jsp"></jsp:include>

	<h1>공고 내용</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<td>제목입력</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>사진<img alt="" src=""></td>
				<td></td>
			</tr>
			<tr>
				<td>경력</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>학력</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>직종</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>직무</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>연봉</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>근무지역</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>게시날짜</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>근무일수</td>
				<td><input type="text" id="" name="" value="" readonly></td>
			</tr>
			<tr>
				<td>상세내용</td>
				<td><textarea rows="50" cols="50" readonly></textarea> </td>
			</tr>
			<tr>
				<td>기업 홈페이지 주소</td>
				<td><input type="text" id="" name="" value="" readonly> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="수정하기"><input type="button" value="삭제하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>