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
})
