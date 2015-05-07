// JavaScript Document

function registerUser(){
		var fname = $('#fname').val();
		var lname = $('#lname').val();
		var username = $('#username').val();
		var email = $('#email').val();
		var australianId = $('#australianId').val();
		var role = $('#userType').val();
		
		if(fname == '')
		{
			$('#fname').css('border','1px solid red');
		}
		else
		{
			$('#fname').css('border','1px solid #aaa');
		}
		if(lname == '')
		{
			$('#lname').css('border','1px solid red');
		}
		else
		{
			$('#lname').css('border','1px solid #aaa');
		}
		if(username == '')
		{
			$('#username').css('border','1px solid red');
		}
		else
		{
			$('#username').css('border','1px solid #aaa');
		}
		if(email == '')
		{
			$('#email').css('border','1px solid red');
		}
		else
		{
			$('#email').css('border','1px solid #aaa');
		}
		if(australianId == '')
		{
			$('#australianId').css('border','1px solid red');
		}
		else
		{
			$('#australianId').css('border','1px solid #aaa');
		}
		if(role == '')
		{
			$('.usertypeSelect .ui-btn').css('border','1px solid red');
		}
		else
		{
			$('.usertypeSelect .ui-btn').css('border','1px solid #aaa');
		}
		
		if( username !='' && email != '' && fname != '' && lname != '' && australianId != '' && role != '')
		{
		if(validateEmail(email))
		{
			if(window.localStorage.getItem("emailExists") != 1 && window.localStorage.getItem("usernameExists") != 1)
			{
			$('#email').removeClass('error');
			check = $("#terms").is(":checked");
				if(check)
				{
					if(role != 'Guest' || role != 'Standard' || role != 'Preminum')
					{
						role = '';
					}
					$.ajax({
						url:API_URL+'register/?key=1234567891011&username='+username+'&email='+email+'&display_name='+username+'&first_name='+fname+'&last_name='+lname+'&role='+role,
						type: "POST",
						contentType: "application/json",
						dataType: 'jsonp',
						success:function(data)
						{
							console.log(data);
							if(data.status == 'ok')
							{
							var regCookie = data.cookie;
							var regUserid = data.user_id;
							var fullname  = fname+' '+lname; 
							extraProfileUpdate(regCookie,fullname,australianId);	
							}
							else
							{
								console.log(data.status);
							}
							
						},
						error:function(){
				
						}
					});
				}
				else
				{
					console.log('Please accept Terms and Condition in order to Register');
					navigator.notification.alert(
						'Please accept Terms and Condition in order to Register',  // message
						function(){},        // callback
					   'Terms and Conditions',            // title
						'OK'                  // buttonName
					);	
				}
			}
		}
		else
		{
			$('#email').addClass('error');
		}
	}
	else
	{
		console.log('Please Fill Required Fields!');
		$('.fieldError').html('Please Fill Required Fields!');
		$('.fieldError').fadeIn();		
	}
		//console.log(birthday);
}

function extraProfileUpdate(cookie,fullname,australianId)
{
	    $.ajax({
        url:API_URL+'xprofile_update/?key=1234567891011&cookie='+cookie+'&Name='+fullname+'&Australian ID='+australianId+' ',
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			console.log(data);
			if(data.status == 'ok')
			{
				navigator.notification.alert(
						'Thankyou for your Registration. Please check your registration Email and Sigin to Continue',  // message
						function(){setTimeout(function(){ window.location = 'login.html'; }, 200);},        // callback
					   'Registration Completed',            // title
						'OK'                  // buttonName
					);	
			//var regCookie = data.cookie;
			//var regUserid = data.user_id;
				
			}
			else
			{
				console.log(data.status);
			}
			
		},
        error:function(){

        }
    });
		
}

function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
	return true;
	}
	else {
	return false;
	}
}

function checkUsernameExist()
{
	
	
	var username = $('#username').val();
	if(username){
	$('#username').addClass('loadingSmall');
	$.ajax({
        url:API_URL+'username_exists/?key=1234567891011&username='+username+' ',
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
		beforeSend: function (xhr){ 
        xhr.setRequestHeader('Authorization', make_base_auth('bonjour', 'aj00pw')); 
    	},
        success:function(data)
        {
			console.log(data);
			$('#username').removeClass('loadingSmall');
			if(data.status == 'error')
			{
				$('#username').removeClass('pass');
				$('#username').addClass('error');
				window.localStorage.setItem("usernameExists",1);
				$('.fieldError').html(data.error);
				$('.fieldError').fadeIn();	
			}
			else
			{
				$('#username').removeClass('error');
				$('#username').addClass('pass');
				window.localStorage.setItem("usernameExists",0);
				$('.fieldError').fadeOut();
				console.log(data.status);
				$('#username').css('background-color','#fff');
			}
			
		},
        error:function(){

        }
    });
	}
	else
	{
		$('#username').removeClass('error');
		$('#username').removeClass('pass');
		$('#username').removeClass('loadingSmall');
	}
}

function checkEmailExist()
{
	
	var email = $('#email').val();
	if(email){
	$('#email').addClass('loadingSmall');
	$.ajax({
        url:API_URL+'email_exists/?key=1234567891011&email='+email,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
		beforeSend: function (xhr){ 
        xhr.setRequestHeader('Authorization', make_base_auth('bonjour', 'aj00pw')); 
    	},
        success:function(data)
        {
			console.log(data);
			$('#email').removeClass('loadingSmall');
			if(data.status == 'error')
			{
				$('#email').removeClass('pass');
				$('#email').addClass('error');
				window.localStorage.setItem("emailExists",1);
				$('.fieldError').html(data.error);
				$('.fieldError').fadeIn();	
			}
			else
			{
				$('#email').removeClass('error');
				$('#email').addClass('pass');
				window.localStorage.setItem("emailExists",0);
				$('.fieldError').fadeOut();
				$('#email').css('background-color','#fff');
				console.log(data.status);
			}
			
		},
        error:function(){

        }
    });
	}
	else
	{
		$('#email').removeClass('error');
		$('#email').removeClass('pass');
		$('#email').removeClass('loadingSmall');
	}
}





