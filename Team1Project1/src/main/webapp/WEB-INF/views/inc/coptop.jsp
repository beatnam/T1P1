<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 다른계획있을시 수정 -->
	<!-- 기업 페이지, 공고 업로드, 지원 이력서 모음, 지원 자소서 모음, 이력서 열람실 -->
	<header id="header">
		<div class="include-menu">
			<h2>기업 회원 페이지</h2>
			<div class="cop-menu-list">
				<ul>
					<li><a href="${pageContext.request.contextPath}/copmain/main">기업 페이지</a></li>
					<li><a href="${pageContext.request.contextPath}/coplist/list">공고 업로드</a></li>
					<li><a href="${pageContext.request.contextPath}/copmain/applyresume">지원 이력서 모음</a></li>
					<li><a href="${pageContext.request.contextPath}/copmain/coverletter">지원 자소서 모음</a></li>
					<li><a href="${pageContext.request.contextPath}/copmain/openresume">이력서 열람실</a></li>
				</ul>
			</div>
		</div>
	</header>