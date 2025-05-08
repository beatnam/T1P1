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
	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script>
	$(function() {

		$('#memberTypeFilter').change(function() {
      const mtId = $(this).val();
      const contextPath = '${pageContext.request.contextPath}';
      $.ajax({
        url: '${pageContext.request.contextPath }/manager/filter',
        method: 'GET',
        data: { mtId : mtId },
        dataType: 'json',
        success: function(result) {
        	  const tbody = $('#memberTableBody');
        	  tbody.empty();
        	  console.log(result);

        	  result.forEach(item => {
        	    var row = 
        	      '<tr>' +
        	        '<td>' + item.mt_name + '</td>' +
        	        '<td>' +
        	          '<a href="' + contextPath + '/manager/content_corp?corpId=' + item.corporationmember_id + '">' + item.corporationmember_id + '</a>' +
        	        '</td>' +
        	        '<td>' + item.corporation_name + '</td>' +
        	        
        	      '</tr>';
        	    tbody.append(row);
        	  });
        	}
      });
    });
		$('#memberTypeFilter').trigger('change');
  });
</script>
</body>

</html>