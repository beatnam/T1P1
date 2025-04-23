<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면접후기 게시판 | 글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
		<div class="">	
		<form action=""  method="post" id="">
			<ul class="">
				<li class="">글제목 : <input type="text" name="subject"></li>
				<li class="">글쓴이 : <input type="text" name="name"></li>
				<li class="">
					<div class="">
					    글내용 : <textarea name="" rows="30" cols="40"></textarea>
                    </div>
				</li>
			</ul>
			<p class="">
				<a href="" class="" id="${pageContext.request.contextPath}/rvborad/riwritepro">글쓰기</a>
				<a href="" class="${pageContext.request.contextPath}/rvborad/rilist">글목록</a>
			</p>
		</form>
		</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>