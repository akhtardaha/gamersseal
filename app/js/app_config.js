// JavaScript Document

var API_URL ='http://gamersseal.com/development/api/userplus/';
var API_URL_DEFAULT ='http://gamersseal.com/development/api/';
var GAME_IMAGES_PATH = 'http://gamersseal.com/development/wp-content/uploads/wpmp-previews/';
var LOGO_PATH = 'http://gamersseal.com/development/uploads/appicon/';

var db = window.openDatabase("gamersseal","1.0","Gamersseal",30000000);



$(document).ready(function(){
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
    window.history.go(-1)
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
			var html = '';
			html += '<ul >';
           		html += '<li><a href="index.html">Continue Shopping</a></li>';
                html += '<li><a href="cart.html">Shopping Cart</a></li>';
                html += '<li><a href="message-board.html">Message Board</a></li>';
                html += '<li><a href="orderstatus.html">Order Status (for buyer)</a></li>';
                html += '<li class="bdr-btm"><a href="shippingstatus.html">Order Summary (for Buyer)</a></li>';
                html += '<li><a href="managegames.html">Stock Management (for Seller)</a></li>';
                html += '<li class="bdr-btm"><a href="postgame.html">Add New Item (for Seller)</a></li>';
                html += '<li class="bdr-btm"><a href="setting.html">Settings</a></li>';
                html += '<li><a href="salesreport.html">Sales Reports</a></li>';
                html += '<li class="bdr-btm"><a href="halloffames.html">Hall of Fame</a></li>';
				if(!(window.localStorage.getItem("loginuserCookie")))
				{
				html += '<li class="loginMenu"><a href="login.html">Sign in</a></li>';
                html += '<li class="registerMenu"><a href="register.html">Sign up</a></li>';
				}
				else
				{
				html += '<li class="profileMenu"><a href="profile.html">Profile</a></li>';	
				html += '<li class="logoutMenu"><a href="#" onclick="return signOutUser();">Sign out</a></li>';
				}
				html += '<li><a href="postgame.html">Post a Game</a></li>';
				html += '<li class="gameMenu"><a href="index.html">Buy Games</a></li>';
				html += '<li class="gameMenu"><a href="index.html">GoTo Home</a></li>';
                
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
				
				app_settings();
			}
			
		},
        error:function(){

        }
    });
		
}

function app_settings()
{
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
	
	$('.header h4').html('<a href="index.html"><img src="'+LOGO_PATH+app_icon+'" alt="Gamer Seal" width="100" /></a>');
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
							console.log("You can not Buy Games more then "+premium_daily_purchase+" per day!");
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
						console.log("You can not Buy Games more then "+standard_daily_purchase+" per day!");
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
						console.log("You can not Buy Games more then "+guest_daily_purchase+" per day!");
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
getUserPurchasePerDay();
/*
$(function() {
    $( "#from , #to" ).datepicker();
  });*/
