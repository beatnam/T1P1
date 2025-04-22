<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 공고 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/coptop.jsp"></jsp:include>
	<div class="">
		<h1>공고 내용</h1>
		<form action="" method="get">
			<div class="t2">
				<div class="">
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
							<td><textarea rows="50" cols="50" readonly></textarea></td>
						</tr>
						<tr>
							<td>기업 홈페이지 주소</td>
							<td><input type="text" id="" name="" value="" readonly>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="button" value="공고 수정" onclick="location.href='${pageContext.request.contextPath}/coplist/update'">
							<input type="button" value="공고 삭제" onclick="location.href='${pageContext.request.contextPath}/coplist/deletepro'">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>