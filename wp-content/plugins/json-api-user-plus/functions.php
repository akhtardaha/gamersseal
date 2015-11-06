<?php

function pim_avatar_upload_dir($upload_dir) {
	$user_id = wp_validate_auth_cookie(urldecode($_REQUEST['cookie']), 'logged_in');
	$upload_dir['subdir']	= '/avatars/'.$user_id;
	$upload_dir['path']		= $upload_dir['basedir'] . $upload_dir['subdir'];
	$upload_dir['url']		= $upload_dir['baseurl'] . $upload_dir['subdir'];
	return $upload_dir;
}


function pim_empty_avatar_dir($dirname) {
   $files = glob($dirname.'/*'); // get all file names
foreach($files as $file){ // iterate files
  if(is_file($file))
    unlink($file); // delete file
   }
 }
 
 
function pim_bp_get_message_date($message_id) {
   global $wpdb;   
   $query =  "SELECT date_sent FROM {$wpdb->prefix}bp_messages_messages WHERE id = '$message_id'";
$result =  $wpdb->get_row($query, ARRAY_A);
 return get_date_from_gmt( $result['date_sent']); 

}

function pim_sort_by_id($a, $b) {
  if ( $a->id < $b->id ) return 1;
    if ( $a->id > $b->id ) return -1;
    return 0; // equality
}