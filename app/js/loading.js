// JavaScript Document
$(document).ready(function(){
	getAppLoading();
	var deviceHeight = $(window).innerHeight();
	deviceHeight = parseInt(deviceHeight) - 30 ;
	$('.loading').css('height',deviceHeight+'px');
	var splash_screen_text = window.localStorage.getItem("splash_screen_text");
	var loading_screen_text = window.localStorage.getItem("loading_screen_text");
	$('.lodin-text').html(loading_screen_text);
	$('.footer-loading').html(splash_screen_text);
	setTimeout(function(){window.location = 'index.html';},6000);
	
})

function getAppLoading()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_app_settings/?key=1234567891011';
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
			if(data.status == 'ok')
			{
				var app_background_color = data.app_configuration[0].app_background_color;
				//app_background_color = app_background_color.replace(/\#\#/g, '');
				//app_background_color = app_background_color;
				
				window.localStorage.setItem("app_background_color",app_background_color);

				window.localStorage.setItem("app_icon",data.app_configuration[0].app_icon);
				window.localStorage.setItem("gst",data.app_configuration[0].gst);
				
				window.localStorage.setItem("splash_screen_text",data.app_configuration[0].splash_screen_text);
				window.localStorage.setItem("admin_msg_for_user",data.app_configuration[0].admin_msg_for_user);
				window.localStorage.setItem("donation_text",data.app_configuration[0].donation_text);
				window.localStorage.setItem("loading_screen_text",data.app_configuration[0].loading_screen_text);
				
				$('.lodin-text').html(window.localStorage.getItem("loading_screen_text"));
				$('.footer-loading').html(window.localStorage.getItem("splash_screen_text"));
			}
			
		},
        error:function(){

        }
    });
		
}

