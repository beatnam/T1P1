$(function() {
			  $('#searchForm').submit(function(e) {
			    let keyword = $('#searchinput').val().trim();
	
			    if (keyword === "") {
			      alert("검색어를 입력해주세요.");
			      e.preventDefault(); // 전송 방지
			      return false;
			    }
			  });
});