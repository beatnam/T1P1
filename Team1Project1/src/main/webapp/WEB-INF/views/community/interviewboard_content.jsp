<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면접후기 게시판 | 게시판 내용</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

		<div class="">	
		<form action=""  method="get" id="">		
			<ul class="">
				<li class="">글제목 : <input type="text" name="subject" value="" readonly></li>
				<li class="">작성자 : <input type="text" name="name" value="" readonly></li>
				<li class="">
					<div class="">
					    글내용 : <textarea name="" rows="30" cols="40" readonly></textarea>
                    </div>
				</li>
			</ul>
			<p class="">
				<a href="${pageContext.request.contextPath}/rvborad/riupdate" class="" id="">글수정</a>
				<a href="${pageContext.request.contextPath}/rvborad/rilist" class="">글목록</a>
			</p>
		</form>
		</div>
		
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>