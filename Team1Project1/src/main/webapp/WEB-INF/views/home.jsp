<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang = "ko">
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!!!  
</h1>
<a href='${pageContext.request.contextPath}/join.jsp'>회원가입</a>
<a href='${pageContext.request.contextPath}/login.jsp'>로그인</a>
<a href='${pageContext.request.contextPath}/list.jsp'>게시판</a>
<P>  The time on the server is ${serverTime}. </P>




</html>
