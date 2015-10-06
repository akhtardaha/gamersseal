// JavaScript Document
$(document).ready(function(){
	window.localStorage.setItem("event_picture",'');
	if(!(window.localStorage.getItem("loginuserCookie")))
	{
		setTimeout(function(){window.location = 'login.html';},200);	
	}
});

function add_event()
	{
		startButtonLoading('addNewEvent');
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
					console.log("Please upload Event Image!");
					navigator.notification.alert(
							"Please upload Event Image!",  // message
							function(){setTimeout(function(){ },200)},        // callback
						   'Upload Event Image',            // title
							'OK'                  // buttonName
					);
					return false;	
			}
			$('#title').css('border','1px solid #cccccc');
			$('#location').css('border','1px solid #cccccc');
			$('#date').css('border','1px solid #cccccc');
			$('#content').css('border','1px solid #cccccc');
		
			//console.log(url);

			var url = API_URL+'add_event/?key=1234567891011&status=pending&type='+type+'&cookie='+cooke+'&title='+eventTitle+'&content='+eventContent+'&eventDate='+eventDate+'&eventLocation='+eventLocation+'&event_picture='+event_picture+'&eventCost='+eventCost+'&eventRequirement='+eventRequirement+'';
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
				endButtonLoading('addNewEvent');
				if(data.status == 'ok')
				{
					console.log("Event Added Successfully");
					navigator.notification.alert(
							data.success,  // message
							function(){setTimeout(function(){ window.location = 'events.html'; },200)},        // callback
						   'Adding new Event',            // title
							'OK'                  // buttonName
					);	
				}
				else
				{
					console.log("Event Not Added");
					navigator.notification.alert(
							data.error,  // message
							function(){setTimeout(function(){ },200)},        // callback
						   'Adding new Event',            // title
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