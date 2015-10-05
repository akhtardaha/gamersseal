<?php
$random = rand(100,100000);
if($_POST['key'])
{
$new_image_name = $_POST['key']."-".$random.".jpg";	
}
else
{
$new_image_name = "Event-".$random.".jpg";	
}
move_uploaded_file($_FILES["file"]["tmp_name"], "/home/stripeycallan/public_html/development/uploads/events/".$new_image_name);
echo $new_image_name;
?>
