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
    fetch(contextPath+'/corpmain/approve', {
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