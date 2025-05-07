<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경력 추가</title>
</head>
<body>

<form id="careerPopupForm">
    <input type="text" id="jhCorporation" placeholder="회사명">
    <input type="text" id="jhDepartment" placeholder="부서명">
    <input type="text" id="workContent" placeholder="담당업무">
    <input type="date" id="startDate">
    <input type="date" id="endDate">
    
    <button type="button" onclick="sendCareerData()">추가</button>
</form>


<script>
function sendCareerData() {
    const data = {
        jhCorporation: document.getElementById("jhCorporation").value,
        jhDepartment: document.getElementById("jhDepartment").value,
        workContent: document.getElementById("workContent").value,
        startDate: document.getElementById("startDate").value,
        endDate: document.getElementById("endDate").value
    };
	
    console.log("팝업에서 보내는 data:", data);
    window.opener.postMessage(data, "*");
    
    setTimeout(function(){
    window.close(); 
	}, 300);
}
</script>


</body>
</html>
