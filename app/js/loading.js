// JavaScript Document
$(document).ready(function(){
	var deviceHeight = $(window).innerHeight();
	deviceHeight = parseInt(deviceHeight) - 30 ;
	$('.loading').css('height',deviceHeight+'px');
	setTimeout(function(){window.location = 'index.html';},5000);
})

