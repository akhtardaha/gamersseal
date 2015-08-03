$(document).ready(function(){
	var order_id = getQueryVariable('order_id');
	getBuyerOrder(order_id);
})

function getBuyerOrder(order_id)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_buyer_order_by_orderid/?key=1234567891011&user_id='+user_id+'&order_id='+order_id+' ';
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
			var orders = data.order;
			if(data.status == 'ok')
			{
				if(data.count == 1)
				{
				$.each(orders, function (i, value) {
				
				html += '<li>';
                //html += '<a href="shippingstatusedit.html?order_id='+value.order_id+'">';
                    html += '<div style="width:100%;float:left;" class="confirm-odr">';
                    html += '<h4><span class="col-odr">Order #</span><span class="odr-val">'+value.order_id+'</span></h4>';
                    html += '<p><span class="col-odr">Order Date:</span><span class="odr-val">'+value.date+'</span></p>';
                    html += '<p><span class="col-odr">Delivery Date:</span><span class="odr-val">'+value.delievery_time+'</span></p>';
                    html += '<p><span class="col-odr">Totla Bill:</span><span class="odr-val">'+value.total+'$</span></p>';
                    html += '<p><span class="col-odr">Address:</span><span class="odr-val">'+value.billing_shipping_data.billing.address_1+' '+value.billing_shipping_data.billing.city+' '+value.billing_shipping_data.billing.country+'</span></p>';
                    html += '<p><span class="col-odr">Mobile #:</span><span class="odr-val">'+value.billing_shipping_data.billing.phone+'</span></p>';
					html += '<p><span class="col-odr">Shipping Status:</span><span class="odr-val">'+value.shipping_status+'</span></p>';
					html += '<h4>Order item(s)</h4>';
					var counter = 1;
					var cart_data = value.cart_data;
					var total = value.items.length;
					console.log(total);
					$.each(cart_data, function (index, val) {
						console.log(val);
						if(counter == total)
						{
							var cls= 'last';
						}
						else
						{
							var cls = '';
						}
						html += '<a class="'+cls+'" style="width:100%;float:left; display:block; margin:3px 0px; border-bottom:1px solid #ccc;padding: 5px 0px;" href="single.html?post_id='+val.ID+'">';
							html += '<img style="max-width: 50px;min-width: 50px;" id="img'+val.ID+'" src="img/loadingSmall.gif" alt="ninja" class="product-thumb"/>';
							html += '<div class="product-list-right">';
							html += '<h5>'+val.post_title+'</h5>';
							html += '<span class="price">Price: '+val.price+'</span>';
							html += '<span class="price">Quantity: '+val.quantity+'</span>';
							html += '</div>';
						html += '</a>';
						getPostPic(val.ID);	
						counter ++;
					})
                    html += '</div>';
                //html += '</a>';
            	html += '</li>';
				//$('#buyer_id').val(value.uid);
				})
				}
				else
				{
					html += '<li><p class="notice">Orders List Empty.</p></li>';
				}
			}
			
			$('.tabContent').html(html);
			
		},
        error:function(){

        }
    });

		
}

function updateOrder(ref)
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var OrderID = window.localStorage.getItem("OrderID");
		var url = API_URL+'update_order_payment/?key=1234567891011&user_id='+user_id+'&order_id='+OrderID+'&payment_reference='+ref;
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
			console.log(data);
			if(data.status == 'ok')
			{
				console.log("Thankyou, Your payment is Successfull!");
				navigator.notification.alert(
							"Thankyou for your Payment, Your Order is Completed now, we are working on it!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Order Complete',            // title
							'OK'                  // buttonName
				);	
			}
			
		},
        error:function(){}
    });
		
}

function getPostPic(post_id)
	{
		var url = API_URL_DEFAULT+'get_post/?id='+post_id+'&post_type=wpmarketplace';
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
			console.log(data);
			if(data.status == 'ok')
			{
				console.log(data);
				var post = data.post;
				var author = data.post.author;
				var totalPosts = data.count;
				if(data.post.custom_fields.images)
				{
					var imgPath = GAME_IMAGES_PATH+data.post.custom_fields.images[0];
					$('#img'+post_id).prop('src',imgPath);
				}
				else
				{
					$('#img'+post_id).prop('src','img/gamesdefault.png');
					
				} 
			}
			
		},
        error:function(){}
    });
		
}
