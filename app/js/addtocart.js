// JavaScript Document
function addToCart(pid,pname,price){
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
		localCart(pid,pname,price);
	}
}


function localCart(pid,pname,price)
{
	                db.transaction(
                    function(tx)
                    {
                        
                        //tx.executeSql('DROP TABLE IF EXISTS localcart');
                        tx.executeSql('CREATE TABLE IF NOT EXISTS localcart (pid TEXT,pname TEXT,price TEXT)');
                        tx.executeSql('INSERT INTO localcart (pid, pname, price) VALUES ("'+pid+'", "'+pname+'", "'+price+'")');

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