// JavaScript Document
$(document).ready(function(){
	getNews();
});

function getNews()
	{
		var type = 'news';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_posts/?post_type='+type;
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
			if(data.status == 'ok')
			{
				//html += '<ul data-role="listview" data-inset="true" data-filter="true" data-split-icon="gear" data-split-theme="c">'; 
				var posts = data.posts;
				var author = data.author;
				var totalPosts = data.count;
				var counter = 1;
				if(totalPosts == 0)
				{
					html += '<p>There is no News Yet</p>';	
				}
				else
				{
					$.each(posts, function (i, value) {
						html += '<div class="accordion_in">';
							html += '<div class="acc_head"><img src="'+value.thumbnail+'" alt="'+value.title+'" class="product-thumb" /><h5>'+value.title+'</h5></div>';
							html += '<div class="acc_content">';
								html += value.content;
							html += '</div>';
						html += '</div>';		
					})
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			$('.news-list').html(html);
			$(".accordion").smk_Accordion({
				closeAble: true, //boolean
			});

		},
        error:function(){

        }
    });
		
}