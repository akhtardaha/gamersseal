// JavaScript Document
 var cartProducts = {};

$(document).ready(function(){
	if(window.localStorage.getItem("loginuserCookie"))
	{
		getCartTotal();
		getUserTransactionsPerDay();
		getUserPurchasePerDay();		
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
						var totalShippingCost = 0;
						var pSeller_id = '';
						var total_games = result.rows.length;
						
						html += '<table>';
						html += '<thead><tr><th>Game ID</th><th>Game</th><th>Shipping Cost</th><th>Price</th></tr></thead>';
						for(var i=0; i<total_games; i++)
							{
								var cartProduct = {};
								var pPrice = result.rows.item(i).price;
								totalCart = parseFloat(totalCart)+parseFloat(pPrice);
								html += '<tr><td>'+result.rows.item(i).pid+'</td><td>'+result.rows.item(i).pname+'</td><td>'+result.rows.item(i).shippingcost+'</td><td>'+result.rows.item(i).price+'</td></tr>';
								cartProduct.product_id = result.rows.item(i).pid;
								cartProduct.product_name = result.rows.item(i).pname;
								cartProduct.product_price = result.rows.item(i).price;
								cartProduct.seller_id = result.rows.item(i).seller;
								cartProduct.shippingcost = result.rows.item(i).shippingcost
								cartProduct.product_qty = 1;
								cartProducts[i] = cartProduct;
								
								var pShippingcost = result.rows.item(i).shippingcost;
								pSeller_id = result.rows.item(i).seller;
								totalShippingCost = parseFloat(totalShippingCost)+parseFloat(pShippingcost); 

							}
						html += '</table>';
						var gstPercenet = window.localStorage.getItem("gst");
						var gamerseal_charges = window.localStorage.getItem("gamerseal_charges");
						var gst = Math.round(totalCart/100 * gstPercenet);
						gamerseal_charges_amount = Math.round(totalCart/100 * gamerseal_charges);
						var OrderTotal = parseFloat(totalCart) + parseFloat(totalShippingCost) + parseFloat(gamerseal_charges_amount);
						html +='<div class="CartTotalBox">';
						html += '<div class="CartTotal"><span>Total Itemized Bill </span> $'+totalCart.toFixed(2)+'</div>';
						html += '<div class="CartGst">GST '+gstPercenet+'% included in price</div>';
						
						html += '<div class="CartGst">Gamer Seal Charges '+gamerseal_charges+'% = $'+gamerseal_charges_amount.toFixed(2)+'</div>';
						
						if(totalShippingCost != 0)
						{
						html += '<div class="CartShippingcost"><span>Shipping Cost </span> $'+totalShippingCost.toFixed(2)+'</div>';
						}
						
						html += '<div class="CartTotal"><span>Order Total </span> $'+OrderTotal.toFixed(2)+'</div>';
						html += '</div>';
						
						$('#gamerseal_charges').val(gamerseal_charges);
						$('#gamerseal_charges_amount').val(gamerseal_charges_amount);
						$('#gstpercent').val(gstPercenet);
						$('#gstpercent').val(gstPercenet);
						$('#gst').val(gst.toFixed(2));
						$('#cartTotal').val(totalCart.toFixed(2));
						$('#shippingCost').val(totalShippingCost.toFixed(2));
						$('#orderTotal').val(OrderTotal.toFixed(2));
						$('#sellerID').val(pSeller_id);
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



function CheckUserPurchaseAmountPerDay()
	{
		startButtonLoading('Orderbtn');
		var cartTotal = $('#cartTotal').val();
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_user_purchase_today/?key=1234567891011&user_id='+user_id+' ';
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
			var purchaseStatus = data.purchase;
			var user_role = window.localStorage.getItem("loginuserRole");
			var guest_daily_purchase = window.localStorage.getItem("guest_daily_purchase");
			var premium_daily_purchase = window.localStorage.getItem("premium_daily_purchase");
			var standard_daily_purchase = window.localStorage.getItem("standard_daily_purchase");
			
			purchaseStatus = parseInt(cartTotal) + parseInt(purchaseStatus);
			console.log(purchaseStatus+" "+user_role+" "+guest_daily_purchase+" "+standard_daily_purchase+" "+premium_daily_purchase);
			if(data.status == 'ok')
			{
				if(user_role == 'preminum')
				{
					if(premium_daily_purchase == 'unlimited')
					{
						placeOrder();
					}
					else
					{
						if(purchaseStatus >= premium_daily_purchase)
						{
							console.log("You can not Buy Games more then "+premium_daily_purchase+" amount per day!");
							navigator.notification.alert(
							"You can not Buy Games more then "+premium_daily_purchase+" amount per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Purchase',            // title
							'OK'                  // buttonName
						);	
							
						}
						else
						{
							placeOrder();
						}
					}
					
				}
				if(user_role == 'standard')
				{
					if(purchaseStatus >= standard_daily_purchase)	
					{
						console.log("You can not Buy Games more then "+standard_daily_purchase+" amount per day!");
						navigator.notification.alert(
							"You can not Buy Games more then "+standard_daily_purchase+" amount per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Purchase',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						placeOrder();
					}
				}
				if(user_role == 'guest')
				{
					if(purchaseStatus >= guest_daily_purchase)	
					{
						console.log("You can not Buy Games more then "+guest_daily_purchase+" amount per day!");
						navigator.notification.alert(
							"You can not Buy Games more then "+guest_daily_purchase+" amount per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Purchase',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						placeOrder();
					}
				}
			}
			
		},
        error:function(){

        }
    });
		
}


function placeOrder()
	{
		
		var user_id = window.localStorage.getItem("loginuserID");
		console.log(cartProducts);
		var shippingAddress = {};
		
		var gstpercent = $('#gstpercent').val();
		var gst = $('#gst').val();
		var cartTotal = $('#cartTotal').val();
		var shippingCost = $('#shippingCost').val();
		var orderTotal = $('#orderTotal').val();
		var sellerID = $('#sellerID').val();
		
		var shipfname = $('#shipfname').val();
		var shiplname = $('#shiplname').val();
		var shipcompany = $('#shipcompany').val();
		var shipaddress = $('#shipaddress').val();
		var shipcity = $('#shipcity').val();
		var shipzip = $('#shipzip').val();
		var shipcountry = $('#shipcountry').val();
		var shipstate = $('#shipstate').val();
		var shipemail = $('#shipemail').val();
		var shipphone = $('#shipphone').val();
		
		var gamerseal_charges = $('#gamerseal_charges').val();
		var gamerseal_charges_amount = $('#gamerseal_charges_amount').val();
		
		
		if(shipfname == '')
		{
			$('#shipfname').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipfname').css('border','1px solid #cccccc');
		}
		
		if(shiplname == '')
		{
			$('#shiplname').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shiplname').css('border','1px solid #cccccc');
		}
		
		if(shipaddress == '')
		{
			$('#shipaddress').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipaddress').css('border','1px solid #cccccc');
		}
		
		if(shipcity == '')
		{
			$('#shipcity').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipcity').css('border','1px solid #cccccc');
		}
		
		if(shipzip == '')
		{
			$('#shipzip').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipzip').css('border','1px solid #cccccc');
		}
		
		if(shipcountry == '')
		{
			$('#shipcountry').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipcountry').css('border','1px solid #cccccc');
		}
		
		if(shipstate == '')
		{
			$('#shipstate').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipstate').css('border','1px solid #cccccc');
		}
		if(shipemail == '')
		{
			$('#shipemail').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipemail').css('border','1px solid #cccccc');
		}
		if(shipphone == '')
		{
			$('#shipphone').css('border','1px solid #ef4c4d');
		}
		else
		{
			$('#shipphone').css('border','1px solid #cccccc');
		}
		
		
		
		
		
		
		
		if(shipfname != '' && shiplname != '' && shipaddress != '' && shipcity != '' && shipzip != '' && shipemail != '' && shipphone != '')
		{
		if(validateEmail(shipemail))
		{
		shipaddress = shipaddress.replace("#", " no "); 
		shippingAddress.first_name = shipfname;
		shippingAddress.last_name = shiplname;
		shippingAddress.company = shipcompany;
		shippingAddress.address_1 = shipaddress;
		shippingAddress.city = shipcity;
		shippingAddress.postcode = shipzip;
		shippingAddress.country = shipcountry;
		shippingAddress.state = shipstate;
		shippingAddress.email = shipemail;
		shippingAddress.phone = shipphone;
		
		
		
		
		var url = API_URL+'order_items/?key=1234567891011&user_id='+user_id+'&orderData='+JSON.stringify(cartProducts)+'&shippingData='+JSON.stringify(shippingAddress)+'&gstpercentage='+gstpercent+'&gst='+gst+'&cartTotal='+cartTotal+'&shippingCost='+shippingCost+'&gamerseal_charges_amount='+gamerseal_charges_amount+'&gamerseal_charges='+gamerseal_charges+'&orderTotal='+orderTotal+'&sellerID='+sellerID+'';
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
			endButtonLoading('Orderbtn');
			stopLoading();
			console.log(data);
			if(data.status == 'ok')
			{
				//deleteProductsCart();
				console.log(data);
				var orderID = data.OrderID;
				window.localStorage.setItem("OrderID",orderID);
				window.localStorage.setItem("OrderTotal",orderTotal);
				console.log(window.localStorage.getItem("OrderID"));
				console.log("Thankyou for your Order, Please make Payment to Complete this Order!");
				navigator.notification.alert(
							"Thankyou for your Order, Please make Payment to Complete this Order!",  // message
							function(){setTimeout(function(){ window.location = 'payment.html?order_id='+orderID; },200)},        // callback
						   'Checkout',            // title
							'OK'                  // buttonName
				);	
				
			}
			else
			{
			}
		},
        error:function(){

        }
    });
		}
		else
			{
				endButtonLoading('Orderbtn');
						console.log("Please enter valid Email Address");
						$('#shipemail').css('border','1px solid #ef4c4d');
						navigator.notification.alert(
						"Please enter valid Email Address",  // message
						function(){
								setTimeout(function() {}, 200);
						},         // callback
						'Checkout', // title
						'Ok'      // buttonName
						);	
						return false;
			}
			
	}
	else
	{
		endButtonLoading('Orderbtn');
	}		
}

function deleteProductsCart()
{
	                db.transaction(
                    function(tx)
                    {
                        tx.executeSql('DELETE * FROM localcart');

                    },
                    function(err){

                        console.log('There is some error while Deleting Game From Cart.');
                    },
                    function(){                       
                        console.log('Success: Products Deleted from Cart');
                    }
                    );
}