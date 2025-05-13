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
          			<div class="career-view" id="career-${career.jhId}" >
            			<input type="text" value="${career.jhCorporation}" readonly>
						<input type="hidden" name="jhCorporation" value="${career.jhCorporation}">
            			<input type="text" value="${career.jhDepartment}" readonly>
            			<input type="hidden" name="jhDepartment" value="${career.jhDepartment}">
            			<input type="text" value="${career.workContent}" readonly>
            			<input type="hidden" name="workContent" value="${career.workContent}">
            			<input type="text" value="${career.startDate}" readonly>
            			<input type="hidden" name="startDate" value="${career.startDate}">
            			<input type="text" value="${career.endDate}" readonly>
            			<input type="hidden" name="endDate" value="${career.endDate}">
            			
            			<button type="button" onclick="deleteCareer(${career.jhId} )">삭제</button>
<%--             			<input type="text" name="careerList[${status.index}].jhCorporation" value="${career.jhCorporation}" readonly> --%>
<%-- 						<input type="text" name="careerList[${status.index}].jhDepartment" value="${career.jhDepartment}" readonly> --%>
<%-- 						<input type="text" name="careerList[${status.index}].workContent" value="${career.workContent}" readonly> --%>
<%-- 						<input type="text" name="careerList[${status.index}].startDate" value="${career.startDate}" readonly> --%>
<%-- 						<input type="text" name="careerList[${status.index}].endDate" value="${career.endDate}" readonly> --%>

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

<!--         <div class="inbox6"> -->
<!--             <div class="sns">SNS 연동</div> -->
<!--             <div class="kakao">카카오 아이디 표시</div> -->
<!--         </div> -->

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
        window.open(
            '${pageContext.request.contextPath}/mypage/career-add',
            '경력추가',
            'width=500,height=400,left=200,top=200'
        );
    }
</script>

<script>
let careerIndex = document.querySelectorAll(".career-view").length;

window.addEventListener("message", function(event) {
    const data = event.data;
    console.log("받은 데이터:", data);
    if (data) {
        const inbox = document.querySelector(".inbox3");

        const wrapper = document.createElement("div");
        wrapper.className = "career-view";

        const index = document.querySelectorAll(".career-view").length;
        
        const fields = [
            { name: "jhCorporation", value: data.jhCorporation },
            { name: "jhDepartment", value: data.jhDepartment },
            { name: "workContent", value: data.workContent },
            { name: "startDate", value: data.startDate },
            { name: "endDate", value: data.endDate }
        ];

        const memberNum = document.querySelector('input[name="memberNum"]').value;
        const hiddenMemberNum = document.createElement("input");
        hiddenMemberNum.type = "hidden";
        hiddenMemberNum.name = `careerList[${index}].memberNum`;
        hiddenMemberNum.value = memberNum;
        wrapper.appendChild(hiddenMemberNum);

        
        fields.forEach(field => {
        	 const visibleInput = document.createElement("input");
             visibleInput.type = "text";
             visibleInput.value = field.value;
             visibleInput.readOnly = true;
             
             const hiddenInput = document.createElement("input");
             hiddenInput.type = "hidden";
             hiddenInput.name = field.name;
             hiddenInput.value = field.value;
             
             wrapper.appendChild(visibleInput);
             wrapper.appendChild(hiddenInput);
             
//             const input = document.createElement("input");
//             input.type = "text";
//             input.name = `careerList[${index}].${field.name}`;
//             input.value = field.value;
//             input.readOnly = true;
//             wrapper.appendChild(input);
        });

        const buttonInInbox = inbox.querySelector("button");
        inbox.insertBefore(wrapper, buttonInInbox);
//         careerIndex++;
    }
});

</script>

<script>
	function deleteCareer(jhId){
		console.log("삭제 요청 jhId:", jhId);
		if(!confirm("정말 삭제하시겠습니까?"))return;
		
		fetch("${pageContext.request.contextPath}/mypage/career-delete", {
		      method: "POST",
		      headers: {
		        "Content-Type": "application/x-www-form-urlencoded"
		      },
		      body: "jhId=" + jhId
		    })
		    .then(response => {
		      if (response.ok) {
		        // 화면에서 해당 div 제거
		        document.getElementById("career-" + jhId).remove();
		      } else {
		        alert("삭제 실패!");
		      }
		    })
		    .catch(error => {
		      alert("에러 발생: " + error);
		    });
		  
	}
</script>

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>