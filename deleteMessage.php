<?php
	include('config.php');
	$message_id = $_GET['message_id'];
	$querystr = "DELETE FROM message_board where message_id='".$message_id."'";
	$res = mysql_query($querystr);
	if($res){
	header('Location:http://'.$_SERVER['SERVER_NAME'].'/gamersseal/wp-admin/options-general.php?page=message_board');
	}