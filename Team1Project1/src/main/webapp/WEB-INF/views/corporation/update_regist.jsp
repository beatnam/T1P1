<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 | 사업자 등록증 업로드</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join.css">

</head>
<div class="container">
	<form
		action="${pageContext.request.contextPath}/corporation/updateRegistPro"
		enctype="multipart/form-data" method="post" id="uploadRegist"
		class="joinMember">

		<fieldset>
			<legend>대표 이미지 | 사업자 등록증 업로드</legend>
			<ul class="joinList">
				<li class="start">
					<div class="join_content">
						<label for="corporationPhoto">회사 대표 이미지</label><br>
						<input type="file" name="corporationPhoto" class="w100p"
							id="corporationPhoto" required />
					</div>
				</li>
				<br>

				<li class="start">
					<div class="join_content">
						<label for="corporationRegistrationPdf">사업자 등록증 사본</label><br>
						<input type="file" name="corporationRegistrationPdf" class="w100p"
							id="corporationRegistrationPdf" required/>
					</div>
				</li>
				<br>
			</ul>

			<p class="btn_line">
				<a href="javascript:;" class="btn_baseColor" id="uploadBtn">업로드</a>
			</p>
		</fieldset>
	</form>
</div>

<script type="text/javascript">
	let uploadBtn = document.querySelector("#uploadBtn");

	let uploadRegist = document.querySelector("#uploadRegist");

	uploadBtn.onclick = function() {

		alert('제출 완료 되었습니다. 승인까지 몇분 내지 몇시간 소요됩니다');
		uploadRegist.submit();
	}
</script>
</body>
</html>