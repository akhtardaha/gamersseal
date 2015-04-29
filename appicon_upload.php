<?php
	$link = mysql_connect('localhost', 'root', '');
	$con = mysql_select_db('gamingmobileapp',$link);
	//print_r($_FILES);
    if ( 0 < $_FILES['file']['error'] ) {
        echo 'Error: ' . $_FILES['file']['error'] . '<br>';
    }
    else {
       if(move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/appicon/' . $_FILES['file']['name']))
	   {
		   $querystr .= "UPDATE app_configuration SET app_icon = '".$_FILES['file']['name']."' ";
		   $res = mysql_query($querystr);
		   echo "uploads/appicon/".$_FILES['file']['name'];
	   } 
    }

?>