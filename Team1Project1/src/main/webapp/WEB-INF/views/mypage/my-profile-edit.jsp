<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-profile-edit.css">
</head>
<body>

<%@ include file="../inc/top.jsp" %>

<div class="all">

    <div class="banner">
        <h2><a href="${pageContext.request.contextPath}/mypage/my-profile">마이페이지</a></h2>
        <div class="banner1">
            <ul class="banner-list">
                <li class="banner-profile active"><a href="${pageContext.request.contextPath}/mypage/my-profile">프로필</a></li>
                <li class="banner-resume"><a href="${pageContext.request.contextPath}/mypage/my-resume">이력서</a></li>
                <li class="banner-introduce"><a href="${pageContext.request.contextPath}/mypage/my-introduce">자기소개서</a></li>
                <li class="banner-ing"><a href="${pageContext.request.contextPath}/mypage/my-ing">지원현황</a></li>
            </ul>
        </div>
    </div>

    <div class="box">

        <div class="inbox1">
            <div class="so">한 줄 소개</div>
            <div>
                <input type="text" name="member_introduce" value="허거덩" required>
            </div>
        </div>

        <div class="inbox2">
            <div class="che">최종 학력</div>
            <div><input type="text" name="eduhigh_id" value="허거덩" required></div>
            <div><input type="text" name="eduhigh_id" value="허거덩"></div>
        </div>

        <div class="inbox3">
            <div class="gyeong">경력 사항</div>
            <div><input type="text" value="허거덩" required></div>
            <div><input type="text" value="허거덩"></div>
            <div><input type="text" value="허거덩"></div>
        </div>

        <div class="inbox4">
            <div class="ii">이름</div>
            <div><input type="text" name="member_name" value="허거덩" required></div>
        </div>

        <div class="inbox5">
            <div class="hyu">휴대전화</div>
            <div><input type="text" name="member_phone" value="허거덩" required></div>
        </div>

        <div class="inbox6">
            <div class="sns">SNS 연동</div>
            <div class="kakao">카카오 아이디 표시</div>
        </div>

        <div class="inbox7">
            <div class="email">이메일 인증 강화</div>
            <div class="checkbox">
                <label>
                    <input type="radio" name="member_infoC" value="agree" required>동의
                </label>
                <label>
                    <input type="radio" name="member_infoC" value="disagree">비동의
                </label>	
            </div>
        </div>

        <div class="inbox8">
  			<button type="button" class="edit-btn" 
  			onclick="alert('저장이 완료되었습니다.'); location.href='${pageContext.request.contextPath}/mypage/my-profile'">저장</button>
		</div>


    </div>

</div>

<%@ include file="../inc/footer.jsp" %>

</body>
</html>