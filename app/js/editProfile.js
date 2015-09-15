// JavaScript Document
$(document).ready(function(){
	getUserInfo();
})


function getUserInfo()
{
	var html = '';
	var cooke = window.localStorage.getItem("loginuserCookie");
	var user_id = window.localStorage.getItem("loginuserID");
	$.ajax({
        url:API_URL+'xprofile/?key=1234567891011&user_id='+user_id+'&field=default',
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			console.log(data);
			if(data.status == 'ok')
			{
			var profile = data;
			html += '<a class="specification">Edit User Profile</a>';
           	html += '<div class="fieldError" style="display:none;"></div>';
            html += '<form action="" name="login" class="register" onsubmit="return false;">';
            html += '<input type="text" id="name" name="name" class="search not-srch" value="'+profile.Name+'" placeholder="Name"/>';
            html += '<div class="width:100%;">';
            	html += '<label style="font-size: 14px;font-family: Arial;margin-right: 5px;float: left;line-height: 50px;">Date of Birth</label>';
                html += '<input style="width:50%;" type="date" id="dob" name="dob" value="'+profile.DOB+'" class="search not-srch" placeholder="DOB"/>';
            html += '</div>';
            
           	html += '<input type="text" id="address" name="address" class="search not-srch" value="'+profile.Address+'" placeholder="Address"/>';
            html += '<input type="text" id="Suburb" name="Suburb" class="search not-srch" value="'+profile.Suburb+'" placeholder="Suburb"/>';
			
            html += '<select id="state" name="state" class="search not-srch">';
            	html += '<option value="" >State</option>';
                html += '<option value="Western Australia (WA)">Western Australia (WA)</option>';
                html += '<option value="New South Wales (NSW)">New South Wales (NSW)</option>';
                html += '<option value="Queensland (QLD)">Queensland (QLD)</option>';
                html += '<option value="South Australia (SA)">South Australia (SA)</option>';
                html += '<option value="Tasmania (TAS)">Tasmania (TAS)</option>';
                html += '<option value="Victoria (VIC)">Victoria (VIC)</option>';
            html += '</select>';
            html += '<input type="number" id="postcode" name="postcode" class="search not-srch" placeholder="Post Code" value="'+profile['Post Code']+'" onkeypress="return isNumberKey();"/>';
            html += '<input type="number" id="hphone" name="hphone" class="search not-srch" placeholder="Home Phone" value="'+profile['Home Phone']+'" onkeypress="return isNumberKey();"/>';
            html += '<input type="number" id="mphone" name="mphone" class="search not-srch" placeholder="Mobile Phone Number" value="'+profile['Mobile Phone']+'" onkeypress="return isNumberKey();"/>';
			console.log(profile.ABN);
            html += '<input type="number" id="abn" name="abn" class="search not-srch" placeholder="ABN# (Business Only)" value="'+profile.ABN+'" onkeypress="return isNumberKey();"/>';
            html += '<input type="number" id="dlicense" name="mphone" class="search not-srch" placeholder="Drivers Licence/Proof of Age Card #" value="'+profile['Driving License']+'" onkeypress="return isNumberKey();"/>';
            html += '<input type="number" id="passport" name="passport" class="search not-srch" placeholder="Passport#" value="'+profile['Passport']+'" onkeypress="return isNumberKey();"/>';
            html += '<label id="form-err"></label>';
            html += '<a href="javascript:void(0)" class="submitBtn ui-btn select ui-btn-up-c search btn not-srch a-btn" onclick="return continueRegister();">Update Profile</a>';
            html += '</form>';
			
			$('.registerBox').html(html);
			var st = profile.State;
			$('#state').val(st);
			
				
			}
			
		},
        error:function(){
			
        }
    });
}

function continueRegister(){
var name = $('#name').val();
		
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
		
		//var role = $('#userType').val();
		updateUser();
		//console.log(birthday);	
}

function updateUser(){
		var name = $('#name').val();
		var password = $('#cpassword').val();
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
		
		var fullname = name;
		var cooke = window.localStorage.getItem("loginuserCookie");
		extraProfileUpdate(cooke,fullname,dob,address,Suburb,state,postcode,hphone,mphone,abn,dlicense,passport);			
}

function extraProfileUpdate(cookie,fullname,dob,address,Suburb,state,postcode,hphone,mphone,abn,dlicense,passport)
{
	    $.ajax({
        url:API_URL+'xprofile_update/?key=1234567891011&cookie='+cookie+'&Name='+fullname+'&DOB='+dob+'&Address='+address+'&Suburb='+Suburb+'&State='+state+'&Post Code='+postcode+'&Home Phone='+hphone+'&Mobile Phone='+mphone+'&ABN='+abn+'&Driving License='+dlicense+'&Passport='+passport+' ',
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			console.log(data);
			if(data.status == 'ok')
			{
				navigator.notification.alert(
						'Profile Updated',  // message
						function(){setTimeout(function(){ window.location = 'profile.html'; }, 200);},        // callback
					   'Edit User Profile',            // title
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


