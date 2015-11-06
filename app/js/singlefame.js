// JavaScript Document
$(document).ready(function(){
	var user = getQueryVariable('user');
	var name = decodeURI(getQueryVariable('name'));
	var rank = getQueryVariable('rank');
	var amount = getQueryVariable('amount');
	var ref = getQueryVariable('ref');
	getUserPic(user);
	$('#donnarname').html(name);
	$('#Hall-of-Fame-area').html('<p>User ID : '+user+'</p><p>Donation Amount : '+amount+'</p><p>Donation Reference # : '+ref+'</p>');
	
	//var app_icon = window.localStorage.getItem("app_icon");
	//$('#adminImg').prop('src',LOGO_PATH+app_icon);	
	
})


function getUserPic(user_id)
	{
		//http://gamersseal.com/development/api/userplus/get_avatar/?key=1234567891011&
		if(user_id == 'Guest')
		{
			$('#userImg').prop('src','img/profile.jpg');
			var app_icon = window.localStorage.getItem("app_icon");
			var hall_of_fame_img = window.localStorage.getItem("hall_of_fame_img");
			
			html += '<img style="float: left;max-width: 48%;"  id="userImg" src="img/profile.jpg" alt="user" />';
			html += '<img style="float: right;max-width: 48%;"  id="adminImg" src="'+WP_UPLOAD_BASE_PATH+hall_of_fame_img+'" alt="user" />';
			//var imgPath = GAME_IMAGES_PATH+data.post.custom_fields.images[0];
			$('.profile-pic').html(html);	
		}
		else
		{
		var url = API_URL+'get_avatar/?key=1234567891011&user_id='+user_id+'&type=full';
	    $.ajax({
         	url:url,
			type: "POST",
			contentType: "application/json",
			dataType: 'jsonp',
			beforeSend: function (xhr){ 
			xhr.setRequestHeader('Authorization', make_base_auth('bonjour', 'aj00pw')); 
			},
			success:function(data)
			{
				console.log(data);
				if(data.status == 'ok')
				{
					console.log(data);
					var avatar = data.avatar;
					var html = '';
					var app_icon = window.localStorage.getItem("app_icon");
					var hall_of_fame_img = window.localStorage.getItem("hall_of_fame_img");
					html += '<img style="float: left;max-width: 48%;"  id="userImg" src="'+avatar+'" alt="user" />';
					html += '<img style="float: right;max-width: 48%;" id="adminImg" src="'+WP_UPLOAD_BASE_PATH+hall_of_fame_img+'" alt="user" />';
					//var imgPath = GAME_IMAGES_PATH+data.post.custom_fields.images[0];
					$('.profile-pic').html(html);
				}
				
			},
			error:function(){}
		});
		}
		
}