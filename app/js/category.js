// JavaScript Document

$(document).ready(function(){
	var term_id = getQueryVariable('term_id');
	var slug = getQueryVariable('slug');
	$('#categoryTitle').html(slug);
	getCategoryProducts(term_id);
})

function getProductCategories()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_products_categories/?key=1234567891011';
		var html = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			console.log(data);
			if(data.status == 'ok')
			{
				$.each(data.data, function (i, value) {
        			html += '<a href="categories.html?term_id='+value.term_id+'&term_taxonomy_id='+value.term_taxonomy_id+'&slug='+value.slug+'">'+value.name+'</a>';
				})
			}
			$('.categoury-box').html(html);
			
		},
        error:function(){

        }
    });
		
}
function getCategoryProducts(term_id)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_category_products/?key=1234567891011&term_id='+term_id+' ';
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
			var products = data.products;
			if(data.status == 'ok')
			{
				$.each(products, function (i, value) {
				html += '<li>';
					html += '<a href="single.html?post_id='+value.ID+'">';
					if(value.custom_fields.images)
					{
						html += '<img src="'+GAME_IMAGES_PATH+value.custom_fields.images[0]+'" class="product-thumb">';
					}
					else
					{
						html += '<img src="img/gamesdefault.png" class="product-thumb">';
					}
						html += '<div class="product-list-right">';
						html += '<h5>'+value.post_title+'</h5>';
						var excerpt = value.post_content;
						html += '<p>'+excerpt.substr(0, 100)+'</p>';
						html += '<p>Price: $'+value.custom_fields.sales_price[0]+'</p>';
						html += '</div>';
					html += '</a>';
				html += '</li>';
				})
			}
			$('.tabContent').html(html);
			
		},
        error:function(){

        }
    });
		
}
