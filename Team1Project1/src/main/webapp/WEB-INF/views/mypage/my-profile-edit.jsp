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
 	<form id="careerForm" action="${pageContext.request.contextPath}/mypage/insert-career" method="post">
        <div class="inbox1">
            <div class="so">한 줄 소개</div>
            <div>
                <input type="text" name="member_introduce" value="${MyPageDTO.memberIntroduce}" required>
            </div>
        </div>

        <div class="inbox2">
            <div class="che">최종 학력</div>
            <div><input type="text" name="eduhigh_id" value="허거덩" required></div>
            <div><input type="text" name="eduhigh_id" value="허거덩"></div>
        </div>

        <div class="inbox3">
            	<div class="gyeong">경력 사항</div>
            	
            	<c:forEach var="career" items="${careerList}" varStatus="status">
          			<div class="career-view">
            			<input type="text" name="careerList[${status.index}].JH_Corporation" value="${career.JH_Corporation}" readonly>
            			<input type="text" name="careerList[${status.index}].JH_department" value="${career.JH_department}" readonly>
            			<input type="text" name="careerList[${status.index}].work_content" value="${career.work_content}" readonly>
            			<input type="text" name="careerList[${status.index}].start_date" value="${career.start_date}" readonly>
            			<input type="text" name="careerList[${status.index}].end_date" value="${career.end_date}" readonly>
          			</div>
        		</c:forEach>
        
            	<button type="button" onclick="openCareerPopup()">경력 추가하기</button>
        </div>

        <div class="inbox4">
            <div class="ii">이름</div>
            <div><input type="text" name="member_name" value="${MyPageDTO.memberName }" required></div>
        </div>

        <div class="inbox5">
            <div class="hyu">휴대전화</div>
            <div><input type="text" name="member_phone" value="${MyPageDTO.memberPhone }" required></div>
        </div>

        <div class="inbox6">
            <div class="sns">SNS 연동</div>
            <div class="kakao">카카오 아이디 표시</div>
        </div>

        <div class="inbox7">
            <div class="email">이메일 인증 강화</div>
            <div class="checkbox">
                <label>
                    <input type="radio" name="member_infoC" value="${MyPageDTO.memberInfoC }" required>동의
                </label>
                <label>
                    <input type="radio" name="member_infoC" value="${MyPageDTO.memberInfoC }">비동의
                </label>	
            </div>
        </div>

        <div class="inbox8">
  			<button type="submit" class="edit-btn" form="careerForm"
  			onclick="return confirm('저장하시겠습니까?')">저장</button>
		</div>

	</form>
    </div>

</div>

<script>
    function openCareerPopup() {
    	const form = document.getElementById("careerForm");
    	
    	form.querySelectorAll("input[name^='careerList[].']").forEach(input => input.remove());
    	
        window.open(
            '${pageContext.request.contextPath}/mypage/career-add',
            '경력추가',
            'width=500,height=400,left=200,top=200'
        );
    }
</script>

<script>
window.addEventListener("message", function(event) {	
    const data = event.data;
    
    if (data) {
        const form = document.getElementById("careerForm");

        const newCareer = document.createElement("div");
        newCareer.className = "career-view"; 
        
        const index = form.querySelectorAll(".career-view").length;

        const fields = [
            { field: "JH_Corporation", value: data.JH_Corporation, type: "text" },
            { field: "JH_department", value: data.JH_department, type: "text" },
            { field: "work_content", value: data.work_content, type: "text" },
            { field: "start_date", value: data.start_date, type: "date" },
            { field: "end_date", value: data.end_date, type: "date" }
        ];
        
        fields.forEach(field => {
            const input = document.createElement("input");
            input.type = field.type;
            input.name = `careerList[${index}].${field.field}`;
            input.value = field.value;
            input.readOnly = true;
            input.style.marginRight = "10px"; 
            newCareer.appendChild(input);
        });
        
         const allCareers = form.querySelectorAll(".career-view"); 
        if (allCareers.length > 0) {
            const lastCareer = allCareers[allCareers.length - 1];
            lastCareer.after(newCareer);
        } else {
            const button = form.querySelector("button[type='button']");
            form.insertBefore(newCareer, button);
        }
        
        alert("경력 추가 성공");
    }
});
</script>

<%@ include file="../inc/footer.jsp" %>

</body>
</html>