<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <title>회원가입</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
</head>
<body>
<div class="container">

  <!-- 회원 유형 선택 -->
  <div class="member_type">
    <label><input type="radio" name="mtId" value="200"> 개인</label>
    <label><input type="radio" name="mtId" value="300"> 기업</label>
  </div>

  <!-- 회원가입 양식 -->
  <form action="${pageContext.request.contextPath}/member/joinPro" method="post" id="joinMember">
    <fieldset>
      <legend>회원가입</legend>
      <ul class="joinList">

        <li class="start">
          <div class="join_content">
            <input type="text" name="memberId" id="id_lbl" placeholder="아이디" required />
          </div>
        </li>

        <li class="start">
          <div class="join_content">
            <input type="password" name="memberPasswd" id="pwd_lbl" placeholder="비밀번호" required />
          </div>
        </li>

        <li class="start">
		  <div class="join_content"> 
		    <div class="jumin_area">
		      <input type="text" name="memberJumin1" id="jumin_lbl1" placeholder="주민등록번호 앞자리" required />
		      <input type="password" name="memberJumin2" id="jumin_lbl2" placeholder="주민등록번호 뒷자리" required />
		    </div>
		  </div> 
		</li>

        <!-- 이메일 -->
        <li class="start">
          <div class="join_content email_area">
            <input type="text" name="memberEmail1" id="email_lbl" placeholder="이메일 주소" required />
          	<span>@</span>
            <input type="text" name="memberEmail2" class="w160" placeholder="이메일주소" required /> 
             <div class="select_common">
              <select onchange="document.getElementsByName('memberEmail2')[0].value=this.value">
                <option value="">직접입력</option>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
              </select>
            </div> 
          </div>
        </li>

        <!-- 이름 -->
        <li class="start">
          <div class="join_content">
            <input type="text" name="memberName" id="name_lbl" placeholder="이름" required />
          </div>
        </li>

        <!-- 주소 및 우편번호 -->
        <li class="start">
          <div class="join_content">
            <input type="text" name="memberPostcode" id="postcode_lbl" placeholder="우편번호" readonly required />
            <input type="text" name="memberAddress" id="address_lbl" placeholder="주소" readonly required />
            <button type="button" class="aceept_content" onclick="execDaumPostcode()">주소검색</button>
          </div>
        </li>

        <!-- 전화번호 -->
        <li class="start">
          <div class="join_content">
            <input type="tel" name="memberPhone" id="phone_lbl" placeholder="휴대전화" required />
            <button type="button" class="aceept_content" id="phone_lbl1">인증번호 전송</button>
          </div>
        </li>

        <!-- 개인정보 동의 -->
        <li class="start">
          <div class="join_content checkbox_area">
            <label><input type="checkbox" name="memberInfo" required /> <strong>[필수]</strong> 개인정보 수집 및 이용에 동의합니다.</label>
          </div>
        </li>

        <li class="start">
          <div class="join_content checkbox_area">
            <label><input type="checkbox" name="memberInfoC" /> <strong>[선택]</strong> 광고성 정보 수신에 동의합니다.</label>
          </div>
        </li>

      </ul>

      <!-- 버튼 -->
      <p class="btn_line">
        <button type="submit" class="btn_baseColor" id="submitBtn">회원가입</button>
      </p>
    </fieldset>
  </form>

</div>

<!-- 다음 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        document.getElementById("postcode_lbl").value = data.zonecode;
        document.getElementById("address_lbl").value = data.address;
      }
    }).open();
  }
</script>
</body>
</html>
