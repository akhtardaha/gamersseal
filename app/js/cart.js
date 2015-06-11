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
            tx.executeSql('SELECT * FROM localcart', [],
                function(tx,result)
                {
                    //alert(result.rows.length);
                    if(result.rows.length>0)
                    {
                        var games = result.rows;
						 $.each(games, function(key,value){
							console.log(value);
							html += '<li>';
								html += '<a href="single.html?post_id='+value.pid+'">';
									html += '<div class="Pimg"><img id="img'+value.pid+'" src="img/loadingSmall.gif" class="product-thumb"></div>';
									html += '<div class="product-list-right">';
									html += '<h5>'+value.pname+'</h5>';
									html += '<p>Price: '+value.price+'$</p>';
									html += '</div>';
								html += '</a>';
								html +='<button id="removeProduct" class="btn-remove search not-srch btn" onclick="return deleteProductfromCart('+value.pid+');">Remove</button>';
							html += '</li>';
							getPostPic(value.pid);
						})
						$('ul.products-list').html(html);
                    }
                    else
                    {
                        $('ul.products-list').html("<li>Shoping Cart Empty</li>");
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