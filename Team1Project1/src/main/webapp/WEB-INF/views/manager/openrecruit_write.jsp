<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>관리자 페이지 | 공개 채용 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>

</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>
		<div class="box">
			<h1>공개 채용 등록</h1>
			<form
				action="${pageContext.request.contextPath}/manager/openrecruit_writePro"
				method="post" id="appForm">
				<input type="hidden" name="memberNum" value="${sessionScope.num }">

				<table border="1">
					<tr>
						<td>제목입력</td>
						<td><input type="text" name="orName" value=""></td>
					</tr>

					<tr>
						<td>회사명</td>
						<td><input type="text" name="orCorporationName" value=""></td>
					</tr>
					<tr>
						<td>학력</td>
						<td><select name="orEduhigh" id="Levels">
								<option value="">-- 선택 --</option>
								<option value="1">학력무관</option>
								<option value="2">고등학교졸업</option>
								<option value="3">대학졸업(2,3년)</option>
								<option value="4">대학교졸업(4년)</option>
								<option value="5">석사졸업</option>
								<option value="6">박사졸업</option>

						</select></td>
					</tr>
					<tr>
						<td>직종 직무</td>
						<td>
							<!-- 직종 리스트 --> <label for="occupation-select"></label> <select
							id="occupation-select" name="orOccupation"
							onchange="loadJobs(this.value)">
								<option value="">직종을 선택하세요</option>
								<c:forEach var="occupation" items="${occupations}">
									<option value="${occupation.occupationId}">${occupation.occupationName}</option>
								</c:forEach>
						</select> <label for="job-select"></label> <select id="job-select"
							name="orJob">
								<option value="">먼저 직무를 선택하세요</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>연봉</td>
						<td><input type="text" name="orSalary" value=""></td>
					</tr>
					<tr>
						<td>경력</td>
						<td><select name="orCareear" id="career" required>
								<option value="">-- 선택 --</option>
								<option value="1">경력 무관</option>
								<option value="2">1년 미만</option>
								<option value="3">1년 ~ 3년</option>
								<option value="4">3년 ~ 5년</option>
								<option value="5">5년 ~ 7년</option>
								<option value="6">7년 이상</option>
						</select></td>
					</tr>

					<tr>
						<td>근무지역</td>
						<td><input type="text" name="orLocation" value=""></td>
					</tr>
					<tr>
						<td>근무 일자</td>
						<td><input type="text" name="orWorkday" placeholder="주 근무 일수"></td>
					</tr>
					<tr>
						<td>마감일자</td>
						<td><input type="date" name="orDeadline"></td>
					</tr>
					<tr>
						<td>회사 홈페이지</td>
						<td><input type="text" name="orUrl" value="http://"></td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- 로그인 되어있고(세션값이 있으면) => 로그인표시값, 글쓴이 일치 => 글수정, 글삭제 버튼 보이기 -->
							<input type="submit" value="공고 올리기"> <input type="button"
								value="공고 리스트"
								onclick="location.href='${pageContext.request.contextPath}/manager/openrecruit_mng'">

						</td>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script>
		const contextPath = '${pageContext.request.contextPath}';
	</script>
<script
	src="${pageContext.request.contextPath}/resources/js/occupation.js"></script>
</body>

</html>