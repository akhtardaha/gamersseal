// JavaScript Document

$(document).ready(function(){
	var term_id = getQueryVariable('term_id');
	var slug = getQueryVariable('slug');
	$('#categoryTitle').html(slug);
	getUserProducts();
})


function getUserProducts()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_author_posts/?id='+user_id+'&post_type='+type;
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
				//html += '<ul data-role="listview" data-inset="true" data-filter="true" data-split-icon="gear" data-split-theme="c">'; 
				var posts = data.posts;
				var author = data.author;
				var totalPosts = data.count;
				var counter = 1;
				if(totalPosts == 0)
				{
					html += '<p style="padding:10px;text-transform: inherit;">You did not posted any Game for Sale.</p>';	
				}
				else
				{
					$.each(posts, function (i, value) {
						if(counter == totalPosts){ var last = 'last'} else {var last ='';}
						html += '<li class="'+last+'"><a href="editgame.html?post_id='+value.id+'">';
						if(value.custom_fields.images)
						{
						html += '<img src="'+GAME_IMAGES_PATH+value.custom_fields.images[0]+'" alt="ninja" class="product-thumb"/>';
						}
						else
						{
						html += '<img src="img/gamesdefault.png" alt="ninja" class="product-thumb"/>';	
						}
						html += '<div class="product-list-right">';
						html += '<h5>'+value.title+'</h5>';
						var excerpt = value.excerpt;
						html += '<p>'+excerpt.substr(0, 100)+'</p>';
						//console.log(value.custom_fields.images[0]);
						html += '<span class="price">Price: '+value.custom_fields.sales_price[0]+'</span>';
						html += '</div></a></li>';
						counter++;
					})
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			$('.tabContent').html(html);
			
		},
        error:function(){

        }
    });
		
}