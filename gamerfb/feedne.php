<?php

error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
// Pass session data over.
session_start();
 
// Include the required dependencies.
echo require( __DIR__.'/src/Facebook/autoload.php' );
$fb = new Facebook\Facebook([
  'app_id' => '135100593240392',
  'app_secret' => '0d22415620c386bfe5ac0f5f0e327c10',
  //'http_client_handler' => 'curl', // can be changed to stream or guzzle
  //'persistent_data_handler' => 'session' // make sure session has started
]);
function make_links($text, $class='', $target='_blank'){
    return preg_replace('!((http\:\/\/|ftp\:\/\/|https\:\/\/)|www\.)([-a-zA-Z?-??-?0-9\~\!\@\#\$\%\^\&\*\(\)_\-\=\+\\\/\?\.\:\;\'\,]*)?!ism', '<a class="'.$class.'" href="//$3" target="'.$target.'">$1$3</a>', $text);
}
	/*define("APP_ID", 'xxxxxxxxxxxxxxxxxxx');
	//define("APP_SECRET",'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
	//define("PAGE_ID",'elnuevodia');
	//$config = array(
		'appId' => APP_ID,
		'secret' => APP_SECRET,      
		);
	$api = new Facebook($config);*/

	$posts = $fb->api("/".PAGE_ID."/posts?limit=50");
	
	//echo "<pre>"; print_r($posts); echo "</pre>";
	$i=0;
	foreach ($posts['data'] as $post){
		$time_ar = explode("T",$post['updated_time']);
		echo "<h3>{$time_ar[0]}</h3>";
		if(isset($post['message']) && $post['message']) echo "<p>".make_links($post['message'])."</p>";
		if(isset($post['story']) && $post['story']) echo "<p>".make_links($post['story'])."</p>";
		
		if($i !== count($posts['data'])-1){
			echo '<hr>';
		}
		$i++;
	}

?>