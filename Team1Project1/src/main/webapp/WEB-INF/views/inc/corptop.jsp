<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 다른계획있을시 수정 -->
	<!-- 기업 페이지, 공고 업로드, 지원 이력서 모음, 지원 자소서 모음, 이력서 열람실 -->
	
			<div class="banner1">
				<h2>기업 회원 페이지</h2>
				<ul class="banner-list">
					<li><a href="${pageContext.request.contextPath}/corpmain/main">기업 페이지</a></li>
					<li><a href="${pageContext.request.contextPath}/corplist/list">공고 업로드</a></li>
					<li><a href="${pageContext.request.contextPath}/corpmain/applyresume">지원 이력서 모음</a></li>
					<li><a href="${pageContext.request.contextPath}/corpmain/coverletter">지원 자소서 모음</a></li>
					<li><a href="${pageContext.request.contextPath}/corpmain/openresume">이력서 열람실</a></li>
				</ul>
			</div>