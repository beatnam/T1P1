<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<header>
	<div class="top-bar">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/main/main">
				<img id ="logo" src="${pageContext.request.contextPath }/resources/img/logo.png" alt="로고">
			</a>
		</div>
		<form class="search-bar" id="searchForm" method="get" action="${pageContext.request.contextPath}/main/search">
			<input type="text" placeholder="검색어를 입력해주세요" name = "query" id ="searchinput" required="required" />			
		</form>
	</div>

	<div class="bottom-bar">
		<div class="nav-links">
			<a href="${pageContext.request.contextPath }/main/recruit_info">채용정보</a>
			<a href="${pageContext.request.contextPath }/main/communitymain">커뮤니티</a>
			<a href="${pageContext.request.contextPath }/main/customerService">고객센터</a>
			



			<c:if test="${!empty sessionScope.id}">
				<c:choose>
					<c:when test="${sessionScope.type eq 100}">
						<a href="${pageContext.request.contextPath}/manager/member_mng">관리자
							페이지</a>
					</c:when>
					<c:when test="${sessionScope.type eq 200}">
						<a href="${pageContext.request.contextPath}/main/my-profile">마이페이지</a>
					</c:when>
					<c:when test="${sessionScope.type eq 500}">
						<a href="${pageContext.request.contextPath}/corpmain/main">기업
							서비스</a>
					</c:when>
				</c:choose>
			</c:if>
		</div>


		<div class="right-links">
			<c:if test="${empty  sessionScope.id}">
				<!-- 로그인 하지 않았을때, 세션값이 없을때 (로그인, 회원가입) -->
				<a href="${pageContext.request.contextPath }/main/login">로그인 / 회원가입</a>

			</c:if>


			<c:if test="${! empty sessionScope.id}">
				<!-- 로그인 했을때, 세션값이 있을때 (로그아웃, 회원정보수정) -->
				<div class = "login">
					<a href="#"> ${sessionScope.id }님 </a>
					<a href="${pageContext.request.contextPath}/main/logout">로그아웃</a>
				</div>	
			</c:if>

		</div>

	</div>
	
	
	
	
<script type="text/javascript">
		$(function() {
			  $('#searchForm').submit(function(e) {
			    let keyword = $('#searchinput').val().trim();
	
			    if (keyword === "") {
			      alert("검색어를 입력해주세요.");
			      e.preventDefault(); // 전송 방지
			      return false;
			    }
			  });
			});
		
	</script>
</header>