<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div class="top-bar">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/main/main">
				출근<span>.</span>
			</a>
		</div>
		<div class="search-bar">
			<input type="text" placeholder="검색어를 입력해주세요" />
		</div>
	</div>

	<div class="bottom-bar">
		<div class="nav-links">
			<a href="${pageContext.request.contextPath }/main/recruit_info">채용정보</a>
<<<<<<< HEAD
			<a href="#">커뮤니티</a>
			<a href="#">고객센터</a>
=======
			<a href="${pageContext.request.contextPath }/main/communitymain">커뮤니티</a>
			<a href="${pageContext.request.contextPath }/main/customerService">고객센터</a>
<<<<<<< HEAD
>>>>>>> branch 'TeamTest' of https://github.com/beatnam/T1P1.git
			<a href="${pageContext.request.contextPath }/main/my-profile">마이페이지</a>
=======

			<c:if test="${!empty sessionScope.id}">
				<c:choose>
					<c:when test="${sessionScope.type eq 100}">
						<a href="${pageContext.request.contextPath}/main/my-profile">마이페이지</a>
					</c:when>
					<c:when test="${sessionScope.type eq 500}">
						<a href="${pageContext.request.contextPath}/corpmain/main">기업
							서비스</a>
					</c:when>
				</c:choose>
			</c:if>
>>>>>>> branch 'TeamTest' of https://github.com/beatnam/T1P1.git
		</div>


		<div class="right-links">
			<c:if test="${empty  sessionScope.id}">
				<!-- 로그인 하지 않았을때, 세션값이 없을때 (로그인, 회원가입) -->
				<a href="${pageContext.request.contextPath }/main/login">로그인</a>
				<a href="${pageContext.request.contextPath }/main/join">회원가입</a>
				<a href="${pageContext.request.contextPath }/main/cop_join">기업회원가입</a>
				<a href="${pageContext.request.contextPath }/main/cop_login">기업
					로그인</a>
			</c:if>


			<c:if test="${! empty sessionScope.id}">
				<!-- 로그인 했을때, 세션값이 있을때 (로그아웃, 회원정보수정) -->
				<li><a href="#"> ${sessionScope.id }님 </a></li>
				<li><a href="${pageContext.request.contextPath}/main/logout">로그아웃</a></li>
			</c:if>

		</div>

	</div>
</header>