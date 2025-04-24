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
<style>
/* rboard 기본 스타일 적용 */
.rboard {
    margin-left: 10px;
    margin-right: 10px;
    padding: 10px;
}

/* 검색 필드셋 스타일 */
.rboard fieldset {
    border: 1px solid #ccc;
    padding: 10px;
}

/* 검색 입력란 및 버튼 스타일 */
.rboard .s {
    margin: 5px;
}

/* 테이블 스타일링 */
.table_t1 {
    border-collapse: collapse;
    width: 100%;
    margin: 10px auto;
}

.table_t1 th, .table_t1 td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

.table_t1 th {
    background-color: #f4f4f4;
}

/* 링크 스타일링 */
.tit_bo a, .tit_notice a {
    color: #007acc;
    text-decoration: none;
}

.tit_bo a:hover, .tit_notice a:hover {
    text-decoration: underline;
}

/* 페이지 번호 중앙 정렬 */
.page_numbers {
    text-align: center;
}

.page_numbers a {
    margin: 0 5px;
    padding: 5px 10px;
    text-decoration: none;
    color: #007acc;
    border: 1px solid #ccc;
}

.page_numbers a:hover {
    background-color: #f4f4f4;
}

/* 버튼 우측 배치 */
.btn_a {
    text-align: right;
}

.btn_a .btn_srch {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007acc;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

.btn_a .btn_srch:hover {
    background-color: #005a99;
}
</style>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<h3>면접 후기 게시판</h3>
<form action="#" class="rboard">
	<fieldset>
		<legend>검색</legend>
		<input type="text" class="s" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
			<a href="#" class="s">검색</a>
			<c:if test="">
					<a href="${pageContext.request.contextPath}/rvborad/rcwrite" class="">글쓰기</a>
					</c:if>
				</fieldset>
			</form>
			<table class="table_t1" summary="">
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
						<td class="tit_bo"><a href="${pageContext.request.contextPath}/rvborad/ricontent">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
<%-- 					</c:forEach> --%>
					<tr>
						<td>글번호</td>
						<td class="tit_bo"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>글번호</td>
						<td class="tit_bo"><a href="">글제목</a> </td>
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
						<td class="tit_bo"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>글번호</td>
						<td class="tit_bo"><a href="">글제목</a> </td>
						<td>글쓴이</td>
						<td>작성일시</td>
						<td>조회수</td>
					</tr>
				</tbody>
			</table>
			
			<div class="page_numbers">
				<a href="">[이 전]</a> <a href="">1</a> <a href="">2</a> <a href="">3</a>
				<a href="">4</a> <a href="">5</a> <a href="">[다 음]</a>
			</div>
			<div class="btn_a">
				<a href="${pageContext.request.contextPath}/rvborad/riwrite" class="btn_srch">글쓰기</a>
			</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>