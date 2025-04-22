<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>상시 채용 | 상세 내용</title>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
  <h1>상시 채용</h1>
  <div class="include_menu">
    <ul>
      <li><a href="${pageContext.request.contextPath }/recruit/open">공개 채용</a></li>
      <li><a href="${pageContext.request.contextPath }/recruit/always">상시 채용</a></li>
      <li><a href="${pageContext.request.contextPath }/recruit/fair">취업 박람회</a></li>
      <li><a href="${pageContext.request.contextPath }/recruit/50">50대 기업</a></li>
    </ul>
  </div>
  <!-- 해당 공고를 올린 기업 회원에게만 보이고-->
  <button type="button">수정</button> <button type="삭제">삭제</button>
  <!-- 누르면 기업 회원원 페이지의 공고 관리 페이지로 이동 -->
  <h1>공고명</h1>
  <div class="tags">

    <span>경력</span>
    <span>직무</span>
  </div>


  <section class="section">
    <h2>회사/서비스 소개</h2>
    <img src="company_office.jpg" alt="회사 사무실 사진">
  </section>

  <section class="section">
    <h2>주요업무</h2>

  </section>

  <section class="section">
    <h2>자격요건</h2>

  </section>

  <section class="section">
    <h2>우대사항</h2>

  </section>

  <section class="section">
    <h2>복지 및 혜택</h2>
    <p>
    </p>
  </section>



  <section class="section">
    <h2>근무정보</h2>
    <p><strong>형태:</strong> </p>
    <p><strong>경력:</strong> 경력 3년 이상</p>
    <p><strong>마감일:</strong> </p>
    <p><strong>근무지:</strong> </p>
  </section>

<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>