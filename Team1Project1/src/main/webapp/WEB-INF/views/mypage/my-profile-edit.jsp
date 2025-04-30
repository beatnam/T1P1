<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-profile-edit.css">
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
 	<form id="careerForm" action="${pageContext.request.contextPath}/mypage/my-profile-edit" method="post">
        <div class="inbox1">
            <div class="so">한 줄 소개</div>
            <div>
            	<input type="hidden" name="memberNum" value="${MyPageDTO.memberNum}">
            	<input type="text" name="memberIntroduce" value="${MyPageDTO.memberIntroduce}">
            </div>
        </div>

        <div class="inbox2">
            <div class="che">최종 학력</div>
            <c:if test="${empty educationList }">
            	<p>학력 정보가 없습니다.</p>
				<button type="button" onclick=
				"window.open('${pageContext.request.contextPath}/mypage/education-insert', 'educationInsert', 'width=600,height=400')">
				학력 추가하기</button>
			</c:if>
            <c:if test="${not empty educationList }">
            	<c:forEach var="edu" items="${educationList }">
            		<div>            			
            			<label>학교명 : </label>
            			<input type="text" name="schoolName" value="${edu.schoolName}" readonly />
            			<label>전공 : </label>
            			<input type="text" name="major" value="${edu.educationMajor}" readonly />
            			<label>세부 전공 : </label>
            			<input type="text" name="majorDetail" value="${edu.majorDetail}" readonly />
            		</div>
            	</c:forEach>
				<button type="button" onclick=
				"window.open('${pageContext.request.contextPath}/mypage/education-update', 'educationUpdate', 'width=600,height=400')">
        		학력 수정하기</button>            
        	</c:if>
            
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
            <div><input type="text" name="member_name" value="${MyPageDTO.memberName }" readonly></div>
        </div>

        <div class="inbox5">
            <div class="hyu">휴대전화</div>
            <div><input type="text" name="member_phone" value="${MyPageDTO.memberPhone }" readonly></div>
        </div>

        <div class="inbox6">
            <div class="sns">SNS 연동</div>
            <div class="kakao">카카오 아이디 표시</div>
        </div>

        <div class="inbox7">
            <div class="email">이메일 인증 강화</div>
            <div class="checkbox">
                <label>
                    <input type="radio" name="memberInfoC" value="1" required
                    <c:if test="${MyPageDTO.memberInfoC == 1 }">checked</c:if>>동의
                </label>
                <label>
                    <input type="radio" name="memberInfoC" value="0"
                    <c:if test="${MyPageDTO.memberInfoC == 0 }">checked</c:if>>비동의
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
    	
//     	form.querySelectorAll("input[name^='careerList[].']").forEach(input => input.remove());
    	
        window.open(
            '${pageContext.request.contextPath}/mypage/career-add',
            '경력추가',
            'width=500,height=400,left=200,top=200'
        );
    }
</script>

<script>
let careerIndex = 0;

document.addEventListener("DOMContentLoaded", function () {
	const form = document.getElementById("careerForm");
	careerIndex = document.querySelectorAll(".career-view").length;
	
	window.addEventListener("message", function(event) {	
    const data = event.data;
    console.log("data : ", data);
    
    if (data) {
        
        const inbox3 = document.querySelector(".inbox3");
        
        const newCareer = document.createElement("div");
        newCareer.className = "career-view"; 
        
        const fields = [
        	{ field: "member_num", value: data.member_num, type: "hidden" },
            { field: "JH_Corporation", value: data.JH_Corporation, type: "text" },
            { field: "JH_department", value: data.JH_department, type: "text" },
            { field: "work_content", value: data.work_content, type: "text" },
            { field: "start_date", value: data.start_date, type: "date" },
            { field: "end_date", value: data.end_date, type: "date" }
        ];        
        console.log("careerIndex used inside forEach:", careerIndex);
        fields.forEach(field => {
            const input = document.createElement("input");
            input.type = field.type;
            input.name = `careerList[${careerIndex}].${field.field}`;
            input.value = field.value;
            input.readOnly = true;
            input.style.marginRight = "10px"; 
            newCareer.appendChild(input);
        });
               
        inbox3.appendChild(newCareer);
        careerIndex++; 
        alert("경력 추가 성공");
        
    }
});
        
form.addEventListener("submit", function (e) {
    const badInputs = this.querySelectorAll("input[name*='careerList[].']");
    badInputs.forEach(input => {
      console.warn("빈 인덱스 input 제거됨:", input.name);
      input.remove();
          });
	});

});
</script>

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>