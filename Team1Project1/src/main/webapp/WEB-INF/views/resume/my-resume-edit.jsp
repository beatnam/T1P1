<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my-resume-edit.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
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
    <h2>이력서 작성</h2>
    <form action="${pageContext.request.contextPath}/resume/submit" method="post" enctype="multipart/form-data" onsubmit="return handleSubmit()">

		
		
        <!-- 사진 -->
        <div class="section">
            <h2>사진</h2>
            <input type="file" name="resumePhoto" id="resumePhotoInput" accept="image/*">
            <br>
    		<img id="photoPreview" src="#" alt="사진 미리보기" style="display:none; max-width: 200px; margin-top: 10px;">
        </div>

        <!-- 기본 정보 -->
        <div class="section basic-info">
            <h2>기본 정보</h2>
            <div class="row">
                <div>
                    <label for="name">성명</label>
                    <input type="text" name="memberName" id="name" value="${memberDTO.memberName}" required>
                </div>
<!--                 <div> -->
<!--                     <label for="age">나이</label> -->
<!--                     <input type="number" name="memberAge" id="age" required> -->
<!--                 </div> -->
<!--                 <div> -->
<!--                     <label for="gender">성별</label> -->
<!--                     <select name="memberGender" id="gender" required> -->
<!--                         <option value="">선택</option> -->
<!--                         <option value="남">남</option> -->
<!--                         <option value="여">여</option> -->
<!--                     </select> -->
<!--                 </div> -->
            </div>

            <div class="row inline-group">
                <div>
                    <label>주민등록번호</label>
                    <div class="inline-inputs">
                    	<input type="text" name="memberJumin" maxlength="13" placeholder="0001111234567" value="${memberDTO.memberJumin}" required>
<!--                     	- -->
<!--                     	<input type="password" name="memberJumin2" maxlength="1" placeholder="뒤 1자리" required> -->
                	</div>
                </div>

                <div class="form-inline-group">
                    <label for="email">이메일</label>
                    	<input type="text" name="memberEmail" placeholder="이메일 입력" value="${memberDTO.memberEmail}" required>
<!--                     <div class="inline-inputs"> -->
<%--                         <input type="text" id="emailId" name="memberEmail" placeholder="이메일 입력" value="${fn:split(memberDTO.memberEmail, '@')[0]}" required> --%>
<!--                         <span>@</span> -->
<%--                         <input type="text" id="customDomain" name="memberEmail" placeholder="직접입력 또는 선택" value="${fn:split(memberDTO.memberEmail, '@')[1]}" disabled> --%>
<!--                         <select id="domainSelect" required> -->
<!--                             <option value="">-- 도메인 선택 --</option> -->
<!--                             <option value="naver.com">naver.com</option> -->
<!--                             <option value="gmail.com">gmail.com</option> -->
<!--                             <option value="daum.net">daum.net</option> -->
<!--                             <option value="custom">직접 입력</option> -->
<!--                         </select> -->
<!--                     </div> -->
                </div>

                <div>
                    <label for="phone">휴대폰번호</label>
                    <input type="text" name="memberPhone" id="phone" value="${memberDTO.memberPhone}" required>
                </div>
            </div>
        </div>

        <!-- 주소 -->
        <div class="section">
            <h2>주소</h2>
            <label for="zipcode">우편번호</label>
            <input type="text" name="memberPostcode" id="postcode" placeholder="우편번호" value="${memberDTO.memberPostcode }" readonly required>
            <button type="button" onclick="execDaumPostcode()">우편번호 검색</button><br>

            <label for="address">기본주소</label>
            <input type="text" name="memberAddress" id="address" value="${memberDTO.memberAddress }"readonly required><br>

<!--             <label for="detailAddress">상세주소</label> -->
<!--             <input type="text" name="detail" id="detailAddress"> -->
        </div>

        <!-- 학력 -->
        <div class="section">
            <h2>최종 학력</h2>
<!--             <label>학력구분</label> -->
<!--             <select name="eduType" required> -->
<!--                 <option value="">선택</option> -->
<!--                 <option value="고등학교">고등학교</option> -->
<!--                 <option value="대학교">대학교</option> -->
<!--                 <option value="대학원">대학원</option> -->
<!--             </select><br> -->
			<c:forEach var="edu" items="${educationList }" varStatus="status">
            <label>학교명</label>
            <input type="text" name="educationSchool" value="${edu.schoolName}" required><br>
            <label>전공명</label>
            <input type="text" name="educationMajor" value="${edu.educationMajor}" required><br>
            <label>세부전공</label>
            <input type="text" name="majorDetail" value="${edu.majorDetail }" required><br>
        	</c:forEach>
        </div>

        <!-- 경력 -->
        <div class="section">
            <h2>경력</h2>
            <label>총 경력</label>
            <div class="career-row">
            <input type="text" name="jhId" placeholder="회사명" style="flex: 1 !important; min-width: 250px !important;"> 
            <input type="text" name="jhDepartment" placeholder="부서명">
            <input type="text" name="workContent" placeholder="담당업무">
            <input type="date" name="startDate" placeholder="시작일"> 
            <span>~</span>
            <input type="date" name="endDate" placeholder="종료일"> 
            </div>
<!--             <br> -->
<!--             <div class="career-row"> -->
<!--             <input type="text" name="jhId" placeholder="회사명"  style="flex: 1 !important; min-width: 250px !important;"> -->
<!--             <input type="text" name="jhDepartment" placeholder="부서명">  -->
<!--             <input type="text" name="workContent" placeholder="담당업무"> -->
<!--             <input type="date" name="startDate" placeholder="시작일">  -->
<!--             <span>~</span> -->
<!--             <input type="date" name="endDate" placeholder="종료일">  -->
<!--             </div> -->
<!--             <br> -->
<!-- 			<div class="career-row"> -->
<!--             <input type="text" name="jhId" placeholder="회사명"  style="flex: 1 !important; min-width: 250px !important;">  -->
<!--             <input type="text" name="jhDepartment" placeholder="부서명"> -->
<!--             <input type="text" name="workContent" placeholder="담당업무"> -->
<!--             <input type="date" name="startDate" placeholder="시작일">  -->
<!--             <span>~</span> -->
<!--             <input type="date" name="endDate" placeholder="종료일">  -->
<!--             </div> -->
        </div>

        <!-- 자격증 -->
        <div class="section" id="certSection">        	
            <h2 style="display: inline-block;">자격증</h2>
            <button type="button" onclick="addCertification()" style="display: inline-block; font-size: 18px; margin-left: 10px;">＋</button>
            
            <div class="cert-item">
            
            <label>자격명</label>
            <input type="text" name="certificationName">    
            <label>발급기관</label>
            <input type="text" name="certificationIssuer">
            <label>취득일</label>
            <input type="date" name="certificationAcquiredDate">
            
            </div>
        </div>

        <!-- 외국어 -->
        <div class="section" id="langSection">
            <h2 style="display: inline-block;">외국어</h2>
            <button type="button" onclick="addLanguage()" style="display: inline-block; font-size: 18px; margin-left: 10px;">＋</button>
                        
            <div class="lang-item">
            
            <label>언어</label>
            <select name="languageName" class="languageSelect">
                <option value="">선택</option>
                <option>TOEIC(토익)</option>
                <option>OPIc(오픽)</option>
                <option>TOEIC Speaking(토익스피킹)</option>
                <option>TOEFL(토플)</option>
                <option>IELTS(아이엘츠)</option>
                <option>JLPT(일본어능력시험)</option>
                <option>JPT(일본어능력평가시험)</option>
                <option>HSK(중국어능력시험)</option>
                <option>텝스(TEPS)</option>
                <option value="custom">직접 입력</option>
            </select>
            
            <input type="text" name="languageNameCustom" class="languageCustomInput" 
            placeholder="외국어를 직접 입력하세요" style="display:none;">
            <label>발급 기관</label>
            	<input type="text" name="languageIssuer">
            <label>성적</label>
            	<input type="text" name="languageGrade">	
            
            </div>
        </div>

        <!-- 제출 -->
        <div class="section submit-section">
        	
            	<button type="submit" class="edit-btn">이력서 제출</button>
        	
        
        </div>
    	</form>
    </div>
</div>

	<script>
        function handleSubmit(){
        	alert("제출이 완료되었습니다.");
            return true;
        }
    </script>
        
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

<!--     이메일 도메인 선택 스크립트 -->
<!--     <script> -->
<!--          let domainSelect = document.getElementById("domainSelect"); -->
<!--          let customDomain = document.getElementById("customDomain"); -->

<!--          domainSelect.addEventListener("change", function () { -->
<!--              const selected = domainSelect.value; -->
<!--              if (selected === "custom") { -->
<!--                  customDomain.value = ""; -->
<!--                  customDomain.disabled = false; -->
<!--                  customDomain.focus(); -->
<!--              } else { -->
<!--                  customDomain.value = selected; -->
<!--                  customDomain.disabled = true; -->
<!--             } -->
<!--          }); -->
<!--     </script> -->
    

    
    <script>
		document.addEventListener("DOMContentLoaded", function () {
			document.body.addEventListener("change", function(e){
				if(e.target && e.target.classList.contains("languageSelect")){
					const select = e.target;
					const container = select.closest(".lang-item");
					const customInput = container.querySelector(".languageCustomInput");
					
					if (select.value === "custom") {
		            	customInput.style.display = "inline-block";
		            	customInput.name = "languageName"; 
		            	select.name = ""; 
		        	} else {
		            	customInput.style.display = "none";
		            	customInput.value = "";
		            	customInput.name = "languageNameCustom"; 
		            	select.name = "languageName"; 
		        	}
				}
			});
//     	const select = document.getElementById("languageSelect");
//     	const customInput = document.getElementById("languageCustomInput");

//     	select.addEventListener("change", function () {
//         	if (this.value === "custom") {
//             	customInput.style.display = "inline-block";
//             	customInput.name = "languageName"; 
//             	select.name = ""; 
//         	} else {
//             	customInput.style.display = "none";
//             	customInput.value = "";
//             	customInput.name = "languageNameCustom"; 
//             	select.name = "languageName"; 
//         	}
//     	});
	});
	</script>
	<script>
		function addLanguage(){
			const section = document.getElementById("langSection");
			const item = document.querySelector(".lang-item");
			const clone = item.cloneNode(true);
			
			clone.querySelectorAll("input, select").forEach(el => {
				el.value = "";
				
				if(el.classList.contains("languageCustomInput")){
					el.style.display = "none";
					el.name = "languageNameCustom";
				}
				if(el.classList.contains("languageSelect")){
					el.name = "languageName";
				}
			});
			section.appendChild(clone);
		}
	</script>
	
   
   <script>
	document.addEventListener("DOMContentLoaded", function () {
    	const fileInput = document.getElementById("resumePhotoInput");
    	const previewImg = document.getElementById("photoPreview");

    	fileInput.addEventListener("change", function () {
        	const file = this.files[0];

        	if (file) {
            	const reader = new FileReader();
            	reader.onload = function (e) {
                	previewImg.src = e.target.result;
                	previewImg.style.display = "block";
            	};
            	reader.readAsDataURL(file);
        	} else {
            	previewImg.src = "#";
            	previewImg.style.display = "none";
        	}
    	});
	});
	</script>
    

<script>
let certIndex = 1; 

function addCertification() {
    const certSection = document.getElementById("certSection");
    const certDiv = document.createElement("div");
    certDiv.classList.add("cert-item");
    certDiv.innerHTML = `
        <label>자격명</label>
        <input type="text" name="certificationName">

        <label>발급기관</label>
        <input type="text" name="certificationIssuer">

        <label>취득일</label>
        <input type="date" name="certificationAcquiredDate">
        <br><br>
    `;
    certSection.appendChild(certDiv);
    certIndex++;
}
</script>



<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>