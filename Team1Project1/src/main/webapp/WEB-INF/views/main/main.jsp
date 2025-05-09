<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>출발</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">

<style>
.main-job-grid {
  max-width: 1200px; 
  margin: 0 auto;     
  display: grid;
  grid-template-columns: repeat(4, 1fr); 
  gap: 24px;
  padding: 30px 0;    
}

.main-job-card {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 240px; 
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 10px;
  text-decoration: none;
  color: #000;
  box-shadow: 0 2px 6px rgba(0,0,0,0.04);
  overflow: hidden;
  transition: transform 0.2s;
}

.main-job-card:hover {
  transform: translateY(-3px);
}

.main-job-img-box {
  position: relative;
  height: 120px;
  overflow: hidden;
}

.main-job-img-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.d-day {
  position: absolute;
  top: 6px;
  left: 6px;
  background: #111;
  color: #fff;
  font-size: 11px;
  padding: 2px 5px;
  border-radius: 4px;
}

.main-job-body {
  padding: 10px;
  font-size: 13px;
}

.main-job-body .company {
  font-weight: 600;
  margin-bottom: 2px;
}

.main-job-body .title {
  font-weight: bold;
  color: #222;
  font-size: 14px;
  margin-bottom: 4px;
}

.main-job-body .tech,
.main-job-body .meta {
  font-size: 12px;
  color: #666;
}

</style>
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
