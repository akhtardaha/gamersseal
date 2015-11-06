// JavaScript Document
$(document).ready(function(){
	//getPosts('wpmarketplace');
	var post_id = getQueryVariable('post_id');
	getPostDetail(post_id);
	var NewViewed = post_id;
	var oldViewed = window.localStorage.getItem("RecentViewed");
	if(oldViewed)
	{
		NewViewed = NewViewed+","+oldViewed;
	}
	else
	{
		NewViewed = NewViewed;
	}
	window.localStorage.setItem("RecentViewed",NewViewed);
	
	$('#captchaInput').keyup(function(e){
		if(e.keyCode == 13)
		{
			console.log("ENTER PRESSED");
			sendMessagetoSeller();
		}
	});
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
				/*if(data.post.custom_fields.images)
				{
				var gallery = data.post.custom_fields.images;
				$.each(gallery, function (i, v) {
				imageGallery += '<div class="swiper-slide" style="background-image:url('+GAME_IMAGES_PATH+v+')"></div>';
				
				})
				}
				else
				{
				imageGallery += '<div class="swiper-slide" style="background-image:url(img/gamesdefault.png)"></div>';
				
				}
				
				$('.gallery').html(imageGallery);*/
				
				
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
			   $('.gallery').html(main_images);
		   
			}
				var swiper = new Swiper('.swiper-container',{
						pagination: '.pagination',
						loop:false,
						paginationClickable: true
					  }) 
				/*var swiper = new Swiper('.swiper-container', {
					pagination: '.swiper-pagination',
					paginationClickable: true
				});*/
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Title:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+post.title+'</a></div></div>';
                 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Category:</a></div>';
				 
				 var gameCategory = [];
				 $.each(post.taxonomy_ptype, function (ind, val) {
					gameCategory.push(val.title);
				 })
				 var gameCat = gameCategory.join(', ');
   				 
				 var seller_id = author.id;
				 var pid = post.id;
				 var pname = post.title;
				 var price = post.custom_fields.sales_price[0];
				 if(post.custom_fields.delivery_time)
				 {
				 var delievery_time = post.custom_fields.delivery_time[0];
				 }
				 else
				 {
					var delievery_time = 2; 
				 }
				 
				 if(post.custom_fields.shiping_cost)
				 {
				 var shiping_cost = post.custom_fields.shiping_cost[0];
				 }
				 else
				 {
					var shiping_cost = '0'; 
				 }
				 shiping_cost = intToFloat(shiping_cost, 2);
				 
				 if(post.custom_fields.state)
				 {
				 var location = post.custom_fields.state[0];
				 }
				 else
				 {
					var state = ''; 
				 }
				 
				 if(post.custom_fields.age_limit)
				 {
				 var age_limit = post.custom_fields.age_limit[0];
				 age_limit =  age_limit.toLowerCase();
				 }
				 else
				 {
					var age_limit = ''; 
					
				 }
				 
				 if(post.custom_fields.condition)
				 {
				 var condition = post.custom_fields.condition[0];
				 }
				 else
				 {
					var condition = ''; 
					
				 }
				 
				 if(post.custom_fields.FrontQuality)
				 {
				 var FrontQuality = post.custom_fields.FrontQuality[0];
				 }
				 else
				 {
					var FrontQuality = ''; 
					
				 }
				 
				  if(post.custom_fields.Disk1Quality)
				 {
				 var Disk1Quality = post.custom_fields.Disk1Quality[0];
				 }
				 else
				 {
					var Disk1Quality = ''; 
					
				 }
				 
				  if(post.custom_fields.Disk2Quality)
				 {
				 var Disk2Quality = post.custom_fields.Disk2Quality[0];
				 }
				 else
				 {
					var Disk2Quality = ''; 
					
				 }
				 
				 if(post.custom_fields.Manual)
				 {
				 var Manual = post.custom_fields.Manual[0];
				 }
				 else
				 {
					var Manual = ''; 
					
				 }
				 
				 
				 
				 
				 //var location = window.localStorage.getItem("loginuserLocation");
				 
				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+gameCat+'</a></div></div>';
                 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Price:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">$'+price+'</a></div></div>';
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Postage Cost:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">$'+shiping_cost+'</a></div></div>';
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Location:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+location+'</a></div></div>';
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Estimated Delivery Time:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+delievery_time+' Days</a></div></div>';
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Contact Email:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+author.email+'</a></div></div>';
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Seller Rating:</a></div>';
				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn"><img src="img/fav.png" alt="Gamer Seal" width="30" /><img src="img/fav.png" alt="Gamer Seal" width="30" /><img src="img/fav.png" alt="Gamer Seal" width="30" /></a></div></div>';
   				 //descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn"><img src="'+LOGO_PATH+app_icon+'" alt="Gamer Seal" width="30" /><img src="'+LOGO_PATH+app_icon+'" alt="Gamer Seal" width="30" /><img src="'+LOGO_PATH+app_icon+'" alt="Gamer Seal" width="30" /></a></div></div>';
				 if(age_limit){
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Classification Rating:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn"><img src="img/icon_'+age_limit+'.png" alt="'+age_limit+'"/></a></div></div>';
				 }
				 if(condition){
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Condition of Game:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+condition+'</a></div></div>';
				 }
				 
				 if(FrontQuality || Disk1Quality || Disk2Quality || Manual)
				 {
				 descBoxes += '<a href="javascript:void(0)" class="specification">Quality of Game</a>';
				 }
				 if(FrontQuality){
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Front:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+FrontQuality+'</a></div></div>';
				 }
				 if(Disk1Quality){
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Disk 1 Rear:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+Disk1Quality+'</a></div></div>';
				 }
				 if(Disk2Quality){
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Disk 2 Rear:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+Disk2Quality+'</a></div></div>';
				 }
				 if(Manual){
				 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Manual:</a></div>';
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+Manual+'</a></div></div>';
				 }
                 descBoxes += '<div class="row-single"><div class="ui-block-a"><a class="ui-shadow ui-btn">Details:</a></div>';
				 var descLimit = window.localStorage.getItem("item_desc_limit");
				 if(descLimit)
				 {
   				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+post.excerpt.substr(0, descLimit)+'</a></div></div>';
				 }
				 else
				 {
				 descBoxes += '<div class="ui-block-b"><a class="ui-shadow ui-btn">'+post.excerpt.substr(0, 250)+'</a></div></div>';
				 }
				 $('#seller_id').val(author.id);
				 console.log(descBoxes);
				 
				
				 if(post.custom_fields.shiping_cost)
				 {
					 var shippingcost = post.custom_fields.shiping_cost[0];
				 }
				 else
				 {
					 var shippingcost = 0;
				 }
				 console.log(author.id+" "+user_id);
				 if(author.id != user_id)
				 {
					 descBoxes += '<button onclick="addToCart(\''+pid+'\',\''+pname+'\',\''+price+'\',\''+seller_id+'\',\''+shippingcost+'\')" id="addToCartbtn" class="ui-btn ui-btn-icon-left ui-btn-corner-all search btn not-srch">Add to Cart</button>';
				 }
				 else
				 {
					 descBoxes += '<a style="float:left;" href="editgame.html?post_id='+pid+'" id="updateProd" class="ui-btn ui-btn-icon-left ui-btn-corner-all search btn not-srch">Update Game</button>';
				 }
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
		var captcha = $('#captchaInput').val();
		var captchaVal = $('#captcha-val').val();
	if(title == ''){
		$('#title').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
	}
	else
	{
		$('#title').css('border','1px solid #cccccc');
		$('#form-err').text('');
	}
	if(message == ''){
		$('#message').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
	}
	else
	{
		$('#message').css('border','1px solid #cccccc');
		$('#form-err').text('');
	}
	if(captcha == ''){
		$('#captchaInput').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
	}
	else
	{
		$('#captchaInput').css('border','1px solid #cccccc');
		$('#form-err').text('');
	}
	if(captcha !== captchaVal){
		$('#captchaInput').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
	}
	else
	{
		$('#captchaInput').css('border','1px solid #cccccc');
		$('#form-err').text('');
	}
	if(message == '' || title == '' || captcha == '' || captcha !== captchaVal){
		$('#form-err').text('Please Fill Required Fields!');
		return false;}
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
                    function(){},    // callback
                    'Sending Message to Seller',            // title
                    'OK'             // buttonName
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



