// JavaScript Document

$(document).ready(function(){
	var order_id = getQueryVariable('order_id');
	//getSellerOrders();
	getSellerOrder(order_id);
})

function getSellerOrder(order_id)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_Order_by_orderid/?key=1234567891011&user_id='+user_id+'&order_id='+order_id+' ';
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
                    html += '<div class="product-list-right">';
                    html += '<h5>Order # '+value.order_id+'</h5>';
                    html += '<p>Order date: '+value.date+'</p>';
                    html += '<p>Expected Date of Delivery: '+value.delievery_time+'</p>';
                    html += '<p>Totla Bill: '+value.total+'$</p>';
                    html += '<p>Address: '+value.billing_shipping_data.billing.address_1+' '+value.billing_shipping_data.billing.city+' '+value.billing_shipping_data.billing.country+'</p>';
                    html += '<p>Mobile #: '+value.billing_shipping_data.billing.phone+'</p>';
					html += '<p>Shipping Status: '+value.shipping_status+'</p>';
                    html += '</div>';
                //html += '</a>';
            	html += '</li>';
				$('#buyer_id').val(value.uid);
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


function sendMessagetoCustomer()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var buyer_id = $('#buyer_id').val();
		var title = $('#title').val();
		var message = $('#message').val();
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
	
	title = title.replace("#", " no "); 
	message = message.replace("#", " no ");
	if(message == '' || title == ''){
		return false;}
		var url = API_URL+'send_message_seller/?key=1234567891011&user_id='+user_id+'&seller_id='+buyer_id+'&title='+title+'&message='+message;
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
                    'Sending Message to Customer',            // title
                    'OK'             // buttonName
                );
			}
			else
			{
				console.log(data.msg.status);
				navigator.notification.alert(
                    "Message not Sent",  // message
                    function(){},         // callback
                    'Sending Message to Customer',            // title
                    'OK'                  // buttonName
                );
				//html += '<p>'+data.error+'</p>';
				
			}
			
		},
        error:function(){

        }
    });
}



function updateOrderShippingStatus()
	{
		startButtonLoading('changeShipping');
		var order_id = getQueryVariable('order_id');
		var user_id = window.localStorage.getItem("loginuserID");
		var shipping_status = $('#shippingStatusDrop').val();
		var url = API_URL+'update_order_shipping_status/?key=1234567891011&user_id='+user_id+'&shipping_status='+shipping_status+'&order_id='+order_id;
		console.log(url);
	    $.ajax({
        url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			endButtonLoading('changeShipping');
			//stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
				console.log(data.shipping_status);
				navigator.notification.alert(
                    data.shipping_status,  // message
                    function(){setTimeout(function() {location.reload();}, 200);},    // callback
                    'Shipping Status Changed',            // title
                    'OK'             // buttonName
                );
			}
			else
			{
				console.log(data.shipping_status);
				navigator.notification.alert(
                    data.shipping_status,  // message
                    function(){},         // callback
                    'Change Shipping Status',            // title
                    'OK'                  // buttonName
                );
				//html += '<p>'+data.error+'</p>';
				
			}
			
		},
        error:function(){

        }
    });
}







