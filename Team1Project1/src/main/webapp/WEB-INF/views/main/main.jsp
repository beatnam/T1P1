<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>출근</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css">


</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>

	<section style="display: flex; justify-content: center; margin-top: 30px;">
  <div style="
        max-width: 1200px; 
        margin: 0 auto;
        padding: 0 0 20px 0;
        display: flex;
        justify-content: flex-start;
      ">
    <div style="width: fit-content;">
      <a href="${pageContext.request.contextPath}/first/filtering" style="display: inline-block;">
        <img src="${pageContext.request.contextPath}/resources/img/rounded_banner.png" 
             alt="출근 배너" 
             style="width: 560px; height: auto; border-radius: 20px; display: block; cursor: pointer;">
    </a>
    </div>
  </div>
</section>

	<div class="main-job-grid">
    <c:forEach var="recruit" items="${recruitList}">
        <a class="main-job-card" href="${pageContext.request.contextPath}/recruit_info/always_content?recruitId=${recruit.recruitId}">
            <div class="main-job-img-box">
                <img src="${recruit.recruitPhoto}" alt="회사 이미지">
                <div class="d-day">D-${recruit.dday}</div>
            </div>
            <div class="main-job-body">
                <div class="company">${recruit.corporationName}</div>
                <div class="title">${recruit.recruitName}</div>
                <div class="tech">${recruit.occupationName} · ${recruit.jobName}</div>
                <div class="meta">${recruit.recruitLocation} · ${recruit.careearName}</div>
            </div>
        </a>
    </c:forEach>
	</div>

	


	


	<jsp:include page="../inc/footer.jsp"></jsp:include>

<c:if test="${deleted eq 'true'}">
	<script>
	    alert("탈퇴되었습니다.");
	</script>
</c:if>
	
	
</body>
</html>
