<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 채용 박람회 관리</title>
</head>

<body>
 <jsp:include page="../inc/top.jsp"></jsp:include>
 	<div class="include_menu">
	<ul>
		<li><a href="member_mng.html">회원 관리</a></li>

		<li><a href="openrecruit_mng.html">채용 공고 관리</a>
			<ul>
				<li><a href="openrecruit_mng.html">공개 채용 관리</a></li>
				<li><a href="alwaysrecruit_mng.html">상시 채용 관리</a></li>
			</ul></li>

		<li><a href="board_mng.html">게시판 관리</a>
			<ul>
				<li><a href="review_employment_mng.html">취업 후기 게시판 관리</a></li>
				<li><a href="review_interview_mng.html">면접 후기 게시판 관리</a></li>
				<li><a href="FAQ_mng.html">FAQ 게시판 관리</a></li>
			</ul></li>

		<li><a href="fair_mng.html">취업 박람회 관리</a></li>
	</ul>
</div>
	<h1>채용 박람회 관리</h1>
	<table border="1">
		<input type="text" placeholder="검색어를 입력하세요.">
		<button>검색</button>
		<tr>
			<td>박람회 명</td>
			<!-- -->
			<td>URL</td>
			<td>마감일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<tr>
			<td>박람회 이름</td>
			<td>URL</td>
			<td>날짜</td>
			<td><a href="fair_update.html">수정</a></td>
			<td><button>삭제</button></td>
		</tr>

	</table>
	
	 <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>