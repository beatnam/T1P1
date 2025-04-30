<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력 추가</title>
</head>
<body>

 <form action="${pageContext.request.contextPath}/mypage/education-insert" method="post">
    <label>학교명: </label>
    <input type="text" name="educationSchool" required><br>

    <label>전공: </label>
    <input type="text" name="educationMajor"><br>

    <label>세부전공: </label>
    <input type="text" name="majorDetail"><br>

    <input type="hidden" name="memberNum" value="${sessionScope.member_num}">

    <button type="submit">저장</button>
  </form>
  
</body>
</html>
