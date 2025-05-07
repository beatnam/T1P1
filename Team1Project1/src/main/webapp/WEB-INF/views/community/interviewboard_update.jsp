<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면접후기 게시판 | 게시판글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
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