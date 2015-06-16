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

jQuery(document).ready(function ($) {

            var _CaptionTransitions = [];
            _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["ZMF|10"] = { $Duration: 900, $Zoom: 11, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 };
            _CaptionTransitions["RTT|10"] = { $Duration: 900, $Zoom: 11, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8} };
            _CaptionTransitions["RTT|2"] = { $Duration: 900, $Zoom: 3, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 0.5} };
            _CaptionTransitions["RTTL|BR"] = { $Duration: 900, x: -0.6, y: -0.6, $Zoom: 11, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.8} };
            _CaptionTransitions["CLIP|LR"] = { $Duration: 900, $Clip: 15, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
            _CaptionTransitions["MCLIP|L"] = { $Duration: 900, $Clip: 1, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic} };
            _CaptionTransitions["MCLIP|R"] = { $Duration: 900, $Clip: 2, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic} };

            var options = {
                $FillMode: 2,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                               //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $CaptionSliderOptions: {                            //[Optional] Options which specifies how to animate caption
                    $Class: $JssorCaptionSlider$,                   //[Required] Class to create instance to animate caption
                    $CaptionTransitions: _CaptionTransitions,       //[Required] An array of caption transitions to play caption, see caption transition section at jssor slideshow transition builder
                    $PlayInMode: 1,                                 //[Optional] 0 None (no play), 1 Chain (goes after main slide), 3 Chain Flatten (goes after main slide and flatten all caption animations), default value is 1
                    $PlayOutMode: 3                                 //[Optional] 0 None (no play), 1 Chain (goes before main slide), 3 Chain Flatten (goes before main slide and flatten all caption animations), default value is 1
                },

                $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 8,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 8,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                },

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 1920));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
/*
$(function() {
    $( "#from , #to" ).datepicker();
  });*/
