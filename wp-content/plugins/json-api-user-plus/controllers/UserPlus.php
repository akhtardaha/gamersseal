<?php

/*
  Controller name: UserPlus
  Controller description: User Registration, User Authentication, User Info, User Meta, FB Login, Avatar Update, BuddyPress xProfile Fields methods
  Controller Author: Ali Qureshi
  Controller Author Twitter: @parorrey
  Controller Author Website: parorrey.com
  
  updated: 2015-03-21
*/
class JSON_API_UserPlus_Controller {
	var $disable_nonce;
	
public function __construct() {
		global $json_api;
	$jaup_options = get_option( 'wp_jaup_settings' );
	
	$this->disable_nonce = $jaup_options['nonce'];
	
		if (!$json_api->query->key || $json_api->query->key != $jaup_options['wp_jaup_api']) {
			$json_api->error("You must include a valid 'key' var in your request.");
		}
		
	}
	
public function info(){	  

	  	global $json_api;

   		return array(
				"version" => JAUP_VERSION_NUM				
		   );	   

	  } 		

public function email_exists(){
  global $json_api;	
  
   if (!$json_api->query->email) {
			$json_api->error("You must include 'email' var in your request. ");
		}
	else {
		$email = $json_api->query->email;
	if ( !is_email( $email ) ) {
   	 $json_api->error("E-mail address is invalid.");
             }
    elseif (email_exists($email)) {

	 $json_api->error("E-mail address is already in use.");

          }	
   else $response = $email.' address is available for registration.';	
	 
	 
	}  
  
  return array('msg'=>$response);
  
  }
  
public function username_exists(){
  global $json_api;	
  
   if (!$json_api->query->username) {
			$json_api->error("You must include 'username' var in your request.");
		}
	else {
	
	//Add usernames we don't want used

$invalid_usernames = array( 'admin' );
	
		$username = sanitize_user($json_api->query->username);
	
	if ( !validate_username( $username ) || in_array( $username, $invalid_usernames ) ) {
  $json_api->error("Username is invalid.");  
        }
	elseif ( username_exists( $username ) )  $json_api->error("Username already exists.");
      	
   else $response = $username.' is available for registration.';
	 
	}  
  
  return array('msg'=>$response);
  
 }

public function register(){

	global $json_api;	  

   if (!$json_api->query->username) {
			$json_api->error("You must include 'username' var in your request. ");
		}
	else $username = sanitize_user( $json_api->query->username );
	
 
  if (!$json_api->query->email) {
			$json_api->error("You must include 'email' var in your request. ");
		}
	else $email = sanitize_email( $json_api->query->email );

 
 if(!$this->disable_nonce){
 if (!$json_api->query->nonce) {
			$json_api->error("You must include 'nonce' var in your request. Use the 'get_nonce' Core API method. ");
		}
 else $nonce =  sanitize_text_field( $json_api->query->nonce ) ;
 
 $nonce_id = $json_api->get_nonce_id('userplus', 'register');

 if( !wp_verify_nonce($json_api->query->nonce, $nonce_id) ) {

    $json_api->error("Invalid access, unverifiable 'nonce' value. Use the 'get_nonce' Core API method. ");
        }
 }
 
 
 if (!$json_api->query->display_name) {
			$json_api->error("You must include 'display_name' var in your request. ");
		}
	else $display_name = sanitize_text_field( $json_api->query->display_name );

$user_pass = sanitize_text_field( $_REQUEST['user_pass'] );

//Add usernames we don't want used

$invalid_usernames = array( 'admin' );

//Do username validation

	if ( !validate_username( $username ) || in_array( $username, $invalid_usernames ) ) {

  $json_api->error("Username is invalid.");
  
        }

    elseif ( username_exists( $username ) ) {

    $json_api->error("Username already exists.");

           }			

	else{


	if ( !is_email( $email ) ) {
   	 $json_api->error("E-mail address is invalid.");
             }
    elseif (email_exists($email)) {

	 $json_api->error("E-mail address is already in use.");

          }			

else {

	//Everything has been validated, proceed with creating the user

//Create the user

if( !isset($_REQUEST['user_pass']) ) {
	 $user_pass = wp_generate_password();
	 $_REQUEST['user_pass'] = $user_pass;
}

 $_REQUEST['user_login'] = $username;
 $_REQUEST['user_email'] = $email;

$allowed_params = array('user_login', 'user_email', 'user_pass', 'display_name', 'user_nicename', 'user_url', 'nickname', 'first_name',
                         'last_name', 'description', 'rich_editing', 'user_registered', 'jabber', 'aim', 'yim',
						 'comment_shortcuts', 'admin_color', 'use_ssl', 'show_admin_bar_front'
                   );


foreach($_REQUEST as $field => $value){
		
	if( in_array($field, $allowed_params) ) $user[$field] = trim(sanitize_text_field($value));
	
    }

if(!$_REQUEST['skip_role']) $user['role'] = get_option('default_role');

$user_id = wp_insert_user( $user );

/*Send e-mail to admin and new user - 
You could create your own e-mail instead of using this function*/

if( isset($_REQUEST['user_pass']) && $_REQUEST['notify']=='no') {
	$notify = false;	
  }else $notify = true;


if($user_id && $notify) wp_new_user_notification( $user_id, $user_pass );	  

			}
		} 


	
	$expiration = time() + apply_filters('auth_cookie_expiration', 1209600, $user_id, true);

	$cookie = wp_generate_auth_cookie($user_id, $expiration, 'logged_in');

 return array( 
          "cookie" => $cookie,	
		  "user_id" => $user_id	
		  ); 		  

  }    

public function get_avatar(){	  

	  	global $json_api;

if (function_exists('bp_is_active')) {	

    if (!$json_api->query->user_id) {
			$json_api->error("You must include 'user_id' var in your request. ");
		}
		
	  if (!$json_api->query->type) {
			$json_api->error("You must include 'type' var in your request. possible values 'full' or 'thumb' ");
		}

		
$avatar	= bp_core_fetch_avatar ( array( 'item_id' => $json_api->query->user_id, 'type' => $json_api->query->type, 'html'=>false ));

        return array('avatar'=>$avatar);	
   } else {
	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	  
	  }
  
	 } 

public function get_userinfo(){	  

	  	global $json_api;

    if (!$json_api->query->user_id) {
			$json_api->error("You must include 'user_id' var in your request. ");
		}

		$user = get_userdata($json_api->query->user_id);

        preg_match('|src="(.+?)"|', get_avatar( $user->ID, 32 ), $avatar);		

		return array(
				"id" => $user->ID,
				//"username" => $user->user_login,
				"nicename" => $user->user_nicename,
				//"email" => $user->user_email,
				"url" => $user->user_url,
				"displayname" => $user->display_name,
				"firstname" => $user->user_firstname,
				"lastname" => $user->last_name,
				"nickname" => $user->nickname,
				"avatar" => $avatar[1]
		   );	   

	  }   

public function retrieve_password(){

    global $wpdb, $json_api, $wp_hasher;  

   if (!$json_api->query->user_login) {

			$json_api->error("You must include 'user_login' var in your request. ");

		}

    $user_login = $json_api->query->user_login;

  if ( strpos( $user_login, '@' ) ) {

        $user_data = get_user_by( 'email', trim( $user_login ) );

        if ( empty( $user_data ) )

        

	 $json_api->error("Your email address not found! ");

		

    } else {

        $login = trim($user_login);

        $user_data = get_user_by('login', $login);

    }



    // redefining user_login ensures we return the right case in the email

    $user_login = $user_data->user_login;

    $user_email = $user_data->user_email;


    do_action('retrieve_password', $user_login);


    $allow = apply_filters('allow_password_reset', true, $user_data->ID);

    if ( ! $allow )  $json_api->error("password reset not allowed! ");        

    elseif ( is_wp_error($allow) )  $json_api->error("An error occured! "); 



    $key = wp_generate_password( 20, false );

    do_action( 'retrieve_password_key', $user_login, $key );



    if ( empty( $wp_hasher ) ) {

        require_once ABSPATH . 'wp-includes/class-phpass.php';

        $wp_hasher = new PasswordHash( 8, true );

    }

    $hashed = $wp_hasher->HashPassword( $key );

    $wpdb->update( $wpdb->users, array( 'user_activation_key' => $hashed ), array( 'user_login' => $user_login ) );



    $message = __('Someone requested that the password be reset for the following account:') . "\r\n\r\n";

    $message .= network_home_url( '/' ) . "\r\n\r\n";

    $message .= sprintf(__('Username: %s'), $user_login) . "\r\n\r\n";

    $message .= __('If this was a mistake, just ignore this email and nothing will happen.') . "\r\n\r\n";

    $message .= __('To reset your password, visit the following address:') . "\r\n\r\n";

    $message .= '<' . network_site_url("wp-login.php?action=rp&key=$key&login=" . rawurlencode($user_login), 'login') . ">\r\n";



    if ( is_multisite() )

        $blogname = $GLOBALS['current_site']->site_name;

    else

        $blogname = wp_specialchars_decode(get_option('blogname'), ENT_QUOTES);



    $title = sprintf( __('[%s] Password Reset'), $blogname );



    $title = apply_filters('retrieve_password_title', $title);

    $message = apply_filters('retrieve_password_message', $message, $key);



    if ( $message && !wp_mail($user_email, $title, $message) )

       $json_api->error("The e-mail could not be sent. Possible reason: your host may have disabled the mail() function...");

	else     

   return array(

    "msg" => 'Link for password reset has been emailed to you. Please check your email.',

		  );	    

     } 

public function validate_auth_cookie() {

		global $json_api;

		if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' authentication cookie. Use the `create_auth_cookie` method.");

		}		

    	$valid = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in') ? true : false;

		return array(

			"valid" => $valid

		);

	}

public function generate_auth_cookie() {
		
		global $json_api;

/*
		$nonce_id = $json_api->get_nonce_id('userplus', 'generate_auth_cookie');

		if (!wp_verify_nonce($json_api->query->nonce, $nonce_id)) {

			$json_api->error("Your 'nonce' value was incorrect. Use the 'get_nonce' API method.");
		}
*/

		if (!$json_api->query->username) {

			$json_api->error("You must include a 'username' var in your request.");

		}


		if (!$json_api->query->password) {

			$json_api->error("You must include a 'password' var in your request.");

		}	
		
		if ($json_api->query->seconds) 	$seconds = (int) $json_api->query->seconds;

		else $seconds = 1209600;//14 days



    	$user = wp_authenticate($json_api->query->username, $json_api->query->password);

    	if (is_wp_error($user)) {

    		$json_api->error("Invalid username and/or password.", 'error', '401');

    		remove_action('wp_login_failed', $json_api->query->username);

    	}


    	$expiration = time() + apply_filters('auth_cookie_expiration', $seconds, $user->ID, true);

    	$cookie = wp_generate_auth_cookie($user->ID, $expiration, 'logged_in');

		preg_match('|src="(.+?)"|', get_avatar( $user->ID, 32 ), $avatar);	

		return array(
			"cookie" => $cookie,
			"cookie_name" => LOGGED_IN_COOKIE,
			"user" => array(
				"id" => $user->ID,
				"username" => $user->user_login,
				"nicename" => $user->user_nicename,
				"email" => $user->user_email,
				"url" => $user->user_url,
				"registered" => $user->user_registered,
				"displayname" => $user->display_name,
				"firstname" => $user->user_firstname,
				"lastname" => $user->last_name,
				"nickname" => $user->nickname,
				"description" => $user->user_description,
				"capabilities" => $user->wp_capabilities,
				"avatar" => $avatar[1]

			),
		);
	}

public function get_currentuserinfo() {

		global $json_api;

		if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");

		}
		
		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		

		if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` method.");
		}

		$user = get_userdata($user_id);

        preg_match('|src="(.+?)"|', get_avatar( $user->ID, 32 ), $avatar);

		

		return array(

			"user" => array(

				"id" => $user->ID,

				"username" => $user->user_login,

				"nicename" => $user->user_nicename,

				"email" => $user->user_email,

				"url" => $user->user_url,

				"registered" => $user->user_registered,

				"displayname" => $user->display_name,

				"firstname" => $user->user_firstname,

				"lastname" => $user->last_name,

				"nickname" => $user->nickname,

				"description" => $user->user_description,

				"capabilities" => $user->wp_capabilities,

				"avatar" => $avatar[1]

			)

		);

	}	
	
public function add_post() {
    global $json_api;

foreach($_REQUEST as $key=>$val) $_REQUEST[$key] = urldecode($val);

	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}
	
	
	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
	//echo '$user_id: '.$user_id;	
	
		if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` method.");
		}
	
	if (!user_can($user_id,'edit_posts')) {
    $json_api->error("You need to login with a user capable of creating posts.");
      }
		
	
    if(!$this->disable_nonce){
 if (!$json_api->query->nonce) {
			$json_api->error("You must include 'nonce' var in your request. Use the 'get_nonce' Core API method. ");
		}
 else $nonce =  sanitize_text_field( $json_api->query->nonce ) ;
 
 $nonce_id = $json_api->get_nonce_id('userplus', 'add_post');

 if( !wp_verify_nonce($json_api->query->nonce, $nonce_id) ) {

    $json_api->error("Invalid access, unverifiable 'nonce' value. Use the 'get_nonce' Core API method. ");
        }
 }
    	
	
	if (!$json_api->query->title) {
      $json_api->error("You must include 'title' value to create post.");
    }
	
	if (!$json_api->query->content) {
      $json_api->error("You must include 'content' value to create post.");
    }
	
	if (!$json_api->query->status) {
      $json_api->error("You must include 'status' value to create post. 'draft' or 'publish'");
    }
	
   
	$post = new JSON_API_Post();
	
	$user_info = get_userdata($user_id);	
	$_REQUEST['author'] = $user_info->user_nicename;
	
	$id = $post->create($_REQUEST);	
	
	
    if (empty($id)) {
      $json_api->error("Could not create post.");
    }else {		
	add_post_meta($post->id, "_thumbnail_id", $post->attachments[0]->id);	
		}
	
	//print_r($post);
	
		
    return array(
      'post' => $post
    );
  } 
  
public function update_post() {
    global $json_api;

foreach($_REQUEST as $key=>$val) $_REQUEST[$key] = urldecode($val);

 	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}	
	
	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
	//echo '$user_id: '.$user_id;	
	
		if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` method.");
		}
	
	  if(!$this->disable_nonce){
 if (!$json_api->query->nonce) {
			$json_api->error("You must include 'nonce' var in your request. Use the 'get_nonce' Core API method. ");
		}
 else $nonce =  sanitize_text_field( $json_api->query->nonce ) ;
 
 $nonce_id = $json_api->get_nonce_id('userplus', 'update_post');

 if( !wp_verify_nonce($json_api->query->nonce, $nonce_id) ) {

    $json_api->error("Invalid access, unverifiable 'nonce' value. Use the 'get_nonce' Core API method. ");
        }
 }
		
   $post = $json_api->introspector->get_current_post();
    if (empty($post)) {
      $json_api->error("Post not found. wrong post_id provided.");
    }
  
  
    if (!$json_api->query->post_id || !$json_api->query->slug) {
      $json_api->error("You must include a 'post_id' to update post. ");
    }
	
	
	$author = get_post_field( 'post_author', $json_api->query->post_id );
	
	if ($author!=$user_id || !user_can($user_id,'edit_posts') ) {
    $json_api->error("You need to login with a user capable of editing posts. Only author of post or admin can update posts.");
      }
	
	if ($json_api->query->post_media=='delete') {
		
      $attachments = get_posts( array(
	        'post_type'      => 'attachment',
	        'posts_per_page' => -1,
	        'post_status'    => 'any',
	        'post_parent'    => $json_api->query->post_id
	    ) );

	    foreach ( $attachments as $attachment ) {
	        if ( false === wp_delete_attachment( $attachment->ID ) ) {
	            // Log failure to delete attachment.
	        }
	    }
    }
		
	
   nocache_headers();
    	
	$post = new JSON_API_Post( $post );
	
	$id = $post->update($_REQUEST);		
	
    if (empty($id)) {
      $json_api->error("Could not update post.");
    }else {	


	$sizeof = sizeof($post->attachments); 		
	if($sizeof) update_post_meta($post->id, "_thumbnail_id", $post->attachments[($sizeof-1)]->id);	
		}
	
	//print_r($post);
	
		
    return array(
      'post' => $post
    );
  } 
  
public function delete_post() {
    global $json_api;

foreach($_REQUEST as $key=>$val) $_REQUEST[$key] = urldecode($val);

 	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}	
	
	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
	//echo '$user_id: '.$user_id;	
	
		if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` method.");
		}
	
	  if(!$this->disable_nonce){
 if (!$json_api->query->nonce) {
			$json_api->error("You must include 'nonce' var in your request. Use the 'get_nonce' Core API method. ");
		}
 else $nonce =  sanitize_text_field( $json_api->query->nonce ) ;
 
 $nonce_id = $json_api->get_nonce_id('userplus', 'delete_post');

 if( !wp_verify_nonce($json_api->query->nonce, $nonce_id) ) {

    $json_api->error("Invalid access, unverifiable 'nonce' value. Use the 'get_nonce' Core API method. ");
        }
 }
		
   $post = $json_api->introspector->get_current_post();
    if (empty($post)) {
      $json_api->error("Post not found. wrong post_id provided.");
    }
  
  
    if (!$json_api->query->post_id ) {
      $json_api->error("You must include a 'post_id' to delete post. ");
    }

	//$author = get_post_field( 'post_author', $json_api->query->post_id );
	
	
	if ( !user_can($user_id, 'delete_posts') ) {
    $json_api->error("You need to login with a user capable of deleting posts.");
      }
	  
	
	
  if ($json_api->query->post_media=='delete') {
		
      $attachments = get_posts( array(
	        'post_type'      => 'attachment',
	        'posts_per_page' => -1,
	        'post_status'    => 'any',
	        'post_parent'    => $json_api->query->post_id
	    ) );

	    foreach ( $attachments as $attachment ) {
	        if ( false === wp_delete_attachment( $attachment->ID ) ) {
	            // Log failure to delete attachment.
	        }
	    }
   
  }
	
   nocache_headers();
    	
	$post = new JSON_API_Post( $post );
	
	  if ($json_api->query->force_delete) {
		 $id =  wp_delete_post($json_api->query->post_id, true);
		  
	  }else {
		  $id =  wp_delete_post($json_api->query->post_id);
	  }
	
    if (empty($id)) {
      $json_api->error("Could not delete post.");
    }	//print_r($post);
			
    return array('post'=>$id);
  }		
	  
public function get_user_meta() {
	 
	  global $json_api;
	  
	  if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	if (!$user_id) 	$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
	
 $meta_key = sanitize_text_field($json_api->query->meta_key);	
  
		  
		if($meta_key) $data[$meta_key] = get_user_meta(  $user_id, $meta_key);
		else {
		// Get all user meta data for $user_id
			$meta = get_user_meta( $user_id );

			// Filter out empty meta data
			$data = array_filter( array_map( function( $a ) {
					return $a[0];
					}, $meta ) );

     	 }
//d($data);
	   return $data;
	    
	  
	  }
	  
public function update_user_meta() {
	 
	  global $json_api;
	  
	   if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	if (!$user_id) 	$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		
		
   if (!$json_api->query->meta_key) $json_api->error("You must include a 'meta_key' var in your request.");
		
		else $meta_key = $json_api->query->meta_key;	
  
   if (!$json_api->query->meta_value) {
			$json_api->error("You must include a 'meta_value' var in your request. You may provide multiple values separated by comma for 'meta_value' var.");
		}
		else $meta_value = sanitize_text_field($json_api->query->meta_value);
  
  if( strpos($meta_value,',') !== false ) {
		$meta_values = explode(",", $meta_value);
	   $meta_values = array_map('trim',$meta_values);

	   $data['updated'] = update_user_meta(  $user_id, $meta_key, $meta_values);
	   }
 else $data['updated'] = update_user_meta(  $user_id, $meta_key, $meta_value); 
	   
	   return $data;	    
	  
	  }
	  
public function delete_user_meta() {
	 
	  global $json_api;
	  
	   if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	if (!$user_id) 	$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		
		
   if (!$json_api->query->meta_key) $json_api->error("You must include a 'meta_key' var in your request.");
		
		else $meta_key = $json_api->query->meta_key;	
  
   if (!$json_api->query->meta_value) {
			$json_api->error("You must include a 'meta_value' var in your request.");
		}
		else $meta_value = sanitize_text_field($json_api->query->meta_value);
  

		$data['deleted'] = delete_user_meta(  $user_id, $meta_key, $meta_value);
		
	   return $data;	    
	  
	  }
	  
public function xprofile() {
	 
	  global $json_api;
	  
if (function_exists('bp_is_active')) {	

	  if (!$json_api->query->user_id) {
			$json_api->error("You must include a 'user_id' var in your request.");
		}
		else $user_id = $json_api->query->user_id;
	
		
   if (!$json_api->query->field) {
			$json_api->error("You must include a 'field' var in your request. Use 'field=default' for all default fields.");
		}
	  elseif ($json_api->query->field=='default') {
			$field_label='First Name, Last Name, Bio';/*you should add your own field labels here for quick viewing*/
		}	
		else $field_label = sanitize_text_field($json_api->query->field);	
  
  
  $fields = explode(",", $field_label);
  
  if(is_array($fields)){
	  
	  foreach($fields as $k){
		  
		  $fields_data[$k] = xprofile_get_field_data( $k, $user_id );
		  
		  }
	
	   return $fields_data;
	    
	  
	  }
	
   }
   
  else {
	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	  
	  }

  }

public function xprofile_update() {
	 
	  global $json_api;	

if (function_exists('bp_is_active')) {	
	
	  if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
//	echo '$user_id: '.$user_id;	
	
		if (!$user_id) {
			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		}


foreach($_REQUEST as $field => $value){
		
	if($field=='cookie') continue;
	
	$field_label = str_replace('_',' ',$field);
	
	if( strpos($value,',') !== false ) {
		$values = explode(",", $value);
	   $values = array_map('trim',$values);
	   }
	else $values = trim($value);
	//echo 'field-values: '.$field.'=>'.$value;
	//d($values);
  
  $result[$field_label]['updated'] = xprofile_set_field_data( $field_label,  $user_id, $values, $is_required = true ); 
  
}

	 return $result;
   }
   
  else {
	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	  
	  }

  }  
  
public function fb_connect(){
	  
	    global $json_api;
		
		if ($json_api->query->fields) {

			$fields = $json_api->query->fields;

		}else $fields = 'id,name,first_name,last_name,email';
		
		if ($json_api->query->ssl) {
			 $enable_ssl = $json_api->query->ssl;
		}else $enable_ssl = true;
	
	if (!$json_api->query->access_token) {
			$json_api->error("You must include a 'access_token' variable. Get the valid access_token for this app from Facebook API.");
		}else{
			
$url='https://graph.facebook.com/me/?fields='.$fields.'&access_token='.$json_api->query->access_token;
	
	//  Initiate curl
$ch = curl_init();
// Enable SSL verification
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, $enable_ssl);
// Will return the response, if false it print the response
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
// Set the url
curl_setopt($ch, CURLOPT_URL,$url);
// Execute
$result=curl_exec($ch);
// Closing
curl_close($ch);

	$result = json_decode($result, true);
	
   if(isset($result["email"])){
          
            $user_email = $result["email"];
           	$email_exists = email_exists($user_email);
			
			if($email_exists) {
				$user = get_user_by( 'email', $user_email );
			  $user_id = $user->ID;
			  $user_name = $user->user_login;
			 }
			
         
		   
		    if ( !$user_id && $email_exists == false ) {
				
			  $user_name = strtolower($result['first_name'].'.'.$result['last_name']);
               				
				while(username_exists($user_name)){		        
				$i++;
				$user_name = strtolower($result['first_name'].'.'.$result['last_name']).'.'.$i;			     
	
					}
				
			 $random_password = wp_generate_password( $length=12, $include_standard_special_chars=false );
      		   $userdata = array(
                           'user_login'    => $user_name,
						   'user_email'    => $user_email,
                           'user_pass'  => $random_password,
						   'display_name'  => $result["name"],
						   'first_name'  => $result['first_name'],
						   'last_name'  => $result['last_name']
                                     );

                   $user_id = wp_insert_user( $userdata ) ;				   
				 if($user_id) $user_account = 'user registered.';
				 
            } else {
				
				 if($user_id) $user_account = 'user logged in.';
				}
			
			 $expiration = time() + apply_filters('auth_cookie_expiration', 1209600, $user_id, true);
    	     $cookie = wp_generate_auth_cookie($user_id, $expiration, 'logged_in');
        
		$response['msg'] = $user_account;
		$response['wp_user_id'] = $user_id;
		$response['cookie'] = $cookie;
		$response['user_login'] = $user_name;	
		
		}
		else {
			$response['msg'] = "Your 'access_token' did not return email of the user. Without 'email' user can't be logged in or registered. Get user email extended permission while joining the Facebook app.";

			}
	
	}	

return $response;
	  
	  }
 
public function post_comment(){
   global $json_api;

  if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
	
		if (!$user_id) {
			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		}

 if ( !$json_api->query->post_id ) {
  $json_api->error("No post specified. Include 'post_id' var in your request.");
  } elseif (!$json_api->query->content ) {
  $json_api->error("Please include 'content' var in your request.");
  }
  
  if (!$json_api->query->comment_status ) {
  $json_api->error("Please include 'comment_status' var in your request. Possible values are '1' (approved) or '0' (not-approved)");
  }else $comment_approved = $json_api->query->comment_status;

$user_info = get_userdata(  $user_id );

 $time = current_time('mysql');
 $agent = $_SERVER['HTTP_USER_AGENT'];
 $ip=$_SERVER['REMOTE_ADDR'];

    $data = array(
  'comment_post_ID' => $json_api->query->post_id,
  'comment_author' => $user_info->user_login,
  'comment_author_email' => $user_info->user_email,
  'comment_author_url' => $user_info->user_url,
  'comment_content' => $json_api->query->content,
  'comment_type' => '',
  'comment_parent' => 0,
  'user_id' => $user_info->ID,
  'comment_author_IP' =>  $ip,
  'comment_agent' => $agent,
  'comment_date' => $time,
  'comment_approved' => $comment_approved,
   );

//print_r($data);

 $comment_id = wp_insert_comment($data);
 
 return array(
             "comment_id" => $comment_id
             );    
   }
	  
public function profile() { 

   global $json_api;
        $oReturn = new stdClass();
	  
if (function_exists('bp_is_active')) {	

	global $bp;
	
	  if (!$json_api->query->user_id) {
			$json_api->error("You must include a 'user_id' var in your request.");
		}
		else $user_id = $json_api->query->user_id;



        if (!bp_has_profile(array('user_id' => $user_id))) {

            return $this->error('xprofile', 0);
			$json_api->error("$user_id does not have BuddPress profile.");

        }



        while (bp_profile_groups(array('user_id' => $user_id))) {

            bp_the_profile_group();

            if (bp_profile_group_has_fields()) {

                $sGroupName = bp_get_the_profile_group_name();

                while (bp_profile_fields()) {

                    bp_the_profile_field();

                    $sFieldName = bp_get_the_profile_field_name();

                    if (bp_field_has_data()) {

                        $sFieldValue = bp_get_the_profile_field_edit_value();

                    }

                    $oReturn->profileGroups->$sGroupName->$sFieldName = $sFieldValue;

                }

            }

        }

        return $oReturn;

    }else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
   }
   
public function friends() { 
		global $json_api;
        
        $oReturn = new stdClass();

  if (function_exists('bp_is_active')) {	

    if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}

        $sFriends = bp_get_friend_ids($user_id);
        $aFriends = explode(",", $sFriends);
       
		if ($aFriends[0] == "") $json_api->error("No friend found.");
		
        foreach ($aFriends as $sFriendID) {
			 $aTemp = new stdClass();
            $oUser = get_user_by('id', $sFriendID);
            $aTemp->user_id = $oUser->data->ID;
			$aTemp->username = $oUser->data->user_login;
            $aTemp->display_name = $oUser->data->display_name;
            $aTemp->avatar = bp_core_fetch_avatar(array('item_id'=>$oUser->data->ID,'html'=>false));;
			
			$oReturn->friends[] = $aTemp;
        }
        $oReturn->count = count($aFriends);
       
		}else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
	    return $oReturn;
    }
	
public function threads() { 
     global $json_api;
        $oReturn = new stdClass();
	
	if (function_exists('bp_is_active')) {	

	
	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
	
	//d(get_userdata( $user_id ));
	
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
			
	$box = 'inbox';
	$per_page = 10;
	$page = 1;
	$type = 'all';

	
	 if ($json_api->query->box) $box = $json_api->query->box;	 
	 if ($json_api->query->per_page) $per_page = $json_api->query->per_page;	 
	 //if ($json_api->query->limit) $limit = $json_api->query->limit;
	  if ($json_api->query->search) $search_terms = $json_api->query->search; else $search_terms = '';
	   if ($json_api->query->page) $page = $json_api->query->page;
	    if ($json_api->query->tsort) $tsort = $json_api->query->tsort; else $tsort = 'desc';
		 if ($json_api->query->msort) $msort = $json_api->query->msort; else $msort = 'desc';
	   
	    if ($json_api->query->sender_id) $sender_id = $json_api->query->sender_id;
	
	$limit = $per_page;
	
	      global $wpdb, $bp;
   
           $user_id_sql = $pag_sql = $type_sql = $search_sql = '';
   
           if ( $limit && $page ) {
               $pag_sql = $wpdb->prepare( " LIMIT %d, %d", intval( ( $page - 1 ) * $limit), intval( $limit ) );
           }
   
           if ( $type == 'unread' ) {
               $type_sql = " AND r.unread_count != 0 ";
           } elseif ( $type == 'read' ) {
               $type_sql = " AND r.unread_count = 0 ";
           }
  
           if ( ! empty( $search_terms ) ) {
               $search_terms_like = '%' . bp_esc_like( $search_terms ) . '%';
               $search_sql        = $wpdb->prepare( "AND ( subject LIKE %s OR message LIKE %s )", $search_terms_like, $search_terms_like );
           }
   
           if ( 'sentbox' == $box ) {
               $user_id_sql = $wpdb->prepare( 'm.sender_id = %d', $user_id );
               $thread_ids  = $wpdb->get_results( "SELECT m.thread_id, MAX(m.date_sent) AS date_sent FROM {$bp->messages->table_name_recipients} r, {$bp->messages->table_name_messages} m WHERE m.thread_id = r.thread_id AND m.sender_id = r.user_id AND {$user_id_sql} AND r.is_deleted = 0 {$search_sql} GROUP BY m.thread_id ORDER BY date_sent DESC {$pag_sql}" );
               $total_threads = $wpdb->get_var( "SELECT COUNT( DISTINCT m.thread_id ) FROM {$bp->messages->table_name_recipients} r, {$bp->messages->table_name_messages} m WHERE m.thread_id = r.thread_id AND m.sender_id = r.user_id AND {$user_id_sql} AND r.is_deleted = 0 {$search_sql} " );
           } else {
               $user_id_sql = $wpdb->prepare( 'r.user_id = %d', $user_id );
			   
			   if($sender_id) $sender_sql = " AND m.sender_id=$sender_id";
			   
			   $my_query = "SELECT m.thread_id, MAX(m.date_sent) AS date_sent FROM {$bp->messages->table_name_recipients} r, {$bp->messages->table_name_messages} m WHERE m.thread_id = r.thread_id $sender_sql AND r.is_deleted = 0 AND {$user_id_sql} AND r.sender_only = 0 {$type_sql} {$search_sql} GROUP BY m.thread_id ORDER BY date_sent DESC {$pag_sql}";
			   

			   
               $thread_ids = $wpdb->get_results( $my_query );
               $total_threads = $wpdb->get_var( "SELECT COUNT( DISTINCT m.thread_id ) FROM {$bp->messages->table_name_recipients} r, {$bp->messages->table_name_messages} m WHERE m.thread_id = r.thread_id $sender_sql AND r.is_deleted = 0 AND {$user_id_sql} AND r.sender_only = 0 {$type_sql} {$search_sql}" );
           }
   
           if ( empty( $thread_ids ) ) {
               return false;
           }
   
           // Sort threads by date_sent
		   
		   
		   
           foreach( (array) $thread_ids as $thread ) {
               $sorted_threads[$thread->thread_id] = strtotime( $thread->date_sent );
           }
   
        //   
		   
    if($tsort=='desc') asort( $sorted_threads );
    else arsort( $sorted_threads );
   
   
           $threads = false;
           foreach ( (array) $sorted_threads as $thread_id => $date_sent ) {
             $threads[] = new BP_Messages_Thread( $thread_id );			
			 
         }
          
		//d($threads);
		  
		  foreach($threads as $t){
			  $tmp = new stdClass();
			  
//d($t->messages);	
//if($msort=='desc') usort($t->messages, 'pim_sort_by_id');
//else uasort($t->messages, 'pim_sort_by_id');
//d($t->messages);			
		//d($t->messages);
		
			// if($recipient_id && !in_array($recipient_id, $t->sender_ids)) continue;
			 
				$tmp->thread_id = $t->thread_id;
				//$tmp->unread_count = $t->unread_count;								
				$tmp->messages =  $t->messages;
				$tmp->recipients = array_values($t->recipients);
				$tmp->sender_ids = array_values($t->sender_ids);  
								 
				$reindexed_threads[] = $tmp;
				//d($t->recipients);
			  }
		  
		  
        $oReturn = array( 'threads' => $reindexed_threads, 
		                  'total_pages' => ceil((int)$total_threads/$per_page), 
						  'current_page' => (int)$page,
						  'total_threads' => (int) $total_threads );
   
		}else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
        return $oReturn;
    }

public function thread() { 
     global $json_api;
        $oReturn = new stdClass();
	
	if (function_exists('bp_is_active')) {	

	
	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
	
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
		
	 if (!$json_api->query->thread_id) {
			$json_api->error("You must include a 'thread_id' var in your request. Use the messages end point to get thread_id.");
		}else $thread_id = $json_api->query->thread_id;	

  if (!messages_check_thread_access( $thread_id, $user_id) ) {
			$json_api->error("Invalid Access. User does not have access to this thread.");
		}	
  

 $aParams ['thread_id'] = $thread_id;	
 $aParams ['order'] = 'ASC';		

	// if ($json_api->query->order) $aParams ['order'] = $json_api->query->order;
	 
		//print_r($aParams);

        if (bp_thread_has_messages($aParams)) {
			
			$oReturn->thread_subject = bp_get_the_thread_subject(); 

			messages_mark_thread_read( $thread_id );
			
            while (bp_thread_messages()) {
                bp_thread_the_message();
				
                $aTemp = new stdClass();	
				 
				$aTemp->message_id = bp_get_the_thread_message_id();
				$aTemp->sender_id = (int) messages_get_message_sender( $aTemp->message_id );
				$aTemp->time_since =  bp_get_the_thread_message_time_since();
				$aTemp->date_sent =  pim_bp_get_message_date($aTemp->message_id);
                $aTemp->message = strip_tags(bp_get_the_thread_message_content());
                            		
				$users[] = $aTemp->sender_id;				
				
			   $oReturn->thread_messages[] = $aTemp;
			
            }
        } else {
            $json_api->error("No message available.");
        }
		
		}else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
        
		
		$users = array_unique($users);
		
		foreach($users as $k){
			 $aUser = new stdClass();
			 $aUser->user_id = $k;
			 $aUser->avatar = bp_core_fetch_avatar(array('item_id'=>$k,'html'=>false));;
			 
			 $oReturn->thread_users[]= $aUser;
			}
		
		
		return $oReturn;
    }
  
public function new_message() { 
    global $json_api;    	
	
  if (function_exists('bp_is_active')) {	
	
	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
	
	if (empty($json_api->query->recipient_ids)) {
      $json_api->error("No recipient specified. Include `recipient_ids` var in your request.");
    } elseif (empty($json_api->query->subject)) {
      $json_api->error("No subject specified. Include `subject` var in your request.");
    }elseif (empty($json_api->query->content)) {
      $json_api->error("No content specified. Include `content` var in your request.");
    }

	$sender_id = $user_id;	
	$recipient_ids =  array_map('trim',explode(",", $_REQUEST['recipient_ids']));
	$subject =  sanitize_text_field( $_REQUEST['subject'] );
	$content =  sanitize_text_field( $_REQUEST['content'] );
	$thread_id =  sanitize_text_field( $_REQUEST['thread_id'] );
	
	if($thread_id){ 
	if (!messages_check_thread_access( $thread_id, $user_id) ) {
			$json_api->error("Invalid Access. User does not have access to this thread.");
		}
	}
	
	$args = array(
	          'sender_id' =>$sender_id,
			  'recipients'=>$recipient_ids,
	          'subject'=>$subject,
			  'content'=>$content,
			  'thread_id'=>$thread_id			  
	        );
	
//d($args);

	
    $message_thread_id = messages_new_message( $args );
	

    
	return array(
	       "sender_id" => $args['sender_id'],
		   "recipient_id" => $args['recipients'],
	       "message_thread_id" => $message_thread_id
		  ); 
	 }else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }  
   }
   
public function mark_thread_read(){ 
	    global $json_api;  
		  	
	if (function_exists('bp_is_active')) {	
	
	global $bp, $wpdb;	
		 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
		
		
	 if (!$json_api->query->thread_id) {
			$json_api->error("You must include a 'thread_id' var in your request.");
		}else $thread_id = $json_api->query->thread_id;	

  if (!messages_check_thread_access( $thread_id, $user_id) ) {
			$json_api->error("Invalid Access. User does not have access to this thread.");
		}	
	  
	  // $action = BP_Messages_Thread::mark_as_read( $thread_id ); 
	   
	   $sql = $wpdb->prepare( "UPDATE {$bp->messages->table_name_recipients} SET unread_count = 0 WHERE user_id = %d AND thread_id = %d", $user_id, $thread_id );
	   
	$action = $wpdb->query($sql);

		wp_cache_delete( $user_id, 'bp_messages_unread_count' );
	   
	  
	   return array('mark_read'=>$action);
	   
	   }else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
	   
	 }

public function mark_thread_unread(){ 
	    global $json_api;  
		  	
	if (function_exists('bp_is_active')) {	
	global $bp, $wpdb;	
	
		 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
		
		
	 if (!$json_api->query->thread_id) {
			$json_api->error("You must include a 'thread_id' var in your request.");
		}else $thread_id = $json_api->query->thread_id;	

  if (!messages_check_thread_access( $thread_id, $user_id) ) {
			$json_api->error("Invalid Access. User does not have access to this thread.");
		}	
	  
	   $sql = $wpdb->prepare( "UPDATE {$bp->messages->table_name_recipients} SET unread_count = 1 WHERE user_id = %d AND thread_id = %d", $user_id, $thread_id );

   wp_cache_delete( $user_id, 'bp_messages_unread_count' );
   
	$action = $wpdb->query($sql);	  
	  	  
	   return array('mark_unread'=>$action);
	   
	   }else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
	   
	 }
	 
public function messages_count(){ 
	    global $json_api;  
		  	
	if (function_exists('bp_is_active')) {	
	
	 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
		
	  $count =  BP_Messages_Thread::get_inbox_count($user_id);
	   
	   return array('unread'=>$count);
	   
	   }else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
	   
	 }
	 
public function avatar_upload(){ 
    global $json_api;

  if (function_exists('wp_get_image_editor')) {	
  	
	 if (!$_REQUEST['cookie']) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}
//d($_FILES);
		$user_id = wp_validate_auth_cookie(urldecode($_REQUEST['cookie']), 'logged_in');
	
//	echo '$user_id: '.$user_id;
		
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}
		
	 if (!$_FILES['avatar']) {
			$json_api->error("You must include 'avatar' file var in your POST form data.");
		}
		
  if ($_REQUEST['full']) $full = $_REQUEST['full'];
  elseif(defined( 'BP_AVATAR_FULL_WIDTH' )) $full = BP_AVATAR_FULL_WIDTH;
   else $full = 300;
  
  if ($_REQUEST['thumb']) $full = $_REQUEST['thumb'];
  elseif(defined( 'BP_AVATAR_THUMB_WIDTH' )) $thumb = BP_AVATAR_THUMB_WIDTH;
  else $thumb = 100;

 
  $uploadedfile = $_FILES['avatar'];
 
 
     if ( ! function_exists( 'wp_handle_upload' ) ) 
    require_once( ABSPATH . 'wp-admin/includes/file.php' );
	
add_filter('upload_dir', 'pim_avatar_upload_dir');
$upload_overrides = array( 'test_form' => false );

   $upload_dir = wp_upload_dir();
  
   pim_empty_avatar_dir($upload_dir['path']);//remove current avatars

$movefile = wp_handle_upload( $uploadedfile, $upload_overrides );


$avatar_file = wp_get_image_editor( $movefile['file'] );
$thumb_file = wp_get_image_editor( $movefile['file'] );
if ( ! is_wp_error( $avatar_file ) ) { 
	
	 $resized = $avatar_file->resize( $full, $full, true );
     $filename1 = $avatar_file->generate_filename( 'bpfull' );
     $img1 = $avatar_file->save($filename1);
	 
	 $resized = $thumb_file->resize( $thumb, $thumb, true );
	 $filename2 = $thumb_file->generate_filename( 'bpthumb' );
      $img2 = $thumb_file->save($filename2); 
}
unlink($movefile['file']);//delete original image

remove_filter('upload_dir', 'pim_avatar_upload_dir');


    return array( 'full'=>$upload_dir['url'].'/'.basename($filename1),
	              'thumb'=>$upload_dir['url'].'/'.basename($filename2)
				  	);
	
	}else {	  
	  $json_api->error("You must install WordPress v 3.5.0 or later to use 'avatar_upload' end point.");
	   }
	
   }
   
public function delete_account(){ 
	    global $json_api;  
		  	
	if (function_exists('bp_is_active')) {	
	
		 if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");
		}

	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
		
	if (!$user_id) {
			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");
		}

  if(!$this->disable_nonce){
 if (!$json_api->query->nonce) {
			$json_api->error("You must include 'nonce' var in your request. Use the 'get_nonce' Core API method. ");
		}
 else $nonce =  sanitize_text_field( $json_api->query->nonce ) ;
 
 $nonce_id = $json_api->get_nonce_id('userplus', 'delete_account');

 if( !wp_verify_nonce($json_api->query->nonce, $nonce_id) ) {

    $json_api->error("Invalid access, unverifiable 'nonce' value. Use the 'get_nonce' Core API method. ");
        }
 }
	  
	if ( is_super_admin( $user_id ) ) {
         $json_api->error("Website super admin cannot be deleted. ");
     }  
	  
  $action = bp_core_delete_account( $user_id ); 
	  
	   return array('deleted'=>$action);
	   
	   }else {	  
	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");
	   }
	   
	 }  
  
 }//end class