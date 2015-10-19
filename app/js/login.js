// JavaScript Document
$(document).ready(function(){
	var faq_text = window.localStorage.getItem("faq_text");
	$('.faq-box').html(faq_text);
	$('#password').keyup(function(e){
    if(e.keyCode == 13)
    {
		console.log("ENTER PRESSED");
		signInUser();
	}
	});
})
if(window.localStorage.getItem("loginuserCookie"))
{
	setTimeout(function(){ window.location = 'index.html'; }, 500);
}


//console.log(window.localStorage.getItem("homepage"));
function signInUser()
{
	//$.validate();
	startButtonLoading('SignIn');
	var username = $('#username').val();
	var password = $('#password').val();
	if(username && password){
	startButtonLoading('SignIn');
	$.ajax({
        url:API_URL+'generate_auth_cookie/?key=1234567891011&username='+username+'&password='+password+' ',
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			endButtonLoading('SignIn');
			console.log(data);
			if(data.status == 'ok')
			{
			var rember = $('#remember').val();
				if($('#remember').is(":checked")){
					console.log('on');
				window.localStorage.setItem("rememberStatus",'true');
				window.localStorage.setItem("rememberUsername",username);
				window.localStorage.setItem("rememberPassword",password);
				}
				else
				{
					console.log('off');
				window.localStorage.setItem("rememberStatus",'false');
				//window.localStorage.setItem("rememberUsername",'');
				//window.localStorage.setItem("rememberPassword",'');	
				}
			console.log('Welcome '+data.user.nickname+'!');
			var role = data.user.capabilities;
			role = Object.keys(role);
			var user_role = role[0];
			//console.log(user_role); 
			window.localStorage.setItem("loginuserPassword",password);
			window.localStorage.setItem("loginuserCookie",data.cookie);
			window.localStorage.setItem("loginuserCookieName",data.cookie_name);
			window.localStorage.setItem("loginuserPic",data.user.avatar);
			window.localStorage.setItem("loginuserDisplayname",data.user.displayname);
			window.localStorage.setItem("loginuserEmail",data.user.email);
			window.localStorage.setItem("loginuserID",data.user.id);
			window.localStorage.setItem("loginuserRole",user_role);
			window.localStorage.setItem("loginuserABN",data.user.abn);
			window.localStorage.setItem("loginuserNicename",data.user.nicename);
			window.localStorage.setItem("loginuserNickname",data.user.nickname);
			window.localStorage.setItem("loginuserUsername",data.user.username);
			window.localStorage.setItem("loginuserLocation",data.user.state);
			window.localStorage.setItem("loginuserRating",data.user.user_rating);
			//console.log(window.localStorage.getItem("loginuserRole"));
			var homePageprefer = window.localStorage.getItem("homepage");
			if(!homePageprefer)
			{
				homePageprefer = 'index';
			}
			navigator.notification.alert(
						'Welcome '+data.user.nickname+'!',  // message
						function(){setTimeout(function(){ window.location = homePageprefer+'.html'; }, 500);},       // callback
					   'Login Successful!',            // title
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
		endButtonLoading('SignIn');
		console.log('Invalid User name or password');
		$('#password').css('border-color','#F00');
		$('#username').css('border-color','#ccc');
		$('#form-err').text('Invalid User name or password');
		navigator.notification.alert(
						'Invalid User name or password',  // message
						function(){},        // callback
					   'Login Password',            // title
						'OK'                  // buttonName
		);	
	}
	else if(username == '' && password != '')
	{
		endButtonLoading('SignIn');
		console.log('Invalid User name or password');
		$('#username').css('border-color','#F00');
		$('#password').css('border-color','#ccc');
		$('#form-err').text('Invalid User name or password');
		navigator.notification.alert(
						'Invalid User name or password',  // message
						function(){},        // callback
					  	'Login Username',            // title
						'OK'                  // buttonName
		);	
	}
	else
	{
		endButtonLoading('SignIn');
		console.log('Invalid User name or password');
		$('#password').css('border-color','#F00');
		$('#username').css('border-color','#F00');
		$('#form-err').text('Invalid User name or password');
		navigator.notification.alert(
						'Invalid User name or password',  // message
						function(){},        // callback
					   'Login Detail',            // title
						'OK'                  // buttonName
		);	
	}
}