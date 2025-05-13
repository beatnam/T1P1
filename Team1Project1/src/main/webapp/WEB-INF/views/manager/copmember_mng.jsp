<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 기업 회원 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_mng.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div class="all">
		<jsp:include page="../inc/mng.jsp"></jsp:include>
		<div class="box">
			<h1>회원 관리</h1>
			<table border="1">
				<thead>
					<tr>
						<td><select id="memberTypeFilter">
								<option value="0">전체</option>
								<option value="300">사업자 등록증 제출 전</option>
								<option value="400">승인 대기</option>
								<option value="500">기업 회원</option>
						</select></td>
						<td>회원 아이디</td>
						<td>기업 이름</td>
					</tr>
				</thead>
				<tbody id="memberTableBody">
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script>
		const contextPath = '${pageContext.request.contextPath}';
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/copmember.js">
		
	</script>
</body>

</html>