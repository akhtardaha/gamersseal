// JavaScript Document
$(document).ready(function(){
	window.localStorage.setItem("event_picture",'');
	var event_id = getQueryVariable('event_id');
	getEvent(event_id);
	$('#RequirementsForAttendance').keyup(function(e){
		if(e.keyCode == 13)
		{
			console.log("ENTER PRESSED");
			update_event();
		}
	});
});

function getEvent(event_id)
	{
		var type = 'g_event';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_post/?id='+event_id+'&post_type='+type;
		console.log(cooke);
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
				var eventObject = data.post;
				var custom_fields = eventObject.custom_fields;
				if(custom_fields.event_cost)
					{
						var event_cost = custom_fields.event_cost[0];
					}
					if(custom_fields.event_date)
					{
						var event_date = custom_fields.event_date[0];
					}
					if(custom_fields.event_location)
					{
						var event_location = custom_fields.event_location[0];
					}
					if(custom_fields.event_picture)
					{
						var event_picture = custom_fields.event_picture[0];
					}
					if(custom_fields.event_requirement)
					{
						var event_requirement = custom_fields.event_requirement[0];
					}
				var event_title = eventObject.title;
				var event_content = eventObject.content;
				
				$('#title').val(event_title);
				$('#content').val(event_content);
				$('#location').val(event_location);
				$('#date').val(event_date);
				$('#cost').val(event_cost);
				$('#event_pic').val(event_picture);
				$('#event_id').val(event_id);
				$('#event_slug').val(eventObject.slug);
				
				
				$('#RequirementsForAttendance').val(event_requirement);
				
				var imageThumb = '<li><img src="'+EVENT_UPLOAD_PATH+event_picture+'" alt="'+event_picture+'"/></li>'
				$('.uploadedImages ul').html(imageThumb);
			}
		},
        error:function(){

        }
    });
		
}

function update_event()
	{
		startButtonLoading('updateEvent');
		var type = 'g_event';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		
		var event_picture = window.localStorage.getItem("event_picture");
		var eventTitle = $('#title').val();
		var eventLocation = $('#location').val();
		var eventDate = $('#date').val();
		var eventCost = $('#cost').val();
		var eventContent = $('#content').val();
		var eventRequirement = $('#RequirementsForAttendance').val();
		var event_old_pic = $('#event_pic').val();
		var event_id = $('#event_id').val();
		var slug = $('#event_slug').val();
		
		if(eventTitle == '')
		{
			$('#title').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#title').css('border','1px solid #cccccc');
		}
		if(eventLocation == '')
		{
			$('#location').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#location').css('border','1px solid #cccccc');
		}
		if(eventDate == '')
		{
			$('#date').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#date').css('border','1px solid #cccccc');
		}
		if(eventContent == '')
		{
			$('#content').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#content').css('border','1px solid #cccccc');
		}
		
		if(eventTitle == '' || eventLocation == '' || eventDate == '' || eventContent == '')
		{
			return false;
		}
		else
		{
			
			if(!(event_picture))
			{
					event_picture = event_old_pic;
			}
			$('#title').css('border','1px solid #cccccc');
			$('#location').css('border','1px solid #cccccc');
			$('#date').css('border','1px solid #cccccc');
			$('#content').css('border','1px solid #cccccc');
		
			//console.log(url);
			var url = API_URL+'update_post/?key=1234567891011&cookie='+cooke+'&slug='+slug+'&post_id='+event_id+'&post_type='+type+'&title='+eventTitle+'&content='+eventContent+'&eventDate='+eventDate+'&eventLocation='+eventLocation+'&event_picture='+event_picture+'&eventCost='+eventCost+'&eventRequirement='+eventRequirement+'';
			console.log(url);
			var html = '';
			$.ajax({
			 url:url,
			type: "POST",
			contentType: "application/json",
			dataType: 'jsonp',
			success:function(data)
			{
				console.log(data);
				endButtonLoading('updateEvent');
				if(data.status == 'ok')
				{
					console.log("Event Updated Successfully");
					navigator.notification.alert(
							'Event Updated Successfully!',  // message
							function(){setTimeout(function(){ window.location = 'events.html'; },200)},        // callback
						   'Updaing Event Information',            // title
							'OK'                  // buttonName
					);	
				}
				else
				{
					console.log("Event Not updated");
					navigator.notification.alert(
							data.error,  // message
							function(){setTimeout(function(){ },200)},        // callback
						   'Updaing Event Information',            // title
							'OK'                  // buttonName
					);	
				}
				//$('.news-list').html(html);
				//$(".accordion").smk_Accordion({
					//closeAble: true, //boolean
				//});
			},
			error:function(){
	
			}
		});
	}
		
}