<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>관리자 | 취업박람회 등록</title>
</head>

<body>
 <jsp:include page="../inc/top.jsp"></jsp:include>
 	<div class="include_menu">
    <ul>
        <li><a href="member_mng.html">회원 관리</a></li>
    
        <li>
            <a href="openrecruit_mng.html">채용 공고 관리</a>
            <ul>
                <li><a href="openrecruit_mng.html">공개 채용 관리</a></li>
                <li><a href="alwaysrecruit_mng.html">상시 채용 관리</a></li>
            </ul>
        </li>
    
        <li>
            <a href="board_mng.html">게시판 관리</a>
            <ul>
                <li><a href="review_employment_mng.html">취업 후기 게시판 관리</a></li>
                <li><a href="review_interview_mng.html">면접 후기 게시판 관리</a></li>
                <li><a href="FAQ_mng.html">FAQ 게시판 관리</a></li>
            </ul>
        </li>
    
        <li><a href="fair_mng.html">취업 박람회 관리</a></li>
    </ul>

</div>
    <h1>취업 박람회 등록</h1>

    <form action="#" method="post">
        <label for="convention_name">박람회명:</label><br>
        <input type="text" id="convention_name" name="convention_name" required><br><br>

        <input type="file" id="convention_photo" name="convention_photo" accept="image/*"><br><br>

        <label for="convention_location">박람회 장소:</label><br>
        <input type="text" id="convention_location" name="convention_location" required><br><br>

        <label for="convention_url">박람회 홈페이지:</label><br>
        <input type="url" id="convention_url" name="convention_url" required><br><br>

        <label for="convention_startdate">박람회 시작 날짜:</label><br>
        <input type="date" id="convention_startdate" name="convention_startdate" required><br><br>

        <label for="convention_enddate">박람회 종료 날짜:</label><br>
        <input type="date" id="convention_enddate" name="convention_enddate" required><br><br>

        <input type="submit" value="등록">
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

</html>