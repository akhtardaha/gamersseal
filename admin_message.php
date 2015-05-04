<?php
	include('config.php');
	$sender = $_POST['sender'];
	$reciever = $_POST['reciever'];
	$message = $_POST['message'];
	$message_type = $_POST['message_type'];
	$status = $_POST['status'];
	$querystr = "INSERT INTO message_board (sender_id,reciever_id,message_txt,message_type,status) VALUES ('".$sender."','".$reciever."','".$message."','".$message_type."','".$status."')";
	$res = mysql_query($querystr);
	if($res){
	echo "Message Successfully Sent";
	}