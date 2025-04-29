<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 | 회원 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common.css">
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/mng.jsp"></jsp:include>

	<h1>회원 관리</h1>
	<table border="1">
		<input type="text" placeholder="검색어를 입력하세요.">
		<button>검색</button>
		<tr>
			<td><select id="memberTypeFilter">
					<option value="">전체</option>
					<option value="등록전">사업자 등록증 제출 전</option>
					<option value="대기">승인 대기</option>
					<option value="완료">기업 회원</option>
			</select></td>
			<!-- -->
			<td>회원 아이디</td>
			<td>회원 이름</td>
			<!--기업 회원의 경우 기업 이름-->
			<td>게시글 수</td>
			<td>댓글 수</td>
			<td>회원 유형 변경</td>
			<td>삭제</td>
		</tr>
		<tr>
			<td>회원 유형</td>
			<td>ID</td>
			<td>이름</td>
			<td>숫자</td>
			<td>숫자</td>
			<td><select>
					<option value="300">사업자 등록증 제출 전</option>
					<option value="400">승인 대기</option>
					<option value="500">기업 회원</option>
			</select></td>
			<td><button>삭제</button></td>
		</tr>

	</table>

	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script type="text/javascript">
		$('#memberTypeFilter').on('change', function() {
			var selectedType = $(this).val(); // 선택된 필터 값

			$.ajax({
				url : '/manager/filter', // 백엔드에서 처리할 API 경로
				method : 'GET',
				data : {
					mtId : selectedType
				}, // 요청 파라미터
				success : function(data) {
					updateMemberTable(data); // 필터링된 데이터로 테이블 갱신
				},
				error : function(xhr, status, error) {
					console.error('회원 필터링 실패:', error);
				}
			});
		});
	</script>
</body>

</html>