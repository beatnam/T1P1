<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-resume-edit.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

</head>
<body>

<%@ include file="../inc/top.jsp" %>

<div class="all">
 <div class="banner">
    <h2><a href="#">마이페이지</a></h2>
        <div class="banner1">
        <ul class="banner-list">
        <li class="banner-profile"><a href="${pageContext.request.contextPath}/mypage/my-profile">프로필</a></li>
        <li class="banner-resume active"><a href="${pageContext.request.contextPath}/mypage/my-resume">이력서</a></li>
        <li class="banner-introduce"><a href="${pageContext.request.contextPath}/mypage/my-introduce">자기소개서</a></li>
        <li class="banner-ing"><a href="${pageContext.request.contextPath}/mypage/my-ing">지원현황</a></li>
        </ul>
        </div>
    </div>

	<div class="box">
    <h2>이력서 작성</h2>
    <form action="/resume/submit" method="post" enctype="multipart/form-data">

        <!-- 사진 -->
        <div class="section">
            <h2>사진</h2>
            <input type="file" name="resume_photo" accept="image/*">
        </div>

        <!-- 기본 정보 -->
        <div class="section basic-info">
            <h2>기본 정보</h2>
            <div class="row">
                <div>
                    <label for="name">성명</label>
                    <input type="text" name="member_name" id="name">
                </div>
                <div>
                    <label for="age">나이</label>
                    <input type="number" name="member_age" id="age">
                </div>
                <div>
                    <label for="gender">성별</label>
                    <select name="member_gender" id="gender">
                        <option value="">선택</option>
                        <option value="남">남</option>
                        <option value="여">여</option>
                    </select>
                </div>
            </div>

            <div class="row inline-group">
                <div>
                    <label>주민등록번호</label>
                    <div class="inline-inputs">
                    	<input type="text" name="member_jumin1" maxlength="6" placeholder="앞 6자리">
                    	-
                    	<input type="password" name="member_jumin2" maxlength="1" placeholder="뒤 1자리">
                	</div>
                </div>

                <div class="form-inline-group">
                    <label for="email">이메일</label>
                    <div class="inline-inputs">
                        <input type="text" id="emailId" name="member_email" placeholder="아이디 입력">
                        <span>@</span>
                        <input type="text" id="customDomain" name="member_emailDomain" placeholder="직접입력 또는 선택" disabled>
                        <select id="domainSelect">
                            <option value="">-- 도메인 선택 --</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="custom">직접 입력</option>
                        </select>
                    </div>
                </div>

                <div>
                    <label for="phone">휴대폰번호</label>
                    <input type="text" name="member_phone" id="phone">
                </div>
            </div>
        </div>

        <!-- 주소 -->
        <div class="section">
            <h2>주소</h2>
            <label for="zipcode">우편번호</label>
            <input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
            <button type="button" onclick="execDaumPostcode()">우편번호 검색</button><br>

            <label for="address">기본주소</label>
            <input type="text" name="address" id="address" readonly><br>

            <label for="detailAddress">상세주소</label>
            <input type="text" name="detail" id="detailAddress">
        </div>

        <!-- 학력 -->
        <div class="section">
            <h2>학력</h2>
            <label>학력구분</label>
            <select name="eduType">
                <option value="">선택</option>
                <option value="고등학교">고등학교</option>
                <option value="대학교">대학교</option>
                <option value="대학원">대학원</option>
            </select><br>
            <label>학교명</label>
            <input type="text" name="schoolName"><br>
            <label>전공명</label>
            <input type="text" name="major"><br>
        </div>

        <!-- 경력 -->
        <div class="section">
            <h2>경력</h2>
            <label>총 경력</label>
            <div class="career-row">
            <input type="number" name="careerYear" placeholder="년"> 년
            <input type="number" name="careerMonth" placeholder="개월"> 개월
            </div>
        </div>

        <!-- 자격증 -->
        <div class="section">
            <h2>자격증</h2>
            <label>자격명</label>
            <input type="text" name="certification_name">    
            <label>발급기관</label>
            <input type="text" name="certification_issuer">
            <label>취득일</label>
            <input type="date" name="cermap_aquired_date">
        </div>

        <!-- 외국어 -->
        <div class="section">
            <h2>외국어</h2>
            <label>언어</label>
            <select name="language">
                <option value="">선택</option>
                <option>영어</option>
                <option>일본어</option>
                <option>중국어</option>
            </select>
            <label>능력</label>
            <select name="languageLevel">
                <option value="상">상</option>
                <option value="중">중</option>
                <option value="하">하</option>
            </select>
        </div>

        <!-- 제출 -->
        <div class="section submit-section">
            <button type="submit">이력서 제출</button>
        </div>
    </form>
    </div>
</div>

    <!-- 주소 검색 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("postcode").value = data.zonecode;
                    document.getElementById("address").value = data.roadAddress;
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>

    <!-- 이메일 도메인 선택 스크립트 -->
    <script>
        let domainSelect = document.getElementById("domainSelect");
        let customDomain = document.getElementById("customDomain");

        domainSelect.addEventListener("change", function () {
            const selected = domainSelect.value;
            if (selected === "custom") {
                customDomain.value = "";
                customDomain.disabled = false;
                customDomain.focus();
            } else {
                customDomain.value = selected;
                customDomain.disabled = true;
            }
        });
    </script>

<%@ include file="../inc/footer.jsp" %>

</body>
</html>