<?php
	$link = mysql_connect('localhost', 'root', '');
	$con = mysql_select_db('gamingmobileapp',$link);
	
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
	
	
	
	$querystr .= "UPDATE app_configuration SET gst = '".$gst."', item_desc_limit = '".$desclimit."', guest_seal_charges = '".$guestcharges."', standard_seal_charges = '".$standardcharges."', premium_seal_charges = '".$premiumcharges."', standard_item_day = '".$standarditemday."', premium_item_day = '".$premiumitemday."', app_background_color = '".$appbgclr."',";
	if($appicon)
	{
		$querystr .= "app_icon = '".$appicon."',"; 
	}
	$querystr .= "terms_and_conditions = '".$terms."' WHERE id = '".$confID."' ";
	$res = mysql_query($querystr);
	if($res){
	echo "App Configuration Successfully Stored";
	}