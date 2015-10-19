// JavaScript Document
$(document).ready(function(){
	getClassificationtext();
	if(window.localStorage.getItem("loginuserCookie"))
	{
		$('#email').val(window.localStorage.getItem("loginuserEmail"));
		getProductCategories();	
		window.localStorage.setItem("GamesPics",'');
		window.localStorage.setItem("imageCount",0);
		getUserTransactionsPerDay();
		getUserPurchasePerDay();	
	}
	else
	{
		setTimeout(function(){window.location = 'login.html';},200);
		
	}
})

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
				html += '<option value="" class="label-list">Select Item Type</option>';
				$.each(data.data, function (i, value) {
					html += '<option value="'+value.term_taxonomy_id+'">'+value.name+'</option>';
				})
			}
			$('#gameType').html(html);
			
		},
        error:function(){

        }
    });
		
}

function addPost()
{
	startButtonLoading('SignIn');
	var gameType = $('#gameType').val();
	var postTitle = $('#title').val();
	var postDetail = $('#content').val();
	var price = $('#price').val();
	var deliveryTime = $('#delivery-time').val();
	var stock = $('#stock').val();
	var shipingCost = $('#shiping-cost').val();
	var condition = $('#condition').val();
	
	var FrontQuality = $('#FrontQuality').val();
	var Disk1Quality = $('#Disk1Quality').val();
	var Disk2Quality = $('#Disk2Quality').val();
	var Manual = $('#ManualQuality').val();
	
	var ageLimit = $('input[name="age-limit"]:checked').val();
	console.log(ageLimit);
	console.log(gameType);
	//var ageLimit = $('#age-limit').val();
	var manage_stock = 1;
	
	if(window.localStorage.getItem("GamesPics"))
	{
		var pics = window.localStorage.getItem("GamesPics");
	}
	else
	{
		var pics = '';
	}
	
	var publish = $('#publish').val();
	
	
	if(postTitle == '')
	{
		$('#title').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
		endButtonLoading('SignIn');
	}
	else
	{
		$('#title').css('border','1px solid #cccccc');
	}
	if(postDetail == '')
	{
		$('#content').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
		endButtonLoading('SignIn');
	}
	else
	{
		$('#content').css('border','1px solid #cccccc');
	}
	if(price == '')
	{
		$('#price').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
		endButtonLoading('SignIn');
	}
	else
	{
		$('#price').css('border','1px solid #cccccc');
	}
	if(stock == '')
	{
		$('#stock').css('border','1px solid #ef4c4d');
		$('#form-err').text('Please Fill Required Fields!');
		endButtonLoading('SignIn');
	}
	else
	{
		$('#stock').css('border','1px solid #cccccc');
	}
	var imgCount = window.localStorage.getItem("imageCount");
	if(imgCount < 3)
	{
		$('#uploadImg1').css('border','1px solid #ef4c4d');
		$('#uploadImg2').css('border','1px solid #ef4c4d');
		$('#uploadImg3').css('border','1px solid #ef4c4d');;
		$('#form-err').text('Please Fill Required Fields!');
		endButtonLoading('SignIn');
	}
	else
	{
		$('#uploadImg1').css('border','1px solid #cccccc');
		$('#uploadImg2').css('border','1px solid #cccccc');
		$('#uploadImg3').css('border','1px solid #cccccc');
	}
	
	if(postTitle == '' || postDetail == '' || price == '' || stock == '')
	{
		$('#form-err').text('Please Fill Required Fields!');
		endButtonLoading('SignIn');
		return false;
	}
	else if(imgCount < 3)
	{
		console.log("Please upload minimum 3 Images of Game");
		navigator.notification.alert(
							"Please upload minimum 3 Images of Game",  // message
							function(){},        // callback
						   'Upload Images',            // title
							'OK'                  // buttonName
		);
		endButtonLoading('SignIn');
		return false;
	}
	else
	{
		$('#form-err').text('');
		$('#postTitle').css('border','1px solid #cccccc');
		$('#postDetail').css('border','1px solid #cccccc');
		$('#price').css('border','1px solid #cccccc');
		$('#stock').css('border','1px solid #cccccc');
	}

	var cooke = window.localStorage.getItem("loginuserCookie");
	var location = window.localStorage.getItem("loginuserLocation");
	
	var url = API_URL+'add_post/?key=1234567891011&cookie='+cooke+'&type=wpmarketplace&title='+postTitle+'&content='+postDetail+'&manage_stock='+manage_stock+'&stock_qty='+stock+'&sales_price='+price+'&delivery_time='+deliveryTime+'&shiping_cost='+shipingCost+'&images='+pics+'&visible='+publish+'&age_limit='+ageLimit+'&condition='+condition+'&FrontQuality='+FrontQuality+'&Disk1Quality='+Disk1Quality+'&Disk2Quality='+Disk2Quality+'&Manual='+Manual+'&location='+location+'&status=pending';
	
	console.log(url);
		var html = '';
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
				var post_id = data.post.id;
				set_product_category(post_id,gameType);
				//set_custom_options(post_id,price,stock,manage_stock);
				
				console.log("Product Added Successfully");
					navigator.notification.alert(
							"Game Added Successfully",  // message
							function(){setTimeout(function(){ window.location = 'postgame.html'; },200)},        // callback
						   'Adding New Game',            // title
							'OK'                  // buttonName
				);	
				
			}
			else
			{
				console.log(data.error);
					navigator.notification.alert(
							data.error,  // message
							function(){},        // callback
						   'Adding New Game',            // title
							'OK'                  // buttonName
				);	
			}
			//$('.tabContent').html(html);
		},
        error:function(){

        }
    });
}

function set_custom_options(post_id,price,stock,manage_stock)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'update_post_meta/?key=1234567891011&cookie='+cooke+'&post_id='+post_id+'&sales_price='+price+'&manage_stock='+manage_stock+'&stock_qty='+stock+'';
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

function set_post_type(post_id)
{
		var url = API_URL+'set_post_type_wpmarketplace/?key=1234567891011&post_id='+post_id;
		$.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			//stopLoading();
			console.log(data);
			//$('.tabContent').html(html);
		},
        error:function(){

        }
    });
}

function getClassificationtext()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_app_settings/?key=1234567891011';
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
				var age_classification = data.app_configuration[0].age_classification;
				$.each(age_classification, function (i, value) {
					$('span.'+i).html(value);
				})
			}
			
		},
        error:function(){

        }
    });
		
}

