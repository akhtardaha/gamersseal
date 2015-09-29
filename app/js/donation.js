// JavaScript Document
$(document).ready(function(){
	
	if(window.localStorage.getItem("donationAmount"))
	{
		$('#totalDonationAmount').text(window.localStorage.getItem("donationAmount")+'$');
		$('#donationAmount').val(window.localStorage.getItem("donationAmount"));
		$('#add-custom').val('');
	}
	if(window.localStorage.getItem("anonymous") == 1)
	{
		$('#anonymous').attr("checked","checked");
	}
	else
	{
		$('#anonymous').removeAttr("checked");
	}
	
  $('#checkoutbtn').click(function(){
	var amount = $('#donationAmount').val();
	if($('#anonymous').is(":checked"))
	{
		var anon = 1;	
	}
	else
	{
		var anon = 0;	
	}
	
	window.localStorage.setItem("donationAmount",amount);
	window.localStorage.setItem("anonymous",anon);
	if(amount > 0)
	{
	window.location = 'donationPayment.html?amount='+amount+'&anon='+anon+'';
	}
}) 
})



