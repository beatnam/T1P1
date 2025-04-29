<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-resume-detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<<<<<<< HEAD
=======

>>>>>>> branch 'TeamTest' of https://github.com/beatnam/T1P1.git

</head>
<body>

<jsp:include page="../inc/top.jsp"></jsp:include>

<div class="all">
 <div class="banner">
    <h2><a href="${pageContext.request.contextPath}/mypage/my-profile">마이페이지</a></h2>
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
    <h2>이력서 상세보기</h2>

    <!-- 사진 -->
    <div class="section">
        <h2>사진</h2>
        <c:if test="${not empty resume.resumePhotoPath}">
            <img src="${resume.resumePhotoPath}" alt="사진" style="max-width: 200px;">
        </c:if>
    </div>

    <!-- 기본 정보 -->
    <div class="section basic-info">
        <h2>기본 정보</h2>
        <p><strong>성명:</strong> ${resume.memberName}</p>
        <p><strong>나이:</strong> ${resume.memberAge}</p>
        <p><strong>성별:</strong> ${resume.memberGender}</p>
        <p><strong>주민등록번호:</strong> ${resume.memberJumin1} - ******</p>
        <p><strong>이메일:</strong> ${resume.memberEmail}@${resume.memberEmailDomain}</p>
        <p><strong>휴대폰번호:</strong> ${resume.memberPhone}</p>
    </div>

    <!-- 주소 -->
    <div class="section">
        <h2>주소</h2>
        <p><strong>우편번호:</strong> ${resume.memberPostcode}</p>
        <p><strong>기본주소:</strong> ${resume.memberAddress}</p>
    </div>

    <!-- 학력 -->
    <div class="section">
        <h2>최종 학력</h2>
        <p><strong>학력구분:</strong> ${resume.eduType}</p>
        <p><strong>학교명:</strong> ${resume.educationSchool}</p>
        <p><strong>전공명:</strong> ${resume.educationMajor}</p>
    </div>

    <!-- 경력 -->
    <div class="section">
        <h2>경력</h2>
        <c:forEach var="career" items="${resume.careerList}">
            <div class="career-row">
                <p><strong>회사명:</strong> ${career.JHId}</p>
                <p><strong>부서명:</strong> ${career.JHDepartment}</p>
                <p><strong>담당업무:</strong> ${career.workContent}</p>
                <p><strong>기간:</strong> ${career.startDate} ~ ${career.endDate}</p>
            </div>
            <hr>
        </c:forEach>
    </div>

    <!-- 자격증 -->
    <div class="section">
        <h2>자격증</h2>
        <p><strong>자격명:</strong> ${resume.certificationName}</p>
        <p><strong>발급기관:</strong> ${resume.certificationIssuer}</p>
        <p><strong>취득일:</strong> ${resume.cermapAquiredDate}</p>
    </div>

    <!-- 외국어 -->
    <div class="section">
        <h2>외국어</h2>
        <p><strong>언어:</strong> ${resume.languageName}</p>
        <p><strong>발급기관:</strong> ${resume.languageIssuer}</p>
        <p><strong>성적:</strong> ${resume.langmapGrade}</p>
    </div>

</div>
</div>

    <!-- 버튼 영역 -->
    <div class="section submit-section" style="text-align:center; margin-top: 30px;">
        <button type="button" class="edit-btn" 
            onclick="location.href='${pageContext.request.contextPath}/resume/edit?resumeId=${resume.resumeId}'">
            수정
        </button>

        <button type="button" class="edit-btn" 
            onclick="if(confirm('정말 삭제하시겠습니까?')) {
                location.href='${pageContext.request.contextPath}/resume/delete?resumeId=${resume.resumeId}';
            }">
            삭제
        </button>

        <button type="button" class="edit-btn" 
            onclick="location.href='${pageContext.request.contextPath}/mypage/my-resume'">
            목록
        </button>
    </div>

	
    

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>