// JavaScript Document

var API_URL ='http://gamersseal.com/development/api/userplus/';
var API_URL_DEFAULT ='http://gamersseal.com/development/api/';
var GAME_IMAGES_PATH = 'http://gamersseal.com/development/wp-content/uploads/wpmp-previews/';
var LOGO_PATH = 'http://gamersseal.com/development/uploads/appicon/';
var UPLOAD_GAME_PICS_URL = 'http://gamersseal.com/development/upload.php';
var UPLOAD_AUSTRALIAN_ID_PIC = 'http://gamersseal.com/development/upload_id.php';
var AUSTRALIAN_IDS_PATH = 'http://gamersseal.com/development/uploads/australianids/';
var WP_UPLOAD_BASE_PATH = 'http://gamersseal.com/development/wp-content/';
var db = window.openDatabase("gamersseal","1.0","Gamersseal",30000000);

document.addEventListener("deviceready", onDeviceReady, false);

    // device APIs are available
    //
	
    function onDeviceReady() {
        checkConnection();
    }





$(document).ready(function(){
		$( ".events-tab.home-tabs ul li>div" ).click(function() {
			$( ".home-tabs > div" ).css('display','none');
		 	$( '.home-tabs ul li').removeClass('tab-open');
		 	$( this ).parent('li').addClass('tab-open');
			var tab = $(this).attr( "data-tab" );
			$( tab ).css('display','block');
		})
		if(window.localStorage.getItem("rememberStatus")=='true'){
			$('#username').val(window.localStorage.getItem("rememberUsername"));
			$('#password').val(window.localStorage.getItem("rememberPassword"));
			}
		$('.news-item').click(function(){
			$(this).css('height','auto');
			})
		$('.donate_amount_val').click(function(){
			var currentdonation = parseInt($('#totalDonationAmount').text()) + parseInt($(this).val());
			$('#totalDonationAmount').text(currentdonation+'$');
			})
		$('#add-custom').blur(function(){
			if(!isNaN(parseInt($(this).val()))){
			var currentdonation = parseInt($('#totalDonationAmount').text()) + parseInt($(this).val());
			$('#totalDonationAmount').text(currentdonation+'$');
			}
			})
		var oneNumber = Math.floor((Math.random() * 3) + 1);
		var anoterNumber = Math.floor((Math.random() * 7) + 1);
		$('#number1').text(oneNumber);
		$('#number2').text(anoterNumber);
		$('#captcha-val').val(oneNumber+anoterNumber);
$('.footer').html('<h4><a href="mailto:haseeb.baber@gmail.com">Powered by AHB</a></h4>');
$('.header h4').html('<a href="index.html"><img src="img/logo.png" alt="Gamer Seal" width="100" /></a><div class="header-mid"><span class="top-header"></span><span class="heaer-tag-line"></span></div>');
$('.content-wraper').append(' <div class="help-center"><a href="#">Help Support Gamers Seal</a></div>');
getAppStatics();
app_settings();
sideBarMenu();

$( ".setting" ).click(function() {  
    if ( $(".slide-menu").hasClass( "open" ) ) {
     $( ".slide-menu" ).animate({left: "2000px"}, 1000);
	 $( ".slide-menu" ).removeClass('open');
     $( ".slide-menu" ).addClass('close');
	 $('.main-wraper').css('opacity','1');	 
    }
    else
    {
     $( ".slide-menu" ).animate({left: "0px"}, 500);
	 $( ".slide-menu" ).removeClass('close');
     $( ".slide-menu" ).addClass('open');
	 $('.main-wraper').css('opacity','0.3');
    }
});
	var app_ads_bar = window.localStorage.getItem("app_ads_bar");
  $('.content-wraper').prepend('<div class="back-box"><a href="javascript:void(0);" class="specification back-btn" onclick="goBack()">Back</a></div>');
  $('.content-wraper').prepend('<div class="advertisement"><marquee direction="left"><a href="#" >'+app_ads_bar+'</a></marquee></div>');
})

$(document).ready(function(){
	var headerheight = 75;
	var footerheight = 65;
	var totalScreenHeight = $(window).innerHeight();
	$('.page-wraper').css('height',totalScreenHeight+'px');
	var totalContentHeight = totalScreenHeight - parseInt(headerheight) - parseInt(footerheight);
	$('.main-wraper').css('height',totalContentHeight+'px');
	//alert(totalScreenHeight);
})

function goBack() {
    window.history.go(-1);
	//var page = getQueryVariable('page');
	//if(page)
	//{
	//window.location = page+'.html';
	//}
	//navigator.app.backHistory();
}

function tabContentstartLoading()
{
	$('.tabContent').addClass('loading'); 
}

function stopLoading()
{
	$('.tabContent').removeClass('loading'); 
}


function getQuery(key)
{        
   return params = location.search.substring(location.search.indexOf(key)).split('&')[0];
}

function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}

function getObjVal(pp,data) {
    if(data.hasOwnProperty(pp)) {
        var value = data[pp]; 
        return value;
    }
}

function make_base_auth(user, password) {
  var tok = user + ':' + password;
  var hash = btoa(tok);
  return "Basic " + hash;
};

function age(birthday) {
    var now = new Date();
    var past = new Date(birthday);
    var nowYear = now.getFullYear();
    var pastYear = past.getFullYear();
    var age = nowYear - pastYear;

    return age;
};

function dateFormat(dateObject) {
    var d = new Date(dateObject);
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    if (day < 10) {
        day = "0" + day;
    }
    if (month < 10) {
        month = "0" + month;
    }
    var date = day + "/" + month + "/" + year;
    return date;
}
function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
	return true;
	}
	else {
	return false;
	}
}


function signOutUser()
{
			window.localStorage.setItem("loginuserCookie",'');
			window.localStorage.setItem("loginuserCookieName",'');
			window.localStorage.setItem("loginuserPic",'');
			window.localStorage.setItem("loginuserDisplayname",'');
			window.localStorage.setItem("loginuserEmail",'');
			window.localStorage.setItem("loginuserID",'');
			window.localStorage.setItem("loginuserNicename",'');
			window.localStorage.setItem("loginuserNickname",'');
			window.localStorage.setItem("loginuserUsername",'');
			window.location = 'index.html';
}

function sideBarMenu()
{
			var menu_icon_url = window.localStorage.getItem("menu_icon_url");
			var html = '';
			html = '<ul class="left-nav">';
				if(window.localStorage.getItem("loginuserCookie"))
				{
					html += '<li><a href="cart.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Shopping Cart</a></li>';
					html += '<li><a href="message-board.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Message Board</a></li>';
					html += '<li><a href="orderstatus.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Order Status</a></li>';					
				}
				if(window.localStorage.getItem("loginuserABN") != '' && window.localStorage.getItem("loginuserCookie") != '')
				{
				    html += '<li class="bdr-btm"><a href="shippingstatus.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Shipping Status</a></li>';
					html += '<li><a href="managegames.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Stock Management</a></li>';
					html += '<li class="bdr-btm"><a href="postgame.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Add New Item</a></li>';
					html += '<li><a href="salesreport.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Sales Reports</a></li>';
				}
				
				if(!(window.localStorage.getItem("loginuserCookie")))
				{
				 	html += '<li class="registerMenu"><a href="register.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Signup</a></li>';
					html += '<li class="loginMenu"><a href="login.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Login</a></li>';
					html += '<li class="gameMenu"><a href="index.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Shop Home</a></li>';
					html += '<li class="gameMenu"><a href="events.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Events</a></li>';
					html += '<li class="bdr-btm gameMenu"><a href="news.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Gamers Seal  News</a></li>';
					html += '<li class="gameMenu"><a href="index.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Home Page</a></li>';
				}
				else
				{
					html += '<li class="bdr-btm"><a href="setting.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Settings</a></li>';
					html += '<li class="profileMenu"><a href="profile.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>User Profile</a></li>';	
					html += '<li class="gameMenu"><a href="index.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Shop</a></li>';
					html += '<li class="bdr-btm"><a href="halloffames.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Hall Of Fame</a></li>';
					html += '<li class="gameMenu"><a href="donation.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Donate</a></li>';
					html += '<li class="gameMenu bdr-btm"><a href="index.html"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Home</a></li>';
					html += '<li class="gameMenu logoutMenu"><a href="#" onclick="return signOutUser();"><img align="center" src="'+WP_UPLOAD_BASE_PATH+menu_icon_url+'" alt="icone"/>Sign Out</a></li>';
				}
			html += '</ul>';
			$('.slide-menu').html(html);
}

var app_icon = window.localStorage.getItem("app_icon");
if(!(app_icon))
{
	getAppSettings();
}
function getAppSettings()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_app_settings/?key=1234567891011';
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
				var app_background_color = data.app_configuration[0].app_background_color;
				//app_background_color = app_background_color.replace(/\#\#/g, '');
				//app_background_color = app_background_color;
				
				window.localStorage.setItem("app_background_color",app_background_color);

				window.localStorage.setItem("app_icon",data.app_configuration[0].app_icon);
				window.localStorage.setItem("gst",data.app_configuration[0].gst);
				
				window.localStorage.setItem("guest_daily_purchase",data.app_configuration[0].guest_daily_purchase);
				window.localStorage.setItem("guest_daily_transaction",data.app_configuration[0].guest_daily_transaction);
				window.localStorage.setItem("guest_seal_charges",data.app_configuration[0].guest_seal_charges);
				
				window.localStorage.setItem("item_desc_limit",data.app_configuration[0].item_desc_limit);
				
				window.localStorage.setItem("premium_daily_purchase",data.app_configuration[0].premium_daily_purchase);
				window.localStorage.setItem("premium_daily_transaction",data.app_configuration[0].premium_daily_transaction);
				window.localStorage.setItem("premium_item_day",data.app_configuration[0].premium_item_day);
				window.localStorage.setItem("premium_seal_charges",data.app_configuration[0].premium_seal_charges);
				
				window.localStorage.setItem("standard_daily_purchase",data.app_configuration[0].standard_daily_purchase);
				window.localStorage.setItem("standard_daily_transaction",data.app_configuration[0].standard_daily_transaction);
				window.localStorage.setItem("standard_item_day",data.app_configuration[0].standard_item_day);
				window.localStorage.setItem("standard_seal_charges",data.app_configuration[0].standard_seal_charges);
				
				window.localStorage.setItem("terms_and_conditions",data.app_configuration[0].terms_and_conditions);
				
				window.localStorage.setItem("app_name",data.app_configuration[0].app_name);
				window.localStorage.setItem("app_tagLine",data.app_configuration[0].app_tagLine);
				
				window.localStorage.setItem("app_ads_bar",data.app_configuration[0].app_ads_bar);
				window.localStorage.setItem("app_header_color",data.app_configuration[0].app_header_color);
				window.localStorage.setItem("media_feed",data.app_configuration[0].media_feed);
				window.localStorage.setItem("menu_icon_url",data.app_configuration[0].menu_icon_url);
				
				app_settings();
			}
			
		},
        error:function(){

        }
    });
		
}

function getAppStatics()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'fetch_app_settings/?key=1234567891011';
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
				window.localStorage.setItem("gst",data.app_configuration[0].gst);
				
				window.localStorage.setItem("guest_daily_purchase",data.app_configuration[0].guest_daily_purchase);
				window.localStorage.setItem("guest_daily_transaction",data.app_configuration[0].guest_daily_transaction);
				window.localStorage.setItem("guest_seal_charges",data.app_configuration[0].guest_seal_charges);
				
				window.localStorage.setItem("item_desc_limit",data.app_configuration[0].item_desc_limit);
				
				window.localStorage.setItem("premium_daily_purchase",data.app_configuration[0].premium_daily_purchase);
				window.localStorage.setItem("premium_daily_transaction",data.app_configuration[0].premium_daily_transaction);
				window.localStorage.setItem("premium_item_day",data.app_configuration[0].premium_item_day);
				window.localStorage.setItem("premium_seal_charges",data.app_configuration[0].premium_seal_charges);
				
				window.localStorage.setItem("standard_daily_purchase",data.app_configuration[0].standard_daily_purchase);
				window.localStorage.setItem("standard_daily_transaction",data.app_configuration[0].standard_daily_transaction);
				window.localStorage.setItem("standard_item_day",data.app_configuration[0].standard_item_day);
				window.localStorage.setItem("standard_seal_charges",data.app_configuration[0].standard_seal_charges);
				
				window.localStorage.setItem("terms_and_conditions",data.app_configuration[0].terms_and_conditions);
				
				window.localStorage.setItem("app_name",data.app_configuration[0].app_name);
				window.localStorage.setItem("app_tagLine",data.app_configuration[0].app_tagLine);
				
				window.localStorage.setItem("app_ads_bar",data.app_configuration[0].app_ads_bar);
				window.localStorage.setItem("app_header_color",data.app_configuration[0].app_header_color);
				window.localStorage.setItem("media_feed",data.app_configuration[0].media_feed);
				window.localStorage.setItem("menu_icon_url",data.app_configuration[0].menu_icon_url);
				
				
				var user_role = window.localStorage.getItem("loginuserRole");
				var standard_seal_charges = window.localStorage.getItem("standard_seal_charges");
				var premium_seal_charges = window.localStorage.getItem("premium_seal_charges");
				var guest_seal_charges = window.localStorage.getItem("guest_seal_charges");
				
				if(user_role == 'preminum')
				{
				window.localStorage.setItem("gamerseal_charges",premium_seal_charges);
				}
				if(user_role == 'standard')
				{
				window.localStorage.setItem("gamerseal_charges",standard_seal_charges);	
				}
				if(user_role == 'guest')
				{
				window.localStorage.setItem("gamerseal_charges",guest_seal_charges);	
				}
				
				
				
				var app_background_color = window.localStorage.getItem("app_background_color");
				var app_icon = window.localStorage.getItem("app_icon");
				
				var app_name = window.localStorage.getItem("app_name");
				var app_tagLine = window.localStorage.getItem("app_tagLine");
				var app_header_color = window.localStorage.getItem("app_header_color");
				
				$('.header h4').html('<a href="index.html" class="headerLogo"><img src="'+LOGO_PATH+app_icon+'" alt="Gamer Seal" width="100" /></a><div class="header-mid"><span class="top-header">'+app_name+'</span><span class="heaer-tag-line">'+app_tagLine+'</span></div>');
	$('.main-wraper').css('background-color',app_background_color);
	$('.header').css('background-color',app_header_color);
				
				//app_settings();
			}
			
		},
        error:function(){

        }
    });
		
}

function app_settings()
{
				var app_name = '';
				var app_tagLine = '';
				var app_background_color = window.localStorage.getItem("app_background_color");
				console.log(app_background_color);
				var app_icon = window.localStorage.getItem("app_icon");
				var gst = window.localStorage.getItem("gst");
				
				var guest_daily_purchase = window.localStorage.getItem("guest_daily_purchase");
				var guest_daily_transaction = window.localStorage.getItem("guest_daily_transaction");
				var guest_seal_charges = window.localStorage.getItem("guest_seal_charges");
				
				var item_desc_limit = window.localStorage.getItem("item_desc_limit");
				
				var premium_daily_purchase = window.localStorage.getItem("premium_daily_purchase");
				var premium_daily_transaction = window.localStorage.getItem("premium_daily_transaction");
				var premium_item_day = window.localStorage.getItem("premium_item_day");
				var premium_seal_charges = window.localStorage.getItem("premium_seal_charges");
				
				var standard_daily_purchase = window.localStorage.getItem("standard_daily_purchase");
				var standard_daily_transaction = window.localStorage.getItem("standard_daily_transaction");
				var standard_item_day = window.localStorage.getItem("standard_item_day");
				var standard_seal_charges = window.localStorage.getItem("standard_seal_charges");
				
				var terms_and_conditions = window.localStorage.getItem("terms_and_conditions");
				
				var app_name = window.localStorage.getItem("app_name");
				var app_tagLine = window.localStorage.getItem("app_tagLine");
	
	$('.header h4').html('<a href="index.html" class="headerLogo"><img src="'+LOGO_PATH+app_icon+'" alt="Gamer Seal" width="100" /></a><div class="header-mid"><span class="top-header">'+app_name+'</span><span class="heaer-tag-line">'+app_tagLine+'</span></div>');
	$('.main-wraper').css('background-color',app_background_color);
}

function startButtonLoading(id)
{
	$('#'+id).addClass('buttonLoading');
}
function endButtonLoading(id)
{
	$('#'+id).removeClass('buttonLoading');
}
function endClassButtonLoading(id)
{
	$('.'+id).removeClass('buttonLoading');
}

function getUserItemsPerDay()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_user_items_today/?key=1234567891011&user_id='+user_id+' ';
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
			var itemStatus = data.count;
			var user_role = window.localStorage.getItem("loginuserRole");
			var premium_item_day = window.localStorage.getItem("premium_item_day");
			var standard_item_day = window.localStorage.getItem("standard_item_day");
			
			console.log(itemStatus+" "+user_role+" "+premium_item_day+" "+standard_item_day);
			if(data.status == 'ok')
			{
				if(user_role == 'preminum')
				{
					if(itemStatus >= premium_item_day)	
					{
						console.log("You can not Add items more then "+premium_item_day+" per day!");
						navigator.notification.alert(
							"You can not Add items more then "+premium_item_day+" per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Upload Limit',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						console.log("continue");
					}
				}
				if(user_role == 'standard')
				{
					if(itemStatus >= standard_item_day)	
					{
						console.log("You can not Add items more then "+standard_item_day+" per day!");
						navigator.notification.alert(
							"You can not Add items more then "+standard_item_day+" per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Upload Limit',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						console.log("continue");
					}
				}
			}
			
		},
        error:function(){

        }
    });
		
}

function getUserPurchasePerDay()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_user_purchase_today/?key=1234567891011&user_id='+user_id+' ';
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
			var purchaseStatus = data.purchase;
			var user_role = window.localStorage.getItem("loginuserRole");
			var guest_daily_purchase = window.localStorage.getItem("guest_daily_purchase");
			var premium_daily_purchase = window.localStorage.getItem("premium_daily_purchase");
			var standard_daily_purchase = window.localStorage.getItem("standard_daily_purchase");
			
			console.log(purchaseStatus+" "+user_role+" "+guest_daily_purchase+" "+standard_daily_purchase+" "+premium_daily_purchase);
			if(data.status == 'ok')
			{
				if(user_role == 'preminum')
				{
					if(premium_daily_purchase == 'unlimited')
					{
						console.log("Continue Buying");
					}
					else
					{
						if(purchaseStatus >= premium_daily_purchase)
						{
							console.log("You can not Buy Games more then "+premium_daily_purchase+" amount per day!");
							navigator.notification.alert(
							"You can not Buy Games more then "+premium_daily_purchase+" amount per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Purchase',            // title
							'OK'                  // buttonName
						);	
							
						}
						else
						{
							console.log("Continue Buying");
						}
					}
					
				}
				if(user_role == 'standard')
				{
					if(purchaseStatus >= standard_daily_purchase)	
					{
						console.log("You can not Buy Games more then "+standard_daily_purchase+" amount per day!");
						navigator.notification.alert(
							"You can not Buy Games more then "+standard_daily_purchase+" amount per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Purchase',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						console.log("Continue Buying");
					}
				}
				if(user_role == 'guest')
				{
					if(purchaseStatus >= guest_daily_purchase)	
					{
						console.log("You can not Buy Games more then "+guest_daily_purchase+" amount per day!");
						navigator.notification.alert(
							"You can not Buy Games more then "+guest_daily_purchase+" amount per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Purchase',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						console.log("Continue Buying");
					}
				}
			}
			
		},
        error:function(){

        }
    });
		
}

function getUserTransactionsPerDay()
	{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		var url = API_URL+'get_user_transactions_today/?key=1234567891011&user_id='+user_id+' ';
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
			var transactionsStatus = data.total;
			var user_role = window.localStorage.getItem("loginuserRole");
			var guest_daily_transaction = window.localStorage.getItem("guest_daily_transaction");
			var premium_daily_transaction = window.localStorage.getItem("premium_daily_transaction");
			var standard_daily_transaction = window.localStorage.getItem("standard_daily_transaction");
			
			console.log(transactionsStatus+" "+user_role+" "+guest_daily_transaction+" "+standard_daily_transaction+" "+premium_daily_transaction);
			if(data.status == 'ok')
			{
				if(user_role == 'preminum')
				{
					if(premium_daily_transaction == 'unlimited')
					{
						console.log("Continue Transactions");
					}
					else
					{
						if(transactionsStatus >= premium_daily_transaction)
						{
							console.log("You can not do more then "+premium_daily_transaction+" Transactions per day!");
							navigator.notification.alert(
							"You can not do more then "+premium_daily_transaction+" Transactions per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Transactions',            // title
							'OK'                  // buttonName
						);	
						}
						else
						{
							console.log("Continue Transactions");
						}
					}
					
				}
				if(user_role == 'standard')
				{
					if(transactionsStatus >= standard_daily_transaction)	
					{
						console.log("You can not do more then "+standard_daily_transaction+" Transactions per day!");
						navigator.notification.alert(
							"You can not do more then "+standard_daily_transaction+" Transactions per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Transactions',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						console.log("Continue Transactions");
					}
				}
				if(user_role == 'guest')
				{
					if(transactionsStatus >= guest_daily_transaction)	
					{
						console.log("You can not do more then "+guest_daily_transaction+" Transactions per day!");
						navigator.notification.alert(
							"You can not do more then "+guest_daily_transaction+" Transactions per day!",  // message
							function(){setTimeout(function(){ window.location = 'index.html'; },200)},        // callback
						   'Daily Transactions',            // title
							'OK'                  // buttonName
						);	
					}
					else
					{
						console.log("Continue Transactions");
					}
				}
			}
			
		},
        error:function(){

        }
    });
		
}

$(document).ready(function(){
    $('input, textarea, select').on('focus', function (e) {
        $('.footer').css('position', 'relative');
    });
    $('input, textarea, select').on('blur', function (e) {
        $('.footer').css('position', 'fixed');
    });
});

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function checkConnection() {
    var networkState = navigator.connection.type;
	console.log(networkState);
    /*var states = {};
    states[Connection.UNKNOWN]  = 'Unknown connection';
    states[Connection.ETHERNET] = 'Ethernet connection';
    states[Connection.WIFI]     = 'WiFi connection';
    states[Connection.CELL_2G]  = 'Cell 2G connection';
    states[Connection.CELL_3G]  = 'Cell 3G connection';
    states[Connection.CELL_4G]  = 'Cell 4G connection';
    states[Connection.CELL]     = 'Cell generic connection';
    states[Connection.NONE]     = 'No network connection';*/
	
	//alert('Connection type: ' + networkState);

    if(networkState == 'none')
	{
		window.location = 'nointernet.html';
	}
}



document.addEventListener("pause", pauseApp, false);

function pauseApp()
{
	var currentURI = window.location;
	window.localStorage.setItem("lastState",currentURI);
}

document.addEventListener("resume", resumeApp, false);

function resumeApp()
{
	
	var currentURI = window.localStorage.getItem("lastState");
	if(currentURI)
	{
		window.location = currentURI;	
	}
}


function additemtoFavorite(product_id)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		if(user_id)
		{
			var type = 'wpmarketplace';
			var url = API_URL+'addtofavorite/?key=1234567891011&user_id='+user_id+'&product_id='+product_id+' ';
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
					if(data == "Removed from Favorite")
					{
						$('.product'+product_id).removeClass('activeFav');	
					}
					else if(data == "Added to Favorite")
					{
						$('.product'+product_id).addClass('activeFav');
					}
					//$('#product-filter').html(html);
					
				},
				error:function(){
		
				}
			});
		}
		else
		{
			console.log("Please login before adding Item to Favorite!");
			navigator.notification.alert(
				"Please login before adding Item to Favorite!",  // message
				function(){},        // callback
				'Login',            // title
				'OK'                  // buttonName
			);		
		}
}

function checkfavorite(product_id)
{
		var user_id = window.localStorage.getItem("loginuserID");
		var cooke = window.localStorage.getItem("loginuserCookie");
		if(user_id)
		{
			var type = 'wpmarketplace';
			var url = API_URL+'checkfavorite/?key=1234567891011&user_id='+user_id+'&product_id='+product_id+' ';
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
					if(data == "Yes")
					{
						$('.product'+product_id).addClass('activeFav');	
					}
					else if(data == "No")
					{
						
					}
					//$('#product-filter').html(html);
					
				},
				error:function(){
		
				}
			});
		}
}

function intToFloat(num, decPlaces) { 

num = parseInt(num);
return num.toFixed(decPlaces); 

}

/*
$(function() {
    $( "#from , #to" ).datepicker();
  });*/
