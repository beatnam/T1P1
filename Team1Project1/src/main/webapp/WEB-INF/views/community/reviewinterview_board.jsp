<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 면접 후기 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<h3>면접 후기 게시판</h3>
<form action="#" class="">
	<fieldset>
		<legend>검색</legend>
		<input type="text" class="s" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
			<a href="#" class="s">검색</a>
			<c:if test="">
					<a href="${pageContext.request.contextPath}/rvborad/rcwrite" class="">글쓰기</a>
					</c:if>
				</fieldset>
			</form>
			<table class="" summary="">
				<caption class="">게시글 목록</caption>
				<thead>
					<tr>
						<th scope="s1">글번호</th>
						<th scope="s1">글제목</th>
						<th scope="s1">글쓴이</th>
						<th scope="s1">작성일시</th>
						<th scope="s1">조회수</th>
					</tr>
				</thead>
				<tbody>
<%-- 					<c:forEach var="" items=""> --%>
					<tr>
						<td>글번호</td>
						<td class="tit_notice"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
<%-- 					</c:forEach> --%>
					<tr>
						<td>글번호</td>
						<td class="tit_notice"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>글번호</td>
						<td class="tit_notice"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>글번호</td>
						<td class="tit_notice"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>글번호</td>
						<td class="tit_notice"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>글번호</td>
						<td class="tit_notice"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
				</tbody>
			</table>
			
			<div class="page-numbers">
				<a href="">[이 전]</a> <a href="">1</a> <a href="">2</a> <a href="">3</a>
				<a href="">4</a> <a href="">5</a> <a href="">[다 음]</a>
			</div>
			<div class="">
				<a href="${pageContext.request.contextPath}/rvborad/riwrite" class="btn_srch">글쓰기</a>
			</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>