// JavaScript Document
 var cartProducts = {};

$(document).ready(function(){
	if(window.localStorage.getItem("loginuserCookie"))
	{
		getCartTotal();			
	}
	else
	{
		setTimeout(function(){window.location = 'login.html';},200);
		
	}
})

function getCartTotal()
{
	var html = '';
    db.transaction(
        function(tx)
        {
            tx.executeSql('SELECT * FROM localcart', [],
                function(tx,result)
                {
                   console.log(result.rows.length);
                    if(result.rows.length>0)
                    {
                        var games = result.rows;
						var totalCart = 0;
						var total_games = result.rows.length;
						
						html += '<table>';
						html += '<thead><tr><th>Game ID</th><th>Game</th><th>Quantity</th><th>Price</th></tr></thead>';
						for(var i=0; i<total_games; i++)
							{
								var cartProduct = {};
								var pPrice = result.rows.item(i).price;
								totalCart = parseFloat(totalCart)+parseFloat(pPrice);
								html += '<tr><td>'+result.rows.item(i).pid+'</td><td>'+result.rows.item(i).pname+'</td><td>1</td><td>'+result.rows.item(i).price+'</td></tr>';
								cartProduct.product_id = result.rows.item(i).pid;
								cartProduct.product_name = result.rows.item(i).pname;
								cartProduct.product_price = result.rows.item(i).price;
								cartProduct.product_qty = 1;
								cartProducts[i] = cartProduct;
							}
						html += '</table>';
						var gstPercenet = window.localStorage.getItem("gst");
						var gst = Math.round(totalCart/100 * gstPercenet);
						var shippingCost = 20;
						var OrderTotal = parseFloat(totalCart) + parseFloat(gst) + parseFloat(shippingCost);
						html += '<div class="CartTotal">Cart Total = '+totalCart.toFixed(2)+'$</div>';
						html += '<div class="CartGst">GST '+gstPercenet+'% = '+gst.toFixed(2)+'$</div>';
						html += '<div class="CartShippingcost">Shipping Cost = '+shippingCost.toFixed(2)+'$</div>';
						
						html += '<div class="CartTotal">Order Total = '+OrderTotal.toFixed(2)+'$</div>';
						$('#gstpercent').val(gstPercenet);
						$('#gst').val(gst.toFixed(2));
						$('#cartTotal').val(totalCart.toFixed(2));
						$('#shippingCost').val(shippingCost.toFixed(2));
						$('#orderTotal').val(OrderTotal.toFixed(2));
						$('.calculation').html(html);
                	}
				}
                ,function(err){
                    console.log('There is some error while getting Total from Cart');

                });

        },
        function(err){
            console.log('Error: '+err);
             console.log('Error: There is some error while getting Total Cart please try again.');
        },
        function(){
            console.log('Success: Cart Total fetch successfully');
        }
        );
}


function placeOrder()
	{
		
		var user_id = window.localStorage.getItem("loginuserID");
		
		console.log(cartProducts);
		var url = API_URL+'order_items/?key=1234567891011&orderData='+JSON.stringify(cartProducts);
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
			}
			else
			{
			}
		},
        error:function(){

        }
    });
		
}