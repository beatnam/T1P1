<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면접후기 게시판 | 글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/community.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/community.jsp"></jsp:include>
<div class="box">
		<div class="main_content">	
		<form action="${pageContext.request.contextPath}/rvborad/riwritepro"  method="post" id="">
			<ul class="bo_info">
				<li class="">글제목 : <input type="text" name="riSubject"></li>
				<li class="">글쓴이 : <input type="text" name="" value="${memberDTO.memberId}" readonly></li>
				<li class="">
					<div class="content_text">
					    글내용 : <textarea name="riContent" rows="30" cols="40"></textarea>
                    </div>
				</li>
			</ul>
			<p class="bo_btn">
				<button type="submit" class="btn_srch">글쓰기</button>
				<a href="${pageContext.request.contextPath}/rvborad/rilist" class="" id="">글목록</a>
			</p>
		</form>
		</div>
		</div>
		</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>