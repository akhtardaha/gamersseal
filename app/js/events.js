// JavaScript Document
$(document).ready(function(){
	getEvents('WA');
});

function getEvents(state)
	{
		var type = 'g_event';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_posts/?post_type='+type;
		console.log(state);
		var StatePosts = 0;
		var html = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			console.log(data);
			if(data.status == 'ok')
			{
				//html += '<ul data-role="listview" data-inset="true" data-filter="true" data-split-icon="gear" data-split-theme="c">'; 
				var posts = data.posts;
				var author = data.author;
				var totalPosts = data.count;
				var counter = 1;
				var event_cost= '';
				var event_date= '';
				var event_location= '';
				var event_picture= '';
				var event_requirement = '';
				if(totalPosts == 0)
				{
					html += '<p style="border: none;">There is no Event for this State.</p>';		
				}
				else
				{
					html += '<div class="accordion">';
					$.each(posts, function (i, value) {	
					var custom_fields = value.custom_fields;
					if(custom_fields.event_location == state)
					{
					StatePosts++;	
					if(custom_fields.event_cost)
					{
						event_cost = custom_fields.event_cost[0];
					}
					if(custom_fields.event_date)
					{
						event_date = custom_fields.event_date[0];
					}
					if(custom_fields.event_location)
					{
						event_location = custom_fields.event_location[0];
					}
					if(custom_fields.event_picture)
					{
						var event_picture = custom_fields.event_picture[0];
					}
					if(custom_fields.event_requirement)
					{
						var event_requirement = custom_fields.event_requirement[0];
					}
						
						html += '<div class="accordion_in">';
							html += '<div class="acc_head"><img src="'+EVENT_UPLOAD_PATH+event_picture+'" alt="'+value.title+'" class="product-thumb" /><h5>'+value.title+'</h5><p>Event Date: '+event_date+'</p></div>';
							html += '<div class="acc_content">';
								html += '<p><strong>Event Cost:</strong> $'+event_cost+'</p>';
								html += '<p><strong>Event Loaction:</strong> '+event_location+'</p>';
								html += '<p><strong>Event Requirement:</strong> '+event_requirement+'</p>';
								html += value.content;
							html += '</div>';
						html += '</div>';
						
				}
			})
				
				if(StatePosts == 0)
				{
					html += '<p style="border: none;">There is no Event for this State.</p>';		
				}
				html += '</div>';
					
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			$('#tabs-'+state).html(html);
			$('.accordion').smk_Accordion({
				closeAble: true, //boolean
			});

		},
        error:function(){

        }
    });
		
}