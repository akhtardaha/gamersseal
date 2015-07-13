<?php
$random = rand(100,100000);
$new_image_name = $_POST['key']."-".$random.".jpg";
move_uploaded_file($_FILES["file"]["tmp_name"], "/home/stripeycallan/public_html/development/uploads/australianids/".$new_image_name);
echo $new_image_name;
?>
