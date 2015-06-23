// JavaScript Document
if(window.localStorage.getItem("loginuserCookie"))
{
	setTimeout(function(){ window.location = 'index.html'; }, 500);
}
function signInUser()
{
	
	var username = $('#username').val();
	var password = $('#password').val();
	
	if(username && password){
	$('.loginBtn').addClass('loadingSmall');
	$.ajax({
        url:API_URL+'generate_auth_cookie/?key=1234567891011&username='+username+'&password='+password+' ',
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			$('.loginBtn').removeClass('loadingSmall');
			console.log(data);
			if(data.status == 'ok')
			{
			console.log('Welecome '+data.user.nickname);
			var role = data.user.capabilities;
			role = Object.keys(role);
			var user_role = role[0]; 
			window.localStorage.setItem("loginuserCookie",data.cookie);
			window.localStorage.setItem("loginuserCookieName",data.cookie_name);
			window.localStorage.setItem("loginuserPic",data.user.avatar);
			window.localStorage.setItem("loginuserDisplayname",data.user.displayname);
			window.localStorage.setItem("loginuserEmail",data.user.email);
			window.localStorage.setItem("loginuserID",data.user.id);
			window.localStorage.setItem("loginuserRole",user_role);
			window.localStorage.setItem("loginuserNicename",data.user.nicename);
			window.localStorage.setItem("loginuserNickname",data.user.nickname);
			window.localStorage.setItem("loginuserUsername",data.user.username);
			
			
			navigator.notification.alert(
						'Welecome '+data.user.nickname,  // message
						function(){setTimeout(function(){ window.location = 'index.html'; }, 500);},       // callback
					   'Login Successfull',            // title
						'OK'                  // buttonName
			);
			}
			if(data.status == 'error')
			{
			console.log(data.error);
			navigator.notification.alert(
						data.error,  // message
						function(){},        // callback
					   'Login',            // title
						'OK'                  // buttonName
			);
			}
			
		},
        error:function(){
			
        }
    });
	}
	else if(username != '' && password == '')
	{
		console.log('Please Enter Password');
		navigator.notification.alert(
						'Please Enter your Password',  // message
						function(){},        // callback
					   'Login Password',            // title
						'OK'                  // buttonName
		);	
	}
	else if(username == '' && password != '')
	{
		console.log('Please Enter Username!');
		navigator.notification.alert(
						'Please Enter your Username!',  // message
						function(){},        // callback
					  	'Login Username',            // title
						'OK'                  // buttonName
		);	
	}
	else
	{
		console.log('Please Enter your Login detail!');
		navigator.notification.alert(
						'Please Enter your Login detail!',  // message
						function(){},        // callback
					   'Login Detail',            // title
						'OK'                  // buttonName
		);	
	}
}