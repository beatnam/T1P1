<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="gpt_result">
			<form action="#" method="post">
				<label for="gptResult">GPT가 준 결과</label>
				<br>
				<textarea id="gptResult" name="gptResult" rows="10" cols="60"
					readonly required>${result }</textarea>


				<input type="hidden" id="actionType" name="actionType" value="">
				<button type="submit" onclick="setAction('apply')">저장 +
					지원하기</button>
				<button type="submit" onclick="setAction('home')">저장 + 홈으로</button>
				<button type="submit" onclick="setAction('draft')">임시저장</button>
			</form>
		</div>
</body>
</html>