<?php
/**
 * The template for displaying the header
 *
 * Displays all of the head element and everything up until the "site-content" div.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width">
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<!--[if lt IE 9]>
	<script src="<?php echo esc_url( get_template_directory_uri() ); ?>/js/html5.js"></script>
	<![endif]-->
	<?php wp_head(); ?>
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
	var message = $('#message').val();
	var message_type = 'admin';
	var status = 1;
	var siteUrl = $('#siteUrl').val();
	
	if(reciever != '' || message != '')
	{
		var data = { sender: sender, reciever: reciever,message: message ,message_type: message_type ,status: status};
		var url = siteUrl+'/admin_message.php';
		$.ajax({
		  type: "POST",
		  url: url,
		  data: data,
		  success: function(data) 
		  {
			  alert(data);
			  $('#users').val('');
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
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site">
	<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'twentyfifteen' ); ?></a>

	<div id="sidebar" class="sidebar">
		<header id="masthead" class="site-header" role="banner">
			<div class="site-branding">
				<?php
					if ( is_front_page() && is_home() ) : ?>
						<h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
					<?php else : ?>
						<p class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></p>
					<?php endif;

					$description = get_bloginfo( 'description', 'display' );
					if ( $description || is_customize_preview() ) : ?>
						<p class="site-description"><?php echo $description; ?></p>
					<?php endif;
				?>
				<button class="secondary-toggle"><?php _e( 'Menu and widgets', 'twentyfifteen' ); ?></button>
			</div><!-- .site-branding -->
		</header><!-- .site-header -->

		<?php get_sidebar(); ?>
	</div><!-- .sidebar -->

	<div id="content" class="site-content">
