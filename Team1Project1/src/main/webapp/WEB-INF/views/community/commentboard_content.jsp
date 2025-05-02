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
</head>
<style>
/* 메인 콘텐츠 스타일 */
.main_content {
    margin: 20px auto;
    width: 80%;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 게시판 정보 리스트 스타일 */
.bo_info {
    list-style: none;
    padding: 0;
    margin: 0 0 20px;
}

.bo_info li {
    margin-bottom: 15px;
    font-size: 16px;
}

.bo_info input[type="text"] {
    width: 70%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
}

.content_text textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    resize: none;
}

/* 버튼 섹션 스타일 */
.bo_btn {
    text-align: right; /* 버튼 우측 정렬 */
}

.bo_btn a {
    display: inline-block;
    padding: 10px 20px;
    margin-left: 10px;
    text-decoration: none;
    background-color: #007acc;
    color: #fff;
    border-radius: 5px;
}

.bo_btn a:hover {
    background-color: #005a99;
}
</style>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

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
		                <p><strong>${comment.member_id}</strong> | ${comment.ce_date}</p>
		                <p>${comment.ce_content}</p>
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

		
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>