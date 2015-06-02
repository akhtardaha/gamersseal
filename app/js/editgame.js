// JavaScript Document
$(document).ready(function(){
	//getPosts('wpmarketplace');
	var post_id = getQueryVariable('post_id');
	getProductCategories();
	setTimeout(getPostDetail(post_id),1000);
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
				 
				 var gameCategory = [];
				 $.each(post.taxonomy_ptype, function (ind, val) {
					gameCategory.push(val.id);
				 })
				 //var gameCat = gameCategory.join(', ');
				 //var dataarray=data.split(",");
				 console.log(gameCategory);
   				 $('#gameTitle').val(post.title);
				  $('#gameType').val(gameCategory);
				 $('#contactEmail').val(author.email);
				 var content = post.excerpt;
				 content = content.replace(/(<([^>]+)>)/ig,"");
				 $('#details').val(content);
				 $('#gameID').val(post.id);
				 $('#stock').val(post.custom_fields.stock_qty[0]);
				 $('#gameSlug').val(post.slug);
				 
				 //$('.descBoxes').html(descBoxes);
			}
			
		},
        error:function(){

        }
    });
		
}

function updateGame()
	{
		var gameID = $('#gameID').val();
		var gameSlug = $('#gameSlug').val();
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		
		var postTitle = $('#gameTitle').val();
		var gameType = $('#gameType').val();
		$('#contactEmail').val();
		var details = $('#details').val();
		var stock = $('#stock').val();
		
		
			if(postTitle == '')
			{
				$('#gameTitle').css('border','1px solid #ef4c4d');
			}
			else
			{
				$('#gameTitle').css('border','1px solid #cccccc');
			}
			if(gameType == '')
			{
				$('#gameType').css('border','1px solid #ef4c4d');
			}
			else
			{
				$('#gameType').css('border','1px solid #cccccc');
			}
			if(details == '')
			{
				$('#details').css('border','1px solid #ef4c4d');
			}
			else
			{
				$('#details').css('border','1px solid #cccccc');
			}
			if(stock == '')
			{
				$('#stock').css('border','1px solid #ef4c4d');
			}
			else
			{
				$('#stock').css('border','1px solid #cccccc');
			}
	
	
	
	
		if(postTitle == '' || gameType == '' || details == '' || stock == '')
		{
			return false;
		}
		else
		{
		$('#gameTitle').css('border','1px solid #cccccc');
		$('#gameType').css('border','1px solid #cccccc');
		$('#details').css('border','1px solid #cccccc');
		$('#stock').css('border','1px solid #cccccc');
		
		var url = API_URL+'update_post/?key=1234567891011&cookie='+cooke+'&id='+gameID+'&slug='+gameSlug+'&post_id='+gameID+'&post_type='+type+'&title='+postTitle+'&content='+details+'';
		console.log(url);
		var html = '';
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
					set_custom_options(gameID,stock);
					set_product_category(gameID,gameType);
					console.log("Product Updated Successfully");
					navigator.notification.alert(
							"Game Updated Successfully",  // message
							function(){setTimeout(function(){ window.location = 'managegames.html'; },2000)},        // callback
						   'Update Game',            // title
							'OK'                  // buttonName
					);		
					}
					
					
				},
				error:function(){
		
				}
			});
		}
		
}
function set_product_category(post_id,terms)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'set_product_category/?key=1234567891011&post_id='+post_id+'&terms_id='+terms;
		console.log(url);
		$.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			//stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
			}
			else
			{
			}
			//$('.tabContent').html(html);
		},
        error:function(){

        }
    });
}

function set_custom_options(post_id,stock)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'update_post_meta/?key=1234567891011&cookie='+cooke+'&post_id='+post_id+'&stock_qty='+stock+'';
		$.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			//stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
			}
			else
			{
			}
			//$('.tabContent').html(html);
		},
        error:function(){

        }
    });
}


function getProductCategories()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_products_categories/?key=1234567891011';
		var html = '';
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
				$.each(data.data, function (i, value) {
					html += '<option value="'+value.term_taxonomy_id+'">'+value.name+'</option>';
        			//html += '<a href="category.html?term_id='+value.term_id+'&term_taxonomy_id='+value.term_taxonomy_id+'&slug='+value.slug+'">'+value.name+'</a>';
				})
			}
			$('#gameType').html(html);
			
		},
        error:function(){

        }
    });
		
}

function deleteGame(gameID)
	{
		var gameID = $('#gameID').val();
		var gameSlug = $('#gameSlug').val();
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'delete_post/?key=1234567891011&cookie='+cooke+'&id='+gameID+'&slug='+gameSlug+'&post_id='+gameID+'&post_type=wpmarketplace';
		var html = '';
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
				console.log("Game Deleted");
				navigator.notification.alert(
							"Game Deleted from Game List",  // message
							function(){setTimeout(function(){ window.location = 'managegames.html'; }, 200);},        // callback
						   'Delete Game',            // title
							'OK'                  // buttonName
				);		
			}
			
			
		},
        error:function(){

        }
    });
		
}

function showConfirm() {
	var gameID = $('#gameID').val();
    console.log('Are you Sure to delete this Game? '+gameID);
    navigator.notification.confirm(
        'Are you Sure to delete this Game?', // message
        function(buttonIndex){
            onConfirm(buttonIndex, gameID);
        },
        'Delete Game',           // title
        ['Yes','No'] 
     );
}

function onConfirm(buttonIndex, gameID){
   if(buttonIndex == '1')
    {
        deleteGame(gameID);
    }
}