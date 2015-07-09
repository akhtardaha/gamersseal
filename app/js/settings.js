// JavaScript Document
	if(!(window.localStorage.getItem("loginuserCookie")))
	{
		window.location = 'login.html';			
	}
$(document).ready(function(){
	getProductCategories();
	getUserFavouriteGamesType();
})
	
function updatePassword(){
	
	var password = $('#password').val();
	var cpassword = $('#cpassword').val();
	var user_id = window.localStorage.getItem("loginuserID");
	var cooke = window.localStorage.getItem("loginuserCookie");
	var url = '';
	
	if(password != '' && cpassword != '')
	{
			if(password == cpassword)
			{
			startButtonLoading('changePassword');
			url = API_URL+'update_user/?key=1234567891011&cookie='+cooke+'&user_pass='+cpassword+' ';
			}
			else
			{
				console.log("Password Not Matched");
				navigator.notification.alert(
						"Password did not Matched, Please enter same!",  // message
						function(){},        // callback
					   'Password Not Matched',            // title
						'OK'                  // buttonName
				);
				return false;
			}
			console.log(url);
		$.ajax({
				url:url,
				type: "POST",
				contentType: "application/json",
				dataType: 'jsonp',
				success:function(data)
				{
					endButtonLoading('changePassword');
					console.log(data);
					if(data.status == 'ok')
					{
						console.log("Password Updated Successfully!");
						window.localStorage.setItem("loginuserCookie",'');
						window.localStorage.setItem("loginuserID",'');
						navigator.notification.alert(
								"Password Updated Successfully!",  // message
								function(){setTimeout(function(){ window.location = 'login.html'; }, 500);},        // callback
							   "Password Updated",            // title
								'Done'                  // buttonName
						);
						
					}
					if(data.status == 'error')
					{
						console.log(data.error);
						navigator.notification.alert(
								data.error,  // message
								function(){setTimeout(function(){location.reload();},300);},        // callback
							   "Error while Change",            // title
								'OK'                  // buttonName
						);
					}
					
				},
				error:function(){
					
				}
			});
	}
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
				html += '<option value="" selected="selected">Choose Game Type</option>';
				$.each(data.data, function (i, value) {
					html += '<option value="'+value.term_taxonomy_id+'">'+value.name+'</option>';
        			//html += '<a href="category.html?term_id='+value.term_id+'&term_taxonomy_id='+value.term_taxonomy_id+'&slug='+value.slug+'">'+value.name+'</a>';
				})
			}
			$('#gameType').html(html);
			
		},
        error:function(){

        }
    });
		
}


function getUserFavouriteGamesType()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_user_favorite_game_type/?key=1234567891011&user_id='+user_id;
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
				var count = data.count;
				
				if(count == 1)
				{
				var total = data.game_types.length;
				console.log(total);
				$.each(data.game_types, function (i, value) {
					if(parseInt(i)+1 == total) { var last = 'last'; } else { var last ='';}
					html += '<li class="'+last+'">';
                	html += '<a href="category.html?term_id='+value.game_type_id+'&term_taxonomy_id='+value.game_type_id+'&slug='+value.game_type_name+'">';
						html += '<div class="product-list-user">';
						html += '<h5>'+value.game_type_name+'</h5>';
						html += '<p>All '+value.game_type_name+' game</p>';
						html += '</div>';
						html += '<a class="delFavourite" id="removefav'+value.game_type_id+'" onclick="removeUserFavouriteGamesType(\''+value.game_type_id+'\');"><img src="img/trash.png" alt="Remove" /></a>'
                	html += '</a>';
            		html += '</li>';
				})
				}
				else
				{
					html += '<li>';
                	html += '<p class="notice">Favourites List Empty.</p>';
            		html += '</li>';	
				}
			}
			$('.favourite-list').html(html);
			
		},
        error:function(){

        }
    });
		
}

function addUserFavouriteGamesType()
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		
		var html = '';
		var game_type = $('#gameType').val();
		var game_type_name = $("#gameType option:selected").text();
		var url = API_URL+'add_user_favorite_game_type/?key=1234567891011&user_id='+user_id+'&game_type='+game_type+'&game_type_name='+game_type_name+' ';
		console.log(url);
		if(game_type)
		{
		startButtonLoading('addtoFavourite');
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			endButtonLoading('addtoFavourite');
			console.log(data);
			if(data.status == 'ok')
			{
				console.log(data.msg);
				navigator.notification.alert(
								data.msg,  // message
								function(){setTimeout(function(){location.reload();},200);},       // callback
							   "Favourite Game Type",            // title
								'Done'                  // buttonName
				);
			}
			//$('.favourite-list').html(html);
			
		},
        error:function(){

        }
    });
	}
}

function removeUserFavouriteGamesType(game_type)
	{
		var type = 'wpmarketplace';
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		
		var html = '';
		var url = API_URL+'remove_user_favorite_game_type/?key=1234567891011&user_id='+user_id+'&game_type='+game_type;
		console.log(url);
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
				console.log(data.msg);
				navigator.notification.alert(
								data.msg,  // message
								function(){setTimeout(function(){location.reload();},200);},       // callback
							   "Remove Favourite Game Type",            // title
								'Done'                  // buttonName
				);
			}
			//$('.favourite-list').html(html);
			
		},
        error:function(){

        }
    });
}