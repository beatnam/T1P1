<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 관리 | 공고 작성</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
	<div class="parent_div">
		<h1>공고 내용</h1>
		<form action="#" method="get" id="appForm">
			<div class="main_content">
				<table border="1">
					<tr>
						<td>제목입력</td>
						<td><input type="text" id="" name="recruitName"
								value="${recruitDTO.recruitName}" readonly></td>
					</tr>
					<tr>
						<td>사진 첨부파일</td>
						<td><img
							src="${pageContext.request.contextPath}/resources/upload/${recruitDTO.recruitPhoto }"
							width="200" height="200"></td>
					</tr>
					<tr>
						<td>학력</td>
						<td><input type="text" id="" name="recruiteduHigh"
								value="${eduHighDTO.eduhighName}" readonly></td>
					</tr>
					<tr>
						<td>직종 직무</td>
						<td>
							<!-- 직종 리스트 --> <input type="text" id="" name="occupationName"
								value="${occupationDTO.occupationName}" readonly> <input
								type="text" id="" name="jobName" value="${jobDTO.jobName}"
								readonly>
						</td>
					</tr>
					<tr>
						<td>연봉</td>
						<td><input type="text" id="" name="recruitSalary"
								value="${recruitDTO.recruitSalary}" readonly></td>
					</tr>
					<tr>
						<td>경력</td>
						<td><input type="text" id="" name="recruitCareear"
								value="${careearDTO.careearName}" readonly></td>
					</tr>

					<tr>
						<td>근무지역</td>
						<td><input type="text" id="" name="recruitLocation"
								value="${recruitDTO.recruitLocation}" readonly></td>
					</tr>
					<tr>
						<td>마감일자</td>
						<td><input type="date" id="recruitDeatline"
								name="recruitDeatline" value="${recruitDTO.recruitDeatline}"
								readonly></td>
					</tr>
					<tr>
						<td>근무일수</td>
						<td><input type="text" id="" name="recruitWorkday"
								value="${recruitDTO.recruitWorkday}" readonly></td>
					</tr>
					<tr>
						<td>상세내용</td>
						<td><textarea rows="50" cols="50" name="recruitContent"
								readonly>${recruitDTO.recruitContent}</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="apply_btn" id="apply_btn">
								<input type="button" value="공고 수정"
									onclick="location.href='${pageContext.request.contextPath}/corplist/update?recruitId=${recruitDTO.recruitId}'">
								<input type="button" value="공고 삭제"
									onclick="location.href='${pageContext.request.contextPath}/corplist/delete?recruitId=${recruitDTO.recruitId}'">
								<input type="button" value="공고 리스트"
									onclick="location.href='${pageContext.request.contextPath}/corplist/list'">
							</div>
						</td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>