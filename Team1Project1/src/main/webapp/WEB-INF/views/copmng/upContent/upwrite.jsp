<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upcontent/Upwrite</title>
</head>
<body>
			<!-- 다른계획있을시 수정 -->
	<jsp:include page="../inc/coptop.jsp"></jsp:include>

	<h1>새공고 업로드</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<td>제목입력</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>첨부파일<form action="upload.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="file" /></form></td>
<!--         			업로드 파일 이름 나오게 -->
        			<div class=""><a href=""></a></div>
				<td></td>
			</tr>
			<tr>
				<td>경력<input type=""></td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>학력</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>근무형태</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>급여</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
			<tr>
				<td>근무지역</td>
				<td><input type="text" id="" name="" value=""></td>
			</tr>
				<td colspan="2">
					<!-- 로그인 되어있고(세션값이 있으면) => 로그인표시값, 글쓴이 일치 => 글수정, 글삭제 버튼 보이기 --> 
					<c:if test="">
						<c:if test="">
							<input type="button" value="공고 올리기" onclick="location.href=''">
						</c:if>
					</c:if>
					<input type="button" value="공고 리스트" onclick="location.href=''">
				</td>
		</table>
	</form>
</body>
</html>