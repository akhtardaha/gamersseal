// JavaScript Document
$(document).ready(function(){
	if(window.localStorage.getItem("loginuserCookie"))
	{
		getProductsFromCart();			
	}
	else
	{
		setTimeout(function(){window.location = 'login.html';},200);
		
	}
})
function getProductsFromCart()
{
    console.log('Fetch products from Cart');
	var html = '';
    //alert(data);
    db.transaction(
        function(tx)
        {
			tx.executeSql('CREATE TABLE IF NOT EXISTS localcart (pid TEXT,pname TEXT,price TEXT,seller TEXT,shippingcost TEXT)');
            tx.executeSql('SELECT * FROM localcart', [],
                function(tx,result)
                {
                    //alert(result.rows.length);
                    if(result.rows.length>0)
                    {
                        var games = result.rows;
						var total_games = result.rows.length;
						console.log(total_games);
							for(var i=0; i<total_games; i++)
							{
								//console.log(result.rows.item(i).prodid);
								var pid = result.rows.item(i).pid;
								var pname = result.rows.item(i).pname;
								var price = result.rows.item(i).price;
								var seller_id = result.rows.item(i).seller;
								var pShippingcost = result.rows.item(i).shippingcost;
								if(pShippingcost == 0)
								{
									pShippingcost = 'free';
								}
								else
								{
									pShippingcost = '$'+pShippingcost;
								}
								html += '<li>';
								html += '<a href="single.html?post_id='+pid+'">';
									html += '<div class="Pimg"><img id="img'+pid+'" src="img/loadingSmall.gif" class="product-thumb"></div>';
									html += '<div class="product-list-right">';
									html += '<h5>'+pname+'</h5>';
									html += '<p>Price: $'+price+'</p>';
									html += '<p>Item Shipping Cost: '+pShippingcost+'</p>';
									html += '</div>';
								html += '</a>';
								html +='<button id="removeProduct" class="btn-remove search not-srch btn" onclick="return deleteProductfromCart('+pid+');">Remove</button>';
							html += '</li>';
							getPostPic(pid);
							}
						$('ul.products-list').html(html);
						getCartTotal();
                    }
                    else
                    {
                        $('ul.products-list').html("<li class='notice'>Shoping Cart Empty</li>");
						$('.checkoutBtn').hide();
                    }
                }
                ,function(err){
                    console.log('There is some error while getting products from Cart');

                });

        },
        function(err){
            console.log('Error: '+err);
             console.log('Error: There is some error while getting products please try again.');
        },
        function(){
            console.log('Success: Products fetch successfully');
        }
        );



}
function getCartTotal()
{
	var html = '';
    db.transaction(
        function(tx)
        {
			tx.executeSql('CREATE TABLE IF NOT EXISTS localcart (pid TEXT,pname TEXT,price TEXT,seller TEXT,shippingcost TEXT)');
            tx.executeSql('SELECT * FROM localcart', [],
                function(tx,result)
                {
                   console.log(result.rows.length);
                    if(result.rows.length>0)
                    {
                        var games = result.rows;
						var totalCart = 0;
						var totalShippingCost = 0;
						var total_games = result.rows.length;
						
						
						for(var i=0; i<total_games; i++)
							{
								var pPrice = result.rows.item(i).price;
								var pShippingcost = result.rows.item(i).shippingcost;
								totalShippingCost = parseFloat(totalShippingCost)+parseFloat(pShippingcost); 
								totalCart = parseFloat(totalCart)+parseFloat(pPrice); 
								
							}
						var gstPercenet = window.localStorage.getItem("gst");
						var gst = Math.round(totalCart/100 * gstPercenet);
						var OrderTotal = parseFloat(totalCart) + parseFloat(totalShippingCost);
						html += '<div class="CartTotalBox">';
						html += '<div class="CartTotal">Cart Total = $'+totalCart.toFixed(2)+'</div>';
						html += '<div class="CartGst">GST '+gstPercenet+'% included in price</div>';
						if(totalShippingCost != 0)
						{
						html += '<div class="CartShippingcost">Shipping Cost = $'+totalShippingCost.toFixed(2)+'</div>';
						}
						html += '<div class="CartTotal">Order Total = $'+OrderTotal.toFixed(2)+'</div>';
						html +='</div>';

						
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