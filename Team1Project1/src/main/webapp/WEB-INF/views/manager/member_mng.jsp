<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 회원 관리</title>
</head>

<body>
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

	<h1>회원 관리</h1>
	<table border="1">
		<input type="text" placeholder="검색어를 입력하세요.">
		<button>검색</button>
		<tr>
			<td><select>
					<option value="all">전체</option>
					<option value="member">회원</option>
					<option value="company">기업회원</option>
					<option value="admin">관리자</option>
			</select></td>
			<!-- -->
			<td>회원 아이디</td>
			<td>회원 이름</td>
			<!--기업 회원의 경우 기업 이름-->
			<td>게시글 수</td>
			<td>댓글 수</td>
			<td>회원 유형 변경</td>
			<td>삭제</td>
		</tr>
		<tr>
			<td>회원 유형</td>
			<td>ID</td>
			<td>이름</td>
			<td>숫자</td>
			<td>숫자</td>
			<td><button>회원 유형 변경</button></td>
			<td><button>삭제</button></td>
		</tr>

	</table>
</body>

</html>