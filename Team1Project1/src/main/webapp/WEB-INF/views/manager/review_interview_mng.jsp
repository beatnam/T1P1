<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 면접 후기 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include><div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>
		<div class="box">
			<h1>면접 후기 관리</h1>
			<div class="pagination">
				<a
					href="${pageContext.request.contextPath}/manager/review_interview_mng?pageNum=1"
					class="firstpage  pbtn">
					<strong> 맨 앞으로 </strong>
				</a>

				<c:if test="${pageDTO.currentPage > pageDTO.startPage }">
					<a
						href="${pageContext.request.contextPath}/manager/review_interview_mng?pageNum=${pageDTO.currentPage -1 }"
						class="prevpage  pbtn">
						<strong> 하나 뒤로 </strong>
					</a>
				</c:if>

				<c:forEach var="i" begin="${pageDTO.startPage }"
					end="${pageDTO.endPage }" step="1">
					<c:if test="${i eq pageDTO.currentPage }">
						<a
							href="${pageContext.request.contextPath}/manager/review_interview_mng?pageNum=${i}">
							<span class="pagenum currentpage">${i }</span>
						</a>

					</c:if>
					<c:if test="${i ne pageDTO.currentPage }">

						<a
							href="${pageContext.request.contextPath}/manager/review_interview_mng?pageNum=${i}">
							<span class="pagenum">${i }</span>
						</a>
					</c:if>
				</c:forEach>


				<c:if test="${pageDTO.currentPage < pageDTO.pageCount }">
					<a
						href="${pageContext.request.contextPath}/manager/review_interview_mng?pageNum=${pageDTO.currentPage +1}"
						class="nextpage  pbtn">
						<strong> 하나 다음 </strong>
					</a>
				</c:if>

				<a
					href="${pageContext.request.contextPath}/manager/review_interview_mng?pageNum=${pageDTO.pageCount}"
					class="lastpage  pbtn">
					<strong>제일 뒤로</strong>
				</a>
			</div>
			<!-- 				pagination -->
			<table border="1">

				<tr>
					<td>글번호</td>
					<td>글제목</td>
					<td>글쓴이</td>
					<td>글내용</td>
					<td>작성 일시</td>
					<td>조회수</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="RI" items="${listRIBoard }">
					<tr>
						<td>${RI.ri_num}</td>
						<td>${RI.member_id }</td>
						<td>${RI.ri_subject }</td>
						<td>${RI.ri_content }</td>
						<td>${RI.ri_date }</td>
						<td>${RI.ri_readcount }</td>
						<td><a
								href="${pageContext.request.contextPath }/manager/deleteRI?ri_num=${RI.ri_num }">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>