<?php
	include('config.php');
	
	$confID = $_POST['confID'];
    $gst = $_POST['gst'];
	$desclimit = $_POST['desclimit'];
	$guestcharges = $_POST['guestcharges'];
	$standardcharges = $_POST['standardcharges'];
	$premiumcharges = $_POST['premiumcharges'];
	$standarditemday = $_POST['standarditemday'];
	$premiumitemday = $_POST['premiumitemday'];
	$appbgclr = $_POST['appbgclr'];
	$appicon = $_POST['appicon'];
	$terms = $_POST['terms'];
	$halloffame = $_POST['halloffame'];
	
	
	$guestBuyAmountDay = $_POST['guestBuyAmountDay'];
	$standardBuyAmountDay = $_POST['standardBuyAmountDay'];
	$premiumBuyAmountDay = $_POST['premiumBuyAmountDay'];
	$guestTransactionDay = $_POST['guestTransactionDay'];
	$standardTransactionDay = $_POST['standardTransactionDay'];
	$premiumTransactionDay = $_POST['premiumTransactionDay'];
	
	$querystr .= "UPDATE app_configuration SET gst = '".$gst."', item_desc_limit = '".$desclimit."', guest_seal_charges = '".$guestcharges."', standard_seal_charges = '".$standardcharges."', premium_seal_charges = '".$premiumcharges."', standard_item_day = '".$standarditemday."', premium_item_day = '".$premiumitemday."', app_background_color = '".$appbgclr."', guest_daily_purchase ='".$guestBuyAmountDay."', standard_daily_purchase ='".$standardBuyAmountDay."', premium_daily_purchase ='".$premiumBuyAmountDay."', guest_daily_transaction ='".$guestTransactionDay."', standard_daily_transaction ='".$standardTransactionDay."', premium_daily_transaction ='".$premiumTransactionDay."', ";
	if($appicon)
	{
		$querystr .= "app_icon = '".$appicon."',"; 
	}
	$querystr .= "terms_and_conditions = '".$terms."', hall_of_fame='".$halloffame."' WHERE id = '".$confID."' ";
	$res = mysql_query($querystr);
	if($res){
	echo "App Configuration Successfully Stored";
	}