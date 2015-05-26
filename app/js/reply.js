// JavaScript Document

$(document).ready(function(){
	var userCookie = window.localStorage.getItem("loginuserCookie");
	var user_id = window.localStorage.getItem("loginuserID");
	var subject = decodeURIComponent(getQueryVariable('subject'));
	var senderName = decodeURIComponent(getQueryVariable('sender'));
	var senderID = getQueryVariable('senderID');
	$('.specification').html(senderName);
	getMessage(subject);
})

function getMessage(subject)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var url = API_URL+'get_user_messages_by_subject/?key=1234567891011&user_id='+user_id+'&subject='+subject;
		var html = '';
		console.log(url);
	$.ajax({
        url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			console.log(data);
			var messages = data.msg.messages;
			var messagesTotal = messages.length;
			var counter = 1;
			if(data.status == 'ok')
			{
				$.each(messages, function (i, value) {
				if(value.sender_id == user_id)
				{
				html += '<li class="your-reply">';
            		html += value.avatar;
                    html += '<div class="single-message">';
                    html += '<h5>Me</h5>';
                    html += '<p>'+value.message_txt+'</p>';
                    html += '</div>';
            	html += '</li>';
				}
				else
				{
            	html += '<li class="user-message">';
                    html += '<div class="single-message">';
                    html += '<h5>'+value.sender_name+'</h5>';
                    html += '<p>'+value.message_txt+'</p>';
                    html += '</div>';
                    html += value.avatar;
            	html += '</li>';
				}
				})
				$('.tabContent').html(html);
			}
			if(data.status == 'error')
			{
			console.log(data.error);
			navigator.notification.alert(
						data.error,  // message
						function(){},        // callback
					   'Message Board',            // title
						'OK'                  // buttonName
			);
			}
			
		},
        error:function(){
			
        }
    });
}


function replyUserMessage()
	{
		
		var userCookie = window.localStorage.getItem("loginuserCookie");
		var user_id = window.localStorage.getItem("loginuserID");
		var subject = decodeURIComponent(getQueryVariable('subject'));
		var senderName = decodeURIComponent(getQueryVariable('sender'));
		var senderID = getQueryVariable('senderID');
		var message = $('#replyMessage').val();
		if(message == '')
		{
			return false;
		}
		var url = API_URL+'send_message_seller/?key=1234567891011&user_id='+user_id+'&seller_id='+senderID+'&title='+subject+'&message='+message;
		console.log(url);
		var html = '';
		var imageGallery = '';
		var descBoxes = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
				$('#replyMessage').val('');
				console.log(data.msg.status);
				navigator.notification.alert(
                    data.msg.status,  // message
                    function(){  setTimeout(function() {location.reload();}, 100);},         // callback
                    'Message Sent',            // title
                    'OK'                  // buttonName
                );
			}
			else
			{
				console.log(data.msg.status);
				navigator.notification.alert(
                    data.msg.status,  // message
                    function(){},         // callback
                    'Sending Message Failed',            // title
                    'OK'                  // buttonName
                );
				//html += '<p>'+data.error+'</p>';
				
			}
			
		},
        error:function(){

        }
    });
		
}

