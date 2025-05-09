<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면접후기 게시판 | 게시판 내용</title>
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
				<li class="">글제목 : <input type="text" name="subject" value="${riBoardDTO.riSubject }" readonly></li>
				<li class="">작성자 : <input type="text" name="name" value="${memberDTO.memberId}" readonly>
				<input type="hidden" name="riNum" value="${riBoardDTO.riNum}">
				<input type="hidden" name="memberNum" value="${riBoardDTO.memberNum}">
				</li>
				<li class="">
					<div class="content_text">
					    글내용 : <textarea name="" rows="30" cols="40" readonly>${riBoardDTO.riContent }</textarea>
                    </div>
				</li>
			</ul>
			<p class="bo_btn">
			<c:if test="${! empty sessionScope.id }">
				<c:if test="${sessionScope.num eq riBoardDTO.memberNum}">
				<a href="${pageContext.request.contextPath}/rvborad/riupdate?riNum=${riBoardDTO.riNum}" class="btn_up" id="">글수정</a>
				<a href="${pageContext.request.contextPath}/rvborad/ridelete?riNum=${riBoardDTO.riNum}" class="btn_up" id="">글삭제</a>
				</c:if>
			</c:if>
				<a href="${pageContext.request.contextPath}/rvborad/rilist" class="btn_list">글목록</a>
			</p>
		</form>
		</div>
		<div class="comment-section">
    
			<!-- 댓글 작성 -->
		    <form action="${pageContext.request.contextPath}/comment/riadd" method="post" class="comment-form">
		        <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
		        <textarea name="ci_content" cols="20" rows="2" placeholder="댓글을 입력하세요" required ></textarea>
		        <button type="submit">작성</button>
		    </form>
		    <h3>댓글 목록</h3>
		    <!-- 댓글 목록 -->
		    <div class="comment-list">
		        <c:forEach var="riComment" items="${riComments}">
		            <div class="comment-item">
		            	<c:if test="${riComment.parent_id eq null}">
		                <p>[${riComment.ci_id}] <strong>${riComment.member_id}</strong> | ${riComment.ci_date}</p>
		                <p>${riComment.ci_content}</p>
						<input type="hidden" name="parent_id" value="${riComment.ci_id}">
						</c:if>
						
						<c:if test="${riComment.parent_id ne null}">
		            	<div class="reple">
		                <p>[${riComment.ci_id}] <strong>${riComment.member_id}</strong> | ${riComment.ci_date}</p>
		                <p>${riComment.ci_content}</p>
						<input type="hidden" name="parent_id" value="${riComment.ci_id}">
						</div>
						</c:if>
						
					    <!-- 대댓글 입력 폼 -->
					    <c:if test="${riComment.parent_id eq null}">
					    <form action="${pageContext.request.contextPath}/comment/rirepliesadd" method="post" class="reply-form">
					        <input type="hidden" name="parent_id" value="${riComment.ci_id}">
					        <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
					        <input type="hidden" name="member_Num" value="${riBoardDTO.memberNum}">
					        <textarea name="ci_content" rows="1" placeholder="대댓글을 입력하세요" required></textarea>
					        <button type="submit">답글 작성</button>
					    </form>
					    </c:if>
					    
					    <c:if test="${riComment.parent_id eq null}">
						<c:if test="${! empty sessionScope.id }">
			            <c:if test="${sessionScope.id eq riComment.member_id}">	                
		                <div class="btn-updelete">
		                <!-- 수정 폼 -->
		                <form action="${pageContext.request.contextPath}/comment/riupdate" method="post" class="update-form">
		                    <input type="hidden" name="ci_id" value="${riComment.ci_id}">
		                    <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
		                    <input type="hidden" name="memberNum" value="${riBoardDTO.memberNum}">
		                    <textarea name="ci_content">${riComment.ci_content}</textarea>
		                   	
		                   	<button type="submit">수정</button>
		                </form>
		                <!-- 삭제 폼 -->
		                <form action="${pageContext.request.contextPath}/comment/ridelete" method="post" class="delete-form">
		                    <input type="hidden" name="ci_id" value="${riComment.ci_id}">
		                    <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
		                    <button type="submit">삭제</button>
		                </form>
		                </div>
		                </c:if>
		                </c:if>
		                </c:if>
		                
		                <c:if test="${riComment.parent_id ne null}">
		                <div class="reple_1">
						<c:if test="${! empty sessionScope.id }">
			            <c:if test="${sessionScope.id eq riComment.member_id}">	                
		                <div class="btn-updelete">
		                <!-- 수정 폼 -->
		                <form action="${pageContext.request.contextPath}/comment/riupdate" method="post" class="update-form">
		                    <input type="hidden" name="ci_id" value="${riComment.ci_id}">
		                    <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
		                    <input type="hidden" name="memberNum" value="${riBoardDTO.memberNum}">
		                    <textarea name="ci_content">${riComment.ci_content}</textarea>
		                   	<button type="submit">수정</button>
		                </form>
		                <!-- 삭제 폼 -->
		                <form action="${pageContext.request.contextPath}/comment/ridelete" method="post" class="delete-form">
		                    <input type="hidden" name="ci_id" value="${riComment.ci_id}">
		                    <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
		                    <button type="submit">삭제</button>
		                </form>
		                </div>
		                </c:if>
		                </c:if>
		                </div>
		                </c:if>
		                
		            </div>
		        </c:forEach>
		    </div>
		</div>
</div>
</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>