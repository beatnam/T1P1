<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community/InterviewReviewBoard</title>
</head>
<body>

<h3>면접 후기 게시판</h3>
<form action="#" class="">
	<fieldset>
		<legend>검색</legend>
		<input type="text" class="s" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
			<a href="#" class="s">검색</a>
			<c:if test="">
					<a href="" class="">글쓰기</a>
					</c:if>
				</fieldset>
			</form>
			<table class="" summary="">
				<caption class="">게시글 목록</caption>
				<thead>
					<tr>
						<th scope="s1">번호</th>
						<th scope="s1">제목</th>
						<th scope="s1">조회수</th>
						<th scope="s1">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="" items="">
					<tr><td>번호</td>
						<td class="tit_notice"><a href="">제목</a> </td>
						<td>조회수</td>
						<td>작성일</td></tr>
					</c:forEach>
				</tbody>
			</table>
</body>
</html>