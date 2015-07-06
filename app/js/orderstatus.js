// JavaScript Document

$(document).ready(function(){
	getBuyerOrders();
})

function getBuyerOrders()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_buyer_orders/?key=1234567891011&user_id='+user_id+' ';
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
			var orders = data.orders;
			if(data.status == 'ok')
			{
				if(data.count == 1)
				{
				$.each(orders, function (i, value) {
				
				html += '<li>';
                html += '<a href="orderconfirm.html?order_id='+value.order_id+'">';
                    html += '<div class="product-list-right">';
                    html += '<h5>Order # '+value.order_id+'</h5>';
                    html += '<p>Order date: '+value.date+'</p>';
                    html += '<p>Expected Date of Delivery: '+value.delievery_time+'</p>';
                    html += '<p>Totla Bill: '+value.total+'$</p>';
					html += '<p>Shipping Status: '+value.shipping_status+'</p>';
                    html += '</div>';
                html += '</a>';
            	html += '</li>';
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