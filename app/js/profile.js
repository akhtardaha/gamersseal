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
					html += '<div class="specification ui-icon-user show-full-profile less" onclick="toggleProfile();" id="show-full-profile">Show Full Profile</div>';
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

function toggleProfile()
{
	//console.log("Clicked");
	if($('#show-full-profile').hasClass('less')){
		$('.full-profile').fadeIn('slow');
		$('#show-full-profile').removeClass('less');
		$('#show-full-profile').addClass('full');
		$('#show-full-profile').html('Hide Full Profile');
		
	}
	else if($('#show-full-profile').hasClass('full'))
	{
		$('.full-profile').fadeOut('slow');
		$('#show-full-profile').removeClass('full');
		$('#show-full-profile').addClass('less');
		$('#show-full-profile').html('Show Full Profile');
	}
	
}


		function getImage() {
            // Retrieve image file location from specified source
			startButtonLoading('changePic');
            navigator.camera.getPicture(uploadPhoto, function(message) {
				console.log('get picture failed');
				},{
				quality: 50, 
				destinationType: navigator.camera.DestinationType.FILE_URI,
				sourceType: navigator.camera.PictureSourceType.PHOTOLIBRARY
			});
 
        }
 
        function uploadPhoto(imageURI) {
			//alert(imageURI);
			var userid = window.localStorage.getItem("loginuserID");
			var cookie = window.localStorage.getItem("loginuserCookie");
            var options = new FileUploadOptions();
            options.fileKey="avatar";
            options.fileName= userid + Number(new Date()) + ".jpg";
            options.mimeType="image/jpeg";
 
            var params = new Object();
            params.key = "1234567891011";
            params.cookie = cookie;
 
            options.params = params;
            options.chunkedMode = false;
 
            var ft = new FileTransfer();
			
			//var url = http://bonjour.projekte-web.com/wp-content/themes/kleo/avatar_upload.php;
			var url = API_URL+'avatar_upload/';
			console.log(url);
			//upload_avatar(imageURI);
            ft.upload(imageURI, url, win, fail, options, true);
        }
 
        function win(r) {
			endButtonLoading('changePic');
			getUserInfo();
        }
 
        function fail(error) {
			endButtonLoading('changePic');
			navigator.notification.alert(
						"Change Picture Failed",  // message
						function(){},        // callback
					   'There is some error while changing your Profile Picture, Please check your Internet Connection',            // title
						'OK'                  // buttonName
				);
            console.log("Error found, Error code ="+error.code);
			//alert("An error has occurred: Code = " = error.code);
        }
