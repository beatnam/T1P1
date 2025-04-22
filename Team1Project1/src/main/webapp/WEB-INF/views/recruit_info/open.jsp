<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>취업 정보 | 공개 채용</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
    <h1>공개 채용</h1>
     <div class="include_menu">
    <ul>
      <li><a href="${pageContext.request.contextPath }/recruit_info/open">공개 채용</a></li>
      <li><a href="${pageContext.request.contextPath }/recruit_info/always">상시 채용</a></li>
      <li><a href="${pageContext.request.contextPath }/recruit_info/fair">취업 박람회</a></li>
      <li><a href="${pageContext.request.contextPath }/recruit_info/50">50대 기업</a></li>
    </ul>
  </div>
<a href="../manager/openrecruit_mng.html">관리자 페이지</a><!-- 관리자 페이지로 이동-->

    <div class="recruit-list">
        <h2>채용 정보</h2>
        누르면 회사 홈페이지로 이동합니다.
        <table border="1">
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
                <td colspan="2">지역</td>
            </tr>
        
        </table>
    </div>
<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>

</html>