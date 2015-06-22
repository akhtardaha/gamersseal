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
  $( ".home-tabs ul li a" ).click(function() {
    	$( ".home-tabs > div" ).css('display','none');
		 $( '.home-tabs ul li').removeClass('tab-open');
		 $( this ).parent('li').addClass('tab-open');
		var tab = $(this).attr( "href" );
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
						html += '<span class="price">Price: '+value.custom_fields.sales_price[0]+'</span>';
						html += '</div></a></li>';
						counter++;
					})
					html += '</ul>';
				}
			}
			else
			{
				console.log(data.status);
				html += '<p>'+data.error+'</p>';
				
			}
			$('#tabs-1').html(html);
			$('#tabs-2').html(html);
			
			
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
					html += '<option value="">Select</option>';
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


