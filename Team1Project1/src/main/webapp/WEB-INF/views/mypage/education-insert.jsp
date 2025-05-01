<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력 추가</title>
</head>
<body>

 <form action="${pageContext.request.contextPath}/mypage/education-insert" method="post">
    <label>학교명: </label>
    <input type="text" id="schoolName" name="educationSchool" autocomplete="off"><br>
	<div id="autocomplete-box" style="border: 1px solid #ccc; display: none; position: absolute; background: white; z-index: 10;"></div>
	<br>
	
    <label>전공: </label>
    <input type="text" name="educationMajor"><br>

    <label>세부전공: </label>
    <input type="text" name="majorDetail"><br>

    <input type="hidden" name="memberNum" value="${sessionScope.member_num}">

    <button type="submit">저장</button>
  </form>
  
  
  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $('#schoolName').on('keyup', function () {
        const query = $(this).val();

        if (query.length >= 1) {
            $.ajax({
                url: '/mypage/school-search',
                type: 'GET',
                data: { keyword: query },
                success: function (data) {
                    let result = '';
                    data.forEach(function (school) {
                        result += `<div class='school-option' style='padding: 5px; cursor: pointer;'>${school}</div>`;
                    });
                    $('#autocomplete-box').html(result).show();
                }
            });
        } else {
            $('#autocomplete-box').hide();
        }
    });

    $(document).on('click', '.school-option', function () {
        $('#schoolName').val($(this).text());
        $('#autocomplete-box').hide();
    });

    $(document).click(function(e) {
        if (!$(e.target).closest('#schoolName, #autocomplete-box').length) {
            $('#autocomplete-box').hide();
        }
    });
});
</script>
  
</body>
</html>
