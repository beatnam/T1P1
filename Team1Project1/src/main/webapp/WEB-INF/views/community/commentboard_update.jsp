<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 게시판글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/community.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/community.jsp"></jsp:include>
<div class="box">
	<div class="main_content">	
		<form action="${pageContext.request.contextPath}/rvborad/rcupdatepro"  method="post" id="appForm">		
			<ul class="bo_info">
				<li class="">글제목 : <input type="text" name="reSubject" value="${rcBoardDTO.reSubject}"></li>
				<li class="">작성자 : <input type="text" name="" value="${memberDTO.memberId}" readonly>
				<input type="hidden" name="memberNum" value="${rcBoardDTO.memberNum}">
				<input type="hidden" name="reNum" value="${rcBoardDTO.reNum}"></li>
				<li class="">
					<div class="content_text">
					    글내용 : <textarea name="reContent" rows="30" cols="40">${rcBoardDTO.reContent}</textarea>
                    </div>
				</li>
			</ul>
			<p class="bo_btn">
				<a href="#" class="" id="btn_up">저장</a>
				<a href="${pageContext.request.contextPath}/rvborad/rclist" class="">글목록</a>
			</p>
		</form>
	</div>
	</div>
	</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
<script>

</script>
<script src="${pageContext.request.contextPath}/resources/js/reviw_update.js"></script>
</body>
</html>