<?php
/*
  Controller name: UserPlus
  Controller description: User Registration, User Authentication, User Info, User Meta, FB Login, Avatar Update, BuddyPress xProfile Fields methods
  Controller Author: Umar Ashad
*/


class JSON_API_UserPlus_Controller {

	var $disable_nonce;

	var $disable_author_check;

	

public function __construct() {

		global $json_api;

	$jaup_options = get_option( 'wp_jaup_settings' );

	

	$this->disable_nonce = $jaup_options['nonce'];

	$this->disable_author_check = $jaup_options['authoring'];

	

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

public function update_user() {
	 
	  global $json_api;
	  
	   if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	if (!$user_id) 	$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		

   $userdata = array('ID' => $user_id);
  
 if($json_api->query->user_nicename) $userdata['user_nicename'] = $json_api->query->user_nicename;
  if($json_api->query->user_url) $userdata['user_url'] = $json_api->query->user_url;
   if($json_api->query->user_email) {
	  $email =  $json_api->query->user_email;
	   if ( !is_email( $email ) ) 	 $json_api->error("E-mail address is invalid.");
         elseif (email_exists($email)) $json_api->error("E-mail address is already in use.");
		 else $userdata['user_email'] =  $email;		
   }
    if($json_api->query->user_pass) $userdata['user_pass'] = $json_api->query->user_pass;
	 if($json_api->query->display_name) $userdata['display_name'] = $json_api->query->display_name;
	  if($json_api->query->nickname) $userdata['nickname'] = $json_api->query->nickname;
    if($json_api->query->last_name) $userdata['last_name'] = $json_api->query->last_name;
	
   
  $data['updated'] = wp_update_user( $userdata ); 
	   
	   return $data;	    
	  
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
	global $wpdb;

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



$allowed_params = array('user_login', 'user_email', 'user_pass', 'role', 'display_name', 'user_nicename', 'user_url', 'nickname', 'first_name',

                         'last_name', 'description', 'rich_editing', 'user_registered', 'jabber', 'aim', 'yim',

						 'comment_shortcuts', 'admin_color', 'use_ssl', 'show_admin_bar_front'

                   );





foreach($_REQUEST as $field => $value){

		

	if( in_array($field, $allowed_params) ) 
	{
		$user[$field] = trim(sanitize_text_field($value));
	}
	

    }



//if(!$_REQUEST['skip_role']) $user['role'] = get_option('default_role');



$user_id = wp_insert_user( $user );
	
	if ($json_api->query->australian_id_image) {
			$aus_id_img = $json_api->query->australian_id_image;
			$queryUpdate = "UPDATE wp_users SET ausid_img_path = '".$aus_id_img."' WHERE ID= ".$user_id." ";
	        $wpdb->query($queryUpdate);
			
		}
	
$wpdb->query("INSERT INTO wp_usermeta(user_id,meta_key,meta_value)VALUES('$user_id','is_active','n'),('$user_id','block_msg_permenant','New User Deactive')");
/*Send e-mail to admin and new user - 

You could create your own e-mail instead of using this function*/



if( isset($_REQUEST['user_pass']) && $_REQUEST['notify']=='no') {

	$notify = false;	

  }
  else 
  
  $notify = true;





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



    		$json_api->error("Invalid User name or password", 'error', '401');



    		remove_action('wp_login_failed', $json_api->query->username);



    	}
		
		if ($user->roles) {
			if ($user->roles[0] != 'preminum' && $user->roles[0] != 'standard' && $user->roles[0] != 'guest') {
    		$json_api->error("Your account has not been activated yet! please try later");
    		}
    	}
		else
		{
			$json_api->error("Your account has not been activated yet! please try later");
		}
		
		//echo '<pre>';
//		print_r($user->roles[0]);
//		die();



    	$expiration = time() + apply_filters('auth_cookie_expiration', $seconds, $user->ID, true);



    	$cookie = wp_generate_auth_cookie($user->ID, $expiration, 'logged_in');



		preg_match('|src="(.+?)"|', get_avatar( $user->ID, 512 ), $avatar);	
		
		$args = array(
			'field'   => 'ABN',
			'user_id' => $user->ID
		);
		
		$args1 = array(
			'field'   => 'State',
			'user_id' => $user->ID
		);

		$abn = bp_get_profile_field_data($args);
		$state = bp_get_profile_field_data($args1);

		

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

				"avatar" => $avatar[1],
				
				"abn" => $abn,
				
				"state" => $state

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

	

	

	if(!$this->disable_author_check){

		

	if (!user_can($user_id,'edit_posts')) {

    $json_api->error("You need to login with a user capable of creating posts.");

      }

	  

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
	
	$img = array();
	
	$sales_price = $json_api->query->sales_price;
	$stock_qty = $json_api->query->stock_qty;
	$manage_stock = $json_api->query->manage_stock;
	$delivery_time = $json_api->query->delivery_time;
	$shiping_cost = $json_api->query->shiping_cost;
	$age_limit = $json_api->query->age_limit;
	$visible = $json_api->query->visible;
	$images = $json_api->query->images;
	
	$condition = $json_api->query->condition;
	$FrontQuality = $json_api->query->FrontQuality;
	$Disk1Quality = $json_api->query->Disk1Quality;
	$Disk2Quality = $json_api->query->Disk2Quality;
	$Manual = $json_api->query->Manual;
	
	$location = $json_api->query->location;
	
	
	$img = explode( ',', $images );
	
	$wpmp_list_opts = array (
			  'tax_status' => 'taxable',
			  'tax_class' => '',
			  'weight' => '',
			  'pwidth' => '',
			  'pheight' => '',
			  'manage_stock' => $manage_stock,
			  'delivery_time' => $delivery_time,
			  'shiping_cost' => $shiping_cost,
			  'min_order' => $min_order,
			  'max_order' => $max_order,
			  'age_limit' => $age_limit,
			  'stock_qty' => $stock_qty,
			  'images1' => '',
			  'images' => $img,
			  'file1' => '',
			  'demo_site' => '',
			  'demo_admin' => '',
			  'demo_username' => '',
			  'demo_password' => '',
			  'base_price' => '',
			  'sales_price' => $sales_price,
			  'sales_price_expire' => '',
			  'variation' => 
			  array (
				1 => 
				array (
				  'vname' => '',
				  1 => 
				  array (
					'option_name' => '',
					'option_price' => '',
				  ),
				),
			  ),
			  'discount' => 
			  array (
				'guest' => '',
				'standard' => '',
				'preminum' => ''
			  ),
		);
	$this->insert_custom_fields_for_filter($post->id,$sales_price,$age_limit);
	//$wpmp_list_op = maybe_serialize($wpmp_list_opts);
	add_post_meta($post->id, "wpmp_list_opts", $wpmp_list_opts);
	
	
	add_post_meta($post->id, "stock_qty", $stock_qty);
	add_post_meta($post->id, "sales_price", $sales_price);
	add_post_meta($post->id, "manage_stock", $manage_stock);
	add_post_meta($post->id, "delivery_time", $delivery_time);
	add_post_meta($post->id, "shiping_cost", $shiping_cost);
	add_post_meta($post->id, "min_order", $min_order);
	add_post_meta($post->id, "max_order", $max_order);
	add_post_meta($post->id, "images", $img);
	add_post_meta($post->id, "age_limit", $age_limit);
	add_post_meta($post->id, "visible", $visible);
	add_post_meta($post->id, "location", $location);
	
	add_post_meta($post->id, "condition", $condition);
	add_post_meta($post->id, "FrontQuality", $FrontQuality);
	add_post_meta($post->id, "Disk1Quality", $Disk1Quality);
	add_post_meta($post->id, "Disk2Quality", $Disk2Quality);
	add_post_meta($post->id, "Manual", $Manual);
	//set_post_type($post->id,'wpmarketplace');	
	}

	

	//print_r($post);

	

	

    return array('post' => $post);

  }  

  

public function update_post() {

    global $json_api;

	$json_api->query->content = nl2br($json_api->query->content);
	
	//echo $json_api->query->content;

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

	

	if(!$this->disable_author_check){

		

	if (!user_can($user_id,'edit_posts') ) {

    $json_api->error("You need to login with a user capable of editing posts. Only author of post or admin can update posts.");

      }

	  

	}

	

	if ($author!=$user_id ) {

    $json_api->error("You need to login with a user capable of editing posts. Only author of post or admin can update posts.");

      }

	

	if ($json_api->query->post_media=='delete') {

		

      $attachments = get_posts( array(

	        'post_type'      => 'attachment',

	        'posts_per_page' => -1,

	        'post_status'    => $json_api->query->post_status,

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
		
		
	/*$my_post = array();
    $my_post['ID'] = $json_api->query->post_id;
  	$my_post['post_status'] = $json_api->query->post_status;
	// Update the post into the database
  	wp_update_post($my_post);*/
	

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

	

	if(!$this->disable_author_check){

	if ( !user_can($user_id, 'delete_posts') ) {

    $json_api->error("You need to login with a user capable of deleting posts.");

      }

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

	  

public function update_user_meta_vars() {

	 

	  global $json_api;	



	  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

//	echo '$user_id: '.$user_id;	

	

		if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}

		

	if( sizeof($_REQUEST) <=1) $json_api->error("You must include one or more vars in your request to add or update as user_meta. e.g. 'name', 'website', 'skills'. You must provide multiple meta_key vars in this format: &name=Ali&website=parorrey.com&skills=php,css,js,web design");



d($_REQUEST);

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



   $result[$field_label]['updated'] =  update_user_meta(  $user_id, $field, $values);

 

}



	 return $result;

   



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
		global $wpdb;	
	  

if (function_exists('bp_is_active')) {	



	  if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		}

		else $user_id = $json_api->query->user_id;

	

		

   if (!$json_api->query->field) {

			$json_api->error("You must include a 'field' var in your request. Use 'field=default' for all default fields.");

		}

	  elseif ($json_api->query->field=='default') {

			$field_label='Name,Australian ID,DOB,Address,Suburb,State,Post Code,Home Phone,Mobile Phone,ABN,Driving License,Passport';/*you should add your own field labels here for quick viewing*/

		}	

		else $field_label = sanitize_text_field($json_api->query->field);	

  

  preg_match('|src="(.+?)"|', get_avatar( $user_id, 512 ), $avatar);
  $user = get_userdata($json_api->query->user_id);	

				$fields_data['id'] = $user->ID;
				$fields_data["nicename"] = $user->user_nicename;
				$fields_data["email"] = $user->user_email;
				$fields_data["url"] = $user->user_url;
				$fields_data["displayname"] = $user->display_name;
				$fields_data["firstname"] = $user->user_firstname;
				$fields_data["lastname"] = $user->last_name;
				$fields_data["nickname"] = $user->nickname;
  				$fields_data['avatar'] = $avatar[1];
				
			$queryDonation = "SELECT SUM(amount) as donation FROM `donations` where user = '".$user->ID."' ";
			$donation = $wpdb->get_results($queryDonation);
			if($donation)
			{
				$donationAmount = $donation[0]->donation;
			}
			else
			{
				$donationAmount = 0;
			}
				$fields_data['donation'] = $donationAmount;

  

  $fields = explode(",", $field_label);

  

  if(is_array($fields)){

	  

	  foreach($fields as $k){

		  
		if($k == 'DOB')
		 {
			 $dob = xprofile_get_field_data( $k, $user_id );
			 $dob = date_format(date_create($dob), 'j F, Y');
			 $fields_data[$k] = $dob;
		 }
		 else
		 {
			 $fields_data[$k] = xprofile_get_field_data( $k, $user_id );
		 }
		  

		  

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

   

public function comments(){

	  global $json_api;	    

	

	 $oReturn = new stdClass();

	

	 if (!$json_api->query->post_id) {

			$json_api->error("You must include a 'post_id' var in your request.");

		}else $post_id = (int) $json_api->query->post_id;

	

	 if (!$json_api->query->per_page) {

			$limit = 10;

		}else $limit = (int) $json_api->query->per_page;

		

		 if (!$json_api->query->page) $page = 1;

     else $page = (int) $json_api->query->page;	

	 

	  if (!$json_api->query->sort) $sort = 'DESC';

     else $sort = $json_api->query->sort;



$offset = ($page * $limit) - $limit;



$args = array(

    'status'=>'approve',

    'offset'=>$offset,

    'number'=>$limit,

	'post_id' => $post_id,

	'order'  => $sort



);



$total_comments = get_comments(array('status'=>'approve', 'post_id' => $post_id));



$oReturn->total_pages = ceil(count($total_comments)/$limit);

$oReturn->current_page = $page;



$comments = get_comments($args);

   



  foreach($comments as $comment) { 

		 $tmp = new stdClass();

	$tmp->comment_id = $comment->comment_ID;   

	$tmp->user_id = $comment->user_id; 

	$tmp->avatar = bp_core_fetch_avatar(array('item_id'=>$tmp->user_id,'html'=>false));;

	$tmp->comment_date = $comment->comment_date;

	$tmp->time_since =  bp_core_time_since($comment->comment_date);

		

	$tmp->author = $comment->comment_author; 

	$tmp->content = $comment->comment_content;

	

	$oReturn->comments[] = $tmp;

     }



   return $oReturn;

	   

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

		

			// if($recipient_id && !in_array($recipient_id, $t->sender_ids)) continue;

			 

				$tmp->thread_id = $t->thread_id;

				//$tmp->unread_count = $t->unread_count;

				$messages =  $t->messages;								

				foreach($messages as $m){

				$thread = $m;

				$thread->time_since = bp_core_time_since ($m->date_sent);

				

				}

				$tmp->message =  $thread;

				

				$recipients_ids = $t->recipients;

			

				foreach($recipients_ids as $r){

					 $recipients['id'] = (int)$r->id;

					 $recipients['user_id'] = (int)$r->user_id;

					  $recipients['thread_id'] = (int)$r->thread_id;

					   $recipients['sender_only'] = (int)$r->sender_only;

					   $recipients['is_deleted'] = (int)$r->is_deleted;

					 $user = get_userdata($r->user_id);

					  $recipients['avatar'] = bp_core_fetch_avatar(array('item_id'=>$r->user_id,'html'=>false));

					  $recipients['display_name'] = $user->display_name;

				}				

				

				$tmp->recipients = $recipients;

				

				$sender_ids = array_values($t->sender_ids);

				

				foreach($sender_ids as $s){

					 $senders['id'] = (int)$s;

					 $user = get_userdata($s);

					  $senders['avatar'] = bp_core_fetch_avatar(array('item_id'=> $s,'html'=>false));

					  $senders['display_name'] = $user->display_name;

				}

				$tmp->sender_ids = $senders; 

								 

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

				$aTemp->avatar = bp_core_fetch_avatar(array('item_id'=>$aTemp->sender_id,'html'=>false));       

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

//d($_POST);

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

	 

public function search_user() {

   global $json_api, $wpdb;

   

   if (!$_REQUEST['search']) {

	$json_api->error("You must include a 'search' var in your request.");

		}

    

	 $query = "SELECT ID, user_login FROM " . $wpdb->prefix . "users WHERE user_login LIKE '%" . $_REQUEST['search'] . "%'";

	 

	 $result = $wpdb->get_results( $query );  

	 $oReturn = new stdClass();

	 foreach ($result as $k) {

			 $aTemp = new stdClass();

   

            $aTemp->user_id = $k->ID;

			$aTemp->username = $k->user_login;   

            $aTemp->avatar = bp_core_fetch_avatar(array('item_id'=>$k->ID,'html'=>false));

			

			$oReturn->users[] = $aTemp;

        }

     $oReturn->count = count($result);

	

    return $oReturn;

  }	

  

public function activities() { 



  global $json_api;



if (function_exists('bp_is_active')) {	



     $oReturn = new stdClass();

	 

	 if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` Auth API method.");

		}



	$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

		

	if (!$user_id) {

			$json_api->error("Invalid authentication cookie. Use the `generate_auth_cookie` Auth API method.");

		}

		

 if ($json_api->query->sort) $sort = $json_api->query->sort;	

 else $sort = 'DESC';//ASC, DESC

 

  if (!$json_api->query->comments) $comments = 'stream';

else $comments = $json_api->query->comments;//Accepted arguments: false

 

  if ($json_api->query->scope) {

	   if (!$json_api->query->user_id) $json_api->error("Error. 'scope' can only be used with 'user_id'.");

	  $scope = $json_api->query->scope;

  }

 else $scope = false;



 if ($json_api->query->limit) $limit = $json_api->query->limit;

else $limit = 10;



 if ($json_api->query->page) $page = $json_api->query->page;

else $page = 1;





$per_page = $limit;

 

        if (!bp_has_activities())  $json_api->error("No Activities found.");		 

		



        if ($page) {



            $aParams ['max'] = true;

            $aParams ['per_page'] = $limit;

			 $aParams ['page'] = $page;

            $iPages = $page;



        }





        $aParams ['display_comments'] = $comments;

        $aParams ['sort'] =  $sort;

		$aParams ['scope'] = $scope;

		

if ($json_api->query->include)	$aParams ['include'] = $json_api->query->include;

if ($json_api->query->search_terms)	$aParams ['search_terms'] = $json_api->query->search_terms;



    if ($json_api->query->user_id)   $aParams ['filter'] ['user_id'] = (int) $json_api->query->user_id;

   if ($json_api->query->component)  $aParams ['filter'] ['object'] = $json_api->query->component;

	

   if ($json_api->query->type)     $aParams ['filter'] ['action'] = $json_api->query->type;

     if ($json_api->query->primary_id)    $aParams ['filter'] ['primary_id'] = (int) $json_api->query->primary_id;

	  if ($json_api->query->secondary_id)     $aParams ['filter'] ['secondary_id'] = (int) $json_api->query->secondary_id;

		

        $iLimit = $limit;

	

//d($aParams);



            $aTempActivities = bp_activity_get($aParams);

		

            if (!empty($aTempActivities['activities'])) {

				

            $user_favs = array_values (bp_activity_get_user_favorites( $user_id ) );

			//print_r($user_favs);

			//exit();

                foreach ($aTempActivities['activities'] as $oActivity) {

					

					$aTemp = new stdClass();

					

                   $aTemp->activity_id = $oActivity->id;					

				   

				   $aTemp->component = $oActivity->component;

					

					$aTemp->action = strip_tags($oActivity->action);

					

					$aTemp->content = $oActivity->content;

					

				

                     

                    $aTemp->user[0]->user_id = (int) $oActivity->user_id; 

					  $aTemp->user[0]->username = $oActivity->user_login; 

					 $aTemp->user[0]->avatar = bp_core_fetch_avatar(array('item_id'=>$oActivity->user_id,'html'=>false));              

                    $aTemp->user[0]->display_name = $oActivity->display_name;



                   $aTemp->type = $oActivity->type;



                   $aTemp->time = $oActivity->date_recorded;

				   

				    $aTemp->time_since =  bp_core_time_since ( $oActivity->date_recorded ) ;



                    $aTemp->is_hidden = $oActivity->hide_sitewide === "0" ? false : true;



                   $aTemp->is_spam = $oActivity->is_spam === "0" ? false : true;

                

				   $aTemp->is_fav = array_search( (int)$aTemp->activity_id, $user_favs); 

				

					foreach($oActivity->children as $comment) {

						 $aComment = new stdClass();

						$aComment->id = (int) $comment->id;

						$aComment->component = $comment->component;

						$aComment->user_id = (int) $comment->user_id;

						$aComment->avatar = bp_core_fetch_avatar(array('item_id'=> $comment->user_id,'html'=>false));

						$aComment->content = strip_tags($comment->content);

						$aComment->action = strip_tags($comment->action);

						

						$aComment->item_id = (int) $comment->item_id;

						$aComment->secondary_item_id = (int) $comment->secondary_item_id;

						$aComment->date_recorded = $comment->date_recorded;

						$aComment->time_since =  bp_core_time_since ($comment->date_recorded);

						$aComment->hide_sitewide = $comment->hide_sitewide;

						$aComment->display_name = $comment->display_name;

						$aComment->depth = $comment->depth;

						$aComment->is_spam = $comment->is_spam;

						$aComment->children = $comment->children;

						$aComment->mptt_left = $comment->mptt_left;

						$aComment->mptt_right = $comment->mptt_right;

		

						$aTemp->comments[] =  $aComment;

					}

					  

					 

					//  $aTemp->old_comments =  $oActivity->children;

	   $oReturn->activities[] = $aTemp;

                }



                $oReturn->has_more_items = $aTempActivities['has_more_items'];

				$oReturn->page = (int) $page;

				$oReturn->per_page = (int) $limit;



            } else {



                return $json_api->error("No Activities found.");	



            }

			



           return $oReturn;

 

}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this endpoint.");

	   }	



    }



public function activities_post_update(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	

		if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}



   if (!$json_api->query->content ) {

  $json_api->error("Please include 'content' var in your request.");

  }else $content = $json_api->query->content;



  $args = array('user_id'=>$user_id,

                'content'=>$content);

				

 $oReturn->activity_id = bp_activity_post_update( $args );

 

 return $oReturn;    

   }

   

public function activities_delete_activity(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	

		if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}



   if (!$json_api->query->activity_id ) {

  $json_api->error("Please include 'activity_id' var in your request.");

  }else $activity_id = $json_api->query->activity_id;



  $args = array('user_id'=>$user_id,

                'content'=>$content);

				

 $oReturn->deleted = bp_activity_delete_by_activity_id( $activity_id );

 

 return $oReturn;    

   }

   

public function activities_new_comment(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	

   if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}

		

if (!$json_api->query->activity_id ) {

  $json_api->error("Please include 'activity_id' var in your request.");

  }else $activity_id = (int) $json_api->query->activity_id;



   if (!$json_api->query->content ) {

  $json_api->error("Please include 'content' var in your request.");

  }else $content = $json_api->query->content;



  $args = array('user_id'=>$user_id,

                'activity_id'=>$activity_id,

                'content'=>$content);

	

  if ($json_api->query->comment_id ) $args['id'] = (int)$json_api->query->comment_id;

  if ($json_api->query->parent_id ) $args['parent_id'] = (int)$json_api->query->parent_id;

				

 $oReturn->comment_id = bp_activity_new_comment( $args );

 

 return $oReturn;    

   }



public function activities_delete_comment(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	

   if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}

		

if (!$json_api->query->activity_id ) {

  $json_api->error("Please include 'activity_id' var in your request.");

  }else $activity_id = (int) $json_api->query->activity_id;



   if (!$json_api->query->comment_id ) {

  $json_api->error("Please include 'comment_id' var in your request.");

  }else $content = (int)$json_api->query->comment_id;

  				

 $oReturn->delete = bp_activity_delete_comment( $activity_id, $comment_id );

 

 return $oReturn;    

   }   

   



public function activities_get_user_favorites(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request. Use the `generate_auth_cookie` method.");

		}else 



  $user_id = (int)$json_api->query->user_id;

	

  

 $oReturn->favorites = bp_activity_get_user_favorites( $user_id );

 

 return $oReturn;    

   }

   

public function activities_total_favorites_for_user(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request. Use the `generate_auth_cookie` method.");

		}else 



  $user_id = (int)$json_api->query->user_id;

	

  

 $oReturn->favorites = bp_activity_total_favorites_for_user( $user_id );

 

 return $oReturn;    

   }

   

public function activities_add_user_favorite(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	

   if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}

		

if (!$json_api->query->activity_id ) {

  $json_api->error("Please include 'activity_id' var in your request.");

  }else $activity_id = (int) $json_api->query->activity_id;



 $oReturn->favorite = bp_activity_add_user_favorite( $activity_id, $user_id );

 

 return $oReturn;    

   }

   

public function activities_remove_user_favorite(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->cookie) {

			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");

		}



  $user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');

	

   if (!$user_id) {

			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");

		}

		

if (!$json_api->query->activity_id ) {

  $json_api->error("Please include 'activity_id' var in your request.");

  }else $activity_id = (int) $json_api->query->activity_id;



 $oReturn->favorite = bp_activity_remove_user_favorite( $activity_id, $user_id );

 

 return $oReturn;    

   }    



public function activities_find_mentions(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->content) {

			$json_api->error("You must include a 'content' var in your request. ");

		}else $content = $json_api->query->content;

	

  

 $oReturn->users = bp_activity_find_mentions( $content );

 

 return $oReturn;    

   } 

 

public function activities_get_user_mentionname(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request. ");

		}else $user_id = (int)$json_api->query->user_id;

	

  

 $oReturn->mentionname = bp_activity_get_user_mentionname( $user_id );

 

 return $oReturn;    

   }

   

public function activities_get_userid_from_mentionname(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->mentionname) {

			$json_api->error("You must include a 'mentionname' var in your request.");

		}else $mentionname = $json_api->query->mentionname;

	

  

 $oReturn->user_id = bp_activity_get_userid_from_mentionname( $mentionname );

 

 return $oReturn;    

   }



public function activities_clear_new_mentions(){

   global $json_api;

 $oReturn = new stdClass();

  if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request. ");

		}else $user_id = (int)$json_api->query->user_id;	

  

 $oReturn->clear = bp_activity_clear_new_mentions( $user_id );

 

 return $oReturn;    

   }

	  

public function friends() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



    if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		}else $user_id = (int) $json_api->query->user_id;



        $sFriends = bp_get_friend_ids($user_id);

        $aFriends = explode(",", $sFriends);

       

		if ($aFriends[0] == "") $json_api->error("No friend found.");

		

		if ($json_api->query->xprofile){

			$xprofile_fields = explode(",", $json_api->query->xprofile);

		}

 

		//d($xprofile_fields);

        foreach ($aFriends as $sFriendID) {

			 $aTemp = new stdClass();

            $oUser = get_user_by('id', $sFriendID);

            $aTemp->user_id = $oUser->data->ID;

			$aTemp->username = $oUser->data->user_login;

            $aTemp->display_name = $oUser->data->display_name;

            $aTemp->avatar = bp_core_fetch_avatar(array('item_id'=>$oUser->data->ID,'html'=>false));

			

			

	 if(is_array($xprofile_fields)){

	  

	  foreach($xprofile_fields as $k){

		  

		  $fields_data[$k] = xprofile_get_field_data( $k, $aTemp->user_id );

		  //echo '$k'.$k.'='.$fields_data[$k];

		  }

		  $aTemp->xprofile = $fields_data;

         }

			 

			$oReturn->friends[] = $aTemp;

        }

        $oReturn->count = count($aFriends);

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	    return $oReturn;

    }	

	

public function friends_add_friend() { 

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

	

	  if (!$json_api->query->friend_id) {

			$json_api->error("You must include a 'friend_id' var in your request.");

		} else $friend_id = (int) $json_api->query->friend_id;	

	

      if ($json_api->query->force_accept) $force_accept= $json_api->query->force_accept;

		 else $force_accept= false;	

		

    $oReturn->response = friends_add_friend($user_id, $friend_id, $force_accept);        

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }



public function friends_remove_friend() { 

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

	

	  if (!$json_api->query->friend_id) {

			$json_api->error("You must include a 'friend_id' var in your request.");

		} else $friend_id = (int) $json_api->query->friend_id;	

	

		

    $oReturn->response = friends_remove_friend($user_id, $friend_id);        

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }

	

public function friends_accept_friendship() { 

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

	

	  if (!$json_api->query->friendship_id) {

			$json_api->error("You must include a 'friendship_id' var in your request.");

		} else $friendship_id = (int) $json_api->query->friendship_id;	

	

	global $wpdb, $bp;

	

	$oReturn->response = $wpdb->query( $wpdb->prepare( "UPDATE {$bp->friends->table_name} SET is_confirmed = 1, date_created = %s WHERE id = %d AND friend_user_id = %d", bp_core_current_time(), $friendship_id, $user_id ) );

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }		

	

public function friends_reject_friendship() { 

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

	

	  if (!$json_api->query->friendship_id) {

			$json_api->error("You must include a 'friendship_id' var in your request.");

		} else $friendship_id = (int) $json_api->query->friendship_id;	

	

	global $wpdb, $bp;

		

    $oReturn->response = $wpdb->query( $wpdb->prepare( "DELETE FROM {$bp->friends->table_name} WHERE id = %d AND friend_user_id = %d", $friendship_id, $user_id ) );

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	

	

public function friends_withdraw_friendship() { 

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

	

	  if (!$json_api->query->friend_id) {

			$json_api->error("You must include a 'friend_id' var in your request.");

		} else $friend_id = (int) $json_api->query->friend_id;		

		

		global $bp, $wpdb;

		

	//	 $bp->loggedin_user->id = $user_id;

	$friendship_id = friends_get_friendship_id( $user_id, $friend_id );

	

	 $friendship    = new BP_Friends_Friendship( $friendship_id, true, false );

	

	 $sql = $wpdb->prepare( "DELETE FROM {$bp->friends->table_name} WHERE id = %d AND initiator_user_id = %d", $friendship_id, $user_id );



	 if ( empty( $friendship->is_confirmed ) ) {

	 $oReturn->response = $wpdb->query( $wpdb->prepare( "DELETE FROM {$bp->friends->table_name} WHERE id = %d AND initiator_user_id = %d", $friendship_id, $user_id ) ); 

	 

	 }else $oReturn->response = 'confirmed already.';

      

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	

	

public function friends_check_friendship() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



    if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 



		

	  if (!$json_api->query->friend_id) {

			$json_api->error("You must include a 'friend_id' var in your request.");

		} else $friend_id = (int) $json_api->query->friend_id;		

		

    $oReturn->response = friends_check_friendship($user_id, $friend_id );        

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	



public function friends_friendship_status() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

	

	  if (!$json_api->query->friend_id) {

			$json_api->error("You must include a 'friend_id' var in your request.");

		} else $friend_id = (int) $json_api->query->friend_id;		

		

    $oReturn->response = friends_check_friendship_status($user_id, $friend_id );        

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	



public function friends_friend_count() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

			

    $oReturn->response = friends_get_total_friend_count($user_id);        

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	

	

public function friends_has_friends() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

			

    $oReturn->response = friends_check_user_has_friends($user_id);        

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }		



public function friends_friendship_id() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request. user_id is initiator of friendship request.");

		} else $user_id = (int) $json_api->query->user_id; 

	

	  if (!$json_api->query->friend_id) {

			$json_api->error("You must include a 'friend_id' var in your request.");

		} else $friend_id = (int) $json_api->query->friend_id;		

		

    $oReturn->response = friends_get_friendship_id($user_id, $friend_id );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }



public function friends_friend_ids() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

	

	  if ($json_api->query->friend_requests_only) $friend_requests_only = $json_api->query->friend_requests_only;

		 else $friend_requests_only = false;

    

	 $assoc_arr = false;		

		

    $oReturn->friends = friends_get_friend_user_ids( $user_id, $friend_requests_only, $assoc_arr );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }

	

public function friends_search_friends() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

		

		if (!$json_api->query->search) {

			$json_api->error("You must include a 'search' var in your request.");

		} else $search = $json_api->query->search; 

	

	  if ($json_api->query->per_page) $per_page =(int) $json_api->query->per_page;

		 else $per_page = 10;

		 

	  if ($json_api->query->page) $page =(int) $json_api->query->page;

		 else $page = null;

    

		

    $oReturn = friends_search_friends( $search, $user_id, $per_page, $page );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }



public function friends_friendship_request_user_ids() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

		

    $oReturn->users = friends_get_friendship_request_user_ids( $user_id );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }

	

public function friends_listing(){ 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



        if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} else $user_id = (int) $json_api->query->user_id; 

	

	  if ($json_api->query->type) $type = $json_api->query->type;

		 else $type = 'active';

    

		if ($json_api->query->search) $filter = $json_api->query->search; 

		else $filter = ''; 

	

	  if ($json_api->query->per_page) $per_page =(int) $json_api->query->per_page;

		 else $per_page = 0;

		 

	  if ($json_api->query->page) $page =(int) $json_api->query->page;

		 else $page = 0;

		 

   $oReturn = BP_Core_User::get_users( $type, $per_page, $page, $user_id, $filter );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }

 

public function friends_get_bulk_last_active() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



       if (!$json_api->query->friend_ids) {

			$json_api->error("You must include a 'friend_ids' var in your request. ids must be comma separated.");

		} 

	

	$friend_ids = explode(',',$json_api->query->friend_ids);

		

    $oReturn->users = friends_get_bulk_last_active( $friend_ids );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }

		 				

public function friends_group_invite_list() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



       if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} 

	

	  if (!$json_api->query->group_id) {

			$json_api->error("You must include a 'group_id' var in your request.");

		} 

		

	$oReturn->friends = friends_get_friends_invite_list( $user_id, $group_id );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }



public function friends_count_invitable_friends() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



       if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} 

	

	  if (!$json_api->query->group_id) {

			$json_api->error("You must include a 'group_id' var in your request.");

		} 

		

	$oReturn->friends = friends_count_invitable_friends( $user_id, $group_id );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	



public function friends_friend_count_for_user() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



       if (!$json_api->query->user_id) {

			$json_api->error("You must include a 'user_id' var in your request.");

		} 

	

	$oReturn->friends = friends_get_friend_count_for_user( $user_id ) ;     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	



public function friends_is_friendship_confirmed() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



       if (!$json_api->query->friendship_id) {

			$json_api->error("You must include a 'friendship_id' var in your request.");

		} 

	

	$oReturn->friendship = friends_is_friendship_confirmed( $friendship_id ) ;     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	

	

public function friends_update_friend_totals() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



       if (!$json_api->query->friendship_id) {

			$json_api->error("You must include a 'friendship_id' var in your request.");

		} 

	

	$oReturn->friendship = friends_update_friend_totals( $user_id, $friend_id, $status );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	



public function members() { 

		global $json_api;

        

        $oReturn = new stdClass();



  if (function_exists('bp_is_active')) {	



   

   if ($json_api->query->limit) $limit = (int) $json_api->query->limit;

else $limit = 10;



 if ($json_api->query->page) $page = (int) $json_api->query->page;

else $page = 1;



 if ($json_api->query->type) $type = $json_api->query->type;

else $type = 'active';  



 

	 // $aParams ['max'] = true;

            $aParams ['per_page'] = $limit;

			 $aParams ['page'] = $page;

			 $aParams ['type'] = $type;

  

			  

		 if ($json_api->query->user_id)	 $aParams ['user_id'] = (int)$json_api->query->user_id;	

		  if ($json_api->query->search_terms)	  $aParams ['search_terms'] = $json_api->query->search_terms;		  

		  		 

		  if ($json_api->query->meta_key)	  $aParams ['meta_key'] = $json_api->query->meta_key;		  

		   if ($json_api->query->meta_value)	{

			   if(!$json_api->query->meta_key) $json_api->error("You must include a 'meta_key' var in your request. or remove 'meta_value' var.");

			    $aParams ['meta_value'] = $json_api->query->meta_value;

				}

		   

		     if ($json_api->query->include)	  $aParams ['include'] = $json_api->query->include;		  

		   if ($json_api->query->exclude)	 $aParams ['exclude'] = $json_api->query->exclude;	

          

	  

	    $sMembers = bp_core_get_users( $aParams );

		

		//d( $sMembers);		

		       

		if ( $sMembers['total'] == 0) $json_api->error("No member found.");

		

		if ($json_api->query->xprofile){

			$xprofile_fields = explode(",", $json_api->query->xprofile);

		}

 

		//d($xprofile_fields);

        foreach ( $sMembers['users'] as $sMemberID) {

			 $aTemp = new stdClass();

          

            $aTemp->user_id = (int) $sMemberID->ID;

			$aTemp->username = $sMemberID->user_login;

			$aTemp->user_nicename = $sMemberID->user_nicename;

            $aTemp->display_name = $sMemberID->display_name;

			$aTemp->fullname = $sMemberID->fullname;

			  $aTemp->is_friend = $sMemberID->is_friend;

			  $aTemp->last_activity = $sMemberID->last_activity;

			    $aTemp->total_friend_count = (int) $sMemberID->total_friend_count;

	

            $aTemp->avatar = bp_core_fetch_avatar(array('item_id'=>$sMemberID->ID,'html'=>false));

			

			

	 if(is_array($xprofile_fields)){

	  

	  foreach($xprofile_fields as $k){

		  

		  $fields_data[$k] = xprofile_get_field_data( $k, $aTemp->user_id );

		  //echo '$k'.$k.'='.$fields_data[$k];

		  }

		  $aTemp->xprofile = $fields_data;

         }

			 

			$oReturn->members[] = $aTemp;

        }

        $oReturn->total = (int) $sMembers['total'];

		$oReturn->page = (int) $page;

		$oReturn->per_page = (int) $limit;

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	    return $oReturn;

    }	

	

public function notifications() { 

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

		

		$args = array('user_id'=>$user_id);

	

	 if ($json_api->query->is_new) $args['is_new'] = $json_api->query->is_new;

	 

	  if ($json_api->query->item_id) $args['item_id'] = $json_api->query->item_id;

	  

	   if ($json_api->query->component) $args['component_name'] = $json_api->query->component;

	 

	    if ($json_api->query->action) $args['component_action'] = $json_api->query->action;

		

		if ($json_api->query->search_terms) $args['search_terms'] = $json_api->query->search_terms;

		

		if ($json_api->query->order_by) $args['order_by'] = $json_api->query->order_by;

		else $args['order_by'] = 'date_notified';	

		if ($json_api->query->sort_order) $args['sort_order'] = $json_api->query->sort_order;

		else $args['sort_order'] = 'DESC';

			

		if ($json_api->query->page) $args['page'] = $json_api->query->page;

		

		if ($json_api->query->per_page) $args['per_page'] = $json_api->query->per_page;

	 

	 global $bp;



	$notifications = BP_Notifications_Notification::get($args);

	//$notifications = bp_notifications_get_notifications_for_user( $user_id, 'object');// $user_id, $format = 'object' ); 

	//return $oReturn->notifications = $notifications;

	    if(is_array($notifications)) {

			

			 foreach ( $notifications as $notification) {

			 $aTemp = new stdClass();

        

            $aTemp->id = (int) $notification->id;

			

		

			$aTemp->user_id = (int) $notification->user_id;

			$aTemp->item_id = (int) $notification->item_id;

			$aTemp->secondary_item_id = (int) $notification->secondary_item_id;

			 $aTemp->component_name = $notification->component_name;

			$aTemp->component_action = $notification->component_action;

			

			if($aTemp->component_name== 'groups'){

				$group = groups_get_group( array( 'group_id' => $aTemp->item_id ) );

			 $aTemp->sender_name = $group->name;

			  $aTemp->sender_avatar = bp_core_fetch_avatar(array('item_id'=>$aTemp->item_id,'object' => 'group','html'=>false));

			}elseif($aTemp->component_name== 'friends') {

				

			 $user = get_userdata( $aTemp->item_id );

			 

			 $aTemp->status = friends_check_friendship_status($aTemp->item_id, $user_id );

			 $aTemp->sender_name = $user->display_name;			 

			  $aTemp->sender_avatar = bp_core_fetch_avatar(array('item_id'=>$aTemp->item_id,'html'=>false));

				}else {

				 $user = get_userdata( $aTemp->secondary_item_id );			

			 $aTemp->sender_name = $user->display_name;

			  $aTemp->sender_avatar = bp_core_fetch_avatar(array('item_id'=>$aTemp->secondary_item_id,'html'=>false));

			}

			 

	           

			  $aTemp->date_notified = $notification->date_notified;

			    $aTemp->time_since = bp_core_time_since($notification->date_notified);

			  $aTemp->is_new = (int)$notification->is_new;

			  

			  $component_name = $aTemp->component_name;

			  $component_action_name = $aTemp->component_action;

			  

			  

			   $content = call_user_func(

                           $bp->{$component_name}->notification_callback,

                           $component_action_name,

                           $aTemp->item_id,

                         $aTemp->secondary_item_id,

                           $action_item_count,

                          'array'

                      );

			  

			   $aTemp->content = $content['text'];

			    $aTemp->href = $content['link'];

			 			 

			$oReturn->notifications[] = $aTemp;

        }

			

			

			}

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }



public function notifications_unread_count() { 

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

	

	$oReturn->count = bp_notifications_get_unread_notification_count( $user_id );     

       

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	



public function notifications_delete() { 

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

	

	  if (!$json_api->query->notification_id) {

			$json_api->error("You must include a 'notification_id' var in your request.");

		}else $notification_id = (int) $json_api->query->notification_id;



	 if ( ! bp_notifications_check_notification_access( $user_id, $notification_id ) ) {

          $json_api->error("Invalid access. user does not have access to this notification.");

     }

 

    $oReturn->response = BP_Notifications_Notification::delete( array( 'id' => $notification_id ) );	

	    

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	

		

public function notifications_mark_all() { 

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

	

   $is_new = 0;

	

 

    $oReturn->response = BP_Notifications_Notification::mark_all_for_user( $user_id, $is_new )  ;	

	    

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }	

	

public function notifications_mark_all_by_type() { 

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

	

    if (!$json_api->query->component_name) {

			$json_api->error("You must include a 'component_name' var in your request. ");

		}else 	 $component_name= $json_api->query->component_name;

		

	 if (!$json_api->query->component_action) {

			$json_api->error("You must include a 'component_action' var in your request. Use the `generate_auth_cookie` Auth API method.");

		}

		else $component_action=$json_api->query->component_action;

	

	$is_new = 0;

		

 

   // $oReturn->response = bp_notifications_mark_notifications_from_user( $user_id, $component_name, $component_action, $is_new );	

	 $oReturn->response =    BP_Notifications_Notification::update(

           array(

              'is_new' => $is_new

          ),

           array(

              'user_id'          => $user_id,

              'component_name'   => $component_name,

              'component_action' => $component_action

           )

           );

		}else {	  

	  $json_api->error("You must install and activate BuddyPress plugin to use this method.");

	   }

	 return $oReturn;

    }
	
	public function get_post_meta() {
	 
	  global $json_api;
	  
	  if (!$json_api->query->post_id) {
			$json_api->error("You must include a 'post_id' var in your request.");
		}else $post_id = (int) $json_api->query->post_id;

			
     $meta_key = sanitize_text_field($json_api->query->meta_key);	
  
		  
		if($meta_key) $meta[$meta_key] =  get_post_meta( $post_id, $meta_key);
		else $meta = get_post_meta( $post_id );
     	
		$data =  array_map( function( $a ) {
					return $a[0];
					}, $meta );
//d($data);
	   return array('post_meta'=>$data);
	    
	  
	  } 
	  
public function update_post_meta() {
	 
	  global $json_api;	

	  if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
//	echo '$user_id: '.$user_id;	
	
		if (!$user_id) {
			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		}
	
	 if (!$json_api->query->post_id) {
			$json_api->error("You must include a 'post_id' var in your request.");
		}else $post_id = (int) $json_api->query->post_id;	
		
	$author = get_post_field( 'post_author', $json_api->query->post_id );
	
	
	if ($author!=$user_id ) {
    $json_api->error("You need to login with same user who created post. Only author of post can update post meta.");
      }	
		
		
	if( sizeof($_REQUEST) <=1) $json_api->error("You must include one or more vars in your request to add or update post_meta. e.g. 'name', 'website', 'skills'. You must provide multiple meta_key vars in this format: &name=Ali&website=parorrey.com&skills=php,css,js,web design");

//d($_REQUEST);
foreach($_REQUEST as $meta_key => $value){
		
	if($meta_key=='cookie' || $meta_key=='key' || $meta_key=='secret' || $meta_key=='post_id') continue;
	
	
	if( strpos($value,',') !== false ) {
		$values = explode(",", $value);
	   $values = array_map('trim',$values);
	   }
	else $values = trim($value);
	
   $result['post_meta'][$meta_key]['updated'] =  update_post_meta(  $post_id, $meta_key, $values);
 
}

	 return $result;
   

  }
  
public function delete_post_meta() {
	 
	  global $json_api;	

	  if (!$json_api->query->cookie) {
			$json_api->error("You must include a 'cookie' var in your request. Use the `generate_auth_cookie` method.");
		}

		$user_id = wp_validate_auth_cookie($json_api->query->cookie, 'logged_in');
//	echo '$user_id: '.$user_id;	
	
		if (!$user_id) {
			$json_api->error("Invalid cookie. Use the `generate_auth_cookie` method.");
		}
	
	 if (!$json_api->query->post_id) {
			$json_api->error("You must include a 'post_id' var in your request.");
		}else $post_id = (int) $json_api->query->post_id;	
		
	$author = get_post_field( 'post_author', $json_api->query->post_id );
	
	
	if ($author!=$user_id ) {
    $json_api->error("You need to login with same user who created post. Only author of post can delete post meta.");
      }	
		
		
	if (!$json_api->query->meta_keys) $json_api->error("You must include 'meta_keys' var in your request to delete post_meta. Provide comma separated meta_key to delete from post_meta.");
	
$meta_keys = explode(",", $json_api->query->meta_keys);

foreach($meta_keys as $k){
		
	//if($meta_key=='cookie' || $meta_key=='key' || $meta_key=='secret' || $meta_key=='post_id') continue;
	
	 $meta_key = trim($k);
	
   $result['post_meta'][$meta_key]['deleted'] =  delete_post_meta(  $post_id, $meta_key);
 
}

	 return $result;
   

  }
  
  public function set_product_category(){
	  	global $json_api;
		global $wpdb;
		
		if (!$json_api->query->post_id || !$json_api->query->terms_id) {
			$json_api->error("You must include 'post_id' , 'terms_id' var in your request. ");
		}
		else {
			$post_id = $json_api->query->post_id;
			$terms_id = $json_api->query->terms_id;	
			
			$query = "DELETE FROM wp_term_relationships WHERE object_id='".$post_id."' ";
			$wpdb->query($query);
		
			
			
			$termsArray = explode(',', $terms_id);
			//print_r($termsArray);
			$where = '';
			foreach ($termsArray as $termsID)
			{
				$where .= "('".$post_id."','".$termsID."'),";
			}
			$where = rtrim($where,',');
			
			$queryINS = "INSERT INTO wp_term_relationships (object_id,term_taxonomy_id) VALUES ".$where." ";
			$res = $wpdb->query($queryINS);
			if($res)
			{
				$response['success'] = 1;
				$response['status'] = "Product category Updated Successfully";
			}
			else
			{
				$response['success'] = 0;
				$response['status'] = "Product category not Updated";
			}
				
		}  
		return array($response);	
  	}
	
	  public function set_post_type_wpmarketplace(){
		  
	  	global $json_api;
		global $wpdb;
		
		if (!$json_api->query->post_id) {
			$json_api->error("You must include 'post_id' var in your request. ");
		}
		else {
			$post_id = $json_api->query->post_id;
			$post_type = 'wpmarketplace';	
			
			if ( set_post_type($post_id,$post_type)) {
			  	$response['success'] = 1;
				$response['status'] = "Post Type Updated";
			} else {
			  	$response['success'] = 0;
				$response['status'] = "Post Type Not Updated";
			}	
		}  
		return array($response);	
  	}
	
	public function send_message_seller(){

  		global $json_api;
		global $wpdb;	

  

   		if (!$json_api->query->seller_id || !$json_api->query->title || !$json_api->query->message) {
			$json_api->error("You must include 'seller_id' , 'title' , 'message' var in your request. ");
		}
		else {
			$seller_id = $json_api->query->seller_id;
			$user_id = $json_api->query->user_id;	
			$title = $json_api->query->title;
			$message = $json_api->query->message;
			$message_type = 'user';
			$status = 1;
			
			$query = "INSERT INTO message_board (sender_id,reciever_id,message_title,message_txt,message_type,status) VALUES ('".$user_id."','".$seller_id."','".$title."','".$message."','".$message_type."','".$status."')";
			$res = $wpdb->query($query);
			if($res)
			{
				$response['success'] = 1;
				$response['status'] = "Message Successfully Sent to Seller";
				
			}
			else
			{
				$response['success'] = 0;
				$response['status'] = "There is some Error while Sending Message to Seller.";
			}
				
		}  
		return array('msg'=>$response);
  		
		
  	}
	
	public function get_user_messages(){

  		global $json_api;
		global $wpdb;	

  

   		if (!$json_api->query->user_id) {
			$json_api->error("You must include 'user_id' var in your request. ");
		}
		else {
			$user_id = $json_api->query->user_id;	
			
			$query = "SELECT * FROM message_board where reciever_id = $user_id group by message_title order by message_id DESC";
			$res = $wpdb->query($query);
			$messages = $wpdb->get_results($query);
			$data = array();
			if($messages)
			{
				$response['success'] = 1;
				foreach($messages as $message)
				{
					$message->sender_name = get_the_author_meta( 'display_name', $message->sender_id);
					$message->date_sent = mysql2date('l, jS F, Y', $message->date);
					$message->avatar = get_avatar( $message->sender_id, 32 );
					$data[] = $message;
				}
				$response['messages'] = $data;
				
			}
			else
			{
				$response['success'] = 0;
				$response['status'] = "There is some Error while Fetching Messages.";
			}
				
		}  
		return array('msg'=>$response);
  		
		
  	}
	
	public function get_user_messages_by_subject(){

  		global $json_api;
		global $wpdb;	

  

   		if (!$json_api->query->user_id || !$json_api->query->subject) {
			$json_api->error("You must include 'user_id' and 'subject' var in your request. ");
		}
		else {
			$user_id = $json_api->query->user_id;
			$subject = $json_api->query->subject;	
			
			$query = "SELECT * FROM message_board where message_title = '".$subject."' Order by message_id ASC";
			$res = $wpdb->query($query);
			$messages = $wpdb->get_results($query);
			$data = array();
			if($messages)
			{
				$response['success'] = 1;
				foreach($messages as $message)
				{
					$message->sender_name = get_the_author_meta( 'display_name', $message->sender_id);
					$message->date_sent = mysql2date('l, jS F, Y', $message->date);
					$message->avatar = get_avatar( $message->sender_id, 150 );
					$data[] = $message;
				}
				$response['messages'] = $data;
				
			}
			else
			{
				$response['success'] = 0;
				$response['status'] = "There is some Error while Fetching Messages.";
			}
				
		}  
		return array('msg'=>$response);
  		
		
  	}
	
	
	public function fetch_products_categories(){

  		global $json_api;
		global $wpdb;	
			
			$query = "SELECT terms.term_id,terms.slug,terms.name,taxonomy.term_taxonomy_id FROM wp_terms as terms INNER JOIN wp_term_taxonomy as taxonomy ON terms.term_id=taxonomy.term_taxonomy_id WHERE taxonomy.taxonomy = 'ptype'";
			$categories = $wpdb->get_results($query);
			if($categories)
			{
				return array('data' => $categories);
				
			}
			else
			{
				return array('msg'=>"There is some Error while fetching categories.");
			}
				
		
  		
		
  	}
	
	public function fetch_category_products()
	{
		global $json_api;
		global $wpdb;
		
		if(!$json_api->query->term_id)
		{
			$json_api->error("You must include 'term_id' var in your request. ");	
		}
		else
		{
		$term_id = $json_api->query->term_id;
		$postsArray = get_posts(array(
			'post_type' => 'wpmarketplace',
			'tax_query' => array(
				array(
				'taxonomy' => 'ptype',
				'field' => 'term_id',
				'terms' => $term_id)
			))
		);
		$allProducts = array();
		$custom_fields = array();
		if($postsArray)
			{
				foreach($postsArray as $product)
				{
					$product_id = $product->ID;
					$custom_fields_object = get_post_custom($product_id);
					foreach ($custom_fields_object as $key => $value ) {
						if($key == 'images' || $key == 'images1')
						{
						$custom_fields[$key] = unserialize($value[0]);
						}
						else
						{
						$custom_fields[$key] = $value;	
						}
					 }
					$product->custom_fields = $custom_fields;
					$allProducts[] = $product;
				}
				return array('products' => $allProducts);
				
			}
			else
			{
				return array('msg'=>"There is some Error while fetching products.");
			}
		}
	}
	
	
	public function fetch_app_settings()
	{
		global $json_api;
		global $wpdb;
		
			$query2 = "SELECT * FROM wp_options where option_name IN ('blogname','blogdescription') order by option_id ASC";
			$res2 = $wpdb->query($query2);
			$app_info = $wpdb->get_results($query2);
			$app_heading = $app_info[0]->option_value;
			$app_tagLine= $app_info[1]->option_value;
			
			
			$query3 = "SELECT * FROM wp_home_setting";
			$res3 = $wpdb->query($query3);
			$home_settings = $wpdb->get_results($query3);
			$header_color = $home_settings[0]->header_color;
			$bg_color = $home_settings[0]->bg_color;
			$ads_bar = $home_settings[0]->ads_bar;
			$media_feed = $home_settings[0]->media_feed;
			$menu_icon_url = $home_settings[0]->menu_icon_url;
			$terms_cnd = $home_settings[0]->terms_cnd;
			
			$query = "SELECT * FROM app_configuration";
			$res = $wpdb->query($query);
			$app_configurations = $wpdb->get_results($query);
			$data = array();
			if($app_configurations)
			{
				$app_configurations[0]->app_name = $app_heading;
				$app_configurations[0]->app_tagLine = $app_tagLine;
				//print_r($app_configurations);
				$app_configurations[0]->menu_icon_url = $menu_icon_url;
				$app_configurations[0]->media_feed = $media_feed;
				$app_configurations[0]->app_ads_bar = $ads_bar;
				$app_configurations[0]->app_header_color = $header_color;
				$app_configurations[0]->app_background_color = $bg_color;
				$app_configurations[0]->terms_and_conditions = $terms_cnd;
				$response['app_configuration'] = $app_configurations;
			}
			else
			{
				$response['app_configuration'] = "There is some Error while Fetching Settings.";
			}
			return $response;
	}
	
	public function order_items()
	{
		global $json_api;
		global $wpdb;
		
		$shippingInformation = array();
		$user_id = $json_api->query->user_id;
		$order = $json_api->query->orderData;
		$shipping = $json_api->query->shippingData;
		$gstpercent = $json_api->query->gstpercentage;
		$gst = $json_api->query->gst;
		$cartTotal = $json_api->query->cartTotal;
		$shippingCost = $json_api->query->shippingCost;
		$orderTotal = $json_api->query->orderTotal;
		$sellerID = $json_api->query->sellerID;
		
		$gamerseal_charges = $json_api->query->gamerseal_charges;
		$gamerseal_charges_amount = $json_api->query->gamerseal_charges_amount;
		
		$order = stripslashes($order);
		$shipping = stripslashes($shipping);
		
		$orderData = json_decode($order, true);
		$shippingData = json_decode($shipping, true);
		
		$date = strtotime("now");
		$order_id = $this->generateRandomString();
		
		$cartitems = array();
		$items = array();
		$batchItems = '';
		
		foreach($orderData as $orderD)
		{
			$cartitems[$orderD['product_id']] = array(
				"quantity" 	=> 1,
				"variation" => '',
				"price" => $orderD['product_price'],
            	"ID" => $orderD['product_id'],
            	"post_title" => $orderD['product_name'],
            	"prices" => 0,
            	"variations" => array(),
				"discount_amount" => 0,
            	"error" => "No Valid Coupon Found"
			);
			$items[] = $orderD['product_id'];
			$batchItems .= "('".$order_id."','".$orderD['seller_id']."','".$orderD['product_id']."','1','".$orderD['product_price']."','0','0'),";
		}
		$cartData =  serialize($cartitems);
		$itemsData =  serialize($items);
		
		$shippingInformation['billing'] = $shippingData;
		$shippingInformation['shippingin'] = $shippingData;
		
		$billing_shipping_data =  serialize($shippingInformation);
		
		
		//echo '<pre>';
		//print_r($orderData);
		$batchItems = rtrim($batchItems,',');
		//echo $batchItems;
		//die();
		
		$query = "INSERT INTO wp_mp_orders (order_id,title,date,items,cart_data,total,order_status,payment_status,uid,seller_id,order_notes,payment_method,shipping_method,shipping_cost,billing_shipping_data,cart_discount,cart_total,gst_percent,gst,gamersseal_charges,gamerseal_charges_amount) VALUES ('".$order_id."','Order From Gamersseal APP','".$date."','".$itemsData."','".$cartData."','".$orderTotal."','Processing','Processing','".$user_id."','".$sellerID."','','eWay','','".$shippingCost."','".$billing_shipping_data."','','".$cartTotal."','".$gstpercent."','".$gst."','".$gamerseal_charges."','".$gamerseal_charges_amount."')";
			//die();
			$res = $wpdb->query($query);
			$OrderID = $order_id;
			if($res)
			{
				$q2 = "INSERT INTO wp_mp_order_items (oid,seller_id,pid,quantity,price,status,site_commission) VALUES ".$batchItems;
				$res2 = $wpdb->query($q2);
				
				if($res2)
				{
					$response['OrderID'] = $OrderID;
					$response['order_status'] = "Order Successfully Placed.";
				}
				else
				{
					$response['OrderID'] = 0;
					$response['order_status'] = "There is some Error while Placing Order.";
				}
			}
			
			return $response;
	}
	
	
	
	function generateRandomString($length = 8) {
		
    $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
	$firstFiveNum = rand(10000,99999);
    return $firstFiveNum.$randomString;
	}
	
	
	function get_sorted_posts()
	{
		global $json_api;
		global $wpdb;
		
		$args = array(
		'posts_per_page'   => 5,
		'offset'           => 0,
		'category'         => '',
		'category_name'    => '',
		'orderby'          => 'meta_value',
		'order'            => 'DESC',
		'include'          => '',
		'exclude'          => '',
		'meta_key'         => 'sales_price',
		'meta_value'       => '',
		'post_type'        => 'wpmarketplace',
		'post_mime_type'   => '',
		'post_parent'      => '',
		'post_status'      => 'publish',
		'suppress_filters' => true 
	 );
	 
	$posts_array = get_posts($args);
	return $posts_array;
	}
	
		
	public function get_user_favorite_game_type(){

  		global $json_api;
		global $wpdb;	
		$user_id = $json_api->query->user_id;
			
			$query = "SELECT * FROM favorite_game_type WHERE user_id = '".$user_id."' ";
			$categories = $wpdb->get_results($query);
			if($categories)
			{
				return array('count'=>1,'game_types'=>$categories);
				
			}
			else
			{
				return array('count'=>0,'msg'=>"There is some Error while fetching user favorite game types.");
			}
  	}
	
	public function add_user_favorite_game_type(){

  		global $json_api;
		global $wpdb;	
		$user_id = $json_api->query->user_id;
		$game_type_id = $json_api->query->game_type;
		$game_type_name = $json_api->query->game_type_name;
			
			$query = "INSERT INTO favorite_game_type (user_id,game_type_id,game_type_name) VALUES ('".$user_id."','".$game_type_id."','".$game_type_name."')";
			$res = $wpdb->query($query);
			if($res)
			{
				return array('msg'=>"Game type added to favourite list successfully.");
				
			}
			else
			{
				return array('msg'=>"There is some Error while adding Game type to favourite list.");
			}
  	}
	
	public function remove_user_favorite_game_type(){

  		global $json_api;
		global $wpdb;	
		$user_id = $json_api->query->user_id;
		$game_type_id = $json_api->query->game_type;
			
			$query = "Delete FROM favorite_game_type WHERE user_id = '".$user_id."' AND game_type_id = '".$game_type_id."'";
			$res = $wpdb->query($query);
			if($res)
			{
				return array('msg'=>"Game type removed from favourite list successfully.");
				
			}
			else
			{
				return array('msg'=>"There is some Error while removing Game type from favourite list.");
			}
  	}
	
	public function get_user_sales(){

  		global $json_api;
		global $wpdb;
		
		$filterSales = array();
		
		$user_id = $json_api->query->user_id;
		
		$start_date = $json_api->query->start_date;
		$end_date = $json_api->query->end_date;
			
				if(!($start_date))
				{
					$start_date = date("Y-m-d H:i:s",strtotime("-12 month"));
				}
				if(!($end_date))
				{
					$end_date = date('Y-m-d');
				}
				
				$DateBegin = date('Y-m-d', strtotime($start_date));
				$DateEnd = date('Y-m-d', strtotime($end_date));
				
				 $query = "SELECT wp_mp_order_items.*,wp_mp_orders.uid,wp_mp_orders.date,wp_mp_orders.order_status,wp_mp_orders.payment_status FROM wp_mp_order_items INNER JOIN wp_mp_orders ON wp_mp_order_items.oid=wp_mp_orders.order_id where wp_mp_orders.seller_id = '".$user_id."' AND wp_mp_orders.order_status = 'completed' AND wp_mp_orders.payment_status = 'completed' order by date DESC";
					$sales = $wpdb->get_results($query);
					if($sales)
					{
						foreach($sales as $sale){
							//echo $sale->date;
							//print_r($sale);
							$orderDate = date('Y-m-d', $sale->date);
							if (($orderDate > $DateBegin) && ($orderDate < $DateEnd))
							{
								$sale->date = date('d M, Y', $sale->date);
								$filterSales[] = $sale;	
							}
						}
						return array('count'=>1,'sales'=>$filterSales);	
					}
					else
					{
						return array('count'=>0,'msg'=>"There is some Error while fetching User Sales.");
					}
	}
	
	
	
	
	public function insert_custom_fields_for_filter($post_id,$price,$age_limit){

  			global $json_api;
			global $wpdb;	
			$query = "INSERT INTO wp_custom_fields (post_id,age_limit,product_price) VALUES ('".$post_id."','".$age_limit."','".$price."')";
			$res = $wpdb->query($query);
  	}
	
	public function get_sorted_games(){

  			global $json_api;
			global $wpdb;
			$posts_data = array();
			//$popular_ids = array();
			
			$filter = $json_api->query->filter;
		    $sort = $json_api->query->sorting;
			$recent_ids = $json_api->query->ids;
			$user_id = $json_api->query->user_id;
			$type = $json_api->query->type;
			
			if($type == 'popular')
			{
			$queryPopular = "SELECT DISTINCT(productid) FROM wp_mp_feature_products";
			$resultPopular = $wpdb->get_results($queryPopular);
				foreach($resultPopular as $resultPop)
				{
					$popular_ids .= $resultPop->productid.",";
				}
				$popular_ids = rtrim($popular_ids,',');
			}
			
			if($type == 'favorite')
			{
			$queryfavorite = "SELECT product_id FROM favorite_items where user_id = '".$user_id."' ";
			$resultfavorite = $wpdb->get_results($queryfavorite);
				foreach($resultfavorite as $resultFav)
				{
					$favorite_ids .= $resultFav->product_id.",";
				}
				$favorite_ids = rtrim($favorite_ids,',');
			}
			
			
			if($recent_ids)
			{
				$query = "SELECT * FROM wp_custom_fields where post_id IN ($recent_ids) order by $filter $sort";
			}
			elseif($type == 'popular')
			{
				$query = "SELECT * FROM wp_custom_fields where post_id IN ($popular_ids) order by $filter $sort";
			}
			elseif($type == 'favorite')
			{
				$query = "SELECT * FROM wp_custom_fields where post_id IN ($favorite_ids) order by $filter $sort";
			}
			else
			{
				$query = "SELECT * FROM wp_custom_fields order by $filter $sort";
			}
			
			$result = $wpdb->get_results($query);
			if($result)
			{
				$sorted_ids = array();
				foreach($result as $res)
				{
					$sorted_ids[] = $res->post_id;
				}
				foreach($sorted_ids as $sorted_id)
				{
					$post = get_post($sorted_id);
					if($post->post_status == 'publish')
					{
					$sales_price = get_post_meta($sorted_id, 'sales_price');
					$delivery_time = get_post_meta($sorted_id, 'delivery_time');
					$post->display_name = get_the_author_meta('display_name', $post->post_author);
					$images = get_post_meta( $sorted_id, 'images' );
					$visible = get_post_meta($sorted_id, 'visible');
					$post->sales_price = $sales_price[0];
					$post->images = $images[0];
					$post->delivery_time = $delivery_time[0];
					$post->visible = $visible[0];
					$posts_data[] = $post;
					}
					//$posts_data[] = $meta;
				}
				
				return array('posts'=>$posts_data);
			}
  	}
	
	public function get_popular_games(){

  			global $json_api;
			global $wpdb;
			$posts_data = array();
			
			$query = "SELECT DISTINCT(productid) FROM wp_mp_feature_products";
			$result = $wpdb->get_results($query);
			if($result)
			{
				$sorted_ids = array();
				foreach($result as $res)
				{
					$sorted_ids[] = $res->productid;
				}
				foreach($sorted_ids as $sorted_id)
				{
					$post = get_post($sorted_id);
					if($post->post_status == 'publish')
					{
					$sales_price = get_post_meta($sorted_id, 'sales_price');
					$delivery_time = get_post_meta($sorted_id, 'delivery_time');
					$post->display_name = get_the_author_meta('display_name', $post->post_author);
					$images = get_post_meta( $sorted_id, 'images' );
					$visible = get_post_meta($sorted_id, 'visible');
					$post->sales_price = $sales_price[0];
					$post->images = $images[0];
					$post->delivery_time = $delivery_time[0];
					$post->visible = $visible[0];
					$posts_data[] = $post;
					}
					//$posts_data[] = $meta;
				}
				
				return array('posts'=>$posts_data);
			}
  	}
	
	
	public function get_recently_viewed_games(){

  			global $json_api;
			global $wpdb;
			$posts_data = array();
			
			$recent_ids = $json_api->query->ids;
		    //$sort = $json_api->query->sorting;
			
				$sorted_ids = explode(',', $recent_ids);
				$sorted_ids = array_unique($sorted_ids);
				foreach($sorted_ids as $sorted_id)
				{
					$post = get_post($sorted_id);
					if($post->post_status == 'publish')
					{
					$sales_price = get_post_meta($sorted_id, 'sales_price');
					$delivery_time = get_post_meta($sorted_id, 'delivery_time');
					$post->display_name = get_the_author_meta('display_name', $post->post_author);
					$images = get_post_meta( $sorted_id, 'images' );
					$visible = get_post_meta($sorted_id, 'visible');
					$post->sales_price = $sales_price[0];
					$post->images = $images[0];
					$post->delivery_time = $delivery_time[0];
					$post->visible = $visible[0];
					$posts_data[] = $post;
					}
					//$posts_data[] = $meta;
				}
				
				return array('posts'=>$posts_data);
	}
	
	public function get_user_items_today(){

  			global $json_api;
			global $wpdb;
			
			$user_id = $json_api->query->user_id;
			$today = date('Y-m-d');
			$start_today = $today." 00:00:00";
			$end_today = $today." 23:59:59";
			
			$query = "SELECT * FROM wp_posts where post_author=$user_id AND post_date BETWEEN '".$start_today."' AND '".$end_today."'";
			$result = $wpdb->get_results($query);
			if($result)
			{
				$count = count($result);
				
			}
			else
			{
				$count = 0;
			}
			return array('count'=>$count);
  	}
	
	
	public function get_user_purchase_today(){

  			global $json_api;
			global $wpdb;
			
			$user_id = $json_api->query->user_id;
			$today = date('Y-m-d');
			$start_today = $today." 00:00:00";
			$end_today = $today." 23:59:59";
			
			$query = "SELECT * FROM wp_mp_orders where uid=$user_id AND date BETWEEN '".strtotime($start_today)."' AND '".strtotime($end_today)."'";
			$result = $wpdb->get_results($query);
			if($result)
			{
				//print_r($result);
				$totalPurchase = 0;
				foreach($result as $res)
				{
					$res->cart_total;
					$totalPurchase = $totalPurchase + $res->cart_total;
				}
			}
			else
			{
				$totalPurchase = 0;
			}
			return array('purchase'=>$totalPurchase);
  	}
	
	public function get_user_transactions_today(){

  			global $json_api;
			global $wpdb;
			
			$user_id = $json_api->query->user_id;
			$today = date('Y-m-d');
			$start_today = $today." 00:00:00";
			$end_today = $today." 23:59:59";
			
			$sellingQuery = "SELECT * FROM wp_posts where post_author=$user_id AND post_date BETWEEN '".$start_today."' AND '".$end_today."'";
			$sellingResult = $wpdb->get_results($sellingQuery);
			if($sellingResult)
			{
				$sellingCount = count($sellingResult);
				
			}
			else
			{
				$sellingCount = 0;
			}
			
			$buyingQuery = "SELECT * FROM wp_mp_orders where uid=$user_id AND date BETWEEN '".strtotime($start_today)."' AND '".strtotime($end_today)."'";
			$buyingResult = $wpdb->get_results($buyingQuery);
			if($buyingResult)
			{
				$buyingCount = count($buyingResult);
				
			}
			else
			{
				$buyingCount = 0;
			}
			
			$totalTransactions = $sellingCount + $buyingCount;
			return array('buying'=>$buyingCount,'selling' =>$sellingCount, 'total' => $totalTransactions);
  	}
	
	public function get_seller_orders(){

  		global $json_api;
		global $wpdb;
		
		$ordersData = array();
		
		$user_id = $json_api->query->user_id;
		
			$query = "SELECT * FROM wp_mp_orders where seller_id = '".$user_id."' order by date DESC";
			$orders = $wpdb->get_results($query);
			if($orders)
			{
				foreach($orders as $order){
					//echo $sale->date;
						$order->date = date('d M, Y', $order->date);
						$order->billing_shipping_data = unserialize($order->billing_shipping_data);
						$order->cart_data = unserialize($order->cart_data);
						$order->items = unserialize($order->items);
						
						foreach($order->items as $itm)
						{
							$ids .= "'".$itm."'".",";
						}
						$ids = rtrim($ids,',');
						
						$q = "SELECT MAX(meta_value) as max FROM wp_postmeta where post_id IN ($ids) AND meta_key = 'delivery_time'";
						$delievery_time = $wpdb->get_results($q);
						$del_time = $delievery_time[0]->max;
						
						$order->delievery_time = date('d M, Y', strtotime($order->date . ' +'.$del_time.' day'));
						//die();
												
						$ordersData[] = $order;	
				}
				return array('count'=>1,'orders'=>$ordersData);
				
			}
			else
			{
				return array('count'=>0,'msg'=>"There is some Error while fetching User Orders.");
			}
  	}
	
	public function get_Order_by_orderid(){

  		global $json_api;
		global $wpdb;
		
		$ordersData = array();
		
		$user_id = $json_api->query->user_id;
		$order_id = $json_api->query->order_id;
		
			$query = "SELECT * FROM wp_mp_orders where seller_id = '".$user_id."' AND order_id = '".$order_id."' ";
			$orders = $wpdb->get_results($query);
			if($orders)
			{
				foreach($orders as $order){
					//echo $sale->date;
						$order->date = date('d M, Y', $order->date);
						$order->billing_shipping_data = unserialize($order->billing_shipping_data);
						$order->cart_data = unserialize($order->cart_data);
						$order->items = unserialize($order->items);
						
						foreach($order->items as $itm)
						{
							$ids .= "'".$itm."'".",";
						}
						$ids = rtrim($ids,',');
						
						$q = "SELECT MAX(meta_value) as max FROM wp_postmeta where post_id IN ($ids) AND meta_key = 'delivery_time'";
						$delievery_time = $wpdb->get_results($q);
						$del_time = $delievery_time[0]->max;
						
						$order->delievery_time = date('d M, Y', strtotime($order->date . ' +'.$del_time.' day'));
						//die();
												
						$ordersData[] = $order;	
				}
				return array('count'=>1,'order'=>$ordersData);
				
			}
			else
			{
				return array('count'=>0,'msg'=>"There is some Error while fetching User Order.");
			}
  	}
	
	public function update_order_shipping_status(){

  		global $json_api;
		global $wpdb;
		
		$shipping_status = $json_api->query->shipping_status;
		$order_id = $json_api->query->order_id;
		$user_id = $json_api->query->user_id;
		
				$query = "UPDATE wp_mp_orders SET shipping_status = '".$shipping_status."' where seller_id = '".$user_id."' AND order_id = '".$order_id."' ";
				$res2 = $wpdb->query($query);
				if($res2)
				{
					$response = "Order Shipping Status Changed to '".$shipping_status."'.";
				}
				else
				{
					$response = "Order Shipping Status already set to '".$shipping_status."'.";
				}
				return array('shipping_status'=>$response);
  	}
	
		public function get_buyer_orders(){

  		global $json_api;
		global $wpdb;
		
		$ordersData = array();
		
		$user_id = $json_api->query->user_id;
		
			$query = "SELECT * FROM wp_mp_orders where uid = '".$user_id."' order by date DESC";
			$orders = $wpdb->get_results($query);
			if($orders)
			{
				foreach($orders as $order){
					//echo $sale->date;
						$order->date = date('d M, Y', $order->date);
						$order->billing_shipping_data = unserialize($order->billing_shipping_data);
						$order->cart_data = unserialize($order->cart_data);
						$order->items = unserialize($order->items);
						
						foreach($order->items as $itm)
						{
							$ids .= "'".$itm."'".",";
						}
						$ids = rtrim($ids,',');
						
						$q = "SELECT MAX(meta_value) as max FROM wp_postmeta where post_id IN ($ids) AND meta_key = 'delivery_time'";
						$delievery_time = $wpdb->get_results($q);
						$del_time = $delievery_time[0]->max;
						
						$order->delievery_time = date('d M, Y', strtotime($order->date . ' +'.$del_time.' day'));
						//die();
												
						$ordersData[] = $order;	
				}
				return array('count'=>1,'orders'=>$ordersData);
				
			}
			else
			{
				return array('count'=>0,'msg'=>"There is some Error while fetching User Orders.");
			}
  	}
	
	
		public function get_buyer_order_by_orderid(){

  		global $json_api;
		global $wpdb;
		
		$ordersData = array();
		
		$user_id = $json_api->query->user_id;
		$order_id = $json_api->query->order_id;
		
			$query = "SELECT * FROM wp_mp_orders where uid = '".$user_id."' AND order_id = '".$order_id."' ";
			$orders = $wpdb->get_results($query);
			if($orders)
			{
				foreach($orders as $order){
					//echo $sale->date;
						$order->date = date('d M, Y', $order->date);
						$order->billing_shipping_data = unserialize($order->billing_shipping_data);
						$order->cart_data = unserialize($order->cart_data);
						$order->items = unserialize($order->items);
						
						foreach($order->items as $itm)
						{
							$ids .= "'".$itm."'".",";
						}
						$ids = rtrim($ids,',');
						
						$q = "SELECT MAX(meta_value) as max FROM wp_postmeta where post_id IN ($ids) AND meta_key = 'delivery_time'";
						$delievery_time = $wpdb->get_results($q);
						$del_time = $delievery_time[0]->max;
						
						$order->delievery_time = date('d M, Y', strtotime($order->date . ' +'.$del_time.' day'));
						//die();
												
						$ordersData[] = $order;	
				}
				return array('count'=>1,'order'=>$ordersData);
				
			}
			else
			{
				return array('count'=>0,'msg'=>"There is some Error while fetching User Order.");
			}
  	}
	
	public function update_order_payment(){

  		global $json_api;
		global $wpdb;	
		$user_id = $json_api->query->user_id;
		$order_id = $json_api->query->order_id;
		$payment_reference = $json_api->query->payment_reference;
			
		$payment_method = 'PayPal';
		$query = "UPDATE wp_mp_orders SET payment_method = '".$payment_method."',payment_status = 'Completed', payment_reference = '".$payment_reference."' WHERE uid= '".$user_id."' AND order_id = '".$order_id."'";
			$res = $wpdb->query($query);
			if($res)
			{
				$response = "Payment Successfully Updated";
				
			}
			else
			{
				$response = "Payment Not Updated";
			}
			
			return $response;
  	}
	
	
	public function addtofavorite(){

  		global $json_api;
		global $wpdb;	
		$user_id = $json_api->query->user_id;
		$product_id = $json_api->query->product_id;
			
		$query = "SELECT * from favorite_items where user_id = '".$user_id."' AND product_id = '".$product_id."' ";
		$res = $wpdb->query($query);
		if($res)
		{
			$queryIns = "DELETE FROM favorite_items WHERE user_id = '".$user_id."' AND product_id = '".$product_id."' ";
			$resIns = $wpdb->query($queryIns);
			$response = "Removed from Favorite";
				
		}
		else
		{
			$queryIns = "INSERT INTO favorite_items (user_id,product_id) VALUES ('".$user_id."', '".$product_id."') ";
			$resIns = $wpdb->query($queryIns);
			$response = "Added to Favorite";
		}
			
		return $response;
  	}
	
	
	
	public function checkfavorite(){

  		global $json_api;
		global $wpdb;	
		$user_id = $json_api->query->user_id;
		$product_id = $json_api->query->product_id;
			
		$query = "SELECT * from favorite_items where user_id = '".$user_id."' AND product_id = '".$product_id."' ";
		$res = $wpdb->query($query);
		if($res)
		{
			$response = "Yes";
				
		}
		else
		{
			$response = "No";
		}
			
		return $response;
  	}
	
	
	public function get_favorite_games(){

  			global $json_api;
			global $wpdb;
			$posts_data = array();
			$user_id = $json_api->query->user_id;
			
			$query = "SELECT product_id FROM favorite_items where user_id = '".$user_id."' ";
			$result = $wpdb->get_results($query);
			if($result)
			{
				//print_r($result);
				//die();
				$sorted_ids = array();
				foreach($result as $res)
				{
					$sorted_ids[] = $res->product_id;
				}
				foreach($sorted_ids as $sorted_id)
				{
					$post = get_post($sorted_id);
					if($post->post_status == 'publish')
					{
					$sales_price = get_post_meta($sorted_id, 'sales_price');
					$delivery_time = get_post_meta($sorted_id, 'delivery_time');
					$post->display_name = get_the_author_meta('display_name', $post->post_author);
					$images = get_post_meta( $sorted_id, 'images' );
					$visible = get_post_meta($sorted_id, 'visible');
					$post->sales_price = $sales_price[0];
					$post->images = $images[0];
					$post->delivery_time = $delivery_time[0];
					$post->visible = $visible[0];
					$posts_data[] = $post;
					}
					//$posts_data[] = $meta;
				}
				
				return array('posts'=>$posts_data);
			}
  	}
	
	
	
	public function make_donation(){

  		global $json_api;
		global $wpdb;	
		
		$user_id = $json_api->query->user_id;
		$name = $json_api->query->name;
		$email = $json_api->query->email;
		$phone = $json_api->query->phone;
		$amount = $json_api->query->amount;
		$anon = $json_api->query->anon;
		$don_num = $json_api->query->don_num;
		$today = date("Y-m-d");
		$today_dayname = date("l");

		$week = $this->getWeeks($today, $today_dayname);
		$year = date("Y");
		$month = date("m");
			
			$query = "INSERT INTO donations (user,name,email,phone,amount,anonymous,don_week,don_month,don_year,don_num) VALUES ('".$user_id."','".$name."','".$email."','".$phone."','".$amount."','".$anon."','".$week."','".$month."','".$year."','".$don_num."')";
			$res = $wpdb->query($query);
			if($res)
			{
				return array('msg'=>"Donation Successfully made.");
				
			}
			else
			{
				return array('msg'=>"There is some Error while adding donation.");
			}
  	}
	
	public function get_user_donation(){

  		global $json_api;
		global $wpdb;	
		
		$user_id = $json_api->query->user_id;
		
			
			$query = "SELECT SUM(amount) as donation FROM `donations` where user = '".$user_id."' ";
			$donation = $wpdb->get_results($query);
			if($donation)
			{
				//print_r($donation);
				$donationAmount = $donation[0]->donation;
				return array('donation'=> $donationAmount);
				
			}
			else
			{
				return array('donation'=>"0",'msg'=>"There is some Error while fetching donation.");
			}
			
  	}
	
	public function getWeeks($date, $rollover)
	{
		$cut        = substr($date, 0, 8);
		$daylen     = 86400;
		$timestamp  = strtotime($date);
		$first      = strtotime($cut . "01");   
		$elapsed    = (($timestamp - $first) / $daylen)+1;
		$i          = 1;
		$weeks      = 0;
		for($i==1; $i<=$elapsed; $i++)
		{
			$dayfind        = $cut . (strlen($i) < 2 ? '0' . $i : $i);
			$daytimestamp   = strtotime($dayfind);
			$day            = strtolower(date("l", $daytimestamp));
			if($day == strtolower($rollover))
			{
				$weeks++;  
			}
		} 
		if($weeks==0)
		{
			$weeks++; 
		}
		return $weeks;  
	}
	
	public function get_hall_of_fame(){

  		global $json_api;
		global $wpdb;	
		
		$type = $json_api->query->type;
		$year = $json_api->query->don_year;
		$month = $json_api->query->don_month;
		$week = $json_api->query->don_week;
		
		if($type == 'default')
		{
			$year = date("Y");
			$month = date("m");
			$query = "SELECT *,SUM(amount) as total_donation FROM donations WHERE don_year = '".$year."' Group By user Order by total_donation DESC LIMIT 4";
		}
		else
		{
			$where = '';
			
			
			if($year || $month || $week)
			{
				if($year)
				{
				$where .= " don_year = '".$year."' and";
				}
				if($month)
				{
				$where .= " don_month = '".$month."' and";
				}
				if($week)
				{
				$where .= " don_week = '".$week."' and";
				}
				$where = substr($where, 0, -3);
				$query = "SELECT *,SUM(amount) as total_donation FROM `donations` WHERE ".$where." Group By user Order by total_donation DESC LIMIT 4";
			}
			else
			{
				$year = date("Y");
				$month = date("m");
				$query = "SELECT *,SUM(amount) as total_donation FROM donations WHERE don_year = '".$year."' Group By user Order by total_donation DESC LIMIT 4";
			}
			
		}
			$halloffame = $wpdb->get_results($query);
			if($halloffame)
			{
				return array('halloffame'=> $halloffame,'status' => 'ok');
				
			}
			else
			{
				return array('halloffame'=>"0",'msg'=>"There is no Hall Of Member found for this time Period.");
			}
			
  	}
	
	


    //
    
	public function get_user_sales_by_type(){

  		global $json_api;
		global $wpdb;
		
		$filterSales = array();
		
		$user_id = $json_api->query->user_id;
		$report_type = $json_api->query->report_type;
				if($report_type == 'daily')
				{
					 $query = "SELECT wp_mp_order_items.*,wp_mp_orders.uid,wp_mp_orders.date,wp_mp_orders.order_status,wp_mp_orders.payment_status FROM wp_mp_order_items INNER JOIN wp_mp_orders ON wp_mp_order_items.oid=wp_mp_orders.order_id where wp_mp_orders.seller_id = '".$user_id."' AND wp_mp_orders.order_status = 'completed' AND wp_mp_orders.payment_status = 'completed' order by date DESC";
						$sales = $wpdb->get_results($query);
						if($sales)
						{
							foreach($sales as $sale){
								$DateBegin = date('Y-m-d', strtotime(date('Y-m-d')));
								$DateEnd = date('Y-m-d', strtotime(date('Y-m-d')));
								
								$DateBegin = $DateBegin." 00:00:00";
								$DateEnd = $DateEnd." 23:59:59";
								
								$orderDate = date('Y-m-d', $sale->date);
								if (($orderDate > $DateBegin) && ($orderDate < $DateEnd))
								{
									$sale->date = date('d M, Y', $sale->date);
									$filterSales[] = $sale;	
								}
							}
							return array('count'=>1,'sales'=>$filterSales);	
						}
						else
						{
							return array('count'=>0,'msg'=>"There is some Error while fetching User Sales.");
						}
				}
				
				if($report_type == 'weekly')
				{
					 $query = "SELECT wp_mp_order_items.*,wp_mp_orders.uid,wp_mp_orders.date,wp_mp_orders.order_status,wp_mp_orders.payment_status FROM wp_mp_order_items INNER JOIN wp_mp_orders ON wp_mp_order_items.oid=wp_mp_orders.order_id where wp_mp_orders.seller_id = '".$user_id."' AND wp_mp_orders.order_status = 'completed' AND wp_mp_orders.payment_status = 'completed' order by date DESC";
						$sales = $wpdb->get_results($query);
						if($sales)
						{
							foreach($sales as $sale){
								$DateBegin = date("Y-m-d",strtotime("-1 week"));
								$DateEnd = date('Y-m-d', strtotime(date('Y-m-d')));
								
								$DateBegin = $DateBegin." 00:00:00";
								$DateEnd = $DateEnd." 23:59:59";
								
								$orderDate = date('Y-m-d', $sale->date);
								if (($orderDate > $DateBegin) && ($orderDate < $DateEnd))
								{
									$sale->date = date('d M, Y', $sale->date);
									$filterSales[] = $sale;	
								}
							}
							return array('count'=>1,'sales'=>$filterSales);	
						}
						else
						{
							return array('count'=>0,'msg'=>"There is some Error while fetching User Sales.");
						}
				}
				if($report_type == 'monthly')
				{
					 $query = "SELECT wp_mp_order_items.*,wp_mp_orders.uid,wp_mp_orders.date,wp_mp_orders.order_status,wp_mp_orders.payment_status FROM wp_mp_order_items INNER JOIN wp_mp_orders ON wp_mp_order_items.oid=wp_mp_orders.order_id where wp_mp_orders.seller_id = '".$user_id."' AND wp_mp_orders.order_status = 'completed' AND wp_mp_orders.payment_status = 'completed' order by date DESC";
						$sales = $wpdb->get_results($query);
						if($sales)
						{
							foreach($sales as $sale){
								
								$DateBegin = date("Y-m-d",strtotime("-1 month"));
								$DateEnd = date('Y-m-d', strtotime(date('Y-m-d')));
								
								 $DateBegin = $DateBegin." 00:00:00";
								 $DateEnd = $DateEnd." 23:59:59";
								
								$orderDate = date('Y-m-d', $sale->date);
								if (($orderDate > $DateBegin) && ($orderDate < $DateEnd))
								{
									$sale->date = date('d M, Y', $sale->date);
									$filterSales[] = $sale;	
								}
							}
							return array('count'=>1,'sales'=>$filterSales);	
						}
						else
						{
							return array('count'=>0,'msg'=>"There is some Error while fetching User Sales.");
						}
				}
				if($report_type == 'yearly')
				{
					 $query = "SELECT wp_mp_order_items.*,wp_mp_orders.uid,wp_mp_orders.date,wp_mp_orders.order_status,wp_mp_orders.payment_status FROM wp_mp_order_items INNER JOIN wp_mp_orders ON wp_mp_order_items.oid=wp_mp_orders.order_id where wp_mp_orders.seller_id = '".$user_id."' AND wp_mp_orders.order_status = 'completed' AND wp_mp_orders.payment_status = 'completed' order by date DESC";
						$sales = $wpdb->get_results($query);
						if($sales)
						{
							foreach($sales as $sale){
								$DateBegin = date("Y-m-d",strtotime("-1 year"));
								$DateEnd = date('Y-m-d', strtotime(date('Y-m-d')));
								
								$DateBegin = $DateBegin;
								$DateEnd = $DateEnd;
								
								$orderDate = date('Y-m-d', $sale->date);
								if (($orderDate > $DateBegin) && ($orderDate < $DateEnd))
								{
									$sale->date = date('d M, Y', $sale->date);
									$filterSales[] = $sale;	
								}
							}
							return array('count'=>1,'sales'=>$filterSales);	
						}
						else
						{
							return array('count'=>0,'msg'=>"There is some Error while fetching User Sales.");
						}
				}
		
					
	}	
	
  

 }//end class