// JavaScript Document
$(document).ready(function(){
   var searchTerms = getQueryVariable('searchTerms');
   searchTerms = decodeURI(searchTerms);
   $('a.searchtitle').html('Search Results For ('+searchTerms+')');
   getSearchResult(searchTerms);
})


function getSearchResult(searchTerm)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_search_results/?search='+searchTerm+'&post_type='+type;
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
			var products = data.posts;
			var count = data.count;
			if(data.status == 'ok')
			{
				if(count == 0)
				{
					//console.log(data.status);
					html += '<li><p class="notice">No Game found, Please try with another Search!</p></li>';
				}
				else
				{
				$.each(products, function (i, value) {
				html += '<li>';
					html += '<a href="single.html?post_id='+value.id+'">';
					if(value.custom_fields.images)
					{
						html += '<img src="'+GAME_IMAGES_PATH+value.custom_fields.images[0]+'" class="product-thumb">';
					}
					else
					{
						html += '<img src="img/gamesdefault.png" class="product-thumb">';
					}
						html += '<div class="product-list-right">';
						html += '<h5>'+value.title+'</h5>';
						var excerpt = value.content;
						html += '<p>'+excerpt.substr(0, 100)+'</p>';
						html += '<div class="price">Price: $'+value.custom_fields.sales_price[0]+'</div>';
						if(value.custom_fields.delivery_time)
								{
								html += '<div class="price">Delivery Time: '+value.custom_fields.delivery_time[0]+' days</div>';
								}
								html += '<div class="seller_name">Seller : '+value.author.name+'</div>';
						html += '</div>';
					html += '</a>';
					html += '<a class="fvt-str product'+value.id+'" href="javascript:void(0);" onclick="return additemtoFavorite(\''+value.id+'\');">&nbsp;</a>';
				html += '</li>';
				checkfavorite(value.id);
				})
				}
				
			}
			else
			{
				console.log(data.status);
				html += '<li><p class="notice">No Game found, Please try with another Search!</p></li>';
				
			}
			$('.tabContent').html(html);
			
			
		},
        error:function(){

        }
    });
		
}