-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2015 at 11:13 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gamingmobileapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_configuration`
--

DROP TABLE IF EXISTS `app_configuration`;
CREATE TABLE IF NOT EXISTS `app_configuration` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `gst` varchar(20) DEFAULT NULL,
  `item_desc_limit` varchar(20) DEFAULT NULL,
  `guest_seal_charges` varchar(20) DEFAULT NULL,
  `standard_seal_charges` varchar(20) DEFAULT NULL,
  `premium_seal_charges` varchar(20) DEFAULT NULL,
  `standard_item_day` varchar(20) DEFAULT NULL,
  `premium_item_day` varchar(20) DEFAULT NULL,
  `app_background_color` varchar(20) DEFAULT NULL,
  `app_icon` text,
  `terms_and_conditions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_configuration`
--

INSERT INTO `app_configuration` (`id`, `gst`, `item_desc_limit`, `guest_seal_charges`, `standard_seal_charges`, `premium_seal_charges`, `standard_item_day`, `premium_item_day`, `app_background_color`, `app_icon`, `terms_and_conditions`) VALUES
(1, '10', '200', '10', '8', '5', '70', '700', '#ff4000', 'Lighthouse.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus congue consequat lorem, in rhoncus magna condimentum ac. Praesent tincidunt tortor at nulla elementum gravida ut eget orci. Morbi ut gravida justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum, nunc vitae vehicula aliquet, sem ante pulvinar ante, vel convallis libero felis sed odio. Cras eget risus quis metus auctor laoreet ut eget nisl. Integer ultricies, enim ac aliquam tristique, dolor tortor scelerisque velit, vel vulputate sem tortor non est. Donec eleifend, quam non malesuada laoreet, purus ex consectetur lorem, nec aliquet ipsum massa sit amet sem. In fermentum, dui ac congue ornare, leo magna luctus enim, nec tempus risus est ut est. Vestibulum magna purus, varius eu mi vel, maximus suscipit enim. Nam sed leo quam. ');

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_adfees`
--

DROP TABLE IF EXISTS `wp_awpcp_adfees`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_adfees` (
  `adterm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adterm_name` varchar(100) NOT NULL DEFAULT '',
  `credits` int(10) NOT NULL DEFAULT '0',
  `amount` float(6,2) unsigned NOT NULL DEFAULT '0.00',
  `recurring` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rec_period` int(5) unsigned NOT NULL DEFAULT '0',
  `rec_increment` varchar(5) NOT NULL DEFAULT '',
  `buys` int(10) unsigned NOT NULL DEFAULT '0',
  `imagesallowed` int(5) unsigned NOT NULL DEFAULT '0',
  `is_featured_ad_pricing` tinyint(1) DEFAULT NULL,
  `categories` text,
  `characters_allowed` int(1) NOT NULL DEFAULT '0',
  `title_characters` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`adterm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_awpcp_adfees`
--

INSERT INTO `wp_awpcp_adfees` (`adterm_id`, `adterm_name`, `credits`, `amount`, `recurring`, `rec_period`, `rec_increment`, `buys`, `imagesallowed`, `is_featured_ad_pricing`, `categories`, `characters_allowed`, `title_characters`, `private`) VALUES
(1, '30 Day Listing', 0, 9.99, 1, 31, 'D', 0, 6, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_admeta`
--

DROP TABLE IF EXISTS `wp_awpcp_admeta`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_admeta` (
  `meta_id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `awpcp_ad_id` bigint(10) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_adphotos`
--

DROP TABLE IF EXISTS `wp_awpcp_adphotos`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_adphotos` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_id` int(10) unsigned NOT NULL DEFAULT '0',
  `image_name` varchar(100) NOT NULL DEFAULT '',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_ads`
--

DROP TABLE IF EXISTS `wp_awpcp_ads`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_ads` (
  `ad_id` int(10) NOT NULL AUTO_INCREMENT,
  `adterm_id` int(10) NOT NULL DEFAULT '0',
  `payment_term_type` varchar(64) NOT NULL DEFAULT 'fee',
  `ad_fee_paid` float(7,2) NOT NULL,
  `ad_category_id` int(10) NOT NULL,
  `ad_category_parent_id` int(10) NOT NULL,
  `ad_title` varchar(255) NOT NULL DEFAULT '',
  `ad_details` text NOT NULL,
  `ad_contact_name` varchar(255) NOT NULL DEFAULT '',
  `ad_contact_phone` varchar(255) NOT NULL DEFAULT '',
  `ad_contact_email` varchar(255) NOT NULL DEFAULT '',
  `websiteurl` varchar(375) NOT NULL,
  `ad_city` varchar(255) NOT NULL DEFAULT '',
  `ad_state` varchar(255) NOT NULL DEFAULT '',
  `ad_country` varchar(255) NOT NULL DEFAULT '',
  `ad_county_village` varchar(255) NOT NULL DEFAULT '',
  `ad_item_price` int(25) NOT NULL,
  `ad_views` int(10) NOT NULL DEFAULT '0',
  `ad_postdate` date NOT NULL,
  `ad_last_updated` date NOT NULL,
  `ad_startdate` datetime NOT NULL,
  `ad_enddate` datetime NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `disabled_date` datetime DEFAULT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '1',
  `verified_at` datetime DEFAULT NULL,
  `ad_key` varchar(255) NOT NULL DEFAULT '',
  `ad_transaction_id` varchar(255) NOT NULL DEFAULT '',
  `payment_gateway` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `is_featured_ad` tinyint(1) DEFAULT NULL,
  `posterip` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(10) DEFAULT NULL,
  `renew_email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `renewed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  FULLTEXT KEY `titdes` (`ad_title`,`ad_details`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_ad_regions`
--

DROP TABLE IF EXISTS `wp_awpcp_ad_regions`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_ad_regions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_id` int(10) NOT NULL,
  `country` varchar(64) DEFAULT '',
  `county` varchar(64) DEFAULT '',
  `state` varchar(64) DEFAULT '',
  `city` varchar(64) DEFAULT '',
  `region_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_index` (`country`),
  KEY `county_index` (`county`),
  KEY `state_index` (`state`),
  KEY `city_index` (`city`),
  KEY `region_id_index` (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_categories`
--

DROP TABLE IF EXISTS `wp_awpcp_categories`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_categories` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_parent_id` int(10) NOT NULL,
  `category_name` varchar(255) NOT NULL DEFAULT '',
  `category_order` int(10) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_awpcp_categories`
--

INSERT INTO `wp_awpcp_categories` (`category_id`, `category_parent_id`, `category_name`, `category_order`) VALUES
(1, 0, 'General', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_credit_plans`
--

DROP TABLE IF EXISTS `wp_awpcp_credit_plans`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_credit_plans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `credits` int(10) NOT NULL,
  `price` float DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_media`
--

DROP TABLE IF EXISTS `wp_awpcp_media`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `mime_type` varchar(100) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT 'Approved',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_pagename`
--

DROP TABLE IF EXISTS `wp_awpcp_pagename`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_pagename` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `userpagename` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_pages`
--

DROP TABLE IF EXISTS `wp_awpcp_pages`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_pages` (
  `page` varchar(100) NOT NULL,
  `id` int(10) NOT NULL,
  PRIMARY KEY (`page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_awpcp_pages`
--

INSERT INTO `wp_awpcp_pages` (`page`, `id`) VALUES
('main-page-name', 4),
('show-ads-page-name', 5),
('reply-to-ad-page-name', 6),
('edit-ad-page-name', 7),
('place-ad-page-name', 8),
('renew-ad-page-name', 9),
('browse-ads-page-name', 10),
('browse-categories-page-name', 11),
('search-ads-page-name', 12),
('payment-thankyou-page-name', 13),
('payment-cancel-page-name', 14);

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_payments`
--

DROP TABLE IF EXISTS `wp_awpcp_payments`;
CREATE TABLE IF NOT EXISTS `wp_awpcp_payments` (
  `id` varchar(64) NOT NULL,
  `items` text,
  `data` text,
  `errors` text,
  `user_id` int(10) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'open',
  `payment_status` varchar(32) DEFAULT NULL,
  `payment_gateway` varchar(255) NOT NULL DEFAULT '',
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `version` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `completed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity`
--

DROP TABLE IF EXISTS `wp_bp_activity`;
CREATE TABLE IF NOT EXISTS `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` text NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(1, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2015-04-29 10:45:29', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity_meta`
--

DROP TABLE IF EXISTS `wp_bp_activity_meta`;
CREATE TABLE IF NOT EXISTS `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_notifications`
--

DROP TABLE IF EXISTS `wp_bp_notifications`;
CREATE TABLE IF NOT EXISTS `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_data`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_data`;
CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'admin', '2015-04-27 16:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_fields`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_fields`;
CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_groups`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_groups`;
CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_meta`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_meta`;
CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-04-27 15:54:38', '2015-04-27 15:54:38', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=268 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/gamersseal/', 'yes'),
(2, 'home', 'http://localhost/gamersseal/', 'yes'),
(3, 'blogname', 'gamingmobileapp', 'yes'),
(4, 'blogdescription', 'Gaming Mobile App', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'muhammadsufiangee@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:46:"another-wordpress-classifieds-plugin/awpcp.php";i:2;s:24:"buddypress/bp-loader.php";i:3;s:9:"hello.php";i:4;s:39:"tamed-admin-theme/tamed-admin-theme.php";i:5;s:37:"user-role-editor/user-role-editor.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:2:{i:0;s:86:"E:\\xampp\\htdocs\\gamingmobileapp/wp-content/plugins/bootstrap-admin/bootstrap-admin.php";i:1;s:0:"";}', 'no'),
(41, 'template', 'twentyfifteen', 'yes'),
(42, 'stylesheet', 'twentyfifteen', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31532', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '17', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31532', 'yes'),
(89, 'wp_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:5:"guest";a:2:{s:4:"name";s:5:"Guest";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"standard";a:2:{s:4:"name";s:8:"Standard";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"preminum";a:2:{s:4:"name";s:8:"Preminum";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:7:{i:1430308971;a:2:{s:20:"doadexpirations_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}s:27:"awpcp_ad_renewal_email_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1430322880;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430322900;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430323371;a:3:{s:16:"doadcleanup_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:35:"awpcp-clean-up-payment-transactions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:31:"awpcp-clean-up-non-verified-ads";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430327032;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430335020;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.2.1-partial-0.zip";s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.1";s:7:"version";s:5:"4.2.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:3:"4.2";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.2.1-partial-0.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-rollback-0.zip";}s:7:"current";s:5:"4.2.1";s:7:"version";s:5:"4.2.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:3:"4.2";s:13:"support_email";s:26:"updatehelp41@wordpress.org";s:9:"new_files";s:0:"";}}s:12:"last_checked";i:1430291861;s:15:"version_checked";s:3:"4.2";s:12:"translations";a:0:{}}', 'yes'),
(104, '_transient_random_seed', '2c3b6263afe23205d33369b099e0a467', 'yes'),
(107, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1430291862;s:7:"checked";a:3:{s:13:"twentyfifteen";s:3:"1.1";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(108, 'can_compress_scripts', '1', 'yes'),
(111, 'recently_activated', 'a:3:{s:35:"bootstrap-admin/bootstrap-admin.php";i:1430154118;s:32:"cream6-admin-theme/functions.php";i:1430153377;s:31:"wp-app-studio/wp-app-studio.php";i:1430151919;}', 'yes'),
(112, 'awpcp-options', 'a:175:{s:17:"enable-user-panel";i:0;s:17:"activatelanguages";i:0;s:17:"main_page_display";i:0;s:23:"view-categories-columns";i:2;s:27:"collapse-categories-columns";i:0;s:9:"uiwelcome";s:160:"Looking for a job? Trying to find a date? Looking for an apartment? Browse our classifieds. Have a job to advertise? An apartment to rent? Post a Classified Ad.";s:21:"awpcpadminaccesslevel";s:5:"admin";s:21:"awpcppagefilterswitch";i:1;s:18:"x-date-time-format";s:8:"american";s:11:"date-format";s:5:"m/d/Y";s:11:"time-format";s:5:"h:i:s";s:16:"date-time-format";s:16:"<date> at <time>";s:19:"thousands-separator";s:1:",";s:17:"decimal-separator";s:1:".";s:13:"show-decimals";i:1;s:11:"requiredtos";i:1;s:3:"tos";s:27:"Terms of service go here...";s:10:"useakismet";i:1;s:15:"captcha-enabled";s:1:"1";s:16:"captcha-provider";s:4:"math";s:23:"math-captcha-max-number";s:2:"10";s:20:"recaptcha-public-key";s:0:"";s:21:"recaptcha-private-key";s:0:"";s:19:"awpcptitleseparator";s:1:"-";s:19:"showcityinpagetitle";i:1;s:20:"showstateinpagetitle";i:1;s:22:"showcountryinpagetitle";i:1;s:28:"showcountyvillageinpagetitle";i:1;s:23:"showcategoryinpagetitle";i:1;s:15:"seofriendlyurls";i:0;s:14:"main-page-name";s:5:"AWPCP";s:18:"show-ads-page-name";s:7:"Show Ad";s:18:"place-ad-page-name";s:8:"Place Ad";s:17:"edit-ad-page-name";s:7:"Edit Ad";s:18:"renew-ad-page-name";s:8:"Renew Ad";s:21:"reply-to-ad-page-name";s:11:"Reply To Ad";s:20:"browse-ads-page-name";s:10:"Browse Ads";s:20:"search-ads-page-name";s:10:"Search Ads";s:27:"browse-categories-page-name";s:17:"Browse Categories";s:25:"view-categories-page-name";s:15:"View Categories";s:26:"payment-thankyou-page-name";s:17:"Payment Thank You";s:24:"payment-cancel-page-name";s:14:"Cancel Payment";s:32:"send-user-ad-posted-notification";i:1;s:21:"send-ad-enabled-email";i:1;s:19:"sent-ad-renew-email";i:1;s:24:"ad-renew-email-threshold";i:5;s:18:"notifyofadexpiring";i:1;s:16:"notifyofadposted";i:1;s:17:"notifyofadexpired";i:1;s:26:"allow-regions-modification";i:1;s:40:"allow-user-to-search-in-multiple-regions";i:0;s:30:"show-ad-preview-before-payment";i:0;s:17:"allowhtmlinadtext";i:0;s:14:"htmlstatustext";s:15:"No HTML Allowed";s:27:"characters-allowed-in-title";i:100;s:20:"maxcharactersallowed";i:750;s:24:"words-in-listing-excerpt";i:20;s:22:"hidelistingcontactname";i:0;s:19:"displayadlayoutcode";s:643:"\n							<div class="$awpcpdisplayaditems $isfeaturedclass">\n								<div style="width:$imgblockwidth; padding:5px; float:left; margin-right:20px;">\n									$awpcp_image_name_srccode\n								</div>\n								<div style="width:50%; padding:5px; float:left;">\n									<h4>$title_link</h4>\n									$excerpt\n								</div>\n								<div style="padding:5px; float:left;">\n									$awpcpadpostdate\n									$awpcp_city_display\n									$awpcp_state_display\n									$awpcp_display_adviews\n									$awpcp_display_price\n									$awpcpextrafields\n								</div>\n								<span class="fixfloat"></span>\n							</div>\n							<div class="fixfloat"></div>";s:20:"awpcpshowtheadlayout";s:960:"\n							<div id="showawpcpadpage">\n								<div class="awpcp-title">$ad_title</div><br/>\n								<div class="showawpcpadpage">\n									$featureimg\n									<div class="awpcp-subtitle">Contact Information</div>\n									<a href="$codecontact">Contact $adcontact_name</a>\n									$adcontactphone\n									$location\n									$awpcpvisitwebsite\n								</div>\n								$aditemprice\n								$awpcpextrafields\n								<div class="fixfloat"></div>\n								$showadsense1\n								<div class="showawpcpadpage">\n									<div class="awpcp-subtitle">More Information</div>\n									$addetails\n								</div>\n								$showadsense2\n								<div class="fixfloat"></div>\n								<div id="displayimagethumbswrapper">\n									<div id="displayimagethumbs">\n										<ul>\n											$awpcpshowadotherimages\n										</ul>\n									</div>\n								</div>\n								<span class="fixfloat">$tweetbtn $sharebtn $flagad</span>\n								$awpcpadviews\n								$showadsense3\n							</div>";s:16:"groupbrowseadsby";i:1;s:20:"search-results-order";i:1;s:16:"adresultsperpage";i:10;s:18:"pagination-options";a:12:{i:0;i:5;i:1;i:10;i:2;i:20;i:3;i:30;i:4;i:40;i:5;i:50;i:6;i:60;i:7;i:70;i:8;i:80;i:9;i:90;i:10;i:100;i:11;i:500;}s:24:"buildsearchdropdownlists";i:0;s:11:"showadcount";i:1;s:21:"hide-empty-categories";i:0;s:14:"displayadviews";i:1;s:21:"hyperlinkurlsinadtext";i:0;s:24:"visitwebsitelinknofollow";i:1;s:23:"show-menu-item-place-ad";i:1;s:22:"show-menu-item-edit-ad";i:1;s:25:"show-menu-item-browse-ads";i:1;s:25:"show-menu-item-search-ads";i:1;s:14:"activatepaypal";i:1;s:11:"paypalemail";s:14:"xxx@xxxxxx.xxx";s:18:"paypalcurrencycode";s:3:"USD";s:17:"activate2checkout";i:1;s:9:"2checkout";s:7:"xxxxxxx";s:21:"2checkoutcurrencycode";s:3:"USD";s:19:"imagesallowdisallow";i:1;s:13:"imagesapprove";i:0;s:23:"awpcp_thickbox_disabled";i:0;s:26:"show-click-to-enlarge-link";i:1;s:17:"imagesallowedfree";i:4;s:16:"uploadfoldername";s:7:"uploads";s:28:"upload-directory-permissions";s:4:"0755";s:12:"maximagesize";s:7:"1048576";s:12:"minimagesize";s:3:"300";s:11:"imgminwidth";s:3:"640";s:12:"imgminheight";s:3:"480";s:11:"imgmaxwidth";s:3:"640";s:12:"imgmaxheight";s:3:"480";s:19:"displayadthumbwidth";s:2:"80";s:29:"primary-image-thumbnail-width";s:3:"200";s:30:"primary-image-thumbnail-height";s:3:"200";s:29:"crop-primary-image-thumbnails";i:1;s:29:"display-thumbnails-in-columns";i:0;s:13:"imgthumbwidth";s:3:"125";s:14:"imgthumbheight";s:3:"125";s:15:"crop-thumbnails";i:1;s:10:"useadsense";i:1;s:7:"adsense";s:12:"AdSense code";s:15:"adsenseposition";i:2;s:17:"user-field-widget";s:8:"dropdown";s:20:"displaypostedbyfield";i:1;s:17:"displayphonefield";i:1;s:22:"displayphonefieldreqop";i:0;s:21:"displayphonefieldpriv";i:0;s:19:"displaywebsitefield";i:1;s:24:"displaywebsitefieldreqop";i:0;s:26:"displaywebsitefieldreqpriv";i:0;s:17:"displaypricefield";i:1;s:22:"displaypricefieldreqop";i:0;s:25:"price-field-is-restricted";i:0;s:25:"hide-price-field-if-empty";i:0;s:19:"displaycountryfield";i:1;s:24:"displaycountryfieldreqop";i:0;s:17:"displaystatefield";i:1;s:22:"displaystatefieldreqop";i:0;s:25:"displaycountyvillagefield";i:0;s:30:"displaycountyvillagefieldreqop";i:0;s:16:"displaycityfield";i:1;s:35:"show-city-field-before-county-field";i:1;s:21:"displaycityfieldreqop";i:0;s:21:"admin-recipient-email";s:0:"";s:15:"awpcpadminemail";s:0:"";s:28:"usesenderemailinsteadofadmin";i:0;s:21:"include-ad-access-key";i:1;s:19:"listingaddedsubject";s:45:"Your Classified Ad listing has been submitted";s:16:"listingaddedbody";s:84:"Thank you for submitting your Classified Ad. The details of your ad are shown below.";s:22:"contactformsubjectline";s:30:"Response to your AWPCP Demo Ad";s:22:"contactformbodymessage";s:43:"Someone has responded to your AWPCP Demo Ad";s:34:"notify-admin-about-contact-message";i:1;s:25:"resendakeyformsubjectline";s:47:"The Classified Ad''s ad access key you requested";s:25:"resendakeyformbodymessage";s:152:"You asked to have your Classified Ad''s access key resent. Below are all the Ad access keys in the system that are tied to the email address you provided";s:25:"paymentabortedsubjectline";s:43:"There was a problem processing your payment";s:25:"paymentabortedbodymessage";s:233:"There was a problem encountered during your attempt to submit payment. If funds were removed from the account you tried to use to make a payment please contact the website admin or the payment website customer service for assistance.";s:22:"renew-ad-email-subject";s:51:"Your classifieds listing Ad will expire in %d days.";s:19:"renew-ad-email-body";s:81:"This is an automated notification that your Classified Ad will expire in %d days.";s:24:"ad-renewed-email-subject";s:60:"Your classifieds listing "%s" has been successfully renewed.";s:21:"ad-renewed-email-body";s:82:"Your classifieds listing Ad has been successfully renewed. More information below:";s:20:"adexpiredsubjectline";s:42:"Your classifieds listing at %s has expired";s:20:"adexpiredbodymessage";s:70:"This is an automated notification that your Classified Ad has expired.";s:7:"usesmtp";i:0;s:8:"smtphost";s:16:"mail.example.com";s:8:"smtpport";s:2:"25";s:12:"smtpusername";s:13:"smtp_username";s:12:"smtppassword";s:0:"";s:40:"sends-listings-to-facebook-automatically";i:1;s:29:"show-quick-start-guide-notice";b:0;s:20:"enable-credit-system";i:0;s:21:"accepted-payment-type";s:4:"both";s:23:"requireuserregistration";i:0;s:33:"reply-to-ad-requires-registration";i:0;s:15:"registrationurl";s:0:"";s:20:"onlyadmincanplaceads";i:0;s:9:"adapprove";i:0;s:26:"enable-ads-pending-payment";s:1:"1";s:25:"enable-email-verification";i:0;s:34:"email-verification-first-threshold";i:5;s:35:"email-verification-second-threshold";i:30;s:27:"notice_awaiting_approval_ad";s:200:"All ads must first be approved by the administrator before they are activated in the system. As soon as an admin has approved your ad it will become visible in the system. Thank you for your business.";s:33:"ad-poster-email-address-whitelist";s:0:"";s:16:"noadsinparentcat";i:0;s:31:"use-multiple-category-dropdowns";i:0;s:18:"addurationfreemode";i:0;s:23:"autoexpiredisabledelete";i:0;s:7:"freepay";i:0;s:9:"fee-order";i:1;s:19:"fee-order-direction";s:3:"ASC";s:19:"pay-before-place-ad";i:1;s:19:"displaycurrencycode";s:3:"USD";s:15:"paylivetestmode";i:0;s:17:"force-secure-urls";i:0;}', 'yes'),
(113, 'awpcp_db_version', '3.3.4', 'yes'),
(116, 'awpcp_installationcomplete', '1', 'yes'),
(118, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(119, 'bb-config-location', 'E:\\xampp\\htdocs\\gamingmobileapp/bb-config.php', 'yes'),
(120, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(121, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(122, 'bp-blogs-first-install', '', 'yes'),
(123, 'bp-disable-profile-sync', '', 'yes'),
(124, 'hide-loggedout-adminbar', '', 'yes'),
(125, 'bp-disable-avatar-uploads', '', 'yes'),
(126, 'bp-disable-account-deletion', '', 'yes'),
(127, 'bp-disable-blogforum-comments', '1', 'yes'),
(128, '_bp_theme_package_id', 'legacy', 'yes'),
(129, 'bp_restrict_group_creation', '', 'yes'),
(130, '_bp_enable_akismet', '1', 'yes'),
(131, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(132, '_bp_force_buddybar', '', 'yes'),
(133, '_bp_retain_bp_default', '', 'yes'),
(134, 'widget_bp_core_login_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(135, 'widget_bp_core_members_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(136, 'widget_bp_core_whos_online_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(137, 'widget_bp_core_recently_active_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(138, 'widget_bp_groups_widget', '', 'yes'),
(139, 'widget_bp_messages_sitewide_notices_widget', '', 'yes'),
(144, 'registration', '0', 'yes'),
(145, 'bp-active-components', 'a:5:{s:8:"activity";i:1;s:7:"members";i:1;s:8:"settings";i:1;s:8:"xprofile";i:1;s:13:"notifications";i:1;}', 'yes'),
(146, 'bp-pages', 'a:2:{s:8:"activity";i:15;s:7:"members";i:16;}', 'yes'),
(147, '_bp_db_version', '9181', 'yes'),
(152, 'WPLANG', '', 'yes'),
(155, 'wpas_apps_submit', 'a:0:{}', 'yes'),
(156, 'wpas_app_54f498cf51e2c3.64234105', 'YTo5OntzOjg6ImFwcF9uYW1lIjtzOjE2OiJGcmVlRGV2IERlbW8gQXBwIjtzOjY6ImFwcF9pZCI7czoyMzoiNTRmNDk4Y2Y1MWUyYzMuNjQyMzQxMDUiO3M6MzoidmVyIjtzOjE6IjQiO3M6NDoiZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7czoxMzoibW9kaWZpZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0wMyAxODo0NDo1MiI7czo2OiJlbnRpdHkiO2E6Mzp7aTowO2E6Njp7czo4OiJlbnQtbmFtZSI7czo0OiJwb3N0IjtzOjk6ImVudC1sYWJlbCI7czo1OiJQb3N0cyI7czoxODoiZW50LXNpbmd1bGFyLWxhYmVsIjtzOjQ6IlBvc3QiO3M6MTY6ImVudC1oaWVyYXJjaGljYWwiO2k6MDtzOjEzOiJtb2RpZmllZF9kYXRlIjtzOjE5OiIyMDE1LTAzLTAyIDE3OjA3OjQ0IjtzOjQ6ImRhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MDc6NDQiO31pOjE7YTo2OntzOjg6ImVudC1uYW1lIjtzOjQ6InBhZ2UiO3M6OToiZW50LWxhYmVsIjtzOjU6IlBhZ2VzIjtzOjE4OiJlbnQtc2luZ3VsYXItbGFiZWwiO3M6NDoiUGFnZSI7czoxNjoiZW50LWhpZXJhcmNoaWNhbCI7aToxO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MDc6NDQiO3M6NDoiZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7fWk6MjthOjM4OntzOjg6ImVudC1uYW1lIjtzOjc6ImNvbnRhY3QiO3M6OToiZW50LWxhYmVsIjtzOjg6IkNvbnRhY3RzIjtzOjE4OiJlbnQtc2luZ3VsYXItbGFiZWwiO3M6NzoiQ29udGFjdCI7czoxOToiZW50LWFkdmFuY2VkLW9wdGlvbiI7czoxOiIxIjtzOjE2OiJlbnQtaGllcmFyY2hpY2FsIjtzOjE6IjAiO3M6MjE6ImVudC1wdWJsaWNseV92aWV3YWJsZSI7czoxOiIxIjtzOjE1OiJlbnQtaGFzX2FyY2hpdmUiO3M6MToiMSI7czoyMzoiZW50LWV4Y2x1ZGVfZnJvbV9zZWFyY2giO3M6MToiMCI7czoyMjoiZW50LXB1YmxpY2x5X3F1ZXJ5YWJsZSI7czoxOiIxIjtzOjE5OiJlbnQtY2FwYWJpbGl0eV90eXBlIjtzOjQ6InBvc3QiO3M6MTE6ImVudC1yZXdyaXRlIjtzOjE6IjEiO3M6MTM6ImVudC1xdWVyeS12YXIiO3M6MToiMSI7czoxNDoiZW50LWNhbl9leHBvcnQiO3M6MToiMSI7czoxMToiZW50LXNob3dfdWkiO3M6MToiMSI7czoxNjoiZW50LXNob3dfaW5fbWVudSI7czoxOiIxIjtzOjE4OiJlbnQtbWVudV9pY29uX3R5cGUiO3M6NDoiZGFzaCI7czoxODoiZW50LW1lbnVfaWNvbl9kYXNoIjtzOjY6Imdyb3VwcyI7czoxNzoiZW50LW1lbnVfcG9zaXRpb24iO3M6MToiNSI7czoxMjoiZW50LWNvbV90eXBlIjtzOjI6IndwIjtzOjE0OiJlbnQtaW5saW5lLWVudCI7czoxOiIwIjtzOjE4OiJlbnQtc3VwcG9ydHNfdGl0bGUiO3M6MToiMCI7czoxOToiZW50LXN1cHBvcnRzX2VkaXRvciI7czoxOiIwIjtzOjE5OiJlbnQtc3VwcG9ydHNfYXV0aG9yIjtzOjE6IjAiO3M6MjI6ImVudC1zdXBwb3J0c190aHVtYm5haWwiO3M6MToiMCI7czoyMDoiZW50LXN1cHBvcnRzX2V4Y2VycHQiO3M6MToiMCI7czoyMzoiZW50LXN1cHBvcnRzX3RyYWNrYmFja3MiO3M6MToiMCI7czoyNjoiZW50LXN1cHBvcnRzX2N1c3RvbV9maWVsZHMiO3M6MToiMCI7czoyMjoiZW50LXN1cHBvcnRzX3JldmlzaW9ucyI7czoxOiIwIjtzOjI4OiJlbnQtc3VwcG9ydHNfcGFnZV9hdHRyaWJ1dGVzIjtzOjE6IjAiO3M6MjU6ImVudC1zdXBwb3J0c19wb3N0X2Zvcm1hdHMiO3M6MToiMCI7czoyMToiZW50LXRheG9ub215X2NhdGVnb3J5IjtzOjE6IjAiO3M6MjE6ImVudC10YXhvbm9teV9wb3N0X3RhZyI7czoxOiIwIjtzOjIxOiJlbnQtc3VwcG9ydHNfY29tbWVudHMiO3M6MToiMCI7czoyMDoiZW50LWNvbV9lbmFibGVfdHJhc2giO3M6MToiMCI7czoxOToiZW50LWNvbV9lbmFibGVfc3BhbSI7czoxOiIwIjtzOjQ6ImRhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MTM6NTUiO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6Mzc6NTkiO3M6NToiZmllbGQiO2E6ODp7aTowO2E6Njp7czo4OiJmbGRfbmFtZSI7czoxODoiY29udGFjdF9maXJzdF9uYW1lIjtzOjk6ImZsZF9sYWJlbCI7czoxMDoiRmlyc3QgTmFtZSI7czo4OiJmbGRfZGVzYyI7czoyMjoiQ29udGFjdCdzIGZpcnN0IG5hbWUNCiI7czo4OiJmbGRfdHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJmbGRfcmVxdWlyZWQiO3M6MToiMSI7czoxMzoibW9kaWZpZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0wMyAxODozMDoxNSI7fWk6MTthOjY6e3M6ODoiZmxkX25hbWUiO3M6MTc6ImNvbnRhY3RfbGFzdF9uYW1lIjtzOjk6ImZsZF9sYWJlbCI7czo5OiJMYXN0IE5hbWUiO3M6ODoiZmxkX2Rlc2MiO3M6MjE6IkNvbnRhY3QncyBsYXN0IG5hbWUNCiI7czo4OiJmbGRfdHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJmbGRfcmVxdWlyZWQiO3M6MToiMSI7czoxMzoibW9kaWZpZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0wMyAxODozMDowNCI7fWk6MjthOjc6e3M6ODoiZmxkX25hbWUiO3M6MTM6ImNvbnRhY3RfZW1haWwiO3M6OToiZmxkX2xhYmVsIjtzOjU6IkVtYWlsIjtzOjg6ImZsZF9kZXNjIjtzOjI1OiJDb250YWN0J3MgZW1haWwgYWRkcmVzcw0KIjtzOjg6ImZsZF90eXBlIjtzOjU6ImVtYWlsIjtzOjExOiJmbGRfdW5pcV9pZCI7czoxOiIxIjtzOjEyOiJmbGRfcmVxdWlyZWQiO3M6MToiMSI7czoxMzoibW9kaWZpZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0wMyAxODoyOTo1NCI7fWk6MzthOjU6e3M6ODoiZmxkX25hbWUiO3M6MTM6ImNvbnRhY3RfcGhvbmUiO3M6OToiZmxkX2xhYmVsIjtzOjU6IlBob25lIjtzOjg6ImZsZF9kZXNjIjtzOjI3OiJDb250YWN0J3MgcGhvbmUgb3IgbW9iaWxlDQoiO3M6ODoiZmxkX3R5cGUiO3M6NDoidGV4dCI7czoxMzoibW9kaWZpZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0wMyAxODoyOTozOCI7fWk6NDthOjU6e3M6ODoiZmxkX25hbWUiO3M6MTU6ImNvbnRhY3RfYWRkcmVzcyI7czo5OiJmbGRfbGFiZWwiO3M6NzoiQWRkcmVzcyI7czo4OiJmbGRfZGVzYyI7czoyODoiQ29udGFjdCdzIG1haWxpbmcgYWRkcmVzcy4NCiI7czo4OiJmbGRfdHlwZSI7czo0OiJ0ZXh0IjtzOjEzOiJtb2RpZmllZF9kYXRlIjtzOjE5OiIyMDE1LTAzLTAzIDE4OjI5OjI3Ijt9aTo1O2E6Nzp7czo4OiJmbGRfbmFtZSI7czoxMjoiY29udGFjdF90aW1lIjtzOjk6ImZsZF9sYWJlbCI7czoxODoiQ29udGFjdCBQcmVmZXJlbmNlIjtzOjg6ImZsZF9kZXNjIjtzOjM2OiJXaGVuIHdvdWxkIHlvdSBsaWtlIHRvIGJlIGNvbnRhY3RlZD8iO3M6ODoiZmxkX3R5cGUiO3M6Njoic2VsZWN0IjtzOjEwOiJmbGRfdmFsdWVzIjtzOjMxOiJtb3JuaW5nO2FmdGVybm9vbjtldmVuaW5nO25pZ2h0IjtzOjE0OiJmbGRfZGZsdF92YWx1ZSI7czo5OiJhZnRlcm5vb24iO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6MzU6MTkiO31pOjY7YTo1OntzOjExOiJmbGRfYnVpbHRpbiI7czoxOiIwIjtzOjg6ImZsZF9uYW1lIjtzOjE0OiJjb250YWN0X2F0dGFjaCI7czo5OiJmbGRfbGFiZWwiO3M6MTM6IkNvbnRhY3QgRmlsZXMiO3M6ODoiZmxkX3R5cGUiO3M6NDoiZmlsZSI7czo0OiJkYXRlIjtzOjE5OiIyMDE1LTAzLTAzIDE4OjM0OjM3Ijt9aTo3O2E6Njp7czoxMToiZmxkX2J1aWx0aW4iO3M6MToiMCI7czo4OiJmbGRfbmFtZSI7czoxNjoiY29udGFjdF9sb2NhdGlvbiI7czo5OiJmbGRfbGFiZWwiO3M6OToiUmVzaWRlbmNlIjtzOjg6ImZsZF9kZXNjIjtzOjMxOiJJcyB0aGlzIGFkZHJlc3MgeW91ciByZXNpZGVuY2U/IjtzOjg6ImZsZF90eXBlIjtzOjg6ImNoZWNrYm94IjtzOjQ6ImRhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6Mzc6NTkiO319fX1zOjQ6InJvbGUiO2E6NTp7aTowO2E6NjQ6e3M6MTc6InJvbGUtbWFuYWdlX3RheF8xIjtpOjE7czoxNToicm9sZS1lZGl0X3RheF8xIjtpOjE7czoxNzoicm9sZS1kZWxldGVfdGF4XzEiO2k6MTtzOjE3OiJyb2xlLWFzc2lnbl90YXhfMSI7aToxO3M6MTc6InJvbGUtbWFuYWdlX3RheF8wIjtpOjE7czoxNToicm9sZS1lZGl0X3RheF8wIjtpOjE7czoxNzoicm9sZS1kZWxldGVfdGF4XzAiO2k6MTtzOjE3OiJyb2xlLWFzc2lnbl90YXhfMCI7aToxO3M6OToicm9sZS1uYW1lIjtzOjEzOiJhZG1pbmlzdHJhdG9yIjtzOjEwOiJyb2xlLWxhYmVsIjtzOjEzOiJBZG1pbmlzdHJhdG9yIjtzOjIyOiJyb2xlLWVkaXRfb3RoZXJzX3Bvc3RzIjtpOjE7czoyMzoicm9sZS1lZGl0X3ByaXZhdGVfcG9zdHMiO2k6MTtzOjIzOiJyb2xlLXJlYWRfcHJpdmF0ZV9wb3N0cyI7aToxO3M6MjQ6InJvbGUtZGVsZXRlX290aGVyc19wb3N0cyI7aToxO3M6MjU6InJvbGUtZGVsZXRlX3ByaXZhdGVfcG9zdHMiO2k6MTtzOjI1OiJyb2xlLWVkaXRfcHVibGlzaGVkX3Bvc3RzIjtpOjE7czoxODoicm9sZS1wdWJsaXNoX3Bvc3RzIjtpOjE7czoyNzoicm9sZS1kZWxldGVfcHVibGlzaGVkX3Bvc3RzIjtpOjE7czoxNToicm9sZS1lZGl0X3Bvc3RzIjtpOjE7czoxNzoicm9sZS1kZWxldGVfcG9zdHMiO2k6MTtzOjI4OiJyb2xlLW1hbmFnZV9vcGVyYXRpb25zX3Bvc3RzIjtpOjE7czoxNToicm9sZS1lZGl0X3BhZ2VzIjtpOjE7czoyMjoicm9sZS1lZGl0X290aGVyc19wYWdlcyI7aToxO3M6MjU6InJvbGUtZWRpdF9wdWJsaXNoZWRfcGFnZXMiO2k6MTtzOjE4OiJyb2xlLXB1Ymxpc2hfcGFnZXMiO2k6MTtzOjE3OiJyb2xlLWRlbGV0ZV9wYWdlcyI7aToxO3M6MjQ6InJvbGUtZGVsZXRlX290aGVyc19wYWdlcyI7aToxO3M6Mjc6InJvbGUtZGVsZXRlX3B1Ymxpc2hlZF9wYWdlcyI7aToxO3M6MjU6InJvbGUtZGVsZXRlX3ByaXZhdGVfcGFnZXMiO2k6MTtzOjIzOiJyb2xlLWVkaXRfcHJpdmF0ZV9wYWdlcyI7aToxO3M6MjM6InJvbGUtcmVhZF9wcml2YXRlX3BhZ2VzIjtpOjE7czoyODoicm9sZS1tYW5hZ2Vfb3BlcmF0aW9uc19wYWdlcyI7aToxO3M6MjE6InJvbGUtYWN0aXZhdGVfcGx1Z2lucyI7aToxO3M6MTQ6InJvbGUtYWRkX3VzZXJzIjtpOjE7czoxNzoicm9sZS1jcmVhdGVfdXNlcnMiO2k6MTtzOjE5OiJyb2xlLWRlbGV0ZV9wbHVnaW5zIjtpOjE7czoxNzoicm9sZS1kZWxldGVfdXNlcnMiO2k6MTtzOjE5OiJyb2xlLWVkaXRfZGFzaGJvYXJkIjtpOjE7czoxNToicm9sZS1lZGl0X2ZpbGVzIjtpOjE7czoxNzoicm9sZS1lZGl0X3BsdWdpbnMiO2k6MTtzOjIzOiJyb2xlLWVkaXRfdGhlbWVfb3B0aW9ucyI7aToxO3M6MTY6InJvbGUtZWRpdF90aGVtZXMiO2k6MTtzOjE1OiJyb2xlLWVkaXRfdXNlcnMiO2k6MTtzOjExOiJyb2xlLWltcG9ydCI7aToxO3M6MjA6InJvbGUtaW5zdGFsbF9wbHVnaW5zIjtpOjE7czoxOToicm9sZS1pbnN0YWxsX3RoZW1lcyI7aToxO3M6MTU6InJvbGUtbGlzdF91c2VycyI7aToxO3M6MjI6InJvbGUtbWFuYWdlX2NhdGVnb3JpZXMiO2k6MTtzOjE3OiJyb2xlLW1hbmFnZV9saW5rcyI7aToxO3M6MTk6InJvbGUtbWFuYWdlX29wdGlvbnMiO2k6MTtzOjIyOiJyb2xlLW1vZGVyYXRlX2NvbW1lbnRzIjtpOjE7czoxODoicm9sZS1wcm9tb3RlX3VzZXJzIjtpOjE7czo5OiJyb2xlLXJlYWQiO2k6MTtzOjE3OiJyb2xlLXJlbW92ZV91c2VycyI7aToxO3M6MTg6InJvbGUtc3dpdGNoX3RoZW1lcyI7aToxO3M6MjA6InJvbGUtdW5maWx0ZXJlZF9odG1sIjtpOjE7czoyMjoicm9sZS11bmZpbHRlcmVkX3VwbG9hZCI7aToxO3M6MTY6InJvbGUtdXBkYXRlX2NvcmUiO2k6MTtzOjE5OiJyb2xlLXVwZGF0ZV9wbHVnaW5zIjtpOjE7czoxODoicm9sZS11cGRhdGVfdGhlbWVzIjtpOjE7czoxNzoicm9sZS11cGxvYWRfZmlsZXMiO2k6MTtzOjIzOiJyb2xlLXZpZXdfYXBwX2Rhc2hib2FyZCI7aToxO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MDc6NDQiO3M6NDoiZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7fWk6MTthOjI5OntzOjk6InJvbGUtbmFtZSI7czo2OiJlZGl0b3IiO3M6MTA6InJvbGUtbGFiZWwiO3M6NjoiRWRpdG9yIjtzOjIyOiJyb2xlLWVkaXRfb3RoZXJzX3Bvc3RzIjtpOjE7czoyMzoicm9sZS1lZGl0X3ByaXZhdGVfcG9zdHMiO2k6MTtzOjIzOiJyb2xlLXJlYWRfcHJpdmF0ZV9wb3N0cyI7aToxO3M6MjQ6InJvbGUtZGVsZXRlX290aGVyc19wb3N0cyI7aToxO3M6MjU6InJvbGUtZGVsZXRlX3ByaXZhdGVfcG9zdHMiO2k6MTtzOjI1OiJyb2xlLWVkaXRfcHVibGlzaGVkX3Bvc3RzIjtpOjE7czoxODoicm9sZS1wdWJsaXNoX3Bvc3RzIjtpOjE7czoyNzoicm9sZS1kZWxldGVfcHVibGlzaGVkX3Bvc3RzIjtpOjE7czoxNToicm9sZS1lZGl0X3Bvc3RzIjtpOjE7czoxNzoicm9sZS1kZWxldGVfcG9zdHMiO2k6MTtzOjE1OiJyb2xlLWVkaXRfcGFnZXMiO2k6MTtzOjIyOiJyb2xlLWVkaXRfb3RoZXJzX3BhZ2VzIjtpOjE7czoyNToicm9sZS1lZGl0X3B1Ymxpc2hlZF9wYWdlcyI7aToxO3M6MTg6InJvbGUtcHVibGlzaF9wYWdlcyI7aToxO3M6MTc6InJvbGUtZGVsZXRlX3BhZ2VzIjtpOjE7czoyNDoicm9sZS1kZWxldGVfb3RoZXJzX3BhZ2VzIjtpOjE7czoyNzoicm9sZS1kZWxldGVfcHVibGlzaGVkX3BhZ2VzIjtpOjE7czoyNToicm9sZS1kZWxldGVfcHJpdmF0ZV9wYWdlcyI7aToxO3M6MjM6InJvbGUtZWRpdF9wcml2YXRlX3BhZ2VzIjtpOjE7czoyMzoicm9sZS1yZWFkX3ByaXZhdGVfcGFnZXMiO2k6MTtzOjIyOiJyb2xlLW1vZGVyYXRlX2NvbW1lbnRzIjtpOjE7czoyMjoicm9sZS1tYW5hZ2VfY2F0ZWdvcmllcyI7aToxO3M6MTc6InJvbGUtbWFuYWdlX2xpbmtzIjtpOjE7czoxNzoicm9sZS11cGxvYWRfZmlsZXMiO2k6MTtzOjk6InJvbGUtcmVhZCI7aToxO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MDc6NDQiO3M6NDoiZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7fWk6MjthOjExOntzOjk6InJvbGUtbmFtZSI7czo2OiJhdXRob3IiO3M6MTA6InJvbGUtbGFiZWwiO3M6NjoiQXV0aG9yIjtzOjI1OiJyb2xlLWVkaXRfcHVibGlzaGVkX3Bvc3RzIjtpOjE7czoxODoicm9sZS1wdWJsaXNoX3Bvc3RzIjtpOjE7czoyNzoicm9sZS1kZWxldGVfcHVibGlzaGVkX3Bvc3RzIjtpOjE7czoxNToicm9sZS1lZGl0X3Bvc3RzIjtpOjE7czoxNzoicm9sZS1kZWxldGVfcG9zdHMiO2k6MTtzOjE3OiJyb2xlLXVwbG9hZF9maWxlcyI7aToxO3M6OToicm9sZS1yZWFkIjtpOjE7czoxMzoibW9kaWZpZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7czo0OiJkYXRlIjtzOjE5OiIyMDE1LTAzLTAyIDE3OjA3OjQ0Ijt9aTozO2E6Nzp7czo5OiJyb2xlLW5hbWUiO3M6MTE6ImNvbnRyaWJ1dG9yIjtzOjEwOiJyb2xlLWxhYmVsIjtzOjExOiJDb250cmlidXRvciI7czoxNToicm9sZS1lZGl0X3Bvc3RzIjtpOjE7czoxNzoicm9sZS1kZWxldGVfcG9zdHMiO2k6MTtzOjk6InJvbGUtcmVhZCI7aToxO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MDc6NDQiO3M6NDoiZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7fWk6NDthOjU6e3M6OToicm9sZS1uYW1lIjtzOjEwOiJzdWJzY3JpYmVyIjtzOjEwOiJyb2xlLWxhYmVsIjtzOjEwOiJTdWJzY3JpYmVyIjtzOjk6InJvbGUtcmVhZCI7aToxO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDIgMTc6MDc6NDQiO3M6NDoiZGF0ZSI7czoxOToiMjAxNS0wMy0wMiAxNzowNzo0NCI7fX1zOjY6Im9wdGlvbiI7YToxNTp7czoxNDoiYW9fcGx1Z2luX25hbWUiO3M6MTM6ImZyZWUtZGVtby1hcHAiO3M6OToiYW9fZG9tYWluIjtzOjI1OiJodHRwczovL2VtYXJrZXRkZXNpZ24uY29tIjtzOjEyOiJhb19ibG9nX25hbWUiO3M6MTc6ImVtYXJrZXRkZXNpZ24uY29tIjtzOjE3OiJhb19zZXRfbWVudV9sYWJlbCI7czoxMjoiRnJlZURldiBEZW1vIjtzOjEyOiJhb19hcHBfc2Rlc2MiO3M6MTEyOiJUaGlzIGlzIGEgV1AgQXBwIFN0dWRpbyBnZW5lcmF0ZWQgd2l0aCBGcmVlRGV2IGFjY291bnQuIFlvdSBjYW4gY3JlYXRlIGEgc2ltaWxhciBhcHAgdXNpbmcgeW91ciBGcmVlRGV2IGFjY291bnQuIjtzOjExOiJhb19hcHBfZGVzYyI7czoyMTI6IlRoaXMgaXMgYSBXUCBBcHAgU3R1ZGlvIGdlbmVyYXRlZCB3aXRoIEZyZWVEZXYgYWNjb3VudC4gWW91IGNhbiBjcmVhdGUgYSBzaW1pbGFyIGFwcCB1c2luZyB5b3VyIEZyZWVEZXYgYWNjb3VudC4gRnJlZURldiBwbHVnaW4gZ2VuZXJhdGlvbiBpcyBvZmZlcmVkIGZyZWUgb2YgY2hhcmdlLiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBnb3RvIHdwYXMuZW1kcGx1Z2lucy5jb20uIjtzOjE0OiJhb19hcHBfdmVyc2lvbiI7czo1OiIxLjAuMCI7czo5OiJhb19hdXRob3IiO3M6MTQ6ImVNYXJrZXQgRGVzaWduIjtzOjEzOiJhb19hdXRob3JfdXJsIjtzOjI1OiJodHRwczovL2VtYXJrZXRkZXNpZ24uY29tIjtzOjEzOiJhb19jaGFuZ2VfbG9nIjtzOjI3OiI9IDEuMC4wID0KKiBJbml0aWFsIHJlbGVhc2UiO3M6MTk6ImFvX3JlbW92ZV9jb2xmaWx0ZXIiO3M6MToiMSI7czoyMDoiYW9fcmVtb3ZlX29wZXJhdGlvbnMiO3M6MToiMSI7czoxOToiYW9fcmVtb3ZlX2FuYWx5dGljcyI7czoxOiIxIjtzOjQ6ImRhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6NDI6MTIiO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6NDI6MTIiO31zOjg6InRheG9ub215IjthOjI6e2k6MDthOjE5OntzOjg6InR4bi1uYW1lIjtzOjE2OiJjb250YWN0X2NhdGVnb3J5IjtzOjk6InR4bi1sYWJlbCI7czoxNjoiQ29udGFjdCBDYXRlZ29yeSI7czoxODoidHhuLXNpbmd1bGFyLWxhYmVsIjtzOjE2OiJDb250YWN0IENhdGVnb3J5IjtzOjEwOiJ0eG4tYXR0YWNoIjthOjE6e2k6MDtzOjE6IjIiO31zOjE2OiJ0eG4taGllcmFyY2hpY2FsIjtzOjE6IjAiO3M6MTY6InR4bi1kaXNwbGF5X3R5cGUiO3M6Njoic2luZ2xlIjtzOjEwOiJ0eG4tdmFsdWVzIjtzOjE3OiJpbnRlcm5hbDtleHRlcm5hbCI7czoxMDoidHhuLXB1YmxpYyI7czoxOiIxIjtzOjExOiJ0eG4tc2hvd191aSI7czoxOiIxIjtzOjIxOiJ0eG4tc2hvd19pbl9uYXZfbWVudXMiO3M6MToiMSI7czoxNzoidHhuLXNob3dfdGFnY2xvdWQiO3M6MToiMSI7czoxMzoidHhuLXF1ZXJ5X3ZhciI7czoxOiIxIjtzOjExOiJ0eG4tcmV3cml0ZSI7czoxOiIxIjtzOjEwOiJ0eG4taW5saW5lIjtzOjE6IjAiO3M6MTI6InR4bi1yZXF1aXJlZCI7czoxOiIwIjtzOjEzOiJ0eG4tc3JlcXVpcmVkIjtzOjE6IjAiO3M6MTk6InR4bi1hZHZhbmNlZC1vcHRpb24iO3M6MToiMCI7czo0OiJkYXRlIjtzOjE5OiIyMDE1LTAzLTAzIDE4OjQzOjQxIjtzOjEzOiJtb2RpZmllZF9kYXRlIjtzOjE5OiIyMDE1LTAzLTAzIDE4OjQzOjQxIjt9aToxO2E6MTk6e3M6ODoidHhuLW5hbWUiO3M6MTE6ImNvbnRhY3RfdGFnIjtzOjk6InR4bi1sYWJlbCI7czoxMjoiQ29udGFjdCBUYWdzIjtzOjE4OiJ0eG4tc2luZ3VsYXItbGFiZWwiO3M6MTE6IkNvbnRhY3QgVGFnIjtzOjEwOiJ0eG4tYXR0YWNoIjthOjE6e2k6MDtzOjE6IjIiO31zOjE2OiJ0eG4taGllcmFyY2hpY2FsIjtzOjE6IjAiO3M6MTY6InR4bi1kaXNwbGF5X3R5cGUiO3M6NToibXVsdGkiO3M6MTA6InR4bi12YWx1ZXMiO3M6MzU6ImZyaWVuZDtidXNpbmVzcztmYW1pbHk7c3BvdXNlO2NoaWxkIjtzOjEwOiJ0eG4tcHVibGljIjtzOjE6IjEiO3M6MTE6InR4bi1zaG93X3VpIjtzOjE6IjEiO3M6MjE6InR4bi1zaG93X2luX25hdl9tZW51cyI7czoxOiIxIjtzOjE3OiJ0eG4tc2hvd190YWdjbG91ZCI7czoxOiIxIjtzOjEzOiJ0eG4tcXVlcnlfdmFyIjtzOjE6IjEiO3M6MTE6InR4bi1yZXdyaXRlIjtzOjE6IjEiO3M6MTA6InR4bi1pbmxpbmUiO3M6MToiMCI7czoxMjoidHhuLXJlcXVpcmVkIjtzOjE6IjAiO3M6MTM6InR4bi1zcmVxdWlyZWQiO3M6MToiMCI7czoxOToidHhuLWFkdmFuY2VkLW9wdGlvbiI7czoxOiIwIjtzOjQ6ImRhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6NDQ6NTIiO3M6MTM6Im1vZGlmaWVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMDMgMTg6NDQ6NTIiO319fQ==', 'yes'),
(157, 'wpas_app_key_list', 'a:1:{i:0;s:23:"54f498cf51e2c3.64234105";}', 'yes'),
(158, 'wpas_version', '4.3.2', 'yes'),
(159, 'wpas_data_version', '4', 'yes'),
(160, 'wpas_default_entities', 'a:2:{i:0;a:4:{s:8:"ent-name";s:4:"post";s:9:"ent-label";s:5:"Posts";s:18:"ent-singular-label";s:4:"Post";s:16:"ent-hierarchical";i:0;}i:1;a:4:{s:8:"ent-name";s:4:"page";s:9:"ent-label";s:5:"Pages";s:18:"ent-singular-label";s:4:"Page";s:16:"ent-hierarchical";i:1;}}', 'yes'),
(161, 'wpas_default_roles', 'a:5:{i:0;a:54:{s:9:"role-name";s:13:"administrator";s:10:"role-label";s:13:"Administrator";s:22:"role-edit_others_posts";i:1;s:23:"role-edit_private_posts";i:1;s:23:"role-read_private_posts";i:1;s:24:"role-delete_others_posts";i:1;s:25:"role-delete_private_posts";i:1;s:25:"role-edit_published_posts";i:1;s:18:"role-publish_posts";i:1;s:27:"role-delete_published_posts";i:1;s:15:"role-edit_posts";i:1;s:17:"role-delete_posts";i:1;s:28:"role-manage_operations_posts";i:1;s:15:"role-edit_pages";i:1;s:22:"role-edit_others_pages";i:1;s:25:"role-edit_published_pages";i:1;s:18:"role-publish_pages";i:1;s:17:"role-delete_pages";i:1;s:24:"role-delete_others_pages";i:1;s:27:"role-delete_published_pages";i:1;s:25:"role-delete_private_pages";i:1;s:23:"role-edit_private_pages";i:1;s:23:"role-read_private_pages";i:1;s:28:"role-manage_operations_pages";i:1;s:21:"role-activate_plugins";i:1;s:14:"role-add_users";i:1;s:17:"role-create_users";i:1;s:19:"role-delete_plugins";i:1;s:17:"role-delete_users";i:1;s:19:"role-edit_dashboard";i:1;s:15:"role-edit_files";i:1;s:17:"role-edit_plugins";i:1;s:23:"role-edit_theme_options";i:1;s:16:"role-edit_themes";i:1;s:15:"role-edit_users";i:1;s:11:"role-import";i:1;s:20:"role-install_plugins";i:1;s:19:"role-install_themes";i:1;s:15:"role-list_users";i:1;s:22:"role-manage_categories";i:1;s:17:"role-manage_links";i:1;s:19:"role-manage_options";i:1;s:22:"role-moderate_comments";i:1;s:18:"role-promote_users";i:1;s:9:"role-read";i:1;s:17:"role-remove_users";i:1;s:18:"role-switch_themes";i:1;s:20:"role-unfiltered_html";i:1;s:22:"role-unfiltered_upload";i:1;s:16:"role-update_core";i:1;s:19:"role-update_plugins";i:1;s:18:"role-update_themes";i:1;s:17:"role-upload_files";i:1;s:23:"role-view_app_dashboard";i:1;}i:1;a:27:{s:9:"role-name";s:6:"editor";s:10:"role-label";s:6:"Editor";s:22:"role-edit_others_posts";i:1;s:23:"role-edit_private_posts";i:1;s:23:"role-read_private_posts";i:1;s:24:"role-delete_others_posts";i:1;s:25:"role-delete_private_posts";i:1;s:25:"role-edit_published_posts";i:1;s:18:"role-publish_posts";i:1;s:27:"role-delete_published_posts";i:1;s:15:"role-edit_posts";i:1;s:17:"role-delete_posts";i:1;s:15:"role-edit_pages";i:1;s:22:"role-edit_others_pages";i:1;s:25:"role-edit_published_pages";i:1;s:18:"role-publish_pages";i:1;s:17:"role-delete_pages";i:1;s:24:"role-delete_others_pages";i:1;s:27:"role-delete_published_pages";i:1;s:25:"role-delete_private_pages";i:1;s:23:"role-edit_private_pages";i:1;s:23:"role-read_private_pages";i:1;s:22:"role-moderate_comments";i:1;s:22:"role-manage_categories";i:1;s:17:"role-manage_links";i:1;s:17:"role-upload_files";i:1;s:9:"role-read";i:1;}i:2;a:9:{s:9:"role-name";s:6:"author";s:10:"role-label";s:6:"Author";s:25:"role-edit_published_posts";i:1;s:18:"role-publish_posts";i:1;s:27:"role-delete_published_posts";i:1;s:15:"role-edit_posts";i:1;s:17:"role-delete_posts";i:1;s:17:"role-upload_files";i:1;s:9:"role-read";i:1;}i:3;a:5:{s:9:"role-name";s:11:"contributor";s:10:"role-label";s:11:"Contributor";s:15:"role-edit_posts";i:1;s:17:"role-delete_posts";i:1;s:9:"role-read";i:1;}i:4;a:3:{s:9:"role-name";s:10:"subscriber";s:10:"role-label";s:10:"Subscriber";s:9:"role-read";i:1;}}', 'yes'),
(169, 'widget_akismet_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(170, 'widget_awpcp-categories', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(171, 'widget_awpcp-latest-ads', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(172, 'widget_awpcp-random-ads', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(173, 'widget_awpcp_search_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(174, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(175, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(176, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(178, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(185, 'rewrite_rules', 'a:85:{s:37:"awpcpx/payments/return/([a-zA-Z0-9]+)";s:82:"index.php?awpcpx=1&awpcp-module=payments&awpcp-action=return&awpcp-txn=$matches[1]";s:37:"awpcpx/payments/notify/([a-zA-Z0-9]+)";s:82:"index.php?awpcpx=1&awpcp-module=payments&awpcp-action=notify&awpcp-txn=$matches[1]";s:37:"awpcpx/payments/cancel/([a-zA-Z0-9]+)";s:82:"index.php?awpcpx=1&awpcp-module=payments&awpcp-action=cancel&awpcp-txn=$matches[1]";s:46:"awpcpx/listings/verify/([0-9]+)/([a-zA-Z0-9]+)";s:104:"index.php?awpcpx=1&awpcp-module=listings&awpcp-action=verify&awpcp-ad=$matches[1]&awpcp-hash=$matches[2]";s:27:"(awpcp/show-ad)/(.+?)/(.+?)";s:45:"index.php?pagename=$matches[1]&id=$matches[2]";s:31:"(awpcp/reply-to-ad)/(.+?)/(.+?)";s:45:"index.php?pagename=$matches[1]&id=$matches[2]";s:37:"(awpcp/browse-categories)/(.+?)/(.+?)";s:58:"index.php?pagename=$matches[1]&cid=$matches[2]&a=browsecat";s:40:"(awpcp/payment-thank-you)/([a-zA-Z0-9]+)";s:52:"index.php?pagename=$matches[1]&awpcp-txn=$matches[2]";s:37:"(awpcp/cancel-payment)/([a-zA-Z0-9]+)";s:52:"index.php?pagename=$matches[1]&awpcp-txn=$matches[2]";s:33:"(awpcp)/(view-categories)($|[/?])";s:59:"index.php?pagename=$matches[1]&layout=2&cid=view-categories";s:31:"(awpcp)/(setregion)/(.+?)/(.+?)";s:63:"index.php?pagename=$matches[1]&regionid=$matches[3]&a=setregion";s:30:"(awpcp)/(classifiedsrss)/(\\d+)";s:63:"index.php?pagename=$matches[1]&awpcp-action=rss&cid=$matches[3]";s:24:"(awpcp)/(classifiedsrss)";s:47:"index.php?pagename=$matches[1]&awpcp-action=rss";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:50:"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:43:"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?bp_member_type=$matches[1]&paged=$matches[2]";s:25:"bp_member_type/([^/]+)/?$";s:36:"index.php?bp_member_type=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=17&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(188, 'theme_mods_twentyfifteen', 'a:1:{s:18:"nav_menu_locations";a:0:{}}', 'yes'),
(189, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(194, '_site_transient_timeout_browser_48ce97d67f5c394f5ce1d5ccaf049307', '1430892993', 'yes'),
(195, '_site_transient_browser_48ce97d67f5c394f5ce1d5ccaf049307', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"37.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(196, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430331400', 'no'),
(197, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430331400', 'no'),
(198, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430288200', 'no'),
(199, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1430331403', 'no'),
(200, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1430331403', 'no'),
(201, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1430288203', 'no'),
(202, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1430331405', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(203, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Apr 2015 05:58:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast&#039;s WordPress SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:137:"Wordfence Security is a free enterprise class security and performance plugin that makes your site up to 50 times faster and more secure.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Broken Link Checker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/broken-link-checker/#post-2441";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 08 Oct 2007 21:35:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2441@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"This plugin will check your posts, comments and other content for broken links and missing images, and notify you if any are found.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Janis Elsts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5468@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:67:"Make your WordPress website mobile-friendly with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics reports and real-time statistics in your WordPress Dashboard. Inserts the latest tracking code in every page of your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"P3 (Plugin Performance Profiler)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/p3-profiler/#post-32894";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 12 Dec 2011 23:11:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"32894@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:102:"See which plugins are slowing down your site.  This plugin creates a performance report for your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"GoDaddy.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"ManageWP Worker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/worker/#post-24528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Feb 2011 13:06:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"24528@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"ManageWP is the ultimate WordPress productivity tool, allowing you to efficiently manage your websites.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Vladimir Prelovac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"solarissmoke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"The Events Calendar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/plugins/the-events-calendar/#post-14790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 16 Dec 2009 21:58:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"14790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:128:"The Events Calendar is a carefully crafted, extensible plugin that lets you easily share your events. Beautiful. Solid. Awesome.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Peter Chester";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Redirection";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/redirection/#post-2286";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 10 Sep 2007 04:45:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2286@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Redirection is a WordPress plugin to manage 301 redirections and keep track of 404 errors without requiring knowledge of Apache .htaccess files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"John Godley";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"bbPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/bbpress/#post-14709";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Dec 2009 00:05:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"14709@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:50:"bbPress is forum software, made the WordPress way.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"John James Jacoby";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 12 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"WP Smush";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-smushit/#post-7936";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Dec 2008 00:00:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"7936@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:108:"Reduce image file sizes, improve performance and boost your SEO using the free WPMU DEV WordPress Smush API.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alex Dunae";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Photo Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/photo-gallery/#post-63299";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Jan 2014 15:58:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"63299@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:143:"Photo Gallery is an advanced plugin with a list of tools and options for adding and editing images for different views. It is fully responsive.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"webdorado";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"BuddyPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/buddypress/#post-10314";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Apr 2009 17:48:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"10314@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"BuddyPress helps you run any kind of social network on your WordPress, with member profiles, activity streams, user groups, messaging, and more.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Andy Peatling";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Wed, 29 Apr 2015 06:16:47 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Wed, 29 Apr 2015 06:33:53 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Wed, 29 Apr 2015 05:58:53 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20150428131838";}', 'no'),
(204, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1430331405', 'no'),
(205, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1430288205', 'no'),
(206, '_transient_timeout_plugin_slugs', '1430374786', 'no'),
(207, '_transient_plugin_slugs', 'a:8:{i:0;s:25:"adminimize/adminimize.php";i:1;s:19:"akismet/akismet.php";i:2;s:46:"another-wordpress-classifieds-plugin/awpcp.php";i:3;s:35:"bootstrap-admin/bootstrap-admin.php";i:4;s:24:"buddypress/bp-loader.php";i:5;s:9:"hello.php";i:6;s:39:"tamed-admin-theme/tamed-admin-theme.php";i:7;s:37:"user-role-editor/user-role-editor.php";}', 'no'),
(208, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1430331405', 'no'),
(209, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/04/wordpress-4-2-1/''>WordPress 4.2.1 Security Release</a> <span class="rss-date">April 27, 2015</span><div class="rssSummary">WordPress 4.2.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by Jouko Pynnönen. [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wptavern.com/wp-rest-api-version-2-0-beta-1-released''>WPTavern: WP REST API Version 2.0 Beta 1 Released</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/wordpress-plugins-created-by-jp-bot-may-not-be-maintained-after-june-2015''>WPTavern: WordPress Plugins Created by JP Bot May Not be Maintained After June 2015</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/managewp-launches-wordpress-events-hub''>WPTavern: ManageWP Launches WordPress Events Hub</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Popular Plugin:</span> <a href=''https://wordpress.org/plugins/photo-gallery/'' class=''dashboard-news-plugin-link''>Photo Gallery</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=photo-gallery&amp;_wpnonce=3a105cd67c&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Photo Gallery''>Install</a>)</span></li></ul></div>', 'no'),
(210, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1430299132', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(211, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5152";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3225";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3156";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2683";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2467";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1979";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1858";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1818";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1763";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1743";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1705";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1699";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1589";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1395";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1345";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1271";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1199";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1147";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1129";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"993";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"965";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"917";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"884";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"877";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"855";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"839";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"798";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"774";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"747";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"728";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"721";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"715";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"684";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"676";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"672";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"662";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"638";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"628";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"627";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"627";}}', 'yes'),
(212, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1430291863;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:8:{s:25:"adminimize/adminimize.php";O:8:"stdClass":6:{s:2:"id";s:4:"3683";s:4:"slug";s:10:"adminimize";s:6:"plugin";s:25:"adminimize/adminimize.php";s:11:"new_version";s:5:"1.8.5";s:3:"url";s:41:"https://wordpress.org/plugins/adminimize/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/adminimize.1.8.5.zip";}s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.1.zip";}s:46:"another-wordpress-classifieds-plugin/awpcp.php";O:8:"stdClass":6:{s:2:"id";s:4:"7207";s:4:"slug";s:36:"another-wordpress-classifieds-plugin";s:6:"plugin";s:46:"another-wordpress-classifieds-plugin/awpcp.php";s:11:"new_version";s:5:"3.3.4";s:3:"url";s:67:"https://wordpress.org/plugins/another-wordpress-classifieds-plugin/";s:7:"package";s:79:"https://downloads.wordpress.org/plugin/another-wordpress-classifieds-plugin.zip";}s:35:"bootstrap-admin/bootstrap-admin.php";O:8:"stdClass":6:{s:2:"id";s:5:"34428";s:4:"slug";s:15:"bootstrap-admin";s:6:"plugin";s:35:"bootstrap-admin/bootstrap-admin.php";s:11:"new_version";s:6:"1.16.2";s:3:"url";s:46:"https://wordpress.org/plugins/bootstrap-admin/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/bootstrap-admin.1.16.2.zip";}s:24:"buddypress/bp-loader.php";O:8:"stdClass":7:{s:2:"id";s:4:"7756";s:4:"slug";s:10:"buddypress";s:6:"plugin";s:24:"buddypress/bp-loader.php";s:11:"new_version";s:7:"2.2.3.1";s:3:"url";s:41:"https://wordpress.org/plugins/buddypress/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/buddypress.2.2.3.1.zip";s:14:"upgrade_notice";s:59:"See: https://codex.buddypress.org/releases/version-2-2-3-1/";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:39:"tamed-admin-theme/tamed-admin-theme.php";O:8:"stdClass":6:{s:2:"id";s:5:"59747";s:4:"slug";s:17:"tamed-admin-theme";s:6:"plugin";s:39:"tamed-admin-theme/tamed-admin-theme.php";s:11:"new_version";s:3:"1.0";s:3:"url";s:48:"https://wordpress.org/plugins/tamed-admin-theme/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/tamed-admin-theme.zip";}s:37:"user-role-editor/user-role-editor.php";O:8:"stdClass":6:{s:2:"id";s:5:"13697";s:4:"slug";s:16:"user-role-editor";s:6:"plugin";s:37:"user-role-editor/user-role-editor.php";s:11:"new_version";s:6:"4.18.3";s:3:"url";s:47:"https://wordpress.org/plugins/user-role-editor/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/user-role-editor.zip";}}}', 'yes'),
(213, 'user_role_editor', 'a:4:{s:11:"ure_version";s:6:"4.18.3";s:17:"ure_caps_readable";i:0;s:24:"ure_show_deprecated_caps";i:0;s:19:"ure_hide_pro_banner";i:0;}', 'yes'),
(214, 'wp_backup_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'no'),
(215, '_site_transient_timeout_ure_caps_readable', '1430289201', 'yes'),
(216, '_site_transient_ure_caps_readable', '0', 'yes'),
(217, '_site_transient_timeout_available_translations', '1430300650', 'yes'),
(218, '_site_transient_available_translations', 'a:55:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 23:59:50";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 14:15:41";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.3/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 18:55:51";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-27 03:15:54";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 20:10:03";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 17:19:12";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 13:39:01";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 19:28:15";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-24 12:47:01";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-24 13:18:45";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.3/haz.zip";s:3:"iso";a:1:{i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-26 14:13:46";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 21:33:36";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 23:18:50";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 22:23:52";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 18:50:10";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-27 00:23:32";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.3/ps.zip";s:3:"iso";a:1:{i:1;s:2:"ps";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-27 09:25:14";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-26 11:34:28";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 16:55:54";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-26 20:25:26";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 16:55:15";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'yes'),
(219, 'gst', '5', 'yes'),
(232, 'desclimit', '200', 'yes'),
(238, '_site_transient_timeout_theme_roots', '1430293658', 'yes'),
(239, '_site_transient_theme_roots', 'a:3:{s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(240, 'appicon', '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 17, '_edit_last', '1'),
(3, 17, '_edit_lock', '1430154148:1'),
(4, 19, '_menu_item_type', 'post_type'),
(5, 19, '_menu_item_menu_item_parent', '0'),
(6, 19, '_menu_item_object_id', '17'),
(7, 19, '_menu_item_object', 'page'),
(8, 19, '_menu_item_target', ''),
(9, 19, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(10, 19, '_menu_item_xfn', ''),
(11, 19, '_menu_item_url', ''),
(13, 20, '_menu_item_type', 'post_type'),
(14, 20, '_menu_item_menu_item_parent', '0'),
(15, 20, '_menu_item_object_id', '4'),
(16, 20, '_menu_item_object', 'page'),
(17, 20, '_menu_item_target', ''),
(18, 20, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(19, 20, '_menu_item_xfn', ''),
(20, 20, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-04-27 15:54:38', '2015-04-27 15:54:38', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-04-27 15:54:38', '2015-04-27 15:54:38', '', 0, 'http://localhost/gamingmobileapp/?p=1', 0, 'post', '', 1),
(2, 1, '2015-04-27 15:54:38', '2015-04-27 15:54:38', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/gamingmobileapp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-04-27 15:54:38', '2015-04-27 15:54:38', '', 0, 'http://localhost/gamingmobileapp/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-04-27 15:55:10', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-04-27 15:55:10', '0000-00-00 00:00:00', '', 0, 'http://localhost/gamingmobileapp/?p=3', 0, 'post', '', 0),
(4, 1, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPCLASSIFIEDSUI]', 'AWPCP', '', 'publish', 'open', 'open', '', 'awpcp', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPCLASSIFIEDSUI]', 0, 'http://localhost/gamingmobileapp/awpcp/', 0, 'page', '', 0),
(5, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPSHOWAD]', 'Show Ad', '', 'publish', 'closed', 'open', '', 'show-ad', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPSHOWAD]', 4, 'http://localhost/gamingmobileapp/awpcp/show-ad/', 0, 'page', '', 0),
(6, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPREPLYTOAD]', 'Reply To Ad', '', 'publish', 'closed', 'open', '', 'reply-to-ad', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPREPLYTOAD]', 4, 'http://localhost/gamingmobileapp/awpcp/reply-to-ad/', 0, 'page', '', 0),
(7, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPEDITAD]', 'Edit Ad', '', 'publish', 'closed', 'open', '', 'edit-ad', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPEDITAD]', 4, 'http://localhost/gamingmobileapp/awpcp/edit-ad/', 0, 'page', '', 0),
(8, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPPLACEAD]', 'Place Ad', '', 'publish', 'closed', 'open', '', 'place-ad', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPPLACEAD]', 4, 'http://localhost/gamingmobileapp/awpcp/place-ad/', 0, 'page', '', 0),
(9, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCP-RENEW-AD]', 'Renew Ad', '', 'publish', 'closed', 'open', '', 'renew-ad', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCP-RENEW-AD]', 4, 'http://localhost/gamingmobileapp/awpcp/renew-ad/', 0, 'page', '', 0),
(10, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPBROWSEADS]', 'Browse Ads', '', 'publish', 'closed', 'open', '', 'browse-ads', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPBROWSEADS]', 4, 'http://localhost/gamingmobileapp/awpcp/browse-ads/', 0, 'page', '', 0),
(11, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPBROWSECATS]', 'Browse Categories', '', 'publish', 'closed', 'open', '', 'browse-categories', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPBROWSECATS]', 4, 'http://localhost/gamingmobileapp/awpcp/browse-categories/', 0, 'page', '', 0),
(12, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPSEARCHADS]', 'Search Ads', '', 'publish', 'closed', 'open', '', 'search-ads', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPSEARCHADS]', 4, 'http://localhost/gamingmobileapp/awpcp/search-ads/', 0, 'page', '', 0),
(13, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPPAYMENTTHANKYOU]', 'Payment Thank You', '', 'publish', 'closed', 'open', '', 'payment-thank-you', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPPAYMENTTHANKYOU]', 4, 'http://localhost/gamingmobileapp/awpcp/payment-thank-you/', 0, 'page', '', 0),
(14, 0, '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPCANCELPAYMENT]', 'Cancel Payment', '', 'publish', 'closed', 'open', '', 'cancel-payment', '', '', '2015-04-27 00:00:00', '2015-04-27 00:00:00', '[AWPCPCANCELPAYMENT]', 4, 'http://localhost/gamingmobileapp/awpcp/cancel-payment/', 0, 'page', '', 0),
(15, 1, '2015-04-27 16:05:32', '2015-04-27 16:05:32', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2015-04-27 16:05:32', '2015-04-27 16:05:32', '', 0, 'http://localhost/gamingmobileapp/activity/', 0, 'page', '', 0),
(16, 1, '2015-04-27 16:05:32', '2015-04-27 16:05:32', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2015-04-27 16:05:32', '2015-04-27 16:05:32', '', 0, 'http://localhost/gamingmobileapp/members/', 0, 'page', '', 0),
(17, 1, '2015-04-27 17:04:08', '2015-04-27 17:04:08', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-04-27 17:04:08', '2015-04-27 17:04:08', '', 0, 'http://localhost/gamingmobileapp/?page_id=17', 0, 'page', '', 0),
(18, 1, '2015-04-27 17:04:08', '2015-04-27 17:04:08', '', 'Home', '', 'inherit', 'open', 'open', '', '17-revision-v1', '', '', '2015-04-27 17:04:08', '2015-04-27 17:04:08', '', 17, 'http://localhost/gamingmobileapp/17-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2015-04-27 17:11:49', '2015-04-27 17:11:49', ' ', '', '', 'publish', 'open', 'open', '', '19', '', '', '2015-04-27 17:11:49', '2015-04-27 17:11:49', '', 0, 'http://localhost/gamingmobileapp/?p=19', 1, 'nav_menu_item', '', 0),
(20, 1, '2015-04-27 17:11:49', '2015-04-27 17:11:49', ' ', '', '', 'publish', 'open', 'open', '', '20', '', '', '2015-04-27 17:11:49', '2015-04-27 17:11:49', '', 0, 'http://localhost/gamingmobileapp/?p=20', 2, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_signups`
--

DROP TABLE IF EXISTS `wp_signups`;
CREATE TABLE IF NOT EXISTS `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`(140),`path`(51))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'main', 'main', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(19, 2, 0),
(20, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:2:{s:64:"12c24c1c5bd70d684db862cc32596d853bbd21427af25457cd6c09b8e7692c22";a:4:{s:10:"expiration";i:1431359699;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1430150099;}s:64:"fba5060412cf33eaf36e2bdaa33756cd265d7ffa1ef412245923debbd5374655";a:4:{s:10:"expiration";i:1430460986;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0";s:5:"login";i:1430288186;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'last_activity', '2015-04-29 10:45:29'),
(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:23:"add-buddypress-nav-menu";i:1;s:8:"add-post";i:2;s:12:"add-post_tag";i:3;s:15:"add-post_format";}'),
(19, 1, 'listings-items-per-page', '10'),
(20, 1, 'listings-category', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BNIcYoBp4nbPGJz8/Vaz3tSuKO0LS41', 'admin', 'muhammadsufiangee@gmail.com', '', '2015-04-27 15:54:37', '', 0, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
