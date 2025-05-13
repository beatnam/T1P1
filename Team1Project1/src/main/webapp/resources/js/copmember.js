$(function() {

		$('#memberTypeFilter').change(function() {
      const mtId = $(this).val();
    
      $.ajax({
        url: contextPath+'/manager/filter',
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