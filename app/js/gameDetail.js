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
		var cooke = window.localStorage.getItem("loginuserCookie");
		console.log(cooke);
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
				var totalPosts = data.count;
				if(data.post.custom_fields.images)
				{
				var gallery = data.post.custom_fields.images;
				$.each(gallery, function (i, v) {
				imageGallery += '<a style="width:100%;" href="#img'+i+'" data-rel="popup" data-position-to="window" data-transition="fade" class="ui-link"><img src="'+GAME_IMAGES_PATH+v+'" alt="'+v+'" class="popphoto"></a>';
				})
				}
				else
				{
				imageGallery += '<a style="width:100%;" href="#img0" data-rel="popup" data-position-to="window" data-transition="fade" class="ui-link"><img style="max-width: 100%;max-height: 145px;width: auto;" src="img/gamesdefault.png" class="popphoto"></a>';	
				}
				
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
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+author.email+'</a></div>';
                 descBoxes += '<div class="ui-block-a"><a class="ui-shadow ui-btn">Details:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+post.excerpt+'</a></div>';
				 $('#seller_id').val(author.id);
				 console.log(descBoxes);
				 
				 var pid = post.id;
				 var pname = post.title;
				 var price = post.custom_fields.sales_price[0];
					 descBoxes += '<button onclick="addToCart(\''+pid+'\',\''+pname+'\',\''+price+'\')" id="addToCartbtn" class="ui-btn ui-btn-icon-left ui-btn-corner-all search btn not-srch">Add to cart</button>';
				 
				 $('.descBoxes').html(descBoxes);
				 if(window.localStorage.getItem("loginuserCookie"))
					{
						checkProductsFromCart(pid);	
					}
				 
				 
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
                    "Message Sent",  // message
                    function(){},         // callback
                    'Sending Message to Seller',            // title
                    'OK'                  // buttonName
                );
			}
			else
			{
				console.log(data.msg.status);
				navigator.notification.alert(
                    "Message not Sent",  // message
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



