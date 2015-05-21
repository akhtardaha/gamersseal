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


   $( ".setting" ).click(function() {
    
    if ( $(".slide-menu").hasClass( "open" ) ) {
     $( ".slide-menu" ).animate({left: "2000px"}, 500);
	 $( ".slide-menu" ).removeClass('open');
     $( ".slide-menu" ).addClass('close');
    }
    else
    {
     $( ".slide-menu" ).animate({left: "0px"}, 500);
	 $( ".slide-menu" ).removeClass('close');
     $( ".slide-menu" ).addClass('open');
    }
   });
  $( ".home-tabs ul li a" ).click(function() {
    	$( ".home-tabs > div" ).css('display','none');
		 $( '.home-tabs ul li').removeClass('tab-open');
		 $( this ).parent('li').addClass('tab-open');
		var tab = $(this).attr( "href" );
		$( tab ).css('display','block');
   });

})
