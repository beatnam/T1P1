<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 게시판 내용</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/comment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/community.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/community.jsp"></jsp:include>
<div class="box">
		<div class="main_content">	
		<form action=""  method="get" id="">		
			<ul class="bo_info">
				<li class="">글제목 : <input type="text" name="subject" value="${rcBoardDTO.reSubject}" readonly></li>
				<li class="">작성자 : <input type="text" name="name" value="${memberDTO.memberId}" readonly>
				<input type="hidden" name="memberNum" value="${rcBoardDTO.memberNum}">
				<input type="hidden" name="reNum" value="${rcBoardDTO.reNum}">
				<li class="">
					<div class="content_text">
					    글내용 : <textarea name="" rows="30" cols="40" readonly>${rcBoardDTO.reContent}</textarea>
                    </div>
				</li>
			</ul>
			<p class="bo_btn">
			<c:if test="${! empty sessionScope.id }">
				<c:if test="${sessionScope.num eq rcBoardDTO.memberNum}">
				<a href="${pageContext.request.contextPath}/rvborad/rcupdate?reNum=${rcBoardDTO.reNum}" class="" id="">글수정</a>
				<a href="${pageContext.request.contextPath}/rvborad/rcdelete?reNum=${rcBoardDTO.reNum}" class="" id="">글삭제</a>
				</c:if>
			</c:if>
				<a href="${pageContext.request.contextPath}/rvborad/rclist" class="">글목록</a>
			</p>
		</form>
		</div>
		<div class="comment-section">
    
			<!-- 댓글 작성 -->
		    <form action="${pageContext.request.contextPath}/comment/add" method="post" class="comment-form">
		        <input type="hidden" name="re_num" value="${rcBoardDTO.reNum}">
		        <textarea name="ce_content" rows="4" placeholder="댓글을 입력하세요" required></textarea>
		        <button type="submit">작성</button>
		    </form>
		    <h3>댓글 목록</h3>
		    <!-- 댓글 목록 -->
		    <div class="comment-list">
		        <c:forEach var="comment" items="${comments}">
		            <div class="comment-item">
		            	<c:if test="${comment.parent_id ne null}">
		            	<p>${comment.parent_id}번글의 = 대댓글</p>
		            	</c:if>
		                <p>[${comment.ce_id}]  <strong>${comment.member_id}</strong> | ${comment.ce_date}</p>
		                <p>${comment.ce_content}</p>
		                <input type="hidden" name="parent_id" value="${comment.ce_id}">
		                <form action="${pageContext.request.contextPath}/comment/rerepliesadd" method="post" class="reply-form">
					        <input type="hidden" name="parent_id" value="${comment.ce_id}">
					        <input type="hidden" name="re_num" value="${rcBoardDTO.reNum}">
					        <input type="hidden" name="member_Num" value="${rcBoardDTO.memberNum}">
					        <textarea name="ce_content" rows="2" placeholder="대댓글을 입력하세요" required></textarea>
					        <button type="submit">답글 작성</button>
					    </form>
		                <!-- 수정 폼 -->
		                <div class="btn-updelete">
		                <form action="${pageContext.request.contextPath}/comment/update" method="post" class="update-form">
		                    
		                    <input type="hidden" name="ce_id" value="${comment.ce_id}">
		                    <input type="hidden" name="re_num" value="${rcBoardDTO.reNum}">
		                    <input type="hidden" name="memberNum" value="${rcBoardDTO.memberNum}">
		                    <textarea name="ce_content">${comment.ce_content}</textarea>
		                    <c:if test="${comment.member_id eq sessionScope.id}">
		                    <button type="submit">수정</button>
		                    </c:if>
		                </form>
		                <!-- 삭제 폼 -->
		                <form action="${pageContext.request.contextPath}/comment/delete" method="post" class="delete-form">
		                    <input type="hidden" name="ce_id" value="${comment.ce_id}">
		                   	<input type="hidden" name="re_num" value="${rcBoardDTO.reNum}">
		                    <c:if test="${comment.member_id eq sessionScope.id}">
		                    <button type="submit">삭제</button>
		                    </c:if>
		                </form>
		                </div>
		            </div>
		        </c:forEach>
		    </div>
		</div>
</div>
</div>
		
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>