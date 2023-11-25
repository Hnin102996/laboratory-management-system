/**
 * 
 */
 data = "";
	submit = function(){
		 
			$.ajax({
				url:'saveOrUpdate',
				type:'POST',
				data:{user_id:$("#user_id").val(),user_name:$('#name').val(),email:$('#email').val()},
				success: function(response){
						alert(response.message);
						load();		
				}				
			});			
	}
	
	delete_ = function(id){		 
		 $.ajax({
			url:'delete',
			type:'POST',
			data:{user_id:id},
			success: function(response){
					alert(response.message);
					load();
			}				
		});
}
	
	edit = function (index){
		$("#user_id").val(data[index].user_id);
		$("#name").val(data[index].user_name);
		$("#email").val(data[index].email);
		
	}
	
	load = function(){	
		$.ajax({
			url:'list',
			type:'POST',
			success: function(response){
					data = response.data;
					$('.tr').remove();
					for(i=0; i<response.data.length; i++){					
						$("#table").append("<tr class='tr'> <td> "+response.data[i].user_name+" </td> <td> "+response.data[i].email+" </td> <td> <a href='#' onclick= edit("+i+");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+response.data[i].user_id+");'> Delete </a>  </td> </tr>");
					}			
			}				
		});
		
	}