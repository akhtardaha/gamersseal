<?php 
ob_start();
/** Step 2 (from text above). */
add_action( 'admin_menu', 'addScripts' );
add_action( 'admin_menu', 'my_plugin_menu' );


/** Step 1. */
function my_plugin_menu() {
	add_options_page( 'App Configuration', 'App Configuration', 'manage_options', 'app_configuration', 'app_configuration_options' );
}

/** Step 3. */
/*function app_configuration_options() {
	
	echo '<div class="wrap">';
	echo '<h2>App Configuration</h2>';
	echo '<p>Here is where the form would go if I actually had options.</p>';
	echo '</div>';
}*/
 
function app_configuration_options()
{
 global $wpdb;
 $querystr = "SELECT * FROM app_configuration";
 $pageposts = $wpdb->get_results($querystr, ARRAY_A);
 //print_r($pageposts);
 foreach ($pageposts as $option)
 {
	 $id =  $option['id'];
	$gst =  $option['gst'];
	$item_desc_limit =  $option['item_desc_limit'];
	$guest_seal_charges =  $option['guest_seal_charges'];
	$standard_seal_charges =  $option['standard_seal_charges'];
	$premium_seal_charges =  $option['premium_seal_charges'];
	$standard_item_day =  $option['standard_item_day'];
	$premium_item_day =  $option['premium_item_day'];
	$app_background_color = $option['app_background_color'];
	$app_icon = $option['app_icon'];
	$terms_and_conditions = $option['terms_and_conditions'];
	
	$guest_daily_purchase =  $option['guest_daily_purchase'];
	$standard_daily_purchase =  $option['standard_daily_purchase'];
	$premium_daily_purchase =  $option['premium_daily_purchase'];
	
	$guest_daily_transaction =  $option['guest_daily_transaction'];
	$standard_daily_transaction =  $option['standard_daily_transaction'];
	$premium_daily_transaction =  $option['premium_daily_transaction'];
	
	
	
 }
?>

    <div class="wrap configurationPage">
        <h2>App Configuration</h2>
        <form method="post" action="options.php">
            <?php // wp_nonce_field('update-options') ?>
            <p><strong>GST %:</strong><br />
                <input type="text" id="gst" name="gst" value="<?php echo $gst; ?>" />
            </p>
            <p><strong>Item Description Limit:</strong><br />
                <input type="text" id="desclimit" name="desclimit" value="<?php echo $item_desc_limit; ?>" />
            </p>
            <div class="confSections">
            	<div class="confSection" style="width:33%; float:left;">
            		<fieldset>
                        <legend>Gamer Seal Charges:</legend>
                         <p><strong>Guest :</strong><br />
                            <input type="text" id="guestcharges" name="guestcharges" value="<?php echo $guest_seal_charges; ?>" />
                         </p>
                         <p><strong>Standard :</strong><br />
                            <input type="text" id="standardcharges" name="standardcharges" value="<?php echo $standard_seal_charges; ?>" />
                         </p>
                         <p><strong>Premium :</strong><br />
                            <input type="text" id="premiumcharges" name="premiumcharges" value="<?php echo $premium_seal_charges; ?>" />
                         </p>
              		</fieldset>
                </div>
                <div class="confSection" style="width:33%; float:left;">
            		<fieldset>
                        <legend>Item Addition per Day:</legend>
                         <p><strong>Standard :</strong><br />
                            <input type="text" id="standarditemday" name="standarditemday" value="<?php echo $standard_item_day; ?>" />
                         </p>
                         <p><strong>Premium :</strong><br />
                            <input type="text" id="premiumitemday" name="premiumitemday" value="<?php echo $premium_item_day; ?>" />
                         </p>
              		</fieldset>
                </div>
                <div class="confSection" style="width:33%; float:left;">
            		<fieldset>
                        <legend>App Background Color:</legend>
                         <p><strong>Choose Color :</strong><br />
                            <input type="text" style="background-color:<?php echo $app_background_color; ?>;" id="appbgclr" name="appbgclr" value="<?php echo $app_background_color; ?>" />
                         </p>
                         <p><strong>App Icon :</strong><br />
                            <input type="file" id="appicon" name="appicon" value="<?php echo $app_icon; ?>" />
                            <input type="button" id="upload" name="upload" value="Upload">
                            <div class="previewIcon"><img src="<?php echo get_site_url(); ?>/uploads/appicon/<?php echo $app_icon; ?>" alt=""></div>
                         </p>
              		</fieldset>
                </div>
            </div>
            <div class="confSections">
            	<div class="confSection" style="width:33%; float:left;">
            	<p><strong>Terms and Conditions:</strong><br />
                <textarea id="terms" style="width: 95%; height: 200px;" name="terms"><?php echo $terms_and_conditions; ?></textarea></p>
                </div>
                <div class="confSection" style="width:33%; float:left;">
            		<fieldset>
                        <legend>Max Purchase Amount per Day :</legend>
                         <p><strong>Guest :</strong><br />
                            <input type="text" id="guestBuyAmountDay" name="guestBuyAmountDay" value="<?php echo $guest_daily_purchase; ?>" />
                         </p>
                         <p><strong>Standard :</strong><br />
                            <input type="text" id="standardBuyAmountDay" name="standardBuyAmountDay" value="<?php echo $standard_daily_purchase; ?>" />
                         </p>
                         <p><strong>Premium :</strong><br />
                            <input type="text" id="premiumBuyAmountDay" name="premiumBuyAmountDay" value="<?php echo $premium_daily_purchase; ?>" />
                         </p>
              		</fieldset>
                </div>
                <div class="confSection" style="width:33%; float:left;">
            		<fieldset>
                        <legend>Max Transaction per Day :</legend>
                         <p><strong>Guest :</strong><br />
                            <input type="text" id="guestTransactionDay" name="guestTransactionDay" value="<?php echo $guest_daily_transaction; ?>" />
                         </p>
                         <p><strong>Standard :</strong><br />
                            <input type="text" id="standardTransactionDay" name="standardTransactionDay" value="<?php echo $standard_daily_transaction; ?>" />
                         </p>
                         <p><strong>Premium :</strong><br />
                            <input type="text" id="premiumTransactionDay" name="premiumTransactionDay" value="<?php echo $premium_daily_transaction; ?>" />
                         </p>
              		</fieldset>
                </div>
            </div>
            <div class="confSections">
            	<p><input type="button" onClick="return submitConfiguration();" name="Submit" value="Store Configuration" /></p>
                <input type="hidden" name="siteUrl" id="siteUrl" value="<?php echo get_site_url(); ?>">
                <input type="hidden" name="confID" id="confID" value="<?php echo $id; ?>">
            </p>
            </div>
            
        </form>
    </div>
<?php
}

add_action( 'admin_menu', 'message_board_menu' );

/** Step 1. */
function message_board_menu() {
	add_options_page( 'Message Board', 'Message Board', 'manage_options', 'message_board', 'message_board_options' );
}

/** Step 3. */
/*function app_configuration_options() {
	
	echo '<div class="wrap">';
	echo '<h2>App Configuration</h2>';
	echo '<p>Here is where the form would go if I actually had options.</p>';
	echo '</div>';
}*/
 
function message_board_options()
{
 global $wpdb;
 $querystr = "SELECT * FROM message_board ORDER BY message_id DESC";
 $messages = $wpdb->get_results($querystr, ARRAY_A);
?>

    <div class="wrap configurationPage">
        <h2>Message Board</h2>
        <div class="confSections">
            	<div class="confSection" style="width:50%; float:left;">
            		<fieldset>
                        <legend>Send New Admin Message</legend>
                         <p><strong>Choose User to Send Message:</strong><br />
                            <select style="width: 50%; border: thin solid rgb(161, 172, 191); height: 32px;" id="users" name="users">
                            	<option value="">Choose Reciever</option>
                                <?php
								$all_Users = get_users();
								// Array of WP_User objects.
								foreach ( $all_Users as $user ) {?>
                                	<?php $user_ID = get_current_user_id(); 
									if($user_ID != $user->id) { ?> 
                                	<option value="<?php echo esc_html($user->id); ?>"><?php echo esc_html($user->display_name); ?></option>
                                    <?php } ?>
								<?php }?>
                            </select>
                         </p>
                         <p><strong>Message Title :</strong><br />
                           <input id="title" style="width: 50%; border: thin solid rgb(161, 172, 191); height: 32px;"  name="title" /></p>
                         </p>
                         <p><strong>Message :</strong><br />
                           <textarea id="message" style="width: 95%; height: 300px;" name="message"></textarea></p>
                         </p>
                         <p><input type="button" onClick="return submitMessage();" name="SubmitMessage" value="Send Message" /></p>
                         <input type="hidden" name="siteUrl" id="siteUrl" value="<?php echo get_site_url(); ?>">
              		</fieldset>
                </div>
                <div class="confSection" style="width:100%; float:left;">
 					<fieldset>
                        <legend>Message Board History</legend>
                         <table width="100%" border="1" cellpadding="1" name="message_history" id="message_history">
                         	<thead style="background: none repeat scroll 0% 0% rgb(203, 203, 204);">
                            	<tr>
                                	<th style="text-align: left;">Message ID</th>
                                    <th style="text-align: left;">Sender</th>
                                    <th style="text-align: left;">Reciever</th>
                                    <th style="text-align: left;">Title</th>
                                    <th style="text-align: left;">Message</th>
                                    <th style="text-align: left;">Message Type</th>
                                    <th style="text-align: left;">Options</th>
                                </tr>
                         	</thead>
                            <tbody style="font-size:12px;">
								<?php
                                foreach ($messages as $message) {?>
									<tr>
                                	<td><?php echo $message['message_id']; ?></td>
                                    <td><?php if($message['sender_id'] == 'admin')
										{
											echo $message['sender_id'];
										}
										else
										{
											$sender = get_userdata($message['sender_id']); 
											echo $sender->display_name;	
										}?>
									 </td>
                                    <td><?php $reciever = get_userdata($message['reciever_id']); echo $reciever->display_name; ?></td>
                                    <td><?php echo $message['message_title'];?></td>
                                    <td><?php echo $message['message_txt'];?></td>
                                    <td><?php echo $message['message_type'];?></td>
                                    <td><a href="javascript:void(0)" onclick="return deleteMessage(<?php echo $message['message_id']; ?>);">Delete</a></td>
                                </tr>
                                <?php } ?>
                            </tbody>
                         </table>
              		</fieldset>
                </div>
         </div>
        
    </div>
<?php
}

function addScripts()
{?>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.css">  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>

<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/colorpicker.js"></script>
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/colorpicker.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	$('#appbgclr').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		},
		onChange: function (hsb, hex, rgb) {
		$('#appbgclr').css('backgroundColor', '#' + hex);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});
	
	$('#message_history').DataTable();
});
function submitConfiguration()
{
	var gst = $('#gst').val();
	var desclimit = $('#desclimit').val();
	var guestcharges = $('#guestcharges').val();
	var standardcharges = $('#standardcharges').val();
	var premiumcharges = $('#premiumcharges').val();
	var standarditemday = $('#standarditemday').val();
	var premiumitemday = $('#premiumitemday').val();
	var appbgclr = $('#appbgclr').val();
	appbgclr = '#'+appbgclr;
	var appicon = $('#appicon').val();
	var terms = $('#terms').val();
	var siteUrl = $('#siteUrl').val();
	var confID = $('#confID').val();
	
	var guestBuyAmountDay = $('#guestBuyAmountDay').val();
	var standardBuyAmountDay = $('#standardBuyAmountDay').val();
	var premiumBuyAmountDay = $('#premiumBuyAmountDay').val();
	var guestTransactionDay = $('#guestTransactionDay').val();
	var standardTransactionDay = $('#standardTransactionDay').val();
	var premiumTransactionDay = $('#premiumTransactionDay').val();
	
	
	var data = { gst: gst, desclimit: desclimit,guestcharges: guestcharges ,standardcharges: standardcharges ,premiumcharges: premiumcharges ,standarditemday: standarditemday ,premiumitemday: premiumitemday,appbgclr:appbgclr,appicon:appicon, terms:terms, confID:confID,guestBuyAmountDay:guestBuyAmountDay,standardBuyAmountDay:standardBuyAmountDay,premiumBuyAmountDay:premiumBuyAmountDay,guestTransactionDay:guestTransactionDay,standardTransactionDay:standardTransactionDay,premiumTransactionDay:premiumTransactionDay};
	var url = siteUrl+'/update_app_configuration.php';
	$.ajax({
	  type: "POST",
	  url: url,
	  data: data,
	  success: function(data) 
	  {
		  alert(data);
	  }
	});
	
	//alert(desclimit);
}

function deleteMessage(message_id)
{
	var siteUrl = $('#siteUrl').val();
	if(confirm("Are you sure to Delete this Message"))
	{
		window.location = siteUrl+'/deleteMessage.php?message_id='+message_id;
	}
}

function submitMessage()
{
	var sender = 'admin';
	var reciever = $('#users').val();
	var title = $('#title').val();
	var message = $('#message').val();
	var message_type = 'admin';
	var status = 1;
	var siteUrl = $('#siteUrl').val();
	
	if(reciever != '' || message != '')
	{
		var data = { sender: sender, reciever: reciever, title:title, message: message ,message_type: message_type ,status: status};
		var url = siteUrl+'/admin_message.php';
		$.ajax({
		  type: "POST",
		  url: url,
		  data: data,
		  success: function(data) 
		  {
			  alert(data);
			  $('#users').val(''); 
			  $('#title').val('');
			  $('#message').val('');
			  setTimeout(function(){location.reload();},500);
			  
		  }
		});	
	}
	else
	{
		 alert("Please Enter Message Recipient and Message!");
	}
}

$(document).ready(function(){
	$('#upload').on('click', function() {
    var file_data = $('#appicon').prop('files')[0];   
    var form_data = new FormData();                  
    form_data.append('file', file_data);
	var siteUrl = $('#siteUrl').val();
    console.log(form_data);                             
    $.ajax({
                url: siteUrl+'/appicon_upload.php', // point to server-side PHP script 
                dataType: 'text',  // what to expect back from the PHP script, if anything
                cache: false,
                contentType: false,
                processData: false,
                data: form_data,                         
                type: 'post',
                success: function(data){
					$('.previewIcon img').prop('src',siteUrl+'/'+data);
                    console.log(data);
					//(php_script_response); // display response from the PHP script, if any
                }
     });
	});
})

</script>
<?php }


