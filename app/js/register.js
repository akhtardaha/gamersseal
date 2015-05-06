// JavaScript Document

$(document).ready(function(){
	console.log(window.localStorage.getItem("Gender"));
	console.log(window.localStorage.getItem("SearchingFor"));
	console.log(window.localStorage.getItem("Purpose"));
	
	$('#submit').click(function(){
		var username = $('#username').val();
		var email = $('#email').val();
		var land = $('#land').val();
		var postcode = $('#postcode').val();
		var zipcode = $('#zipcode').val();
		var birthday = $('#birthday').val();
		var gender = window.localStorage.getItem("Gender");	
		var searchingFor = window.localStorage.getItem("SearchingFor");
		var Purpose = window.localStorage.getItem("Purpose");
		
		
		if(username == '')
		{
			$('#username').css('background-color','#f6dbdb');
		}
		else
		{
			$('#username').css('background-color','#fff');
		}
		if(email == '')
		{
			$('#email').css('background-color','#f6dbdb');
		}
		else
		{
			$('#email').css('background-color','#fff');
		}
		if(land == '')
		{
			$('#land').css('background-color','#f6dbdb');
		}
		else
		{
			$('#land').css('background-color','#fff');
		}
		if(postcode == '')
		{
			$('#postcode').css('background-color','#f6dbdb');
		}
		else
		{
			$('#postcode').css('background-color','#fff');
		}
		if(zipcode == '')
		{
			$('#zipcode').css('background-color','#f6dbdb');
		}
		else
		{
			$('#zipcode').css('background-color','#fff');
		}
		if(birthday == '')
		{
			$('#birthday').css('background-color','#f6dbdb');
			$('label[for="birthday"]').css('background-color','#f6dbdb');
		}
		else
		{
			$('#birthday').css('background-color','#fff');
			$('label[for="birthday"]').css('background-color','#fff');
		}
		if( username !='' && email != '' && land != '' && postcode != '' && zipcode != '' && birthday != '')
		{
		if(validateEmail(email))
		{
			if(window.localStorage.getItem("emailExists") != 1 && window.localStorage.getItem("usernameExists") != 1)
			{
			$('#email').removeClass('error');
			birthday = birthday+' 00:00:00';
			$.ajax({
				url:API_URL+'register/?key=1234567891011&username='+username+'&email='+email+'&display_name='+username,
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
					var regCookie = data.cookie;
					var regUserid = data.user_id;
					extraProfileUpdate(regCookie,username,gender,searchingFor,Purpose,land,postcode,birthday);	
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
	})
})

function extraProfileUpdate(cookie,name,iam,searchingfor,purpose,land,city,birthday)
{
	    $.ajax({
        url:API_URL+'xprofile_update/?key=1234567891011&cookie='+cookie+'&Name='+name+'&Ich bin='+iam+'&Ich suche='+searchingfor+'&Rubrik='+purpose+'&Land='+land+'&City='+city+'&Birthday='+birthday+' ',
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
				navigator.notification.alert(
						'Thankyou for your Registration. Please check your registration Email and Sigin to Continue',  // message
						function(){setTimeout(function(){ window.location = 'signin.html'; }, 500);},        // callback
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





