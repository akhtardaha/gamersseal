// JavaScript Document
$(document).ready(function(){

})

function retrieve_password()
	{
		$('.submitBtn').html('<img src="img/loadingSmall.gif" alt="Loading">');
		var user_login = $('#user_login').val();
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'retrieve_password/?key=1234567891011&user_login='+user_login+' ';
		console.log(url);
		var html = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			$('.submitBtn').html('Retrieve Password');
			console.log(data);
			if(data.status == 'ok')
			{
				console.log(data.msg);
				navigator.notification.alert(
                    data.msg,  // message
                    function(){},         // callback
                    'Retrieve Password',            // title
                    'OK'                  // buttonName
                );
			}
			else
			{
				console.log(data.error);
				navigator.notification.alert(
                    "Please enter correct Username!",   // message
                    function(){},         // callback
                    'Retrieve Password',            // title
                    'OK'                  // buttonName
                );
			}
			
		},
        error:function(){

        }
    });
		
}


