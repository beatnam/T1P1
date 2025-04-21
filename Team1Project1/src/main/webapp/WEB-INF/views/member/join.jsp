<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang = "ko">
<head>
	<title>회원가입</title>
	 <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
  <div class="">
      <!-- 회원가입 양식 -->
  
      
      <form action="" class="" method="post" id="">
         <fieldset>
           <legend>회원가입</legend>
            <p class="">필수입력</p>
             <ul class="">
               <li class="">
                  <label class="">아이디</label>
                   <div class=""><input type="text" name="" class=""  id="" placeholder=""/></div>
               </li>
               <li class="">
                  <label for="" class=""></label>
                  <div class="" id=""></div>
               </li>
               
               <li class="">
                   <label for="" class="">비밀번호</label>
                   <div class=""><input type="password" name="" class="" id="" placeholder=""/></div>
               </li>
                
               <li class="">
                   <label for="" class="">이메일</label>
                   <div class="">
                   <input type="text" name="" class="" id="" title="이메일 주소" />
                   <span class="">@</span>
                      <input type="text" name="" class="" title="이메일 제공업체 입력" />
                        <div class="">
                           <select title="이메일 제공업체 목록" >
                               <option value="">직접입력</option>
                               <option value="">naver.com</option>
                               <option value="">daum.net</option>
                           </select>
                        </div>                                                       
                   </div>
               
                </li>
                  
                 <li class="">
                  	<label for="" class="">주소</label>
                  		<div class=""><input type="text" name="" class="" id="" placeholder=""/></div>	
                  	
                  
            
                </li>
                  
                <li class="">
                    <label for="" class="">휴대폰</label>
                    <div class=""><input type="tel" name="" class="" id="" placeholder=""/></div>
                  	<button type="button" class="" id=""><span>인증번호 전송</span></button>
                </li>
                  
                 
                <li class="">
                    <span class="">필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신
                    <br> (선택)에 모두 동의합니다.
                    </span>
                     
                </li>
                
            </ul>
               <p class=""><a href="" class="" id="">회원가입</a></p>   
            </fieldset>
         </form>
         <!-- //회원가입 양식-->
         
         
      </div>
</body>
</html>



