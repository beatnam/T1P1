<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력 수정</title>

<style>
    #autocomplete-box {
    background-color: white;
  	color: black;
  	font-size: 10px;
  	line-height: 1.6;
  	padding: 10px;
  	max-height: 200px;
  	overflow-y: auto;
    }
    .school-option {
    color: black;
  	font-weight: bold;
  	display: block;
  	overflow: hidden;
  	white-space: nowrap;
  	padding: 5px;
  	cursor: pointer;
  	font-size: 10px;
}

</style>

</head>
<body>

<form action="${pageContext.request.contextPath}/mypage/education-update" method="post">
    <label>학교명: </label>
    <div style="position: relative;">
        <input type="text" id="schoolName" value="${educationDTO.educationSchool}" autocomplete="off"><br>
        <input type="hidden" name="educationSchool" id="schoolId">
        <div id="autocomplete-box" style="border: 1px solid #ccc; display: none; position: absolute; background: white; z-index: 10;"></div>
    </div><br>
    
    <label>전공: </label>
    <input type="text" name="educationMajor" value="${educationDTO.educationMajor}"><br>

    <label>세부전공: </label>
    <input type="text" name="majorDetail" value="${educationDTO.majorDetail}"><br>

    <input type="hidden" name="memberNum" value="${educationDTO.memberNum}">

    <button type="submit">수정</button>
</form>

<script>
    const contextPath = '${pageContext.request.contextPath}';
</script>
  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $('#schoolName').on('keyup', function () {
        const query = $(this).val();

        if (query.length >= 1) {
            $.ajax({
                url: contextPath + '/mypage/school-search',
                type: 'GET',
                data: { keyword: query },
                success: function (data) {
                	console.log("자동완성 응답", data);
                	if (data.length > 0) {
                        console.log("첫 번째 항목:", data[0]);
                        for (let key in data[0]) {
                            console.log("key:", key, "| value:", data[0][key]);
                        }
                    }
                    let result = '';
                    data.forEach(function (school, index) {
                    	console.log(`자동완성 ${index} : `, school.schoolName);
                        result += '<div class="school-option" data-id="'+school.schoolId+'"><span>'+school.schoolName+'</span></div>';
                    });
                    console.log(result);
                    $('#autocomplete-box').html(result).show();
                    
                    const input = $('#schoolName');
                    const box = $('#autocomplete-box');
                    const offset = input.position(); 

                    box.css({
                        top: input.outerHeight() + 'px', 
                        left: '0px',                    
                        width: input.outerWidth() + 'px' 
                    });

                    
                }
            });
        } else {
            $('#autocomplete-box').hide();
        }
    });

    $(document).on('click', '.school-option', function () {
    	const name = $(this).text();
    	const id = $(this).data('id');
        $('#schoolName').val(name);
        $('#schoolId').val(id);
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
