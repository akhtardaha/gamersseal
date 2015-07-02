// JavaScript Document
function addToCart(pid,pname,price,seller_id,shippingcost){
	if(!(window.localStorage.getItem("loginuserCookie")))
	{
		console.log("Please Login before Add to Cart!");
			navigator.notification.alert(
						"Please Login before Add to Cart!",  // message
						function(){setTimeout(function(){window.location = 'login.html';},200);},        // callback
					   'Login Required',            // title
						'OK'                  // buttonName
		);
	}
	else
	{
		
		db.transaction(
        function(tx)
        {
			tx.executeSql('CREATE TABLE IF NOT EXISTS localcart (pid TEXT,pname TEXT,price TEXT,seller TEXT,shippingcost TEXT)');
            tx.executeSql('SELECT * FROM localcart', [],
                function(tx,result)
                {
                    //alert(result.rows.length);
					console.log(result.rows);
                    if(result.rows.length > 0)
                    {
						var cart_seller_id = 0;
						var games = result.rows;
						var total_games = result.rows.length;
						console.log(total_games);
							for(var i=0; i<total_games; i++)
							{
								cart_seller_id = result.rows.item(i).seller;
							}
                     		if(cart_seller_id != seller_id)
							{
								console.log('You Can not Add to Cart Games from Different Sellers! Please complete Order first for thoes Games you already added to Cart');
									navigator.notification.alert(
									'You Can not Add to Cart Games from Different Sellers! Please complete Order first for thoes Games you already added to Cart',  // message
									function(){
										setTimeout(function() {
											location.reload();
										}, 200);
									},        // callback
									'Add to Cart',            // title
									'OK'                  // buttonName
								);	
							}
							else
							{
								console.log('No Different Seller Found!');
								localCart(pid,pname,price,seller_id,shippingcost);
							}
                    }
                    else
                    {
						console.log('No Item in Cart so dnt check for Seller ID');
                     	localCart(pid,pname,price,seller_id,shippingcost);
                    }
                }
                ,function(err){
                    console.log('There is some error while getting products from Cart for Seller Check');

                });

        },
        function(err){
            console.log('Error: '+err.message);
             console.log('There is some error while getting products from Cart for Seller Check.');
        },
        function(){
            console.log('Success: Products Seller Checked successfully');
        }
        );
		
	}
}


function localCart(pid,pname,price,seller_id,shippingcost)
{
	                db.transaction(
                    function(tx)
                    {
                        
                        //tx.executeSql('DROP TABLE IF EXISTS localcart');
                        //tx.executeSql('CREATE TABLE IF NOT EXISTS localcart (pid TEXT,pname TEXT,price TEXT,seller TEXT,shippingcost TEXT)');
                        tx.executeSql('INSERT INTO localcart (pid, pname, price, seller, shippingcost) VALUES ("'+pid+'", "'+pname+'", "'+price+'", "'+seller_id+'", "'+shippingcost+'")');

                    },
                    function(err){

                        console.log('There is some error while Adding Game to Cart.');
						navigator.notification.alert(
                        'There is some error while Adding Game to Cart.',  // message
                        function(){},        // callback
                        'Add to Cart Failed',            // title
                        'OK'                  // buttonName
                        );
                    },
                    function(){                       
                        console.log('Success: Product added to Cart');
                        navigator.notification.alert(
                        'Game added to cart successfully',  // message
                        function(){
                            setTimeout(function() {
                                location.reload();
                            }, 200);
                        },        // callback
                        'Add to Cart',            // title
                        'OK'                  // buttonName
                        );
                    }
                    );
}

function deleteProductfromCart(pid)
{
	                db.transaction(
                    function(tx)
                    {
                        tx.executeSql('DELETE FROM localcart WHERE pid = "'+pid+'" ');

                    },
                    function(err){

                        console.log('There is some error while Deleting Game From Cart.');
						navigator.notification.alert(
                        'There is some error while Deleting Game From Cart.',  // message
                        function(){},        // callback
                        'Delete From Cart Failed',            // title
                        'OK'                  // buttonName
                        );
                    },
                    function(){                       
                        console.log('Success: Product Deleted from Cart');
                        navigator.notification.alert(
                        'Game Deleted from cart successfully',  // message
                        function(){
                            setTimeout(function() {
                                location.reload();
                            }, 200);
                        },        // callback
                        'Delete From Cart',            // title
                        'OK'                  // buttonName
                        );
                    }
                    );
}

function checkProductsFromCart(pid)
{
    console.log('checking product from Cart');
    //alert(data);
    db.transaction(
        function(tx)
        {
            tx.executeSql('SELECT * FROM localcart where pid= "'+pid+'" ', [],
                function(tx,result)
                {
                    //alert(result.rows.length);
					console.log(result.rows);
                    if(result.rows.length > 0)
                    {
                     $('#addToCartbtn').html("Already Added to Cart");
					 $('#addToCartbtn').removeAttr("onclick");
                    }
                    else
                    {
                     //$('#addToCartbtn').html("Already Added to Cart");
                    }
                }
                ,function(err){
                    console.log('There is some error while getting products from Cart');

                });

        },
        function(err){
            console.log('Error: '+err.message);
             console.log('Error: There is some error while getting products please try again.');
        },
        function(){
            console.log('Success: Products fetch successfully');
        }
        );



}