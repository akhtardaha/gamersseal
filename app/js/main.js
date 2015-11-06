// JavaScript Document
$(document).ready(function(){
	
	if(!(window.localStorage.getItem("firstTimeLoading")))
	{			
		window.localStorage.setItem("firstTimeLoading",1);
		window.location = 'loading.html';
	}
	
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
	getTwitterFeeds();
	getYoutubeFeeds();
	getFacebookFeeds();
	getRecentContributors();
})



function getTwitterFeeds()
	{
		var url = TWITTER_FEEDS_URL;
		console.log(url);
		var html = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			//console.log(data);
			var tweets = data;
			var totalTweets = tweets.length;
			console.log(totalTweets);
			if(totalTweets > 0)
			{
				console.log(data);
				$.each(tweets, function (i, value) {
					var dtl = value.text.length;
					 if(dtl>50){
						value.text = value.text.substr(0,50)+"...";
					} 
					var userName = value.user.name;
					var screen_name = value.user.screen_name;
					var profile_image_url = value.user.profile_image_url;
					var media_url =  '';
					var tweetID = value.id;
					var tweetUrl = 'https://twitter.com/'+screen_name+'/status/'+tweetID+'/';
					
					if(value.extended_entities)
					{
						if(value.extended_entities.media)
						{
						 	media_url = value.extended_entities.media[0].media_url;
						}
					}
					var blank = '_blank';
					html += '<li class="single-feed">';
						html += '<a href="#" onclick="window.open(\''+tweetUrl+'\',\''+blank+'\')">';
                		html += '<img src="'+profile_image_url+'" alt="'+userName+'" class="product-thumb">';
                		html += '<div class="product-list-right">';
                			html += '<h5>'+value.text+'</h5>';
							if(media_url)
							{
							html += '<img src="'+media_url+'" alt="" />';	
							}
                    		html += '<p>'+moment(value.created_at).format('lll')+'</p>';
                    	html += '</div>';
						html += '</a>';
                	html += '</li>';
					
					return i<5;
				})
				
			}
			else
			{
				console.log(data);
				html += '<p>'+data+'</p>';
				
			}
			//$('#tabs-1').html(html);
			//$('#tabs-2').html(html);
			$('.twitterFeeds').html(html);
			
			
		},
        error:function(){

        }
    });
		
}

function getYoutubeFeeds()
	{
		var url = YOUTUBE_FEEDS_URL;
		console.log(url);
		var html = '';
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
        success:function(data)
        {
			var YouTubeFeeds = data.items;
			var totalYouTubeFeeds = YouTubeFeeds.length;
			console.log(totalYouTubeFeeds);
			console.log(YouTubeFeeds);
			var channelLink = 'https://www.youtube.com/channel/UCxE_vzom-qMPAbNPVe3ulsQ';
			var videoLink = 'https://www.youtube.com/watch?v=rYvRjwc6lag';
			if(totalYouTubeFeeds > 0)
			{
				$.each(YouTubeFeeds, function (i, value) {
					
					var FeedType = value.id.kind;
					var snippet = value.snippet;
					var date = snippet.publishedAt;
					
					var description = snippet.description;
					var channelTitle = snippet.channelTitle;
					var thumbnails = snippet.thumbnails;
					var thumbnailsPic = thumbnails.high.url;
					var linkFeed = '';
					if(FeedType == 'youtube#video')
					{
						var videoID = value.id.videoId;
						linkFeed = 'https://www.youtube.com/watch?v='+videoID;
						
					}
					else if(FeedType == 'youtube#channel')
					{
						var channelId = value.id.channelId;
						linkFeed = 'https://www.youtube.com/channel/'+channelId;
					}
					
					var blank = '_blank';
					html += '<li class="single-feed">';
						html += '<a href="#" onclick="window.open(\''+linkFeed+'\',\''+blank+'\')">';
                		html += '<img src="img/youtube.png" alt="'+channelTitle+'" class="product-thumb">';
                		html += '<div class="product-list-right">';
                			html += '<h5>'+description+'</h5>';
							html += '<img src="'+thumbnailsPic+'" alt="" />';	
                    		html += '<p>'+moment(date).format('lll')+'</p>';
                    	html += '</div>';
						html += '</a>';
                	html += '</li>';
					
					return i<5;
				})
			}
			else
			{
				console.log(data);
				html += '<p>'+data+'</p>';
				
			}
			
			$('.youtubeFeeds').html(html);
		},
        error:function(){

        }
    });
		
}


function getFacebookFeeds()
	{
		var url = FACEBOOK_FEEDS_URL;
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
			var facebook = data.data;
			var totalFacebook = facebook.length;
			console.log(totalFacebook);
			if(totalFacebook > 0)
			{
				console.log(data);
				$.each(facebook, function (i, value) {
					var dtl = value.from.name;
					 if(dtl>50){
						value.from.name = value.text.substr(0,50)+"...";
					} 
					var userName = value.from.name;
					var profile_image_url = 'http://graph.facebook.com/'+value.from.id+'/picture?type=square';
					var media_url =  '';
					var postLink = '';
					var postID = value.id;
					
					if(value.picture)
					{
						 media_url = value.picture;
					}
					
					if(value['link'])
					{
						 postLink = value['link'];
					}
					else
					{
						postLink = 'https://www.facebook.com/'+userName+'/';
					}
					
					var blank = '_blank';
					html += '<li class="single-feed">';
						html += '<a href="#" onclick="window.open(\''+postLink+'\',\''+blank+'\')">';
                		html += '<img src="'+profile_image_url+'" alt="'+userName+'" class="product-thumb">';
                		html += '<div class="product-list-right">';
						html += '<h5>'+value.from.name+'</h5>';
						html += '<p>'+value.message+'</p>';
							if(media_url)
							{
							html += '<img src="'+media_url+'" alt="" />';	
							}
							
                    		html += '<p>'+moment(value.created_time).format('lll')+'</p>';
                    	html += '</div>';
						html += '</a>';
                	html += '</li>';
					
					return i<5;
				})
				
			}
			else
			{
				console.log(data);
				html += '<p>'+data+'</p>';
				
			}
			//$('#tabs-1').html(html);
			//$('#tabs-2').html(html);
			$('.facebookFeeds').html(html);
			
			
		},
        error:function(){

        }
    });
		
}

function getRecentContributors()
	{
		var url = API_URL+'get_donation/?key=1234567891011';
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
				var donations = data.donations;
				var totalDonations = donations.length;
				if(totalDonations > 0)
				{
					$.each(donations, function (i, value) {
						html += '<li class="single-feed">';
							if(value.anonymous == 1)
							{
								var amount = parseFloat(value.amount);
								html += '<h5>Anonymous Donation</h5>';
								html += '<p><strong>Donation Amount : </strong> $'+amount.toFixed(2)+'</p>';
								html += '<p><strong>Donation Date : </strong>'+moment(value.donation_date).format('lll')+'</p>';
							}
							else
							{
								var amount = parseFloat(value.amount);
								html += '<p><strong>User ID : </strong> '+value.user+'</p>';
								html += '<p><strong>Username : </strong> '+value.name+'</p>';
								html += '<p><strong>Donation Amount : </strong> $'+amount.toFixed(2)+'</p>';
								html += '<p><strong>Donation Date : </strong>'+moment(value.donation_date).format('lll')+'</p>';
							}
						html += '</li>';
					})
				}
				else
				{
					console.log(data);
					html += '<p>'+data.msg+'</p>';
					
				}
				//$('#tabs-1').html(html);
				//$('#tabs-2').html(html);
				$('.recentCont').html(html);
				
				
			},
			error:function(){
	
			}
    });
		
}