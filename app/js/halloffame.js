// JavaScript Document
$(document).ready(function(){
	if(window.localStorage.getItem("HallofFameYear") || window.localStorage.getItem("HallofFameMonth") || window.localStorage.getItem("HallofFameWeek"))
	{
		getHallofFame('no');
	}
	else
	{
		getHallofFame('default');
	}
   if(window.localStorage.getItem("HallofFameYear"))
		{
			$('#year').val(window.localStorage.getItem("HallofFameYear"));
		}
	if(window.localStorage.getItem("HallofFameMonth"))
		{
			$('#month').val(window.localStorage.getItem("HallofFameMonth"));
		}
	if(window.localStorage.getItem("HallofFameWeek"))
		{
			$('#week').val(window.localStorage.getItem("HallofFameWeek"));
		}
})

function changeYearHallofFame()
{
	var yearVal = $('#year').val();
	window.localStorage.setItem("HallofFameYear",yearVal);
	getHallofFame('no');
}

function changeMonthHallofFame()
{
	var monthVal = $('#month').val();
	window.localStorage.setItem("HallofFameMonth",monthVal);
	getHallofFame('no');
}

function changeWeekHallofFame()
{
	var weekVal = $('#week').val();
	window.localStorage.setItem("HallofFameWeek",weekVal);
	getHallofFame('no');
}


function getHallofFame(type){
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		
		if(window.localStorage.getItem("HallofFameYear"))
		{
			var year = window.localStorage.getItem("HallofFameYear");
		}
		else
		{
			var year = $('#year').val();
		}
		
		if(window.localStorage.getItem("HallofFameMonth"))
		{
			var month = window.localStorage.getItem("HallofFameMonth");
		}
		else
		{
			var month = $('#month').val();
		}
		
		if(window.localStorage.getItem("HallofFameWeek"))
		{
			var week = window.localStorage.getItem("HallofFameWeek");
		}
		else
		{
			var week = $('#week').val();
		}
		
		if(type == 'default')
		{
		var url = API_URL+'get_hall_of_fame/?key=1234567891011&type='+type+'&don_year='+year+'&don_month='+month+'&don_week='+week+'';
		}
		else
		{
		var url = API_URL+'get_hall_of_fame/?key=1234567891011&don_year='+year+'&don_month='+month+'&don_week='+week+'';	
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
			var posts = data.halloffame;
			var totalPosts = posts.count;
			var num = 1;
			if(posts == 0)
			{
				html += '<p class="empty">'+data.msg+'</p>';	
			}
			else
			{
				if(data.status == 'ok')
				{
					$.each(posts, function (i, value) {
					html += '<div class="fame-user">';
						html += '<a href="singlefame.html?user='+value.user+'&name='+encodeURI(value.name)+'&rank='+num+'&amount='+value.total_donation+'&ref='+value.don_num+'" class="FameRank"><span class="rank">'+num+'</span></a>';
						html += '<a href="singlefame.html?user='+value.user+'&name='+encodeURI(value.name)+'&rank='+num+'&amount='+value.total_donation+'&ref='+value.don_num+'" class="Fameinfo">';
							html += '<img id="img'+num+'" src="img/loadingSmall.gif" alt="user" />'; 
						html += '</a>';
						html += '<span style="margin-top: 10px;text-align: center;font-size: 14px;" class="user-id">User ID: '+value.user+'</span>';
					html += '</div>';
					getUserPic(value.user,num);
					num++;
					})
				}
				else
				{
					console.log(data.msg);
					html += '<p>'+data.msg+'</p>';
					
				}
			}
			$('.hall-user-box').html(html);

		},
        error:function(){

        }
    });
}

function getUserPic(user_id,num)
	{
		//http://gamersseal.com/development/api/userplus/get_avatar/?key=1234567891011&
		if(user_id == 'Guest')
		{
			$('#img'+num).prop('src','img/profile.jpg');	
		}
		else
		{
		var url = API_URL+'get_avatar/?key=1234567891011&user_id='+user_id+'&type=full';
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
					console.log(data);
					var avatar = data.avatar;
					//var imgPath = GAME_IMAGES_PATH+data.post.custom_fields.images[0];
					$('#img'+num).prop('src',avatar);
				}
				
			},
			error:function(){}
		});
		}
		
}