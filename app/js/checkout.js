// JavaScript Document
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
						 $.each(games, function(key,value){
							var pPrice = value.price;
							totalCart = parseFloat(totalCart)+parseFloat(pPrice); 
						})
						var gstPercenet = 9;
						var gst = Math.round(totalCart/100 * gstPercenet);
						var shippingCost = 20;
						var OrderTotal = parseFloat(totalCart) + parseFloat(gst) + parseFloat(shippingCost);
						html += '<div class="CartTotal">Cart Total = '+totalCart.toFixed(2)+'$</div>';
						html += '<div class="CartGst">GST '+gstPercenet+'% = '+gst.toFixed(2)+'$</div>';
						html += '<div class="CartShippingcost">Shipping Cost = '+shippingCost.toFixed(2)+'$</div>';
						
						html += '<div class="CartTotal">Order Total = '+OrderTotal.toFixed(2)+'$</div>';
						
						$('.calculation').html(html);
                	}
				}
                ,function(err){
                    console.log('There is some error while getting Total from Cart');

                });

        },
        function(err){
            console.log('Error: '+err.message);
             console.log('Error: There is some error while getting Total Cart please try again.');
        },
        function(){
            console.log('Success: Cart Total fetch successfully');
        }
        );
}