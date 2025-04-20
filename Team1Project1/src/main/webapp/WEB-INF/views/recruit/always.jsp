<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">

  <title>취업정보 | 공개채용</title>
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
  <h1>상시 채용</h1>

  <div class="menu">
    <ul>
      <li><a href="open.html">공개 채용</a></li>
      <li><a href="always.html">상시 채용</a></li>
      <li><a href="fair.html">취업 박람회</a></li>
      <li><a href="50.html">50대 기업</a></li>
    </ul>
  </div>
  <input type="text" placeholder="검색어를 입력하세요."> <button type="button">검색</button>
 <a href="../manager/alwaysrecruit_mng.html">관리자 페이지</a>
  <div class="recruit-list">
    <h2>채용 정보</h2>
    <table border="1">
      <tr>
        <td colspan="2">사진</td>
      </tr>
      <tr>
        <td colspan="2">회사명</td>
      </tr>
      <tr>
        <td colspan="2">공고명</td>
      </tr>
      <tr>
        <td>직종</td>
        <td>직무</td>
      </tr>
      <tr>
        <td>지역</td>
      </tr>
    </table>
  </div>
<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>