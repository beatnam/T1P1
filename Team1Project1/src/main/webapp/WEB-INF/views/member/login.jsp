<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>



 <div class="">
  
	<form action="" id="" method="">
		<fieldset>
			<legend>로그인 입력 양식</legend>
			<p class="">개인회원  |  기업회원</p>
			<ul class="">
					<li class="">
						<label for="" class="">아이디</label>
						<div class=""><input type="text" name="" class="" id="" placeholder=""/></div>
					</li>
					<li class="">
						<label for="" class=" ">비밀번호</label>
						<div class=""><input type="password" name="" class="" id="" placeholder=""/></div>
					</li>
						
			</ul>
<!-- 		로그인유지/아이디저장	 -->
	<input type="checkbox">로그인유지</input>
	<input type="checkbox">아이디저장</input>
	
	
	<br>
<!-- 	아이디/비밀번호 찾기 -->
    <form action="" method="">
        <label for="">아이디찾기</label>
        <a href='${pageContext.request.contextPath}/login1-1.jsp'>아이디찾기</a>
        
    </form>
    
     <form action="" method="">
        <label for="">비밀번호찾기</label>
        <a href='${pageContext.request.contextPath}/login1-2.jsp'>비밀번호찾기</a>
        
    </form>


	
    
    
    <br>
<!--      소셜 계정으로 간편 로그인 -->
    <form action="" method="">
        <label for=>카카오로그인</label>
        
    </form>
    
    
    
    
    
    
    
    
    
    
    
    
    
    <br>
    <button>로그인</button>
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	 </fieldset>
	</form>
</div>	

</body>
</html>