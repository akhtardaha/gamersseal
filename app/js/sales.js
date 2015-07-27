// JavaScript Document
if(window.localStorage.getItem("loginuserCookie") == '')
{
	setTimeout(function(){ window.location = 'index.html'; }, 500);
}
$(document).ready(function(){
	getUserSales(1);
})
function getUserSales(noloading)
{
	if(noloading != 1)
	{
		startButtonLoading('userSalesbtn');
	}
	var html = '';
	var total_sales = 0;
	var cooke = window.localStorage.getItem("loginuserCookie");
	var user_id = window.localStorage.getItem("loginuserID");
	var start_date = $('#from').val();
	var to_date = $('#to').val();
	
	var url = API_URL+'get_user_sales/?key=1234567891011&user_id='+user_id+'&start_date='+start_date+'&end_date='+to_date+' ';
	console.log(url);
	$.ajax({
        url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			endButtonLoading('userSalesbtn');
			$('.loginBtn').removeClass('loadingSmall');
			console.log(data);
			if(data.status == 'ok')
			{
				var count = data.count;
				if(count == 1)
				{
					var sales = data.sales;
					$.each(sales, function (i, value) {
					html += '<li>';
						html += '<a href="single.html?post_id='+value.pid+'">';
							html += '<div class="Pimg"><img id="img'+i+value.pid+'" src="img/loadingSmall.gif" class="product-thumb"></div>';
							html += '<div class="product-list-right">';
							html += '<h5 id="pname'+i+value.pid+'"></h5>';
							html += '<p>Order ID :'+value.oid+'</p>';
							html += '<p id="buyer'+i+value.pid+'"></p>';
							html += '<p>Order Date :'+value.date+'</p>';
							html += '<p>Price : $'+value.price+'</p>';
							html += '<p>Quantity :'+value.quantity+'</p>';
							html += '</div>';
						html += '</a>';
					html += '</li>';
					getPostPic(i,value.pid);
					total_sales = total_sales + parseInt(value.price) ; 
					})	
				}
				else
				{
					html = '<li class="notice">No Sales Found...</li>';
				}
				
				//html += '<div class="Pimg"><img id="img'+pid+'" src="img/loadingSmall.gif" class="product-thumb"></div>';
				total_sales = '<a href="#" class="specification">Total Sales = $'+total_sales.toFixed(2)+' </a>';
				$('.totalSales').html(total_sales);
				$('.products-list').html(html);
			}
			
		},
        error:function(){
			
        }
    });
}

function getPostPic(i,post_id)
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
				//console.log(data);
				var post = data.post;
				var author = data.post.author;
				var totalPosts = data.count;
				
				$('#pname'+i+post_id).html(post.title);
				$('#buyer'+i+post_id).html('Buyer : '+author.nickname);
				if(data.post.custom_fields.images)
				{
					var imgPath = GAME_IMAGES_PATH+data.post.custom_fields.images[0];
					$('#img'+i+post_id).prop('src',imgPath);
				}
				else
				{
					$('#img'+i+post_id).prop('src','img/gamesdefault.png');
					
				} 
			}
			
		},
        error:function(){}
    });
		
}