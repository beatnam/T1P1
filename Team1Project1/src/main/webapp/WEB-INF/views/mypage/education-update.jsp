<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력 수정</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/mypage/education-update" method="post">
    <label>학교명: </label>
    <input type="text" name="educationSchool" value="${educationDTO.educationSchool}" required><br>

    <label>전공: </label>
    <input type="text" name="educationMajor" value="${educationDTO.educationMajor}"><br>

    <label>세부전공: </label>
    <input type="text" name="majorDetail" value="${educationDTO.majorDetail}"><br>

    <input type="hidden" name="memberNum" value="${educationDTO.memberNum}">

    <button type="submit">수정</button>
</form>
  
</body>
</html>
