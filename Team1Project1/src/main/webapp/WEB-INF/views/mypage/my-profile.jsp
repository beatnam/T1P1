<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-profile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>

<jsp:include page="../inc/top.jsp"></jsp:include>

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
                <input type="text" name="memberIntroduce" value="${MyPageDTO.memberIntroduce}" readonly>
            </div>
        </div>

        <div class="inbox2">
            <div class="che">최종 학력</div>
            	<c:forEach var="edu" items="${educationList }">
            		<div>
            			<p>학교 이름 : ${edu.schoolName }</p>
            			<p>전공 : ${edu.educationMajor }</p>
            			<p>세부 전공 : ${edu.majorDetail }</p>
            		</div>
            	</c:forEach>
        </div>
		
        <div class="inbox3">
            <div class="gyeong">경력 사항</div>
            
            <c:forEach var="career" items="${careerList}">
            	<div class="career-view">
            		<p><strong>회사명:</strong> ${career.JH_Corporation}</p>
      				<p><strong>부서:</strong> ${career.JH_department}</p>
      				<p><strong>업무 내용:</strong> ${career.work_content}</p>
      				<p><strong>시작일:</strong> ${career.start_date}</p>
      				<p><strong>종료일:</strong> ${career.end_date}</p>
        		</div>
        	</c:forEach>
        </div>

        <div class="inbox4">
            <div class="ii">이름</div>
            <div><input type="text" name="memberName" value="${MyPageDTO.memberName}" readonly></div>
        </div>

        <div class="inbox5">
            <div class="hyu">휴대전화</div>
            <div><input type="text" name="memberPhone" value="${MyPageDTO.memberPhone}" readonly></div>
        </div>

        <div class="inbox6">
            <div class="sns">SNS 연동</div>
            <div class="kakao">카카오 아이디 표시</div>
        </div>

        <div class="inbox7">
            <div class="email">이메일 인증 강화</div>
            <div class="checkbox">
                <label>
                    <input type="radio" name="memberInfoC" value="1" 
                    <c:if test="${MyPageDTO.memberInfoC == 1}">checked</c:if> disabled />동의
                </label>
                <label>
                    <input type="radio" name="memberInfoC" value="0" 
                    <c:if test="${MyPageDTO.memberInfoC == 0}">checked</c:if> disabled /> 비동의
                </label>	
            </div>
        </div>

        <div class="inbox8">
            <a href="#" onclick="return handleDelete()">회원 탈퇴</a>
            <a href="${pageContext.request.contextPath}/mypage/my-profile-edit" class="edit-btn">수정</a>
        </div>

    </div>

</div>

<script>
function handleDelete() {
    if (confirm("정말 탈퇴하시겠습니까?")) {
        alert("탈퇴 되었습니다.");
        location.href = "#";

        return false; 
    }
    return false; 
}
</script>

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>