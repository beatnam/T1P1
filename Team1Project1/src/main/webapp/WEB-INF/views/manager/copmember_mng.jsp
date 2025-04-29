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
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>

<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/mng.jsp"></jsp:include>

	<h1>회원 관리</h1>
	<table border="1">
		<thead>
			<tr>
				<td><select id="memberTypeFilter">
						<option value="">전체</option>
						<option value="300">사업자 등록증 제출 전</option>
						<option value="400">승인 대기</option>
						<option value="500">기업 회원</option>
				</select></td>
				<td>회원 아이디</td>
				<td>기업 이름</td>
				<td>등업</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody id="memberTableBody">
		</tbody>
	</table>

	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script>
  $(document).ready(function() {
    $('#memberTypeFilter').change(function() {
      const mtId = $(this).val();

      $.ajax({
        url: '${pageContext.request.contextPath }/manager/filter',
        method: 'GET',
        data: { mtId: mtId },
        success: function(result) {
        	const tbody = $('#memberTableBody');
          	tbody.empty();

          result.forEach(item => {
            const row = `
              <tr>
                <td>${item.mt_name}</td>
                <td>${item.corporationmember_id}</td>
                <td>${item.corporation_name}</td>
                <td>
                  <select id="memberTypeChange" data-id="">
                    <option value="300" ${item.mt_id == 300 ? 'selected' : ''}>사업자 등록증 제출 전</option>
                    <option value="400" ${item.mt_id == 400 ? 'selected' : ''}>승인 대기</option>
                    <option value="500" ${item.mt_id == 500 ? 'selected' : ''}>기업 회원</option>
                  </select>
                </td>
                <td>
                  <button id="deleteBtn" data-id="">삭제</button>
                </td>
              </tr>
            `;
            tbody.append(row);
          });
        }//success
      });
    });
  });
</script>
</body>

</html>