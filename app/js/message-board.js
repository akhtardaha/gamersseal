// JavaScript Document

$(document).ready(function(){
	if(!(window.localStorage.getItem("loginuserCookie")))
	{
		window.location = 'login.html';			
	}
	getMessages();
})

function getMessages()
{
		var user_id = window.localStorage.getItem("loginuserID");
		var url = API_URL+'get_user_messages/?key=1234567891011&user_id='+user_id;
		var html = '';
		console.log(url);
	$.ajax({
        url:API_URL+'get_user_messages/?key=1234567891011&user_id='+user_id,
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
				if(counter == messagesTotal){ var last = 'last'} else {var last ='';}
				if(value.sender_id == 'admin')
				{
					value.sender_name = 'Admin';
				}
				html += '<li class="'+last+'">';
                html += '<a href="reply.html?senderID='+value.sender_id+'&sender='+encodeURI(value.sender_name)+'&subject='+encodeURI(value.message_title)+'">';
					html += '<div class="user-img">';
                    html += value.avatar;
                    html += '</div>';
                    html += '<div class="product-list-user">';
                    html += '<h5>'+value.sender_name+'</h5>';
                    html += '<p>'+value.message_title+'</p>';
                    html += '</div>';
                html += '</a>';
            	html += '</li>';
				counter++;
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
