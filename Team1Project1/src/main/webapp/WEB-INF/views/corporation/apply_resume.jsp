<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>기업 관리 | 지원 이력서 모음</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/corp.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="all">
	<jsp:include page="../inc/corptop.jsp"></jsp:include>
<div class="box">
<div class="parent_div">
		<div>
			<button name="refresh" class="refresh" id="refresh" onclick="location.reload()">화면갱신</button>
		</div>
		<!-- 본문 영역 -->
		<div class="main_content">
			<h3>지원 이력서 모음</h3>
			<form action="${pageContext.request.contextPath}" class="" id="" method="post">
			<table border="1">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>지원자</td>
					<td>지원 일시</td>
					<td>합격 여부</td>
				</tr>
			<c:forEach var="item" items="${listResume}">
				<tr>
					<td><input type="checkbox" name="application" value="${item.application_id}"> ${item.application_id}</td>
					<td><a href="${pageContext.request.contextPath}/resources/upload/${item.resume_pdf}">${item.member_name}님의 이력서</a></td>
					<td>${item.member_name}</td>
					<td>${item.application_date}</td>
					<td>
						<c:if test="${item.approved eq null}">
							<p>대기중</p>
						</c:if>
						<c:if test="${item.approved eq 'Y'}">
							<p>합격</p>
						</c:if>
						<c:if test="${item.approved eq 'N'}">
							<p>불합격</p>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</table>
			</form>
			<div class="page_numbers">
				<a href="${pageContext.request.contextPath}/corplist/list?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${ i eq pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${i }"><span class="pagenum currentpage">${i }</span></a>
					</c:if>
					<c:if test="${ i ne pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${i }"><span class="pagenum">${i }</span></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
				
				<a href="${pageContext.request.contextPath}/corplist/list?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>

			<div class="apply_btn" id="apply_btn">
				<input type="button" id="a_btn" value="합격 처리" onclick="sendResult('Y')">
				<input type="button" id="na_btn" value="불합격 처리" onclick="sendResult('N')">
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script>
function sendResult(result) {
    // 체크된 체크박스의 application_id 값 가져오기
    let selectedApplications = [];
    document.querySelectorAll('input[name="application"]:checked').forEach((checkbox) => {
        selectedApplications.push(checkbox.value);
    });

    if (selectedApplications.length === 0) {
        alert('지원서를 선택하세요!');
        return;
    }

    // 서버로 데이터 전송
    fetch('${pageContext.request.contextPath}/corpmain/approve', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ application_ids: selectedApplications, status: result }) // 선택된 지원서 + 합격/불합격 값 전달
    })
    .then(response => response.json())
    .then(data => {
        alert('처리 완료: ' + selectedApplications.join(', ') + ' / 상태: ' + result);
    })
    .catch(error => {
        console.error('오류 발생:', error);
    });
}
</script>


</body>
</html>