// JavaScript Document
$(document).ready(function(){
   getAppSettings2();
})


function getAppSettings2()
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
//				var app_background_color = data.app_configuration[0].app_background_color;
//				//app_background_color = app_background_color.replace(/\#\#/g, '');
//				//app_background_color = app_background_color;
//				
//				window.localStorage.setItem("app_background_color",app_background_color);
//
//				window.localStorage.setItem("app_icon",data.app_configuration[0].app_icon);
//				window.localStorage.setItem("gst",data.app_configuration[0].gst);
//				
//				window.localStorage.setItem("guest_daily_purchase",data.app_configuration[0].guest_daily_purchase);
//				window.localStorage.setItem("guest_daily_transaction",data.app_configuration[0].guest_daily_transaction);
//				window.localStorage.setItem("guest_seal_charges",data.app_configuration[0].guest_seal_charges);
//				
//				window.localStorage.setItem("item_desc_limit",data.app_configuration[0].item_desc_limit);
//				
//				window.localStorage.setItem("premium_daily_purchase",data.app_configuration[0].premium_daily_purchase);
//				window.localStorage.setItem("premium_daily_transaction",data.app_configuration[0].premium_daily_transaction);
//				window.localStorage.setItem("premium_item_day",data.app_configuration[0].premium_item_day);
//				window.localStorage.setItem("premium_seal_charges",data.app_configuration[0].premium_seal_charges);
//				
//				window.localStorage.setItem("standard_daily_purchase",data.app_configuration[0].standard_daily_purchase);
//				window.localStorage.setItem("standard_daily_transaction",data.app_configuration[0].standard_daily_transaction);
//				window.localStorage.setItem("standard_item_day",data.app_configuration[0].standard_item_day);
//				window.localStorage.setItem("standard_seal_charges",data.app_configuration[0].standard_seal_charges);
//				
//				window.localStorage.setItem("terms_and_conditions",data.app_configuration[0].terms_and_conditions);
				window.localStorage.setItem("hall_of_fame",data.app_configuration[0].hall_of_fame);
				
				var hall_of_fame = window.localStorage.getItem("hall_of_fame");
				
				$('.tabContent').html(hall_of_fame);
			}
			
		},
        error:function(){

        }
    });
		
}