<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 게시판글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="">	
		<form action=""  method="post" id="">		
			<ul class="">
				<li class="">글제목 : <input type="text" name="subject"></li>
				<li class="">작성자 : <input type="text" name="name" readonly></li>
				<li class="">
					<div class="">
					    글내용 : <textarea name="" rows="30" cols="40"></textarea>
                    </div>
				</li>
			</ul>
			<p class="">
				<a href="${pageContext.request.contextPath}/ivborad/updatepro" class="" id="">글수정</a>
				<a href="${pageContext.request.contextPath}/ivborad/list" class="">글목록</a>
			</p>
		</form>
	</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>