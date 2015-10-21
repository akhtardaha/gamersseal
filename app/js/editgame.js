// JavaScript Document
$(document).ready(function(){
	//getPosts('wpmarketplace');
	var post_id = getQueryVariable('post_id');
	getProductCategories();
	
})

function getPostDetail(post_id)
	{
		$('.tabContent').html('');
		tabContentstartLoading();
		var user_id = window.localStorage.getItem("loginuserID");	
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
				var slider_images = '';
		   var main_images = ''; 
		   var totalimages = 0;
		   var blank = '_blank';
		   	if(typeof(data.post.custom_fields.images) == 'object')
		   	{
				main_images = '';
				//console.log(data.post.custom_fields.images.length);
			  for(count=0; count < data.post.custom_fields.images.length;  count++)
		   {
				totalimages++;
				  var imgPath  = GAME_IMAGES_PATH;
				  var pimgname = data.post.custom_fields.images[count]; 
				  var pimg     =  imgPath+pimgname;
				  console.log(pimg);
				      //P_ABILD
						 //slider_images += '<li><img onclick="updateImage(this)" src="'+pimg+'" style="max-height:50px; max-width: 50px;"  /></li>';
						 //main_images += '<div class="swiper-slide"><a style="width:100%;height:90%;float:left;display:block;" href="javascript:void(0)" onclick="window.open(\''+pimg+'\',\''+blank+'\');"><img id="main-image" src="'+pimg+'" align="center" valign="center" style="max-width: 300px; max-height: 200px;" /></div></div>';
						 main_images += '<div class="swiper-slide"><a style="width:100%;height:90%;float:left;display:block;" href="javascript:void(0)"><img id="main-image" src="'+pimg+'" align="center" valign="center" style="max-width: 300px; max-height: 200px;" /></div></div>';
				   //alert(html2);
				   
		   }
		   
		   html += '<div  class="imgDetailCont">';
							 var html2 = main_images;
							 //html3 = '<div class="imagedetail-thumb" style="padding: 25px; float: left;"><ul>'+slider_images+'</ul></div>';
				   html += '</div>';
				   //$('#pdbLnk').attr('href','products.html?groupid='+pgroupid);
				  
				  $('.gallery').html(html2);
			}
			else
			{
				 main_images += '<div class="swiper-slide"><img id="main-image" src="img/gamesdefault.png" align="center" valign="center" style="margin-top: 0px !important;max-width: 260px; max-height: 120px;" /></div></div>';
			   $('.swiper-container').html(main_images);
		   
			}
				var swiper = new Swiper('.swiper-container',{
						pagination: '.pagination',
						loop:false,
						paginationClickable: true
					  }) 
				
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
				 //content = content.replace(/(<([^>]+)>)/ig,"");
					var regex = /<br\s*[\/]?>/gi;
					content = content.replace(regex, "\n");

				 $('#details').val(content);
				 $('#gameID').val(post.id);
				 $('#stock').val(post.custom_fields.stock_qty[0]);
				 $('#gameSlug').val(post.slug);
				 $('#publish').val(post.custom_fields.visible[0]);
				 
				 //$('.descBoxes').html(descBoxes);
			}
			
		},
        error:function(){

        }
    });
		
}

function updateGame()
	{
		startButtonLoading('updateBtn');
		var gameID = $('#gameID').val();
		var gameSlug = $('#gameSlug').val();
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var publish = $('#publish').val();
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
			$('#form-err').text('Please Fill Required Fields!');
			endButtonLoading('updateBtn');
			return false;
		}
		else
		{
		$('#gameTitle').css('border','1px solid #cccccc');
		$('#gameType').css('border','1px solid #cccccc');
		$('#details').css('border','1px solid #cccccc');
		$('#stock').css('border','1px solid #cccccc');
		
		details = details.replace(/\n/g, "<br />");
		
		var url = API_URL+'update_post/?key=1234567891011&cookie='+cooke+'&id='+gameID+'&slug='+gameSlug+'&post_id='+gameID+'&post_status='+publish+'&post_type='+type+'&title='+postTitle+'&content='+details+'';
		console.log(url);
		var html = '';
			$.ajax({
				 url:url,
				type: "POST",
				contentType: "application/json",
				dataType: 'jsonp',
				success:function(data)
				{
					endButtonLoading('updateBtn');
					console.log(data);
					if(data.status == 'ok')
					{
					set_custom_options(gameID,stock,publish);
					console.log(gameType);
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
			terms
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

function set_custom_options(post_id,stock,publish)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'update_post_meta/?key=1234567891011&cookie='+cooke+'&post_id='+post_id+'&stock_qty='+stock+'&visible='+publish+'';
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
		var post_id = getQueryVariable('post_id');
		var url = API_URL+'fetch_products_categories/?key=1234567891011';
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
				$.each(data.data, function (i, value) {
					html += '<option value="'+value.term_taxonomy_id+'">'+value.name+'</option>';
        			//html += '<a href="category.html?term_id='+value.term_id+'&term_taxonomy_id='+value.term_taxonomy_id+'&slug='+value.slug+'">'+value.name+'</a>';
				})
			}
			$('#gameType').html(html);
			getPostDetail(post_id);
			
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