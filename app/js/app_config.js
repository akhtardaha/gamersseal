// JavaScript Document

var API_URL ='http://gamersseal.com/development/api/userplus/';
var API_URL_DEFAULT ='http://gamersseal.com/development/api/';
var GAME_IMAGES_PATH = 'http://gamersseal.com/development/wp-content/uploads/wpmp-previews/';
var db = window.openDatabase("gamersseal","1.0","Gamersseal",30000000);



$(document).ready(function(){
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
	var footerheight = 67;
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
                html += '<li><a href="#">Order Status (for buyer)</a></li>';
                html += '<li class="bdr-btm"><a href="#">Order Summary (for Buyer)</a></li>';
                html += '<li><a href="managegames.html">Stock Management (for Seller)</a></li>';
                html += '<li class="bdr-btm"><a href="postgame.html">Add New Item (for Seller)</a></li>';
                html += '<li class="bdr-btm"><a href="#">Settings</a></li>';
                html += '<li><a href="#">Sales Reports</a></li>';
                html += '<li class="bdr-btm"><a href="#">Hall of Fame</a></li>';
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
                
			html += '</ul>';
			$('.slide-menu').html(html);
}
/*
$(function() {
    $( "#from , #to" ).datepicker();
  });*/
