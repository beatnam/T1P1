<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면접후기 게시판 | 게시판글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/community.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/community.jsp"></jsp:include>
<div class="box">
	<div class="main_content">	
		<form action="${pageContext.request.contextPath}/rvborad/riupdatepro"  method="post" id="appForm">		
			<ul class="bo_info">
				<li class="">글제목 : <input type="text" name="riSubject" value="${riBoardDTO.riSubject}"></li>
				<li class="">작성자 : <input type="text" name="" value="${memberDTO.memberId}" readonly>
				<input type="hidden" name="riNum" value="${riBoardDTO.riNum}">
				<input type="hidden" name="memberNum" value="${riBoardDTO.memberNum}"></li>
				<li class="">
					<div class="content_text">
					    글내용 : <textarea name="riContent" rows="30" cols="40">${riBoardDTO.riContent}</textarea>
                    </div>
				</li>
			</ul>
			<p class="bo_btn">
				<a href="#" class="" id="btn_up">저장</a>
				<a href="${pageContext.request.contextPath}/rvborad/rilist" class="">글목록</a>
			</p>
		</form>
	</div>
	</div>
	</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
<script type="text/javascript">
let submitBtn = document.querySelector("#btn_up");
let appForm = document.querySelector("#appForm");
submitBtn.onclick = function () {
	appForm.submit();
}
</script>
</body>
</html>