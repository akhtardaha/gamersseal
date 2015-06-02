// JavaScript Document
$(document).ready(function(){
	getProductCategories();
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
				html += '<option value="" selected="selected">Select Game Type</option>';
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

function addPost()
{
	var gameType = $('#gameType').val();
	var postTitle = $('#title').val();
	var postDetail = $('#content').val();
	var price = $('#price').val();
	var deliveryTime = $('#delivery-time').val();
	var stock = $('#stock').val();
	var shipingCost = $('#shiping-cost').val();
	var minOrder = $('#min-order').val();
	var maxOrder = $('#max-order').val();
	var ageLimit = $('#age-limit').val();
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
	if(publish == 1)
	{
		publish = 'publish';
	}
	else
	{
		publish = 'pending';
	}
	
	
	if(postTitle == '')
	{
		$('#title').css('border','1px solid #ef4c4d');
	}
	else
	{
		$('#title').css('border','1px solid #cccccc');
	}
	if(postDetail == '')
	{
		$('#content').css('border','1px solid #ef4c4d');
	}
	else
	{
		$('#content').css('border','1px solid #cccccc');
	}
	if(price == '')
	{
		$('#price').css('border','1px solid #ef4c4d');
	}
	else
	{
		$('#price').css('border','1px solid #cccccc');
	}
	if(stock == '')
	{
		$('#stock').css('border','1px solid #ef4c4d');
	}
	else
	{
		$('#stock').css('border','1px solid #cccccc');
	}
	
	
	
	
	if(postTitle == '' || postDetail == '' || price == '' || stock == '')
	{
		return false;
	}
	else
	{
		$('#postTitle').css('border','1px solid #cccccc');
		$('#postDetail').css('border','1px solid #cccccc');
		$('#price').css('border','1px solid #cccccc');
		$('#stock').css('border','1px solid #cccccc');
	}

	var cooke = window.localStorage.getItem("loginuserCookie");
	
	var url = API_URL+'add_post/?key=1234567891011&cookie='+cooke+'&type=wpmarketplace&title='+postTitle+'&content='+postDetail+'&manage_stock='+manage_stock+'&stock_qty='+stock+'&sales_price='+price+'&delivery_time='+deliveryTime+'&shiping_cost='+shipingCost+'&min_order='+minOrder+'&max_order='+maxOrder+'&images='+pics+'&age_limit='+ageLimit+'&status='+publish+' ';
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

