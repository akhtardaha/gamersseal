// JavaScript Document
$(document).ready(function(){
   var searchTerms = getQueryVariable('searchTerms');
   searchTerms = decodeURI(searchTerms);
   $('a.specification').html('Search Results For ('+searchTerms+')');
   getSearchResult(searchTerms);
})


function getSearchResult(searchTerm)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_search_results/?search='+searchTerm;
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
						html += '<p>Price: $'+value.custom_fields.sales_price[0]+'</p>';
						html += '</div>';
					html += '</a>';
				html += '</li>';
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