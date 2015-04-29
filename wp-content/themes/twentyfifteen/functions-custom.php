<?php 

/** Step 2 (from text above). */
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
                            <input type="text" id="appbgclr" name="appbgclr" value="<?php echo $app_background_color; ?>" />
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
            	<p><strong>Terms and Conditions:</strong><br />
                <textarea id="terms" style="width: 500px; height: 200px;" name="terms"><?php echo $terms_and_conditions; ?></textarea>
            </p>
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
?>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
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
	var appicon = $('#appicon').val();
	var terms = $('#terms').val();
	var siteUrl = $('#siteUrl').val();
	var confID = $('#confID').val();
	
	
	var data = { gst: gst, desclimit: desclimit,guestcharges: guestcharges ,standardcharges: standardcharges ,premiumcharges: premiumcharges ,standarditemday: standarditemday ,premiumitemday: premiumitemday,appbgclr:appbgclr,appicon:appicon, terms:terms, confID:confID};
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

