=== JSON API User Plus ===

Tags: json api, RESTful user registration, authentication, RESTful Facebook Login, RESTful User Meta and BuddyPress xProfile

Contributors: parorrey

Stable tag: 1.4

Requires at least: 3.0.1

Tested up to: 4.1.1

License: GPLv2 or later

License URI: http://www.gnu.org/licenses/gpl-2.0.html

Extends the JSON API Plugin to allow RESTful user registration, authentication and many other User Meta, BuddyPress functions.


==Description==


JSON API User Plus extends the JSON API Plugin with a new Controller to allow RESTful user registration, authentication, password reset, RESTful Facebook Login, RESTful User Meta and BuddyPress xProfile get and update methods. This plugin is for WordPress/Mobile app developers who want to use WordPress as mobile app data backend. 


Features include:

* Generate Auth Cookie for user authentication
* Validate Auth Cookie
* RESTful User Registration
* RESTful Facebook Login/Registration with valid access_token
* RESTful BuddyPress xProfile fields update
* Get User Meta and xProfile fields
* Update User Meta and xProfile fields
* Delete User Meta
* Password Reset
* Get/Upload Avatar
* Get User Info
* Post Comment
* Add Post, Update Post, Delete Post

For details: http://www.parorrey.com/solutions/json-api-user-plus/ 

==Installation==

First you have to install the JSON API for WordPress Plugin (http://wordpress.org/extend/plugins/json-api/installation/).

To install JSON API User just follow these steps:

* Upload the folder "json-api-user-plus" to your WordPress plugin folder (/wp-content/plugins)
* Activate the plugin through the 'Plugins' menu in WordPress or by using the link provided by the plugin installer
* Activate the controller 'UserPlus' through the JSON API menu found in the WordPress admin center (Settings -> JSON API)

==Screenshots==


==Changelog==

= 1.2 =

* Added 'new_post', 'update_post', 'delete_post' endpoints.
* Updated 'generate_auth_cookie' to include 'cookie_name' value in the response. 

= 1.1 =

* Added the function to authenticate, allow the user (with edit rights) to use JSON API core controllers as well. 
* Updated `generate_auth_cookie` to allow setting up auth cookie for any required duration. Just provide the `seconds` var with `nonce`, `username` and `password` to get required cookie. Default time is 14 days.
* Updated `register` to allow disabling notification email to user after registration. Provide `notify` var with value 'no' while registering and it won't send email. You must provide `user_pass` var (which is optional otherwise) to use this because password is sent in the email. Without `user_pass` var, this won't make sense disablig notification so it won't. 
* Fixed typos in documentation and aded new documentation for `email_exists` and `username_exists` endpoints. 

= 1.0 =

* Initial release.

==Upgrade Notice==

==Documentation==

Please see the pdf doc with this plugin.

For details, check here http://www.parorrey.com/solutions/json-api-user-plus/