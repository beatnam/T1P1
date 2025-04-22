<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<div class="top-bar">
		<div class="logo">
		<a href="${pageContext.request.contextPath }/main/main">
			출근<span>.</span></a> 
		</div>
		<div class="search-bar">
			<input type="text" placeholder="검색어를 입력해주세요" />
		</div>
	</div>

	<div class="bottom-bar">
		<div class="nav-links">
			<a href="${pageContext.request.contextPath }/main/recruit_info">채용정보</a>
			<a href="#">커뮤니티</a>
			<a href="${pageContext.request.contextPath }/main/customerService">고객센터</a>
			<a href="${pageContext.request.contextPath }/main/my-profile">마이페이지</a>
		</div>


		<div class="right-links">

			<a href="${pageContext.request.contextPath }/main/join">회원가입</a> 
			<a href="${pageContext.request.contextPath }/main/cop_join">기업회원가입</a> 
			<a href="${pageContext.request.contextPath }/main/login">로그인</a> 
			<a href="${pageContext.request.contextPath }/main/copmain">기업 서비스</a>
		</div>

	</div>
</header>