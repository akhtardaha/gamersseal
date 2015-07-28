// JavaScript Document
if(window.localStorage.getItem("loginuserCookie") == '')
{
	setTimeout(function(){ window.location = 'index.html'; }, 500);
}
$(document).ready(function(){
	var avatar = window.localStorage.getItem("loginuserPic");
	$('#popphoto').html('<img src="'+avatar+'" alt="Game Image 01" class="popphoto" >');
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
			$('.loginBtn').removeClass('loadingSmall');
			console.log(data);
			if(data.status == 'ok')
			{
				var profile = data;
					html += '<div class="item">';
					html += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Name:</a></div>';
   					html += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+profile.displayname+'</a></div>';
					html += '</div>';
					html += '<div class="item">';
					html += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Contact Email:</a></div>';
   					html += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+profile.email+'</a></div>';
					html += '</div>';
					html += '<div class="specification ui-icon-user show-full-profile" id="show-full-profile">Show Full Profile</div>';
					html += '<div class="full-profile">';
				$.each(profile, function (i, value) {
					if(i != 'status' && i != 'id' && i != 'nicename' && i != 'email' && i != 'lastname' && i != 'nickname' && i != 'firstname' && i != 'avatar' && i != 'displayname' && i != 'url' && i != '' && value != '' && i != 'Name' )
					{
					html += '<div class="item">';
					html += '<div class="ui-block-a"><a class="ui-shadow ui-btn">'+i+':</a></div>';
   					html += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+value+'</a></div>';
					html += '</div>';
					}
				})
				html += '</div>';
				$('.descBoxes').html(html);
			}
			
		},
        error:function(){
			
        }
    });
}