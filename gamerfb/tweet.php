<?php
//$ob = curl_init();
//
//curl_setopt($ob, CURLOPT_SSL_VERIFYHOST, false);
////curl_setopt($ob, CURLOPT_SSL_VERIFYPEER, 0);
//curl_setopt($ob, CURLOPT_SSL_VERIFYPEER, false);
//curl_setopt ($ob, CURLOPT_SSL_VERIFYPEER, TRUE); 
//curl_setopt ($ob, CURLOPT_CAINFO, __DIR__ . "/cacert.pem");
//curl_setopt($ob, CURLOPT_USERAGENT, 'Mandrill-PHP/1.0.54');
//curl_setopt($ob, CURLOPT_POST, true);
//curl_setopt($ob, CURLOPT_FOLLOWLOCATION, true);
//curl_setopt($ob, CURLOPT_HEADER, false);
//curl_setopt($ob, CURLOPT_RETURNTRANSFER, true);
//curl_setopt($ob, CURLOPT_CONNECTTIMEOUT, 30);
//curl_setopt($ob, CURLOPT_TIMEOUT, 600);

require_once('TwitterAPIExchange.php');


/** Set access tokens here - see: https://dev.twitter.com/apps/ **/
$settings = array(
    'oauth_access_token' => "1062765997-BWdP1ZBq8ezhYce2VJWJ5xVjvNmtvm6JBqTrFaI",
    'oauth_access_token_secret' => "piTdLvYebnY1KK93CYDqPgidoSWyFUySh3WpffN8TABRp",
    'consumer_key' => "z9OqDdx5ni6GGqMhDFrTS2BTh",
    'consumer_secret' => "ZLYxznGBBiLmswh1ga33yTGW79eljyA7OVpV61F8ilnYKwfe4x"
);

$url = "https://api.twitter.com/1.1/statuses/user_timeline.json";
$getfield = '?user_id=Chfiaz3&count=10';
$requestMethod = 'GET';
$twitter = new TwitterAPIExchange($settings);
$string = json_decode($twitter->setGetfield($getfield)
             ->buildOauth($url, $requestMethod)
             ->performRequest(),$assoc = TRUE);
if($string["errors"][0]["message"] != "") {echo "<h3>Sorry, there was a problem.</h3><p>Twitter returned the following error message:</p><p><em>".$string[errors][0]["message"]."</em></p>";exit();}
//echo "<pre>";
//print_r($string);
echo $_GET['callback'] . "(" . json_encode($string) . ");";
//print_r($string);
//echo "</pre>";

?>