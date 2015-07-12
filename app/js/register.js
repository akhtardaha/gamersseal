// JavaScript Document
var terms_and_conditions = '<a class="specification">Terms and Conditions</a>';
terms_and_conditions += window.localStorage.getItem("terms_and_conditions");
terms_and_conditions += '<div style="margin-top: 15px;" class="lastRow"><input type="checkbox" style="float:left;margin-top: 5px; margin-right:10px;" name="terms" id="terms"  /><label style="position: relative;left: 0px;">Agree to Terms and Conditions</label></div>';
 terms_and_conditions += '<a href="javascript:void(0)" class="submitBtn ui-btn select ui-btn-up-c search btn not-srch a-btn" onclick="return registerUser();">Register</a>';
$(document).ready(function(){
	$('.agreeTerms').html(terms_and_conditions);
})

function continueRegister(){
var fname = $('#fname').val();
		var lname = $('#lname').val();
		var username = $('#username').val();
		var email = $('#email').val();
		
		var dob = $('#dob').val();
		var address = $('#address').val();
		var Suburb = $('#Suburb').val();
		var state = $('#state').val();
		var postcode = $('#postcode').val();
		var hphone = $('#hphone').val();
		var mphone = $('#mphone').val();
		var abn = $('#abn').val();
		var dlicense = $('#dlicense').val();
		var passport = $('#passport').val();
		var australianId = $('#australianId').val();
		
		var role = $('#userType').val();
		
		if(fname == '')
		{
			$('#fname').css('border','1px solid goldenrod');
		}
		else
		{
			$('#fname').css('border','1px solid #aaa');
		}
		if(lname == '')
		{
			$('#lname').css('border','1px solid goldenrod');
		}
		else
		{
			$('#lname').css('border','1px solid #aaa');
		}
		if(username == '')
		{
			$('#username').css('border','1px solid goldenrod');
		}
		else
		{
			$('#username').css('border','1px solid #aaa');
		}
		if(email == '')
		{
			$('#email').css('border','1px solid goldenrod');
		}
		else
		{
			$('#email').css('border','1px solid #aaa');
		}
		if(australianId == '')
		{
			$('#australianId').css('border','1px solid goldenrod');
		}
		else
		{
			$('#australianId').css('border','1px solid #aaa');
		}
		if(role == '')
		{
			$('.usertypeSelect select').css('border','1px solid goldenrod');
		}
		else
		{
			$('.usertypeSelect select').css('border','1px solid #aaa');
		}
		
		if( username !='' && email != '' && fname != '' && lname != '' && australianId != '' && role != '')
		{
		if(validateEmail(email))
		{
			if(window.localStorage.getItem("emailExists") != 1 && window.localStorage.getItem("usernameExists") != 1)
			{
				$('.fieldError').hide();
				$('.registerBox').hide();
				$('.agreeTerms').show();
				$('.header .cart a').attr('onclick','backRegForm()');
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
		//$('.fieldError').html('Please Fill Required Fields!');
		$('#form-err').text('Please Fill Required Fields!');
		//$('.fieldError').fadeIn();		
	}
		//console.log(birthday);	
}

function backRegForm()
{
	$('.agreeTerms').hide();
	$('.registerBox').show();
	$('.header .cart a').attr('onclick','return goBack()');	
}
function registerUser(){
		var fname = $('#fname').val();
		var lname = $('#lname').val();
		var username = $('#username').val();
		var email = $('#email').val();
		
		var dob = $('#dob').val();
		var address = $('#address').val();
		var Suburb = $('#Suburb').val();
		var state = $('#state').val();
		var postcode = $('#postcode').val();
		var hphone = $('#hphone').val();
		var mphone = $('#mphone').val();
		var abn = $('#abn').val();
		var dlicense = $('#dlicense').val();
		var passport = $('#passport').val();
		var australianId = $('#australianId').val();
		
			var role = $('#userType').val();
			var check = $("#terms").is(":checked");
				if(check)
				{
					if(role != 'guest' && role != 'standard' && role != 'preminum')
					{
						role = '';
					}
					var url = API_URL+'register/?key=1234567891011&username='+username+'&email='+email+'&display_name='+username+'&first_name='+fname+'&last_name='+lname+'&role='+role;
					console.log(url);
					//return false;
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
							var regCookie = data.cookie;
							var regUserid = data.user_id;
							var fullname  = fname+' '+lname; ;
							extraProfileUpdate(regCookie,fullname,australianId,dob,address,Suburb,state,postcode,hphone,mphone,abn,dlicense,passport);	
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

function extraProfileUpdate(cookie,fullname,australianId,dob,address,Suburb,state,postcode,hphone,mphone,abn,dlicense,passport)
{
	    $.ajax({
        url:API_URL+'xprofile_update/?key=1234567891011&cookie='+cookie+'&Name='+fullname+'&Australian ID='+australianId+'&DOB='+dob+'&Address='+address+'&Suburb='+Suburb+'&State='+state+'&Post Code='+postcode+'&Home Phone='+hphone+'&Mobile Phone='+mphone+'&ABN='+abn+'&Driving License='+dlicense+'&Passport='+passport+' ',
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





