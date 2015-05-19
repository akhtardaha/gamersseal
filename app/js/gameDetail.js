// JavaScript Document
$(document).ready(function(){
	//getPosts('wpmarketplace');
	var post_id = getQueryVariable('post_id');
	getPostDetail(post_id);
})

function getPostDetail(post_id)
	{
		$('.tabContent').html('');
		tabContentstartLoading();
		var user_id = window.localStorage.getItem("loginUserID");	
		var cooke = window.localStorage.getItem("loginUserCookie");
		var url = API_URL_DEFAULT+'get_post/?id='+post_id+'&post_type=wpmarketplace';
		console.log(url);
		var html = '';
		var imageGallery = '';
		var descBoxes = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
		beforeSend: function (xhr){ 
        xhr.setRequestHeader('Authorization', make_base_auth('bonjour', 'aj00pw')); 
    	},
        success:function(data)
        {
			stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
				console.log(data);
				var post = data.post;
				var author = data.post.author;
				var gallery = data.post.custom_fields.images;
				var totalPosts = data.count;
					$.each(gallery, function (i, v) {
				imageGallery += '<a style="width:100%;" href="#img'+i+'" data-rel="popup" data-position-to="window" data-transition="fade" class="ui-link"><img src="'+GAME_IMAGES_PATH+v+'" alt="'+v+'" class="popphoto"></a>';
					})
				$('.gallery').html(imageGallery);
				
				 descBoxes += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Title:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+post.title+'</a></div>';
                 descBoxes += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Category:</a></div>';
				 
				 var gameCategory = [];
				 $.each(post.taxonomy_ptype, function (ind, val) {
					gameCategory.push(val.title);
				 })
				 var gameCat = gameCategory.join(', ');
   				 
				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+gameCat+'</a></div>';
                 descBoxes += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Contact Email:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+author.name+'</a></div>';
                 descBoxes += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Details:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+post.excerpt+'</a></div>';
				 $('#seller_id').val(author.id);
				 console.log(descBoxes);
				 $('.descBoxes').html(descBoxes);
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			//$('.tabContent').html(html);
			
		},
        error:function(){

        }
    });
		
}

function sendMessagetoSeller()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var seller_id = $('#seller_id').val();
		var title = $('#title').val();
		var message = $('#message').val();
		var url = API_URL+'send_message_seller/?key=1234567891011&user_id='+user_id+'&seller_id='+seller_id+'&title='+title+'&message='+message;
		console.log(url);
		var html = '';
		var imageGallery = '';
		var descBoxes = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
				$('#title').val('');
				$('#message').val('');
				console.log(data.msg.status);
				navigator.notification.alert(
                    data.msg.status,  // message
                    function(){},         // callback
                    'Sending Message to Seller',            // title
                    'OK'                  // buttonName
                );
			}
			else
			{
				console.log(data.msg.status);
				navigator.notification.alert(
                    data.msg.status,  // message
                    function(){},         // callback
                    'Sending Message to Seller',            // title
                    'OK'                  // buttonName
                );
				//html += '<p>'+data.error+'</p>';
				
			}
			
		},
        error:function(){

        }
    });
		
}



