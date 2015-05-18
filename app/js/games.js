// JavaScript Document
$(document).ready(function(){
getPosts('wpmarketplace');
})

function getPosts(type)
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_posts/?post_type='+type;
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
					html += '<p>There is no Game available Yet</p>';	
				}
				else
				{
					$.each(posts, function (i, value) {
						if(counter == totalPosts){ var last = 'last'} else {var last ='';}
						html += '<li class="item '+last+'"><a href="single.html?post_id='+value.id+'">';
						html += '<img src="'+GAME_IMAGES_PATH+value.custom_fields.images[0]+'">';
						html += '<h2>'+value.title+'</h2>';
						html += '<p>'+value.excerpt+'</p>';
						//console.log(decodeURIComponent( $.param(value.custom_fields.images[0]) ));
						console.log(value.custom_fields.images[0]);
						html += '<p>Price: '+value.custom_fields.sales_price[0]+'</p>';
						html += '</a></li>';
						counter++;
					})
				}
				
				//html += '</ul>';
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

