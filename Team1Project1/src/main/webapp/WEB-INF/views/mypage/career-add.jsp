<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>경력 추가</title>

    <style>
    
        body {
            font-family: '맑은 고딕', sans-serif;
            padding: 20px;
        }
        input {
            display: block;
            margin-bottom: 10px;
            width: 100%;
            padding: 8px;
        }
        button {
            padding: 8px 12px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>경력 정보 입력</h2>
    <form id="careerForm" name="careerForm" action="${pageContext.request.contextPath }/mypage/career-add" method="post">
        <input type="text" name="JH_Corporation" placeholder="회사명" required>
    	<input type="text" name="JH_department" placeholder="부서명" required>
    	<input type="text" name="work_content" placeholder="담당업무" required>
    	<input type="date" name="start_date" required>
    	<input type="date" name="end_date" required>
        <button type="button" onclick="submitCareer()">저장</button>
    </form>

    <script>
        function submitCareer() {
            const data = {
            		JH_Corporation: document.careerForm.JH_Corporation.value,
            	    JH_department: document.careerForm.JH_department.value,
            	    work_content: document.careerForm.work_content.value,
            	    start_date: document.careerForm.start_date.value,
            	    end_date: document.careerForm.end_date.value
            };
            
            console.log("팝업창에서 부모창으로 보낼 데이터:", data);
                    
        
        fetch('${pageContext.request.contextPath}/mypage/insert-career-ajax', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        }).then(res => res.text())
          .then(response => {
              if (response === 'success') {
            	  console.log("저장 성공");
                  window.opener.postMessage(data, "*");
                  window.close();
              } else {
                  alert("저장 실패");
              }
          });
        
        }
    </script>
</body>
</html>
