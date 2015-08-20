// JavaScript Document
$(document).ready(function(){
	if(window.localStorage.getItem("loginuserCookie"))
	{			
		$('.loginMenu').hide();
		$('.registerMenu').hide();
		$('.logoutMenu').show();
		$('.profileMenu').addClass('ui-corner-top');
	}
	else
	{
		$('.loginMenu').show();
		$('.registerMenu').show();
		$('.gameMenu').addClass('ui-corner-bottom');
		
	}
  getPopularPosts();
  var recent_viewed_games = window.localStorage.getItem("RecentViewed");
  if(recent_viewed_games)
  {
	  getRecentPosts();
  }
  else
  {
	  var html = '<p style="padding:5px;">Recent viewed Games list empty</p>';
	  $('#tabs-1').html(html);
  }
	
  $( ".home-tabs ul li>div" ).click(function() {
    	$( ".home-tabs > div" ).css('display','none');
		 $( '.home-tabs ul li').removeClass('tab-open');
		 $( this ).parent('li').addClass('tab-open');
		//var tab = $(this).attr( "href" );
		var tab = $(this).attr( "data-tab" );
		$( tab ).css('display','block');
   });
   
   $('#searchTerms').keyup(function(e){
    if(e.keyCode == 13)
    {
		console.log("ENTER PRESSED");
		var searchTerms = $('#searchTerms').val();
		if(searchTerms)
		{
			window.location = 'search.html?searchTerms='+encodeURI(searchTerms);
		}
	}
	});


   getProductCategories();
   	getProductsList();
	getPosts();
	getSearchProduct('moha');
	getCategoryProducts(3);
})


function getPosts()
	{
		var type = 'wpmarketplace';
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
					html += '<ul  class="products-list">';
					$.each(posts, function (i, value) {
						if(value.custom_fields.visible)
						{
							if(value.custom_fields.visible[0] != 0)
							{
								if(counter == totalPosts){ var last = 'last'} else {var last ='';}
								html += '<li class="'+last+'"><a href="single.html?post_id='+value.id+'">';
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
								html += '<span class="price">Price: $'+value.custom_fields.sales_price[0]+'</span>';
								if(value.custom_fields.delivery_time)
								{
								html += '<span class="price">Delivery Time: '+value.custom_fields.delivery_time[0]+' days</span>';
								}
								html += '<span class="seller_name">Seller : '+value.author.name+'</span>';
								html += '</div></a></li>';
								counter++;
							}
						}
						else
						{
							if(counter == totalPosts){ var last = 'last'} else {var last ='';}
								html += '<li class="'+last+'"><a href="single.html?post_id='+value.id+'">';
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
								html += '<span class="price">Price: $'+value.custom_fields.sales_price[0]+'</span>';
								if(value.custom_fields.delivery_time)
								{
								html += '<span class="price">Delivery Time: '+value.custom_fields.delivery_time[0]+' days</span>';
								}
								html += '<span class="seller_name">Seller : '+value.author.name+'</span>';
								html += '</div></a></li>';
								counter++;
						}
						
					})
					html += '</ul>';
					html += '<form name="sort-by-price" id="price-sort">';
					html += '<select name="product" id="price_filter2" class="mobile-dropdown" onchange="return sortGames(2);">';
						html += '<option>Sort By…</option>';
						html += '<option value="DESC">Highest to Lowest </option>';
						html += '<option value="ASC">Lowest to Highest </option>';
					html += '</select>';
        			html += '</form>';
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			//$('#tabs-1').html(html);
			$('#tabs-2').html(html);
			//$('#tabs-3').html(html);
			
			
		},
        error:function(){

        }
    });
		
}

function getRecentPosts()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var recent_viewed_games = window.localStorage.getItem("RecentViewed");
		var url = API_URL+'get_recently_viewed_games/?key=1234567891011&post_type='+type+'&ids='+recent_viewed_games;
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
				var totalPosts = posts.length;
				var counter = 1;
				if(totalPosts == 0)
				{
					html += '<p>There is no Game available Yet</p>';	
				}
				else
				{
					html += '<ul  class="products-list">';
					$.each(posts, function (i, value) {
						if(value.visible != 0)
						{
									if(counter == totalPosts){ var last = 'last'} else {var last ='';}
									html += '<li class="'+last+'"><a href="single.html?post_id='+value.ID+'">';
									if(value.images)
									{
									html += '<img src="'+GAME_IMAGES_PATH+value.images[0]+'" alt="ninja" class="product-thumb"/>';
									}
									else
									{
									html += '<img src="img/gamesdefault.png" alt="ninja" class="product-thumb"/>';	
									}
									html += '<div class="product-list-right">';
									html += '<h5>'+value.post_title+'</h5>';
									var excerpt = value.post_content;
									html += '<p>'+excerpt.substr(0, 100)+'</p>';
									//console.log(value.custom_fields.images[0]);
									html += '<span class="price">Price: $'+value.sales_price+'</span>';
									if(value.delivery_time)
									{
									html += '<span class="price">Delivery Time: '+value.delivery_time+' days</span>';
									}
									html += '<span class="seller_name">Seller : '+value.display_name+'</span>';
									html += '</div></a></li>';
									counter++;
							}
					})
					html += '</ul>';
					html += '<form name="sort-by-price" id="price-sort">';
					html += '<select name="product" id="price_filter1" class="mobile-dropdown" onchange="return sortGames(1);">';
						html += '<option>Sort By…</option>';
						html += '<option value="DESC">Highest to Lowest </option>';
						html += '<option value="ASC">Lowest to Highest </option>';
					html += '</select>';
        			html += '</form>';
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			$('#tabs-1').html(html);
			//$('#tabs-2').html(html);
			//$('#tabs-3').html(html);
			
			
		},
        error:function(){

        }
    });
		
}

function getPopularPosts()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var recent_viewed_games = window.localStorage.getItem("RecentViewed");
		var url = API_URL+'get_popular_games/?key=1234567891011&post_type='+type;
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
				var totalPosts = posts.length;
				var counter = 1;
				if(totalPosts == 0)
				{
					html += '<p>There is no Game available Yet</p>';	
				}
				else
				{
					html += '<ul  class="products-list">';
					$.each(posts, function (i, value) {
					if(value.visible != 0)
					{
						if(counter == totalPosts){ var last = 'last'} else {var last ='';}
						html += '<li class="'+last+'"><a href="single.html?post_id='+value.ID+'">';
						if(value.images)
						{
						html += '<img src="'+GAME_IMAGES_PATH+value.images[0]+'" alt="ninja" class="product-thumb"/>';
						}
						else
						{
						html += '<img src="img/gamesdefault.png" alt="ninja" class="product-thumb"/>';	
						}
						html += '<div class="product-list-right">';
						html += '<h5>'+value.post_title+'</h5>';
						var excerpt = value.post_content;
						html += '<p>'+excerpt.substr(0, 100)+'</p>';
						//console.log(value.custom_fields.images[0]);
						html += '<span class="price">Price: $'+value.sales_price+'</span>';
						if(value.delivery_time)
						{
						html += '<span class="price">Delivery Time: '+value.delivery_time+' days</span>';
						}
						html += '<span class="seller_name">Seller : '+value.display_name+'</span>';
						html += '</div></a></li>';
						counter++;
					}
					})
					html += '</ul>';
					html += '<form name="sort-by-price" id="price-sort">';
					html += '<select name="product" id="price_filter3" class="mobile-dropdown" onchange="return sortGames(3);">';
						html += '<option>Sort By…</option>';
						html += '<option value="DESC">Highest to Lowest </option>';
						html += '<option value="ASC">Lowest to Highest </option>';
					html += '</select>';
        			html += '</form>';
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			//$('#tabs-1').html(html);
			//$('#tabs-2').html(html);
			$('#tabs-3').html(html);
			
			
		},
        error:function(){

        }
    });
		
}


function getProductsList()
	{
		var type = 'wpmarketplace';
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
				var posts = data.posts;
				var author = data.author;
				var totalPosts = data.count;
					html += '<option value="">All Games</option>';
					$.each(posts, function (i, value) {
	
						html += '<option value="'+value.id+'">'+value.title+'</option>';
					})
			}

			$('#product-filter').html(html);
			
			
		},
        error:function(){

        }
    });
		
}

function gotoProduct()
{
	var product_id = $('#product-filter').val();
	window.location = 'single.html?post_id='+product_id+'';
}


function getSearchProduct(searchTxt)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL_DEFAULT+'get_search_results/?search='+searchTxt+'';
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
				var posts = data.posts;
				var author = data.author;
				var totalPosts = data.count;
			}
			
			
		},
        error:function(){

        }
    });
		
}

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
        			html += '<a href="category.html?term_id='+value.term_id+'&term_taxonomy_id='+value.term_taxonomy_id+'&slug='+value.slug+'">'+value.name+'</a>';
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
			if(data.status == 'ok')
			{
				
			}
			
		},
        error:function(){

        }
    });
		
}

function sortGames(num)
{
		var sorting = $('#price_filter'+num).val();
		console.log(sorting);	
		var filter = 'product_price';
		
		if(num == 1)
		{
		$('#tabs-1').html('<img id="loading" src="img/loading.gif" alt="Loading" />');
		}
		else if(num == 2)
		{
		$('#tabs-2').html('<img id="loading" src="img/loading.gif" alt="Loading" />');	
		}
		else
		{
		$('#tabs-3').html('<img id="loading" src="img/loading.gif" alt="Loading" />');		
		}
		
		
		
		
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var recent_viewed_games = window.localStorage.getItem("RecentViewed");
		
		if(num == 1)
		{
		var url = API_URL+'get_sorted_games/?key=1234567891011&sorting='+sorting+'&filter='+filter+'&ids='+recent_viewed_games;
		}
		else if(num == 2)
		{
		var url = API_URL+'get_sorted_games/?key=1234567891011&sorting='+sorting+'&filter='+filter+' ';
		}
		else if(num == 3)
		{
		var url = API_URL+'get_sorted_games/?key=1234567891011&sorting='+sorting+'&filter='+filter+'&type=popular';
		}
		
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
				var totalPosts = posts.length;
				var counter = 1;
				if(totalPosts == 0)
				{
					html += '<p>There is no Game available Yet</p>';	
				}
				else
				{
					html += '<ul  class="products-list">';
					$.each(posts, function (i, value) {
						if(counter == totalPosts){ var last = 'last'} else {var last ='';}
						html += '<li class="'+last+'"><a href="single.html?post_id='+value.ID+'">';
						if(value.images)
						{
						html += '<img src="'+GAME_IMAGES_PATH+value.images[0]+'" alt="ninja" class="product-thumb"/>';
						}
						else
						{
						html += '<img src="img/gamesdefault.png" alt="ninja" class="product-thumb"/>';	
						}
						html += '<div class="product-list-right">';
						html += '<h5>'+value.post_title+'</h5>';
						var excerpt = value.post_content;
						html += '<p>'+excerpt.substr(0, 100)+'</p>';
						//console.log(value.custom_fields.images[0]);
						html += '<span class="price">Price: $'+value.sales_price+'</span>';
						if(value.delivery_time)
						{
						html += '<span class="price">Delivery Time: '+value.delivery_time+' days</span>';
						}
						html += '<span class="seller_name">Seller : '+value.display_name+'</span>';
						html += '</div></a></li>';
						counter++;
					})
					html += '</ul>';
					
					html += '<form name="sort-by-price" id="price-sort">';
					if(num == 1)
					{
					html += '<select name="product" id="price_filter1" class="mobile-dropdown" onchange="return sortGames(1);">';
					}
					else if(num == 2)
					{
					html += '<select name="product" id="price_filter2" class="mobile-dropdown" onchange="return sortGames(2);">';
					}
					else
					{
					html += '<select name="product" id="price_filter3" class="mobile-dropdown" onchange="return sortGames(3);">';
					}
						html += '<option>Sort By…</option>';
						html += '<option value="DESC">Highest to Lowest </option>';
						html += '<option value="ASC">Lowest to Highest </option>';
					html += '</select>';
        			html += '</form>';
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			//$('#tabs-1').html(html);
			
			if(num == 1)
			{
			$('#tabs-1').html(html);
			}
			else if(num == 2)
			{
			$('#tabs-2').html(html);
			}
			else
			{
			$('#tabs-3').html(html);
			}
			
		},
        error:function(){

        }
    });
	
}




