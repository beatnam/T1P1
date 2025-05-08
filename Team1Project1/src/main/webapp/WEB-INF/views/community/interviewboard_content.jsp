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
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

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
		        <textarea name="ci_content" rows="4" placeholder="댓글을 입력하세요" required></textarea>
		        <button type="submit">작성</button>
		    </form>
		    <h3>댓글 목록</h3>
		    <!-- 댓글 목록 -->
		    <div class="comment-list">
		        <c:forEach var="riComment" items="${riComments}">
		            <div class="comment-item">
		            	<c:if test="${riComment.parent_id ne null}">
		            	<p>${riComment.parent_id}번글의 = 대댓글</p>
		            	</c:if>
		                <p>[${riComment.ci_id}] <strong>${riComment.member_id}</strong> | ${riComment.ci_date}</p>
		                <p>${riComment.ci_content}</p>
						<input type="hidden" name="parent_id" value="${riComment.ci_id}">
						
<!-- 					    대댓글 목록 -->
<!-- 					    <div class="replies"> -->
<%-- 				            <c:forEach var="rireplies" items="${rireplies}"> --%>
<!-- 				                <div class="rireply-item"> -->
<%-- 				                    <p><strong>${rireply.member_id}</strong></p> --%>
<%-- 				                    <p>${rireply.ci_content}</p> --%>
<!-- 				                </div> -->
<%-- 				            </c:forEach> --%>
<!-- 				        </div> -->
					    <!-- 대댓글 입력 폼 -->
					    
					    <form action="${pageContext.request.contextPath}/comment/rirepliesadd" method="post" class="reply-form">
					        <input type="hidden" name="parent_id" value="${riComment.ci_id}">
					        <input type="hidden" name="ri_num" value="${riBoardDTO.riNum}">
					        <input type="hidden" name="member_Num" value="${riBoardDTO.memberNum}">
					        <textarea name="ci_content" rows="2" placeholder="대댓글을 입력하세요" required></textarea>
					        <button type="submit">답글 작성</button>
					    </form>
							                
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
		            </div>
		        </c:forEach>
		    </div>
		</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- <!-- <script type="text/javascript"> --> -->
<!-- document.addEventListener("DOMContentLoaded", function() { -->
<!--     document.querySelectorAll(".reply-btn").forEach(button => { -->
<!--         button.addEventListener("click", function() { -->
<!--             const ciId = this.getAttribute("data-ciid"); -->
<!--             console.log("Received ciId:", ciId); -->
<!--             alert(ciId); // 디버깅용 -->

<!--             loadReplies(ciId, this); -->
<!--         }); -->
<!--     }); -->
<!-- }); -->

<!-- function loadReplies(ciId, button) { -->
<!--     console.log("loadReplies 실행됨. ciId:", ciId); -->

<%--     const repliesContainer = document.getElementById(`replies-${ciId}`); --%>

<!--     if (!repliesContainer) { -->
<%--         console.error(`❌ Element #replies-${ciId}를 찾을 수 없습니다.`); --%>
<!--         return; -->
<!--     } -->

<!--     // 이미 열려있으면 숨기기 -->
<!--     if (repliesContainer.style.display === "block") { -->
<!--         repliesContainer.style.display = "none"; -->
<!--         button.textContent = "대댓글 보기"; -->
<!--         return; -->
<!--     } -->

<!--     // 서버에서 대댓글 로드 -->
<%--     fetch(`/comment/rireplies/${ciId}`) --%>
<!--         .then(response => { -->
<!--             if (!response.ok) throw new Error("응답 실패"); -->
<!--             return response.json(); -->
<!--         }) -->
<!--         .then(data => { -->
<!--             console.log("✅ AJAX 응답 데이터:", data); -->

<!--             repliesContainer.innerHTML = ""; -->

<!--             if (!data || data.length === 0) { -->
<!--                 repliesContainer.innerHTML = "<p>대댓글이 없습니다.</p>"; -->
<!--             } else { -->
<!--                 data.forEach(reply => { -->
<!--                     const replyItem = document.createElement("div"); -->
<!--                     replyItem.classList.add("reply-item"); -->
<!--                     replyItem.innerHTML = ` -->
<%--                         <p><strong>${reply.member_id}</strong></p> --%>
<%--                         <p>${reply.ci_content}</p> --%>
<!--                     `; -->
<!--                     repliesContainer.appendChild(replyItem); -->
<!--                 }); -->
<!--             } -->

<!--             repliesContainer.style.display = "block"; -->
<!--             button.textContent = "대댓글 숨기기"; -->
<!--         }) -->
<!--         .catch(error => { -->
<!--             console.error("🚨 대댓글 불러오기 오류:", error); -->
<!--         }); -->
<!-- } -->


<%-- function replies(${ciId}) { --%>
<!-- 	alert(ciId); -->
<%--     const replies = document.getElementById('replies-${ciId}'); --%>
<!--     alert(replies); -->
<!--     if (ciId) { -->
<!--     	$.ajax({ -->
<!-- 			type : "GET", -->
<%-- 			url:'${pageContext.request.contextPath}/rireplies/${ciId}', --%>
<!-- 			data: {'ciId' : ciId}, -->
<!-- 			dataType:'json', -->
<!-- 			success:function(result){ -->
<!-- 				$('#replies').html(''); -->
<!-- 				$.each(result, function(index,item){ -->
<%-- 					$('#job-select').append('<p><strong>' + ${reply.member_id} + '</strong></p><p>' + ${reply.ci_content} + '</p>'); --%>
<!-- 				}); -->
<!-- 			}, -->
<!-- 		});//ajax() -->
<!--     } -->
<!-- } -->
<!-- </script> -->


</body>
</html>