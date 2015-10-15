<?php
require_once __DIR__ . '/sdk/autoload.php';
$fb = new Facebook\Facebook([
        'app_id' => '135100593240392',
  'app_secret' => '0d22415620c386bfe5ac0f5f0e327c10',
  'default_graph_version' => 'v2.2',]);

$helper = $fb->getJavaScriptHelper();
try {
  $accessToken = $helper->getAccessToken();
} catch(Facebook\Exceptions\FacebookResponseException $e) {
  // When Graph returns an error
  echo 'Graph returned an error: ' . $e->getMessage();
  exit;
} catch(Facebook\Exceptions\FacebookSDKException $e) {
  // When validation fails or other local issues
  echo 'Facebook SDK returned an error: ' . $e->getMessage();