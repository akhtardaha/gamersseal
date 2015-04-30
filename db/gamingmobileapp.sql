-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2015 at 09:50 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `guest_daily_purchase` varchar(20) DEFAULT NULL,
  `standard_daily_purchase` varchar(20) DEFAULT NULL,
  `premium_daily_purchase` varchar(20) DEFAULT NULL,
  `guest_daily_transaction` varchar(20) DEFAULT NULL,
  `standard_daily_transaction` varchar(20) DEFAULT NULL,
  `premium_daily_transaction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_configuration`
--

INSERT INTO `app_configuration` (`id`, `gst`, `item_desc_limit`, `guest_seal_charges`, `standard_seal_charges`, `premium_seal_charges`, `standard_item_day`, `premium_item_day`, `app_background_color`, `app_icon`, `terms_and_conditions`, `guest_daily_purchase`, `standard_daily_purchase`, `premium_daily_purchase`, `guest_daily_transaction`, `standard_daily_transaction`, `premium_daily_transaction`) VALUES
(1, '10', '200', '10', '8', '5', '70', '700', '#babdd6', 'Lighthouse.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus congue consequat lorem, in rhoncus magna condimentum ac. Praesent tincidunt tortor at nulla elementum gravida ut eget orci. Morbi ut gravida justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum, nunc vitae vehicula aliquet, sem ante pulvinar ante, vel convallis libero felis sed odio. Cras eget risus quis metus auctor laoreet ut eget nisl. Integer ultricies, enim ac aliquam tristique, dolor tortor scelerisque velit, vel vulputate sem tortor non est. Donec eleifend, quam non malesuada laoreet, purus ex consectetur lorem, nec aliquet ipsum massa sit amet sem. In fermentum, dui ac congue ornare, leo magna luctus enim, nec tempus risus est ut est. Vestibulum magna purus, varius eu mi vel, maximus suscipit enim. Nam sed leo quam. ', '100', '10000', 'unlimited', '7', '70', '700');

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_adfees`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_awpcp_ads`
--

INSERT INTO `wp_awpcp_ads` (`ad_id`, `adterm_id`, `payment_term_type`, `ad_fee_paid`, `ad_category_id`, `ad_category_parent_id`, `ad_title`, `ad_details`, `ad_contact_name`, `ad_contact_phone`, `ad_contact_email`, `websiteurl`, `ad_city`, `ad_state`, `ad_country`, `ad_county_village`, `ad_item_price`, `ad_views`, `ad_postdate`, `ad_last_updated`, `ad_startdate`, `ad_enddate`, `disabled`, `disabled_date`, `flagged`, `verified`, `verified_at`, `ad_key`, `ad_transaction_id`, `payment_gateway`, `payment_status`, `payer_email`, `is_featured_ad`, `posterip`, `user_id`, `renew_email_sent`, `renewed_date`) VALUES
(1, 0, 'fee', 0.00, 1, 0, 'first game', 'just anoter game', 'admin', '0000000000', 'muhammadsufiangee@gmail.com', '', '', '', '', '', 50000, 6, '2015-04-29', '2015-04-29', '2015-04-29 15:58:24', '2025-04-26 15:58:24', 0, NULL, 0, 1, '2015-04-29 15:59:13', '253a8c0a062779678989af5c4a799cb1', '15a51906eb1d1cff37e45b8dfb1db059', '', 'Not Required', '', 0, '::1', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_ad_regions`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_awpcp_ad_regions`
--

INSERT INTO `wp_awpcp_ad_regions` (`id`, `ad_id`, `country`, `county`, `state`, `city`, `region_id`) VALUES
(1, 1, 'australia', '', '', 'Illawarra', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_categories`
--

CREATE TABLE IF NOT EXISTS `wp_awpcp_categories` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_parent_id` int(10) NOT NULL,
  `category_name` varchar(255) NOT NULL DEFAULT '',
  `category_order` int(10) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_awpcp_categories`
--

INSERT INTO `wp_awpcp_categories` (`category_id`, `category_parent_id`, `category_name`, `category_order`) VALUES
(1, 0, 'General', 0),
(2, 0, 'XBOX', 0),
(3, 0, 'PSP', 0),
(4, 0, 'PS3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_credit_plans`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_awpcp_media`
--

INSERT INTO `wp_awpcp_media` (`id`, `ad_id`, `name`, `path`, `mime_type`, `enabled`, `status`, `is_primary`, `created`) VALUES
(1, 1, '10941866_1147702645243570_1987336995896076403_n.jpg', '10941866_1147702645243570_1987336995896076403_n.jpg', 'image/jpeg', 0, 'Approved', 1, '2015-04-29 15:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_pagename`
--

CREATE TABLE IF NOT EXISTS `wp_awpcp_pagename` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `userpagename` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_awpcp_pages`
--

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

--
-- Dumping data for table `wp_awpcp_payments`
--

INSERT INTO `wp_awpcp_payments` (`id`, `items`, `data`, `errors`, `user_id`, `status`, `payment_status`, `payment_gateway`, `payer_email`, `version`, `created`, `updated`, `completed`) VALUES
('15a51906eb1d1cff37e45b8dfb1db059', 'a:1:{i:0;O:8:"stdClass":5:{s:2:"id";s:11:"fee-0-money";s:4:"name";s:12:"Free Listing";s:11:"description";s:0:"";s:12:"payment_type";s:5:"money";s:6:"amount";d:0;}}', 'a:10:{s:7:"context";s:8:"place-ad";s:8:"redirect";s:82:"http://localhost/gamersseal/wp-admin/admin.php?page=awpcp-listings&action=place-ad";s:13:"redirect-data";a:1:{s:4:"step";s:17:"payment-completed";}s:8:"category";s:1:"1";s:12:"payment-term";s:11:"fee-0-money";s:17:"payment-term-type";s:3:"fee";s:15:"payment-term-id";i:0;s:25:"payment-term-payment-type";s:5:"money";s:5:"ad-id";i:1;s:18:"ad-consolidated-at";s:19:"2015-04-29 15:59:14";}', 'a:0:{}', 1, 'Completed', 'Not Required', '', '', 2, '2015-04-29 15:55:38', '2015-04-29 15:59:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity`
--

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
(1, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2015-04-30 19:41:42', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity_meta`
--

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

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'admin', '2015-04-27 16:05:33'),
(2, 1, 2, 'test test', '2015-04-29 16:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_fields`
--

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
-- Table structure for table `wp_eshop_base_products`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_base_products` (
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ptype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thecondition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expiry` date NOT NULL DEFAULT '0000-00-00',
  `ean` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mpn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `qty` int(5) NOT NULL DEFAULT '0',
  `xtra` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_countries`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_countries` (
  `code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zone` tinyint(1) NOT NULL DEFAULT '0',
  `list` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`code`),
  KEY `zone` (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_eshop_countries`
--

INSERT INTO `wp_eshop_countries` (`code`, `country`, `zone`, `list`) VALUES
('AD', 'Andorra', 1, 1),
('AE', 'United Arab Emirates', 2, 1),
('AG', 'Antigua and Barbuda', 2, 1),
('AI', 'Anguilla', 2, 1),
('AL', 'Albania', 1, 1),
('AM', 'Armenia', 1, 1),
('AN', 'Netherlands Antilles', 2, 1),
('AO', 'Angola', 2, 1),
('AR', 'Argentina', 2, 1),
('AT', 'Austria', 1, 1),
('AU', 'Australia', 3, 1),
('AW', 'Aruba', 2, 1),
('AZ', 'Azerbaijan Republic', 1, 1),
('BA', 'Bosnia and Herzegovina', 1, 1),
('BB', 'Barbados', 2, 1),
('BE', 'Belgium', 1, 1),
('BF', 'Burkina Faso', 2, 1),
('BG', 'Bulgaria', 1, 1),
('BH', 'Bahrain', 2, 1),
('BI', 'Burundi', 2, 1),
('BJ', 'Benin', 2, 1),
('BM', 'Bermuda', 2, 1),
('BN', 'Brunei', 2, 1),
('BO', 'Bolivia', 2, 1),
('BR', 'Brazil', 2, 1),
('BS', 'Bahamas', 2, 1),
('BT', 'Bhutan', 2, 1),
('BW', 'Botswana', 2, 1),
('BZ', 'Belize', 2, 1),
('CA', 'Canada', 2, 1),
('CD', 'Democratic Republic of the Congo', 2, 1),
('CG', 'Republic of the Congo', 2, 1),
('CH', 'Switzerland', 1, 1),
('CK', 'Cook Islands', 3, 1),
('CL', 'Chile', 2, 1),
('CN', 'China', 3, 1),
('CO', 'Colombia', 2, 1),
('CR', 'Costa Rica', 2, 1),
('CV', 'Cape Verde', 2, 1),
('CY', 'Cyprus', 1, 1),
('CZ', 'Czech Republic', 1, 1),
('DE', 'Germany', 1, 1),
('DJ', 'Djibouti', 2, 1),
('DK', 'Denmark', 1, 1),
('DM', 'Dominica', 2, 1),
('DO', 'Dominican Republic', 2, 1),
('DZ', 'Algeria', 2, 1),
('EC', 'Ecuador', 2, 1),
('EE', 'Estonia', 1, 1),
('ER', 'Eritrea', 2, 1),
('ES', 'Spain', 1, 1),
('ET', 'Ethiopia', 2, 1),
('FI', 'Finland', 1, 1),
('FJ', 'Fiji', 3, 1),
('FK', 'Falkland Islands', 2, 1),
('FM', 'Federated States of Micronesia', 3, 1),
('FO', 'Faroe Islands', 1, 1),
('FR', 'France', 1, 1),
('GA', 'Gabon Republic', 2, 1),
('GB', 'United Kingdom', 1, 1),
('GD', 'Grenada', 2, 1),
('GF', 'French Guiana', 2, 1),
('GI', 'Gibraltar', 1, 1),
('GL', 'Greenland', 1, 1),
('GM', 'Gambia', 2, 1),
('GN', 'Guinea', 2, 1),
('GP', 'Guadeloupe', 3, 1),
('GR', 'Greece', 1, 1),
('GT', 'Guatemala', 2, 1),
('GW', 'Guinea Bissau', 2, 1),
('GY', 'Guyana', 2, 1),
('HK', 'Hong Kong', 2, 1),
('HN', 'Honduras', 2, 1),
('HR', 'Croatia', 1, 1),
('HU', 'Hungary', 1, 1),
('ID', 'Indonesia', 2, 1),
('IE', 'Ireland', 1, 1),
('IL', 'Israel', 2, 1),
('IN', 'India', 2, 1),
('IS', 'Iceland', 1, 1),
('IT', 'Italy', 1, 1),
('JM', 'Jamaica', 2, 1),
('JO', 'Jordan', 2, 1),
('JP', 'Japan', 3, 1),
('KE', 'Kenya', 2, 1),
('KG', 'Kyrgyzstan', 1, 1),
('KH', 'Cambodia', 2, 1),
('KI', 'Kiribati', 3, 1),
('KM', 'Comoros', 2, 1),
('KN', 'St. Kitts and Nevis', 2, 1),
('KR', 'South Korea', 3, 1),
('KW', 'Kuwait', 2, 1),
('KY', 'Cayman Islands', 2, 1),
('KZ', 'Kazakhstan', 1, 1),
('LA', 'Laos', 3, 1),
('LC', 'St. Lucia', 2, 1),
('LI', 'Liechtenstein', 1, 1),
('LK', 'Sri Lanka', 2, 1),
('LS', 'Lesotho', 2, 1),
('LT', 'Lithuania', 1, 1),
('LU', 'Luxembourg', 1, 1),
('LV', 'Latvia', 1, 1),
('MA', 'Morocco', 2, 1),
('MG', 'Madagascar', 2, 1),
('MH', 'Marshall Islands', 3, 1),
('ML', 'Mali', 2, 1),
('MN', 'Mongolia', 3, 1),
('MQ', 'Martinique', 3, 1),
('MR', 'Mauritania', 2, 1),
('MS', 'Montserrat', 2, 1),
('MT', 'Malta', 1, 1),
('MU', 'Mauritius', 2, 1),
('MV', 'Maldives', 2, 1),
('MW', 'Malawi', 2, 1),
('MX', 'Mexico', 2, 1),
('MY', 'Malaysia', 2, 1),
('MZ', 'Mozambique', 2, 1),
('NA', 'Namibia', 2, 1),
('NC', 'New Caledonia', 3, 1),
('NE', 'Niger', 2, 1),
('NF', 'Norfolk Island', 3, 1),
('NI', 'Nicaragua', 2, 1),
('NL', 'Netherlands', 1, 1),
('NO', 'Norway', 1, 1),
('NP', 'Nepal', 2, 1),
('NR', 'Nauru', 3, 1),
('NU', 'Niue', 3, 1),
('NZ', 'New Zealand', 3, 1),
('OM', 'Oman', 2, 1),
('PA', 'Panama', 2, 1),
('PE', 'Peru', 2, 1),
('PF', 'French Polynesia', 3, 1),
('PG', 'Papua New Guinea', 3, 1),
('PH', 'Philippines', 3, 1),
('PL', 'Poland', 1, 1),
('PM', 'St. Pierre and Miquelon', 2, 1),
('PN', 'Pitcairn Islands', 3, 1),
('PT', 'Portugal', 1, 1),
('PW', 'Palau', 3, 1),
('PY', 'Paraguay', 2, 1),
('QA', 'Qatar', 2, 1),
('RE', 'Reunion', 2, 1),
('RO', 'Romania', 1, 1),
('RU', 'Russia', 1, 1),
('RW', 'Rwanda', 2, 1),
('SA', 'Saudi Arabia', 2, 1),
('SB', 'Solomon Islands', 3, 1),
('SC', 'Seychelles', 2, 1),
('SE', 'Sweden', 1, 1),
('SG', 'Singapore', 2, 1),
('SH', 'St. Helena', 2, 1),
('SI', 'Slovenia', 1, 1),
('SJ', 'Svalbard and Jan Mayen Islands', 3, 1),
('SK', 'Slovakia', 1, 1),
('SL', 'Sierra Leone', 2, 1),
('SM', 'San Marino', 1, 1),
('SN', 'Senegal', 2, 1),
('SO', 'Somalia', 2, 1),
('SR', 'Suriname', 2, 1),
('ST', 'Sao Tome and Principe', 2, 1),
('SV', 'El Salvador', 2, 1),
('SZ', 'Swaziland', 2, 1),
('TC', 'Turks and Caicos Islands', 2, 1),
('TD', 'Chad', 2, 1),
('TG', 'Togo', 2, 1),
('TH', 'Thailand', 2, 1),
('TJ', 'Tajikistan', 1, 1),
('TM', 'Turkmenistan', 1, 1),
('TN', 'Tunisia', 2, 1),
('TO', 'Tonga', 3, 1),
('TR', 'Turkey', 1, 1),
('TT', 'Trinidad and Tobago', 2, 1),
('TV', 'Tuvalu', 3, 1),
('TW', 'Taiwan', 3, 1),
('TZ', 'Tanzania', 2, 1),
('UA', 'Ukraine', 1, 1),
('UG', 'Uganda', 2, 1),
('US', 'United States', 2, 1),
('UY', 'Uruguay', 2, 1),
('VA', 'Vatican City State', 1, 1),
('VC', 'Saint Vincent and the Grenadines', 2, 1),
('VE', 'Venezuela', 2, 1),
('VG', 'British Virgin Islands', 2, 1),
('VN', 'Vietnam', 2, 1),
('VU', 'Vanuatu', 3, 1),
('WF', 'Wallis and Futuna Islands', 3, 1),
('WS', 'Samoa', 3, 1),
('YE', 'Yemen', 2, 1),
('YT', 'Mayotte', 3, 1),
('ZA', 'South Africa', 2, 1),
('ZM', 'Zambia', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_downloads`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `files` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `purchases` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_download_orders`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_download_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchased` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `files` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `downloads` smallint(1) NOT NULL DEFAULT '3',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_emails`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailUse` tinyint(1) NOT NULL DEFAULT '0',
  `emailType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `emailSubject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `emailContent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `wp_eshop_emails`
--

INSERT INTO `wp_eshop_emails` (`id`, `emailUse`, `emailType`, `emailSubject`, `emailContent`) VALUES
(1, 1, 'Automatic default email', 'Your order from gamingmobileapp', '[AUTO-RESPONSE - PLEASE DO NOT REPLY]\r\n\r\n	Dear {FIRSTNAME},\r\n\r\n	Your order has been received. Thank you! \r\n	The details of your order follow...\r\n\r\n	--------------- ORDER DETAILS ---------------\r\n\r\n	{STATUS}\r\n	{CART}\r\n\r\n\r\n	--------------- DOWNLOAD DETAILS ---------------\r\n	These are available for download via:\r\n	{DOWNLOADS}\r\n\r\n\r\n	--------------- CUSTOMER DETAILS ---------------\r\n\r\n	{NAME}\r\n	{ADDRESS}\r\n\r\n	--------------- CONTACT DETAILS ---------------\r\n\r\n	{CONTACT}\r\n\r\n	--------------- OTHER INFORMATION (if applicable) ---------------\r\n\r\n	{REFCOMM}\r\n	---\r\n\r\n	If you have questions or concerns, please contact us.\r\n	Thank you for ordering with us.'),
(2, 1, 'Admin Order Form email', 'gamingmobileapp Notification', '[SPECIAL COMMUNICATION/NOTIFICATION]\r\n\r\n	Dear {FIRSTNAME},\r\n\r\n	*** Enter a custom message here ***\r\n\r\n	Respectfully,\r\n	*** Enter your name, title, and email here ***\r\n\r\n\r\n\r\n	--------------- ORDER DETAILS ---------------\r\n\r\n	{STATUS}\r\n	{CART}\r\n\r\n	--------------- DOWNLOAD DETAILS ---------------\r\n	These are available for download via:\r\n	{DOWNLOADS}\r\n\r\n	--------------- CUSTOMER DETAILS ---------------\r\n\r\n	{NAME}\r\n	{ADDRESS}\r\n\r\n	--------------- CONTACT DETAILS ---------------\r\n\r\n	{CONTACT}\r\n\r\n	--------------- OTHER INFORMATION (if applicable) ---------------\r\n\r\n	{REFCOMM}\r\n\r\n	---\r\n\r\n	If you have questions or concerns, please contact us.\r\n	Again, thank you for ordering with us.\r\n	'),
(3, 0, 'Automatic Paypal email', 'Your order from gamingmobileapp', ''),
(4, 0, 'Automatic Payson email', 'Your order from gamingmobileapp', ''),
(5, 0, 'Automatic Cash email', 'Your order from gamingmobileapp', ''),
(6, 0, 'Automatic ePN email', 'Your order from gamingmobileapp', ''),
(7, 0, 'Automatic webtopay email', 'Your order from gamingmobileapp', ''),
(8, 0, 'Automatic Authorize.net email', 'Your order from gamingmobileapp', ''),
(9, 0, 'Automatic iDeal Lite email', 'Your order from gamingmobileapp', ''),
(10, 0, 'Automatic ogone email', 'Your order from gamingmobileapp', ''),
(11, 0, 'Automatic Bank email', 'Your order from gamingmobileapp', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_option_names`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_option_names` (
  `optid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`optid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_option_sets`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_option_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `price` float(16,2) NOT NULL DEFAULT '0.00',
  `weight` float(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_orders`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` set('Sent','Completed','Pending','Failed','Deleted','Waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_postcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_country` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_field` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thememo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edited` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `downloads` set('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `admin_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `paidvia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `affiliate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `user_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field` (`checkid`(191)),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_order_items`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `item_qty` int(11) NOT NULL DEFAULT '0',
  `item_amt` float(16,2) NOT NULL DEFAULT '0.00',
  `tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_amt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `optname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `optsets` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `down_id` int(11) NOT NULL DEFAULT '0',
  `weight` float(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `custom_field` (`checkid`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_rates`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(3) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `items` smallint(2) NOT NULL DEFAULT '0',
  `zone1` float(16,2) NOT NULL DEFAULT '0.00',
  `zone2` float(16,2) NOT NULL DEFAULT '0.00',
  `zone3` float(16,2) NOT NULL DEFAULT '0.00',
  `zone4` float(16,2) NOT NULL DEFAULT '0.00',
  `zone5` float(16,2) NOT NULL DEFAULT '0.00',
  `zone6` float(16,2) NOT NULL DEFAULT '0.00',
  `zone7` float(16,2) NOT NULL DEFAULT '0.00',
  `zone8` float(16,2) NOT NULL DEFAULT '0.00',
  `zone9` float(16,2) NOT NULL DEFAULT '0.00',
  `weight` float(16,2) NOT NULL DEFAULT '0.00',
  `maxweight` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `area` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `rate_type` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'shipping',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_eshop_rates`
--

INSERT INTO `wp_eshop_rates` (`id`, `class`, `items`, `zone1`, `zone2`, `zone3`, `zone4`, `zone5`, `zone6`, `zone7`, `zone8`, `zone9`, `weight`, `maxweight`, `area`, `rate_type`) VALUES
(1, 'A', 1, 10.00, 15.00, 20.00, 25.00, 30.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(2, 'B', 1, 15.00, 20.00, 30.00, 40.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(3, 'C', 1, 40.00, 45.00, 50.00, 50.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(4, 'D', 1, 30.00, 35.00, 40.00, 40.00, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(5, 'E', 1, 50.00, 60.00, 70.00, 80.00, 90.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(6, 'A', 2, 5.00, 8.00, 10.00, 15.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(7, 'B', 2, 7.00, 10.00, 20.00, 20.00, 15.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(8, 'C', 2, 20.00, 25.00, 40.00, 25.00, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(9, 'D', 2, 15.00, 25.00, 30.00, 20.00, 25.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping'),
(10, 'E', 2, 25.00, 30.00, 60.00, 40.00, 30.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', 'shipping');

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_states`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `stateName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zone` tinyint(1) NOT NULL DEFAULT '0',
  `list` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `zone` (`zone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=155 ;

--
-- Dumping data for table `wp_eshop_states`
--

INSERT INTO `wp_eshop_states` (`id`, `code`, `stateName`, `zone`, `list`) VALUES
(1, 'AK', 'Alaska', 5, 'US'),
(2, 'HI', 'Hawaii', 5, 'US'),
(3, 'AL', 'Alabama', 2, 'US'),
(4, 'AZ', 'Arizona', 4, 'US'),
(5, 'AR', 'Arkansas', 3, 'US'),
(6, 'CA', 'California', 5, 'US'),
(7, 'CO', 'Colorado', 4, 'US'),
(8, 'CT', 'Connecticut', 1, 'US'),
(9, 'DE', 'Delaware', 2, 'US'),
(10, 'DC', 'District Of Columbia', 2, 'US'),
(11, 'FL', 'Florida', 2, 'US'),
(12, 'GA', 'Georgia', 2, 'US'),
(13, 'ID', 'Idaho', 4, 'US'),
(14, 'IL', 'Illinois', 3, 'US'),
(15, 'IN', 'Indiana', 2, 'US'),
(16, 'IA', 'Iowa', 3, 'US'),
(17, 'KS', 'Kansas', 3, 'US'),
(18, 'KY', 'Kentucky', 2, 'US'),
(19, 'LA', 'Louisiana', 3, 'US'),
(20, 'ME', 'Maine', 1, 'US'),
(21, 'MD', 'Maryland', 2, 'US'),
(22, 'MA', 'Massachusetts', 1, 'US'),
(23, 'MI', 'Michigan', 2, 'US'),
(24, 'MN', 'Minnesota', 3, 'US'),
(25, 'MS', 'Mississippi', 3, 'US'),
(26, 'MO', 'Missouri', 3, 'US'),
(27, 'MT', 'Montana', 4, 'US'),
(28, 'NE', 'Nebraska', 3, 'US'),
(29, 'NV', 'Nevada', 5, 'US'),
(30, 'NH', 'New Hampshire', 1, 'US'),
(31, 'NJ', 'New Jersey', 2, 'US'),
(32, 'NM', 'New Mexico', 4, 'US'),
(33, 'NY', 'New York', 2, 'US'),
(34, 'NC', 'North Carolina', 2, 'US'),
(35, 'ND', 'North Dakota', 3, 'US'),
(36, 'OH', 'Ohio', 2, 'US'),
(37, 'OK', 'Oklahoma', 3, 'US'),
(38, 'OR', 'Oregon', 5, 'US'),
(39, 'PA', 'Pennsylvania', 2, 'US'),
(40, 'RI', 'Rhode Island', 1, 'US'),
(41, 'SC', 'South Carolina', 2, 'US'),
(42, 'SD', 'South Dakota', 3, 'US'),
(43, 'TN', 'Tennessee', 3, 'US'),
(44, 'TX', 'Texas', 3, 'US'),
(45, 'UT', 'Utah', 4, 'US'),
(46, 'VT', 'Vermont', 1, 'US'),
(47, 'VA', 'Virginia', 2, 'US'),
(48, 'WA', 'Washington', 5, 'US'),
(49, 'WV', 'West Virginia', 2, 'US'),
(50, 'WI', 'Wisconsin', 3, 'US'),
(51, 'WY', 'Wyoming', 4, 'US'),
(52, 'AB', 'Alberta', 3, 'CA'),
(53, 'BC', 'British Columbia', 3, 'CA'),
(54, 'MB', 'Manitoba', 3, 'CA'),
(55, 'NB', 'New Brunswick', 3, 'CA'),
(56, 'NL', 'Newfoundland & Labrador', 3, 'CA'),
(57, 'NT', 'Northwest Territories', 3, 'CA'),
(58, 'NU', 'Nunavut', 3, 'CA'),
(59, 'NS', 'Nova Scotia', 3, 'CA'),
(60, 'ON', 'Ontario', 3, 'CA'),
(61, 'PE', 'Prince Edward Island', 3, 'CA'),
(62, 'QC', 'Quebec', 3, 'CA'),
(63, 'SK', 'Saskatchewan', 3, 'CA'),
(64, 'YU', 'Yukon', 3, 'CA'),
(65, 'Lond', 'London', 1, 'GB'),
(66, 'Beds', 'Bedfordshire', 1, 'GB'),
(67, 'Berk', 'Berkshire', 1, 'GB'),
(68, 'Buck', 'Buckinghamshire', 1, 'GB'),
(69, 'Camb', 'Cambridgeshire', 1, 'GB'),
(70, 'Ches', 'Cheshire', 1, 'GB'),
(71, 'Corn', 'Cornwall and Isles of Scilly', 1, 'GB'),
(72, 'Cumb', 'Cumbria', 1, 'GB'),
(73, 'Derb', 'Derbyshire', 1, 'GB'),
(74, 'Dev', 'Devon', 1, 'GB'),
(75, 'Dors', 'Dorset', 1, 'GB'),
(76, 'Durh', 'Durham', 1, 'GB'),
(77, 'ESus', 'East Sussex', 1, 'GB'),
(78, 'Esse', 'Essex', 1, 'GB'),
(79, 'Glos', 'Gloucestershire', 1, 'GB'),
(80, 'GL', 'Greater London', 1, 'GB'),
(81, 'GM', 'Greater Manchester', 1, 'GB'),
(82, 'Hamp', 'Hampshire', 1, 'GB'),
(83, 'Here', 'Herefordshire', 1, 'GB'),
(84, 'Hert', 'Hertfordshire', 1, 'GB'),
(85, 'Kent', 'Kent', 1, 'GB'),
(86, 'Lanc', 'Lancashire', 1, 'GB'),
(87, 'Leic', 'Leicestershire', 1, 'GB'),
(88, 'Linc', 'Lincolnshire', 1, 'GB'),
(89, 'Mers', 'Merseyside', 1, 'GB'),
(90, 'Norf', 'Norfolk', 1, 'GB'),
(91, 'NYor', 'North Yorkshire', 1, 'GB'),
(92, 'Nort', 'Northamptonshire', 1, 'GB'),
(93, 'Norh', 'Northumberland', 1, 'GB'),
(94, 'Nott', 'Nottinghamshire', 1, 'GB'),
(95, 'Ox', 'Oxfordshire', 1, 'GB'),
(96, 'Shrp', 'Shropshire', 1, 'GB'),
(97, 'Som', 'Somerset', 1, 'GB'),
(98, 'SYor', 'South Yorkshire', 1, 'GB'),
(99, 'Staf', 'Staffordshire', 1, 'GB'),
(100, 'Suff', 'Suffolk', 1, 'GB'),
(101, 'Surr', 'Surrey', 1, 'GB'),
(102, 'Tyne', 'Tyne and Wear', 1, 'GB'),
(103, 'Warw', 'Warwickshire', 1, 'GB'),
(104, 'WMid', 'West Midlands', 1, 'GB'),
(105, 'WSus', 'West Sussex', 1, 'GB'),
(106, 'WYor', 'West Yorkshire', 1, 'GB'),
(107, 'Wilt', 'Wiltshire', 1, 'GB'),
(108, 'Worc', 'Worcestershire', 1, 'GB'),
(109, 'Flin', 'Flintshire', 1, 'GB'),
(110, 'Glam', 'Glamorgan', 1, 'GB'),
(111, 'Meri', 'Merionethshire', 1, 'GB'),
(112, 'Mon', 'Monmouthshire', 1, 'GB'),
(113, 'Mont', 'Montgomeryshire', 1, 'GB'),
(114, 'Pemb', 'Pembrokeshire', 1, 'GB'),
(115, 'Radn', 'Radnorshire', 1, 'GB'),
(116, 'Angl', 'Anglesey', 1, 'GB'),
(117, 'Brec', 'Breconshire', 1, 'GB'),
(118, 'Caer', 'Caernarvonshire', 1, 'GB'),
(119, 'Card', 'Cardiganshire', 1, 'GB'),
(120, 'Carm', 'Carmarthenshire', 1, 'GB'),
(121, 'Denb', 'Denbighshire', 1, 'GB'),
(122, 'Kirk', 'Kirkcudbrightshire', 1, 'GB'),
(123, 'Lana', 'Lanarkshire', 1, 'GB'),
(124, 'Midl', 'Midlothian', 1, 'GB'),
(125, 'Mora', 'Moray', 1, 'GB'),
(126, 'Nair', 'Nairnshire', 1, 'GB'),
(127, 'Orkn', 'Orkney', 1, 'GB'),
(128, 'Peeb', 'Peebleshire', 1, 'GB'),
(129, 'Pert', 'Perthshire', 1, 'GB'),
(130, 'Renf', 'Renfrewshire', 1, 'GB'),
(131, 'Ross', 'Ross &amp; Cromarty', 1, 'GB'),
(132, 'Roxb', 'Roxburghshire', 1, 'GB'),
(133, 'Selk', 'Selkirkshire', 1, 'GB'),
(134, 'Shet', 'Shetland', 1, 'GB'),
(135, 'Stir', 'Stirlingshire', 1, 'GB'),
(136, 'Suth', 'Sutherland', 1, 'GB'),
(137, 'WLot', 'West Lothian', 1, 'GB'),
(138, 'Wigt', 'Wigtownshire', 1, 'GB'),
(139, 'Aber', 'Aberdeenshire', 1, 'GB'),
(140, 'Angu', 'Angus', 1, 'GB'),
(141, 'Argy', 'Argyll', 1, 'GB'),
(142, 'Ayrs', 'Ayrshire', 1, 'GB'),
(143, 'Banf', 'Banffshire', 1, 'GB'),
(144, 'Berw', 'Berwickshire', 1, 'GB'),
(145, 'Bute', 'Bute', 1, 'GB'),
(146, 'Cait', 'Caithness', 1, 'GB'),
(147, 'Clac', 'Clackmannanshire', 1, 'GB'),
(148, 'Dumf', 'Dumfriesshire', 1, 'GB'),
(149, 'Dumb', 'Dumbartonshire', 1, 'GB'),
(150, 'ELot', 'East Lothian', 1, 'GB'),
(151, 'Fife', 'Fife', 1, 'GB'),
(152, 'Inve', 'Inverness', 1, 'GB'),
(153, 'Kinc', 'Kincardineshire', 1, 'GB'),
(154, 'Kinr', 'Kinross-shire', 1, 'GB');

-- --------------------------------------------------------

--
-- Table structure for table `wp_eshop_stock`
--

CREATE TABLE IF NOT EXISTS `wp_eshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `available` int(11) NOT NULL DEFAULT '0',
  `purchases` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`,`available`,`purchases`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

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

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=380 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/gamersseal/', 'yes'),
(2, 'home', 'http://localhost/gamersseal/', 'yes'),
(3, 'blogname', 'Gamers Seal', 'yes'),
(4, 'blogdescription', 'Gamers Seal', 'yes'),
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
(33, 'active_plugins', 'a:8:{i:0;s:19:"akismet/akismet.php";i:1;s:46:"another-wordpress-classifieds-plugin/awpcp.php";i:2;s:45:"branded-login-screen/branded-login-screen.php";i:3;s:24:"buddypress/bp-loader.php";i:4;s:9:"hello.php";i:5;s:29:"simple-cart-buy-now/scabn.php";i:6;s:39:"tamed-admin-theme/tamed-admin-theme.php";i:7;s:37:"user-role-editor/user-role-editor.php";}', 'yes'),
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
(82, 'uninstall_plugins', 'a:1:{s:45:"branded-login-screen/branded-login-screen.php";a:2:{i:0;s:20:"Branded_Login_Screen";i:1;s:9:"uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '17', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31532', 'yes'),
(89, 'wp_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:71:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;s:5:"eShop";b:1;s:11:"eShop_admin";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:5:"eShop";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:5:"guest";a:2:{s:4:"name";s:5:"Guest";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"standard";a:2:{s:4:"name";s:8:"Standard";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"preminum";a:2:{s:4:"name";s:8:"Preminum";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:7:{i:1430424171;a:2:{s:20:"doadexpirations_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}s:27:"awpcp_ad_renewal_email_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1430452480;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430464620;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430495700;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430496171;a:3:{s:16:"doadcleanup_hook";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:35:"awpcp-clean-up-payment-transactions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:31:"awpcp-clean-up-non-verified-ads";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430499832;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.2.1-partial-0.zip";s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.1";s:7:"version";s:5:"4.2.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:3:"4.2";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.2.1-partial-0.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-rollback-0.zip";}s:7:"current";s:5:"4.2.1";s:7:"version";s:5:"4.2.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:3:"4.2";s:13:"support_email";s:26:"updatehelp41@wordpress.org";s:9:"new_files";s:0:"";}}s:12:"last_checked";i:1430421154;s:15:"version_checked";s:3:"4.2";s:12:"translations";a:0:{}}', 'yes'),
(104, '_transient_random_seed', 'cfd3eda93df2da71ef85a02d4def5446', 'yes'),
(107, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1430421173;s:7:"checked";a:3:{s:13:"twentyfifteen";s:3:"1.1";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(108, 'can_compress_scripts', '1', 'yes'),
(111, 'recently_activated', 'a:5:{s:32:"ect-add-to-cart-button/index.php";i:1430423008;s:15:"eshop/eshop.php";i:1430322377;s:35:"bootstrap-admin/bootstrap-admin.php";i:1430154118;s:32:"cream6-admin-theme/functions.php";i:1430153377;s:31:"wp-app-studio/wp-app-studio.php";i:1430151919;}', 'yes'),
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
(178, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(188, 'theme_mods_twentyfifteen', 'a:1:{s:18:"nav_menu_locations";a:0:{}}', 'yes'),
(189, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(194, '_site_transient_timeout_browser_48ce97d67f5c394f5ce1d5ccaf049307', '1430892993', 'yes'),
(195, '_site_transient_browser_48ce97d67f5c394f5ce1d5ccaf049307', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"37.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(206, '_transient_timeout_plugin_slugs', '1430509416', 'no'),
(207, '_transient_plugin_slugs', 'a:11:{i:0;s:25:"adminimize/adminimize.php";i:1;s:19:"akismet/akismet.php";i:2;s:46:"another-wordpress-classifieds-plugin/awpcp.php";i:3;s:35:"bootstrap-admin/bootstrap-admin.php";i:4;s:45:"branded-login-screen/branded-login-screen.php";i:5;s:24:"buddypress/bp-loader.php";i:6;s:32:"ect-add-to-cart-button/index.php";i:7;s:9:"hello.php";i:8;s:29:"simple-cart-buy-now/scabn.php";i:9;s:39:"tamed-admin-theme/tamed-admin-theme.php";i:10;s:37:"user-role-editor/user-role-editor.php";}', 'no'),
(210, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1430299132', 'yes'),
(211, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5152";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3225";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3156";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2683";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2467";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1979";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1858";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1818";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1763";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1743";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1705";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1699";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1589";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1395";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1345";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1271";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1199";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1147";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1129";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"993";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"965";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"917";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"884";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"877";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"855";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"839";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"798";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"774";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"747";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"728";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"721";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"715";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"684";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"676";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"672";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"662";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"638";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"628";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"627";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"627";}}', 'yes'),
(213, 'user_role_editor', 'a:4:{s:11:"ure_version";s:6:"4.18.3";s:17:"ure_caps_readable";i:0;s:24:"ure_show_deprecated_caps";i:0;s:19:"ure_hide_pro_banner";i:0;}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(214, 'wp_backup_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'no'),
(215, '_site_transient_timeout_ure_caps_readable', '1430289201', 'yes'),
(216, '_site_transient_ure_caps_readable', '0', 'yes'),
(219, 'gst', '5', 'yes'),
(232, 'desclimit', '200', 'yes'),
(240, 'appicon', '', 'yes'),
(269, '_site_transient_timeout_available_translations', '1430332423', 'yes'),
(270, '_site_transient_available_translations', 'a:55:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 23:59:50";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.1.4";s:7:"updated";s:19:"2015-04-28 19:15:50";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.4/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 18:55:51";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-27 03:15:54";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 20:10:03";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 13:39:01";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-25 17:19:12";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 19:28:15";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-24 12:47:01";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-24 13:18:45";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.3/haz.zip";s:3:"iso";a:1:{i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-26 14:13:46";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 21:33:36";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 23:18:50";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 22:23:52";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 18:50:10";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-27 00:23:32";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.3/ps.zip";s:3:"iso";a:1:{i:1;s:2:"ps";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-27 09:25:14";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-26 11:34:28";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 16:55:54";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:09";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.3";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.3/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-26 20:25:26";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.1.4";s:7:"updated";s:19:"2015-04-29 06:37:03";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.4/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'yes'),
(273, 'shortcode_ec_111', '<form method=\\"post\\" action=\\"/cart.php\\"><input type=\\"hidden\\" name=\\"id\\" value=\\"111\\" /><input type=\\"hidden\\" name=\\"mode\\" value=\\"add\\" /><input type=\\"submit\\"  name=\\"add to cart\\" value=\\"add to cart\\"></form>', 'yes'),
(274, 'shortcode_ec_2', '<form method=\\"post\\" action=\\"/cart.php\\"><input type=\\"hidden\\" name=\\"id\\" value=\\"2\\" /><input type=\\"hidden\\" name=\\"mode\\" value=\\"add\\" /><input type=\\"submit\\"  name=\\"add to cart\\" value=\\"add to cart\\"></form>', 'yes'),
(277, 'eshop_plugin_settings', 'a:68:{s:15:"addtocart_image";s:0:"";s:10:"base_brand";s:0:"";s:14:"base_condition";s:0:"";s:11:"base_expiry";s:0:"";s:12:"base_payment";s:0:"";s:10:"base_ptype";s:0:"";s:8:"business";s:0:"";s:4:"cart";i:24;s:11:"cart_cancel";i:27;s:12:"cart_nostock";s:12:"Out of Stock";s:13:"cart_shipping";i:28;s:12:"cart_success";i:26;s:8:"checkout";i:25;s:7:"credits";s:2:"no";s:10:"cron_email";s:0:"";s:15:"currency_symbol";s:7:"&pound;";s:8:"currency";s:3:"GBP";s:17:"discount_shipping";s:0:"";s:15:"discount_spend1";s:0:"";s:15:"discount_value1";s:0:"";s:15:"discount_spend2";s:0:"";s:15:"discount_value2";s:0:"";s:15:"discount_spend3";s:0:"";s:15:"discount_value3";s:0:"";s:17:"downloads_hideall";s:2:"no";s:13:"downloads_num";s:1:"3";s:14:"downloads_only";s:2:"no";s:4:"etax";a:1:{i:0;s:0:"";}s:10:"first_time";s:2:"no";s:9:"fold_menu";s:2:"no";s:10:"from_email";s:0:"";s:12:"hide_addinfo";s:3:"yes";s:11:"hide_cartco";s:0:"";s:13:"hide_shipping";s:0:"";s:13:"image_in_cart";s:0:"";s:8:"location";s:14:"United Kingdom";s:6:"method";a:1:{i:0;s:6:"paypal";}s:11:"options_num";s:1:"3";s:14:"paypal_noemail";s:0:"";s:7:"records";s:2:"10";s:10:"search_img";s:2:"no";s:16:"set_cacheability";s:2:"no";s:14:"shipping_state";s:2:"GB";s:13:"shipping_zone";s:7:"country";s:8:"shipping";s:1:"1";s:14:"numb_shipzones";s:1:"5";s:9:"shop_page";s:0:"";s:14:"show_allstates";s:0:"";s:14:"show_downloads";i:29;s:10:"show_forms";s:0:"";s:10:"show_zones";s:2:"no";s:6:"status";s:7:"testing";s:13:"stock_control";s:2:"no";s:5:"style";s:3:"yes";s:9:"sysemails";s:0:"";s:5:"tandc";s:0:"";s:8:"tandc_id";s:0:"";s:9:"tandc_use";s:0:"";s:13:"unknown_state";s:1:"5";s:7:"version";s:6:"6.3.11";s:14:"state_location";s:0:"";s:10:"tax_symbol";s:3:"VAT";s:4:"tax1";s:1:"0";s:4:"tax2";s:1:"0";s:4:"tax3";s:1:"0";s:10:"tax_method";s:1:"1";s:9:"xtra_help";s:0:"";s:12:"xtra_privacy";s:0:"";}', 'yes'),
(278, 'rewrite_rules', 'a:85:{s:37:"awpcpx/payments/return/([a-zA-Z0-9]+)";s:82:"index.php?awpcpx=1&awpcp-module=payments&awpcp-action=return&awpcp-txn=$matches[1]";s:37:"awpcpx/payments/notify/([a-zA-Z0-9]+)";s:82:"index.php?awpcpx=1&awpcp-module=payments&awpcp-action=notify&awpcp-txn=$matches[1]";s:37:"awpcpx/payments/cancel/([a-zA-Z0-9]+)";s:82:"index.php?awpcpx=1&awpcp-module=payments&awpcp-action=cancel&awpcp-txn=$matches[1]";s:46:"awpcpx/listings/verify/([0-9]+)/([a-zA-Z0-9]+)";s:104:"index.php?awpcpx=1&awpcp-module=listings&awpcp-action=verify&awpcp-ad=$matches[1]&awpcp-hash=$matches[2]";s:27:"(awpcp/show-ad)/(.+?)/(.+?)";s:45:"index.php?pagename=$matches[1]&id=$matches[2]";s:31:"(awpcp/reply-to-ad)/(.+?)/(.+?)";s:45:"index.php?pagename=$matches[1]&id=$matches[2]";s:37:"(awpcp/browse-categories)/(.+?)/(.+?)";s:58:"index.php?pagename=$matches[1]&cid=$matches[2]&a=browsecat";s:40:"(awpcp/payment-thank-you)/([a-zA-Z0-9]+)";s:52:"index.php?pagename=$matches[1]&awpcp-txn=$matches[2]";s:37:"(awpcp/cancel-payment)/([a-zA-Z0-9]+)";s:52:"index.php?pagename=$matches[1]&awpcp-txn=$matches[2]";s:33:"(awpcp)/(view-categories)($|[/?])";s:59:"index.php?pagename=$matches[1]&layout=2&cid=view-categories";s:31:"(awpcp)/(setregion)/(.+?)/(.+?)";s:63:"index.php?pagename=$matches[1]&regionid=$matches[3]&a=setregion";s:30:"(awpcp)/(classifiedsrss)/(\\d+)";s:63:"index.php?pagename=$matches[1]&awpcp-action=rss&cid=$matches[3]";s:24:"(awpcp)/(classifiedsrss)";s:47:"index.php?pagename=$matches[1]&awpcp-action=rss";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:50:"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:43:"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?bp_member_type=$matches[1]&paged=$matches[2]";s:25:"bp_member_type/([^/]+)/?$";s:36:"index.php?bp_member_type=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=17&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(363, '_site_transient_timeout_theme_roots', '1430422949', 'yes'),
(364, '_site_transient_theme_roots', 'a:3:{s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(365, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1430422786;s:7:"checked";a:11:{s:25:"adminimize/adminimize.php";s:5:"1.8.5";s:19:"akismet/akismet.php";s:5:"3.1.1";s:46:"another-wordpress-classifieds-plugin/awpcp.php";s:5:"3.3.4";s:35:"bootstrap-admin/bootstrap-admin.php";s:6:"1.16.2";s:45:"branded-login-screen/branded-login-screen.php";s:3:"3.2";s:24:"buddypress/bp-loader.php";s:7:"2.2.3.1";s:32:"ect-add-to-cart-button/index.php";s:3:"1.0";s:9:"hello.php";s:3:"1.6";s:29:"simple-cart-buy-now/scabn.php";s:5:"2.1.4";s:39:"tamed-admin-theme/tamed-admin-theme.php";s:3:"1.0";s:37:"user-role-editor/user-role-editor.php";s:6:"4.18.3";}s:8:"response";a:1:{s:37:"user-role-editor/user-role-editor.php";O:8:"stdClass":6:{s:2:"id";s:5:"13697";s:4:"slug";s:16:"user-role-editor";s:6:"plugin";s:37:"user-role-editor/user-role-editor.php";s:11:"new_version";s:6:"4.18.4";s:3:"url";s:47:"https://wordpress.org/plugins/user-role-editor/";s:7:"package";s:58:"http://downloads.wordpress.org/plugin/user-role-editor.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:10:{s:25:"adminimize/adminimize.php";O:8:"stdClass":6:{s:2:"id";s:4:"3683";s:4:"slug";s:10:"adminimize";s:6:"plugin";s:25:"adminimize/adminimize.php";s:11:"new_version";s:5:"1.8.5";s:3:"url";s:41:"https://wordpress.org/plugins/adminimize/";s:7:"package";s:58:"http://downloads.wordpress.org/plugin/adminimize.1.8.5.zip";}s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:55:"http://downloads.wordpress.org/plugin/akismet.3.1.1.zip";}s:46:"another-wordpress-classifieds-plugin/awpcp.php";O:8:"stdClass":6:{s:2:"id";s:4:"7207";s:4:"slug";s:36:"another-wordpress-classifieds-plugin";s:6:"plugin";s:46:"another-wordpress-classifieds-plugin/awpcp.php";s:11:"new_version";s:5:"3.3.4";s:3:"url";s:67:"https://wordpress.org/plugins/another-wordpress-classifieds-plugin/";s:7:"package";s:78:"http://downloads.wordpress.org/plugin/another-wordpress-classifieds-plugin.zip";}s:35:"bootstrap-admin/bootstrap-admin.php";O:8:"stdClass":6:{s:2:"id";s:5:"34428";s:4:"slug";s:15:"bootstrap-admin";s:6:"plugin";s:35:"bootstrap-admin/bootstrap-admin.php";s:11:"new_version";s:6:"1.16.2";s:3:"url";s:46:"https://wordpress.org/plugins/bootstrap-admin/";s:7:"package";s:64:"http://downloads.wordpress.org/plugin/bootstrap-admin.1.16.2.zip";}s:45:"branded-login-screen/branded-login-screen.php";O:8:"stdClass":7:{s:2:"id";s:5:"12558";s:4:"slug";s:20:"branded-login-screen";s:6:"plugin";s:45:"branded-login-screen/branded-login-screen.php";s:11:"new_version";s:3:"3.2";s:3:"url";s:51:"https://wordpress.org/plugins/branded-login-screen/";s:7:"package";s:66:"http://downloads.wordpress.org/plugin/branded-login-screen.3.2.zip";s:14:"upgrade_notice";s:96:"updated .css for newer versions of WordPress\nupdated screenshots for WordPress plugin repository";}s:24:"buddypress/bp-loader.php";O:8:"stdClass":7:{s:2:"id";s:4:"7756";s:4:"slug";s:10:"buddypress";s:6:"plugin";s:24:"buddypress/bp-loader.php";s:11:"new_version";s:7:"2.2.3.1";s:3:"url";s:41:"https://wordpress.org/plugins/buddypress/";s:7:"package";s:60:"http://downloads.wordpress.org/plugin/buddypress.2.2.3.1.zip";s:14:"upgrade_notice";s:59:"See: https://codex.buddypress.org/releases/version-2-2-3-1/";}s:32:"ect-add-to-cart-button/index.php";O:8:"stdClass":6:{s:2:"id";s:5:"40410";s:4:"slug";s:22:"ect-add-to-cart-button";s:6:"plugin";s:32:"ect-add-to-cart-button/index.php";s:11:"new_version";s:3:"1.0";s:3:"url";s:53:"https://wordpress.org/plugins/ect-add-to-cart-button/";s:7:"package";s:68:"http://downloads.wordpress.org/plugin/ect-add-to-cart-button.1.1.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:57:"http://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:29:"simple-cart-buy-now/scabn.php";O:8:"stdClass":6:{s:2:"id";s:5:"26955";s:4:"slug";s:19:"simple-cart-buy-now";s:6:"plugin";s:29:"simple-cart-buy-now/scabn.php";s:11:"new_version";s:5:"2.1.4";s:3:"url";s:50:"https://wordpress.org/plugins/simple-cart-buy-now/";s:7:"package";s:61:"http://downloads.wordpress.org/plugin/simple-cart-buy-now.zip";}s:39:"tamed-admin-theme/tamed-admin-theme.php";O:8:"stdClass":6:{s:2:"id";s:5:"59747";s:4:"slug";s:17:"tamed-admin-theme";s:6:"plugin";s:39:"tamed-admin-theme/tamed-admin-theme.php";s:11:"new_version";s:3:"1.0";s:3:"url";s:48:"https://wordpress.org/plugins/tamed-admin-theme/";s:7:"package";s:59:"http://downloads.wordpress.org/plugin/tamed-admin-theme.zip";}}}', 'yes'),
(366, '_site_transient_timeout_browser_d7bfebab08f0e875ec525b36fe2598e7', '1431026010', 'yes'),
(367, '_site_transient_browser_d7bfebab08f0e875ec525b36fe2598e7', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"42.0.2311.90";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(368, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430464421', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(369, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 18:34:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:39:"http://wordpress.org/?v=4.3-alpha-32323";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 4.2.1 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/04/wordpress-4-2-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/04/wordpress-4-2-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 18:34:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3706";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:366:"WordPress 4.2.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by Jouko Pynnönen. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Gary Pendergast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1010:"<p>WordPress 4.2.1 is now available. This is a <strong>critical security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by <a href="http://klikki.fi/">Jouko Pynnönen</a>.</p>\n<p>WordPress 4.2.1 has begun to roll out as an automatic background update, for sites that <a href="https://wordpress.org/plugins/background-update-tester/">support</a> those.</p>\n<p>For more information, see the <a href="https://codex.wordpress.org/Version_4.2.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.2?rev=32311&amp;stop_rev=32300">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.2.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now&#8221;.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/04/wordpress-4-2-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WordPress 4.2 “Powell”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://wordpress.org/news/2015/04/powell/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/04/powell/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Apr 2015 18:35:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3642";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:343:"Version 4.2 of WordPress, named &#8220;Powell&#8221; in honor of jazz pianist Bud Powell, is available for download or update in your WordPress dashboard. New features in 4.2 help you communicate and share, globally. An easier way to share content Clip it, edit it, publish it. Get familiar with the new and improved Press This. From [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:29250:"<p>Version 4.2 of WordPress, named &#8220;Powell&#8221; in honor of jazz pianist <a href="https://en.wikipedia.org/wiki/Bud_Powell">Bud Powell</a>, is available for <a href="https://wordpress.org/download/">download</a> or update in your WordPress dashboard. New features in 4.2 help you communicate and share, globally.</p>\n<div id="v-e9kH4FzP-1" class="video-player"><embed id="v-e9kH4FzP-1-video" src="https://v0.wordpress.com/player.swf?v=1.04&amp;guid=e9kH4FzP&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" title="Introducing WordPress 4.2 &quot;Powell&quot;" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<hr />\n<h2 style="text-align: center">An easier way to share content</h2>\n<p><img class="alignnone size-full wp-image-3677" src="https://wordpress.org/news/files/2015/04/4.2-press-this-2.jpg" alt="Press This" width="1000" height="832" />Clip it, edit it, publish it. Get familiar with the new and improved Press This. From the Tools menu, add Press This to your browser bookmark bar or your mobile device home screen. Once installed you can share your content with lightning speed. Sharing your favorite videos, images, and content has never been this fast or this easy.</p>\n<hr />\n<h2 style="text-align: center">Extended character support</h2>\n<p><img class="alignnone size-full wp-image-3676" src="https://wordpress.org/news/files/2015/04/4.2-characters.png" alt="Character support for emoji, special characters" width="1000" height="832" />Writing in WordPress, whatever your language, just got better. WordPress 4.2 supports a host of new characters out-of-the-box, including native Chinese, Japanese, and Korean characters, musical and mathematical symbols, and hieroglyphs.</p>\n<p>Don’t use any of those characters? You can still have fun — emoji are now available in WordPress! Get creative and decorate your content with <img src="https://s.w.org/images/core/emoji/72x72/1f499.png" alt="💙" class="wp-smiley" style="height: 1em; max-height: 1em;" />, <img src="https://s.w.org/images/core/emoji/72x72/1f438.png" alt="🐸" class="wp-smiley" style="height: 1em; max-height: 1em;" />, <img src="https://s.w.org/images/core/emoji/72x72/1f412.png" alt="🐒" class="wp-smiley" style="height: 1em; max-height: 1em;" />, <img src="https://s.w.org/images/core/emoji/72x72/1f355.png" alt="🍕" class="wp-smiley" style="height: 1em; max-height: 1em;" />, and all the many other <a href="https://codex.wordpress.org/Emoji">emoji</a>.</p>\n<hr />\n<div><img class="alignright size-medium wp-image-3656" src="https://wordpress.org/news/files/2015/04/4.2-theme-switcher-300x230.png" alt="Customizer theme switcher" width="288" height="221" /></p>\n<h3>Switch themes in the Customizer</h3>\n<p>Browse and preview your installed themes from the Customizer. Make sure the theme looks great with your content, before it debuts on your site.</p>\n</div>\n<div style="clear: both"></div>\n<div><img class="alignright size-medium wp-image-3653" src="https://wordpress.org/news/files/2015/04/4.2-embeds-300x230.png" alt="Tumbr.com oEmbed example" width="288" height="221" /></p>\n<h3>Even more embeds</h3>\n<p>Paste links from Tumblr.com and Kickstarter and watch them magically appear right in the editor. With every release, your publishing and editing experience get closer together.</p>\n</div>\n<div style="clear: both"></div>\n<div>\n<p><img class="alignright size-medium wp-image-3654" src="https://wordpress.org/news/files/2015/04/4.2-plugins-300x230.png" alt="Inline plugin updates" width="288" height="221" /></p>\n<h3>Streamlined plugin updates</h3>\n<p>Goodbye boring loading screen, hello smooth and simple plugin updates. Click <em>Update Now</em> and watch the magic happen.</p>\n</div>\n<div style="clear: both"></div>\n<hr />\n<h2 style="text-align: center">Under the Hood</h2>\n<h5>utf8mb4 support</h5>\n<p>Database character encoding has changed from utf8 to utf8mb4, which adds support for a whole range of new 4-byte characters.</p>\n<h5>JavaScript accessibility</h5>\n<p>You can now send audible notifications to screen readers in JavaScript with <code>wp.a11y.speak()</code>. Pass it a string, and an update will be sent to a dedicated ARIA live notifications area.</p>\n<h5>Shared term splitting</h5>\n<p>Terms shared across multiple taxonomies will be split when one of them is updated. Find out more in the <a href="https://developer.wordpress.org/plugins/taxonomy/working-with-split-terms-in-wp-4-2/">Plugin Developer Handbook</a>.</p>\n<h5>Complex query ordering</h5>\n<p><code>WP_Query</code>, <code>WP_Comment_Query</code>, and <code>WP_User_Query</code> now support complex ordering with named meta query clauses.</p>\n<hr />\n<h2 style="text-align: center">The Team</h2>\n<p><a class="alignleft" href="https://profiles.wordpress.org/drewapicture"><img src="https://www.gravatar.com/avatar/95c934fa2c3362794bf62ff8c59ada08?d=mm&amp;s=150&amp;r=G" alt="Drew Jaynes" width="90" height="90" /></a>This release was led by <a href="http://werdswords.com">Drew Jaynes</a>, with the help of these fine individuals. There are 283 contributors with props in this release, a new high. Pull up some Bud Powell on your music service of choice, and check out some of their profiles:</p>\n<a href="https://profiles.wordpress.org/mercime">@mercime</a>, <a href="https://profiles.wordpress.org/a5hleyrich">A5hleyRich</a>, <a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/abhishekfdd">abhishekfdd</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/mrahmadawais">Ahmad Awais</a>, <a href="https://profiles.wordpress.org/alexkingorg">Alex King</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/deconf">Alin Marcu</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/awbauer">Andrew Bauer</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/norcross">Andrew Norcross</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="https://profiles.wordpress.org/aramzs">Aram Zucker-Scharff</a>, <a href="https://profiles.wordpress.org/arminbraun">ArminBraun</a>, <a href="https://profiles.wordpress.org/ashfame">Ashfame</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/avryl">avryl</a>, <a href="https://profiles.wordpress.org/barrykooij">Barry Kooij</a>, <a href="https://profiles.wordpress.org/beaulebens">Beau Lebens</a>, <a href="https://profiles.wordpress.org/bendoh">Ben Doherty (Oomph, Inc)</a>, <a href="https://profiles.wordpress.org/bananastalktome">Billy Schneider</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/krogsgard">Brian Krogsgard</a>, <a href="https://profiles.wordpress.org/bswatson">Brian Watson</a>, <a href="https://profiles.wordpress.org/calevans">CalEvans</a>, <a href="https://profiles.wordpress.org/carolinegeven">carolinegeven</a>, <a href="https://profiles.wordpress.org/caseypatrickdriscoll">Casey Driscoll</a>, <a href="https://profiles.wordpress.org/caspie">Caspie</a>, <a href="https://profiles.wordpress.org/cdog">Catalin Dogaru</a>, <a href="https://profiles.wordpress.org/chipbennett">Chip Bennett</a>, <a href="https://profiles.wordpress.org/chipx86">chipx86</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/cbaldelomar">Chris Baldelomar</a>, <a href="https://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="https://profiles.wordpress.org/cfoellmann">Christian Foellmann</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/clifgriffin">Clifton Griffin</a>, <a href="https://profiles.wordpress.org/codix">Code Master</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/couturefreak">Courtney Ivey</a>, <a href="https://profiles.wordpress.org/craig-ralston">Craig Ralston</a>, <a href="https://profiles.wordpress.org/cweiske">cweiske</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/timersys">Damian</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/dkotter">Darin Kotter</a>, <a href="https://profiles.wordpress.org/nerrad">Darren Ethier (nerrad)</a>, <a href="https://profiles.wordpress.org/dllh">Daryl L. L. Houston (dllh)</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/davidanderson">David Anderson</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/folletto">Davide ''Folletto'' Casali</a>, <a href="https://profiles.wordpress.org/davideugenepratt">davideugenepratt</a>, <a href="https://profiles.wordpress.org/davidhamiltron">davidhamiltron</a>, <a href="https://profiles.wordpress.org/denis-de-bernardy">Denis de Bernardy</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, <a href="https://profiles.wordpress.org/dsmart">Derek Smart</a>, <a href="https://profiles.wordpress.org/designsimply">designsimply</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dipeshkakadiya">dipesh.kakadiya</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/doublesharp">doublesharp</a>, <a href="https://profiles.wordpress.org/dzerycz">DzeryCZ</a>, <a href="https://profiles.wordpress.org/kucrut">Dzikri Aziz</a>, <a href="https://profiles.wordpress.org/emazovetskiy">e.mazovetskiy</a>, <a href="https://profiles.wordpress.org/oso96_2000">Eduardo Reveles</a>, <a href="https://profiles.wordpress.org/cais">Edward Caissie</a>, <a href="https://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/elliottcarlson">elliottcarlson</a>, <a href="https://profiles.wordpress.org/enej">enej</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ethitter">Erick Hitter</a>, <a href="https://profiles.wordpress.org/evansolomon">Evan Solomon</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/fhwebcs">fhwebcs</a>, <a href="https://profiles.wordpress.org/floriansimeth">Florian Simeth</a>, <a href="https://profiles.wordpress.org/bueltge">Frank Bueltge</a>, <a href="https://profiles.wordpress.org/frankpw">Frank P. Walentynowicz</a>, <a href="https://profiles.wordpress.org/f-j-kaiser">Franz Josef Kaiser</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/geertdd">Geert De Deckere</a>, <a href="https://profiles.wordpress.org/genkisan">genkisan</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/grahamarmfield">Graham Armfield</a>, <a href="https://profiles.wordpress.org/webord">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/hakre">hakre</a>, <a href="https://profiles.wordpress.org/harishchaudhari">Harish Chaudhari</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/herbmillerjr">herbmillerjr</a>, <a href="https://profiles.wordpress.org/hew">Hew</a>, <a href="https://profiles.wordpress.org/horike">horike</a>, <a href="https://profiles.wordpress.org/hlashbrooke">Hugh Lashbrooke</a>, <a href="https://profiles.wordpress.org/hugobaeta">Hugo Baeta</a>, <a href="https://profiles.wordpress.org/iandunn">Ian Dunn</a>, <a href="https://profiles.wordpress.org/ianmjones">ianmjones</a>, <a href="https://profiles.wordpress.org/idealien">idealien</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="https://profiles.wordpress.org/jamescollins">James Collins</a>, <a href="https://profiles.wordpress.org/janhenckens">janhenckens</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/cheffheid">Jeffrey de Wit</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jipmoors">jipmoors</a>, <a href="https://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/yo-l1982">Joel Bernerman</a>, <a href="https://profiles.wordpress.org/joen">Joen Asmussen</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johneckman">John Eckman</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/jlevandowski">John Levandowski</a>, <a href="https://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="https://profiles.wordpress.org/joostdekeijzer">joost de keijzer</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/jcastaneda">Jose Castaneda</a>, <a href="https://profiles.wordpress.org/joshlevinson">Josh Levinson</a>, <a href="https://profiles.wordpress.org/jphase">jphase</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/kopepasah">Justin Kopepasah</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/justincwatt">Justin Watt</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevdotbadger">Kevin Ruscoe</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/mindrun">Leonard</a>, <a href="https://profiles.wordpress.org/leopeo">Leonardo Giacone</a>, <a href="https://profiles.wordpress.org/lgladdy">Liam Gladdy</a>, <a href="https://profiles.wordpress.org/maimairel">maimairel</a>, <a href="https://profiles.wordpress.org/mako09">Mako</a>, <a href="https://profiles.wordpress.org/funkatronic">Manny Fleurmond</a>, <a href="https://profiles.wordpress.org/marcelomazza">marcelomazza</a>, <a href="https://profiles.wordpress.org/marcochiesi">Marco Chiesi</a>, <a href="https://profiles.wordpress.org/mkaz">Marcus Kazmierczak</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/senff">Mark Senff</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/mgibbs189">Matt Gibbs</a>, <a href="https://profiles.wordpress.org/sivel">Matt Martz</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mzak">Matt Zak</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mattheweppelsheimer">Matthew Eppelsheimer</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/maxcutler">Max Cutler</a>, <a href="https://profiles.wordpress.org/mehulkaklotar">mehulkaklotar</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/meloniq">meloniq</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/tw2113">Michael Beckwith</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/mdgl">Mike Glendinning</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/thaicloud">Mike Jordan</a>, <a href="https://profiles.wordpress.org/mikeschinkel">Mike Schinkel</a>, <a href="https://profiles.wordpress.org/mikengarrett">MikeNGarrett</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="https://profiles.wordpress.org/mmn-o">mmn-o</a>, <a href="https://profiles.wordpress.org/batmoo">Mohammad Jangda</a>, <a href="https://profiles.wordpress.org/momdad">MomDad</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/morpheu5">Morpheu5</a>, <a href="https://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="https://profiles.wordpress.org/nathan_dawson">nathan_dawson</a>, <a href="https://profiles.wordpress.org/neil_pie">Neil Pie</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nicnicnicdevos">nicnicnicdevos</a>, <a href="https://profiles.wordpress.org/nikv">Nikhil Vimal</a>, <a href="https://profiles.wordpress.org/ninnypants">ninnypants</a>, <a href="https://profiles.wordpress.org/nitkr">nitkr</a>, <a href="https://profiles.wordpress.org/nunomorgadinho">Nuno Morgadinho</a>, <a href="https://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="https://profiles.wordpress.org/pareshradadiya-1">Paresh Radadiya</a>, <a href="https://profiles.wordpress.org/pathawks">Pat Hawks</a>, <a href="https://profiles.wordpress.org/pbearne">Paul Bearne</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/sirbrillig">Payton Swick</a>, <a href="https://profiles.wordpress.org/petemall">Pete Mall</a>, <a href="https://profiles.wordpress.org/gungeekatx">Pete Nelson</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/podpirate">podpirate</a>, <a href="https://profiles.wordpress.org/postpostmodern">postpostmodern</a>, <a href="https://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="https://profiles.wordpress.org/prasoon2211">prasoon2211</a>, <a href="https://profiles.wordpress.org/cyman">Primoz Cigler</a>, <a href="https://profiles.wordpress.org/r-a-y">r-a-y</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rahulbhangale">rahulbhangale</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/lamosty">Rastislav Lamos</a>, <a href="https://profiles.wordpress.org/ravindra-pal-singh">Ravindra Pal Singh</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/ritteshpatel">Ritesh Patel</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/magicroundabout">Ross Wintle</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/rmarks">Ryan Marks</a>, <a href="https://profiles.wordpress.org/sagarjadhav">sagarjadhav</a>, <a href="https://profiles.wordpress.org/solarissmoke">Samir Shah</a>, <a href="https://profiles.wordpress.org/samo9789">samo9789</a>, <a href="https://profiles.wordpress.org/samuelsidler">samuelsidler</a>, <a href="https://profiles.wordpress.org/sgrant">Scott Grant</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/scottgonzalez">scott.gonzalez</a>, <a href="https://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/sergejmueller">Sergej Muller</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/sevenspark">sevenspark</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="https://profiles.wordpress.org/sippis">sippis</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/sillybean">Stephanie Leary</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/stevehickeydesign">stevehickeydesign</a>, <a href="https://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/hissy">Takuro Hishikawa</a>, <a href="https://profiles.wordpress.org/themiked">theMikeD</a>, <a href="https://profiles.wordpress.org/thomaswm">thomaswm</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/tillkruess">Till</a>, <a href="https://profiles.wordpress.org/timothyblynjacobs">Timothy Jacobs</a>, <a href="https://profiles.wordpress.org/tiqbiz">tiqbiz</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tmeister">tmeister</a>, <a href="https://profiles.wordpress.org/tschutter">Tobias Schutter</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tomdxw">tomdxw</a>, <a href="https://profiles.wordpress.org/travisnorthcutt">Travis Northcutt</a>, <a href="https://profiles.wordpress.org/trishasalas">trishasalas</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/uamv">UaMV</a>, <a href="https://profiles.wordpress.org/desaiuditd">Udit Desai</a>, <a href="https://profiles.wordpress.org/sorich87">Ulrich Sossou</a>, <a href="https://profiles.wordpress.org/veritaserum">Veritaserum</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/volodymyrc">VolodymyrC</a>, <a href="https://profiles.wordpress.org/vortfu">vortfu</a>, <a href="https://profiles.wordpress.org/welcher">welcher</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/earnjam">William Earnhardt</a>, and <a href="https://profiles.wordpress.org/wordpressorru">WordPressor</a>.\n<p style="margin-top: 22px">Special thanks go to <a href="http://siobhanmckeown.com/">Siobhan McKeown</a> for producing the release video and <a href="http://camikaos.com/">Cami Kaos</a> for the voice-over.</p>\n<p>Finally, thanks to all of the contributors who provided subtitles for the release video, which at last count had been translated into 30 languages!</p>\n<p><a href="https://profiles.wordpress.org/adrianpop">Adrian Pop</a>, <a href="https://profiles.wordpress.org/deconf">Alin Marcu</a>, <a href="https://profiles.wordpress.org/bagerathan">Bagerathan Sivarajah</a>, <a href="https://profiles.wordpress.org/besnik">Besnik</a>, <a href="https://profiles.wordpress.org/bjornjohansen">Bjørn Johansen</a>, Chantal Coolsma, <a href="https://profiles.wordpress.org/cubells">cubells</a>, Daisuke Takahashi, <a href="https://profiles.wordpress.org/dianakc">Diana K. Cury</a>, <a href="https://profiles.wordpress.org/djzone">DjZoNe</a>, <a href="https://profiles.wordpress.org/dyrer">dyrer</a>, <a href="https://profiles.wordpress.org/semblance">Elzette Roelofse</a>, <a href="https://profiles.wordpress.org/wordpress-tr">Emre Erkan</a>, <a href="https://profiles.wordpress.org/fxbenard">fxbenard</a>, <a href="https://profiles.wordpress.org/tacoverdo">TacoVerdo</a>, <a href="https://profiles.wordpress.org/gabriel-reguly">Gabriel Reguly</a>, <a href="https://profiles.wordpress.org/miss_jwo">Jenny Wong</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/hgmb">Håvard Grimelid</a>, <a href="https://profiles.wordpress.org/intoxstudio">Joachim Jensen</a>, <a href="https://profiles.wordpress.org/jimmyxu">Jimmy Xu</a>, <a href="https://profiles.wordpress.org/nukaga">Junko Nukaga</a>, <a href="https://profiles.wordpress.org/pokeraitis">Justina</a>, <a href="https://profiles.wordpress.org/kenan3008/">Kenan Dervisevic</a>, <a href="https://profiles.wordpress.org/kosvrouvas">Kostas Vrouvas</a>, <a href="https://profiles.wordpress.org/eclare">Krzysztof Trynkiewicz</a>, <a href="https://profiles.wordpress.org/goblindegook">Luís Rodrigues</a>, <a href="https://profiles.wordpress.org/luisrull">Luis Rull</a>, <a href="https://profiles.wordpress.org/culturemark">Mark Thomas Gazel </a>, <a href="https://profiles.wordpress.org/clorith">Marius Jensen</a>, <a href="https://profiles.wordpress.org/matthee">matthee</a>, <a href="https://profiles.wordpress.org/damst">Mattias Tengblad</a>, Matúš Záhradník, Mayuko Moriyama, <a href="https://profiles.wordpress.org/michalvittek">Michal Vittek</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinić</a>, <a href="https://profiles.wordpress.org/mrshemek">MrShemek</a>, <a href="https://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/peterhoob">Peter Holme Obrestad</a>, <a href="https://profiles.wordpress.org/petya">Petya Raykovska</a>, Przemysław Mirota, <a href="https://profiles.wordpress.org/qraczek">qraczek</a>, <a href="https://profiles.wordpress.org/bi0xid">Rafa Poveda</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/rasheed">Rasheed Bydousi</a>, <a href="https://profiles.wordpress.org/gwgan">Rhoslyn Prys</a>, <a href="https://profiles.wordpress.org/robee">Robert Axelsen</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/siobhyb">Siobhan Bamber</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/tohave">ک To Have داشتن</a>, <a href="https://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="https://profiles.wordpress.org/egalego">Victor J. Quesada</a>, <a href="https://profiles.wordpress.org/wolly">Wolly</a>, <a href="https://profiles.wordpress.org/xavivars">Xavi Ivars</a>, <a href="https://profiles.wordpress.org/xibe">Xavier Borderie</a></p>\n<p>If you want to follow along or help out, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.3!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:47:"https://wordpress.org/news/2015/04/powell/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 4.1.2 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/04/wordpress-4-1-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/04/wordpress-4-1-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 21 Apr 2015 13:44:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3628";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:383:"WordPress 4.1.2 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. WordPress versions 4.1.1 and earlier are affected by a critical cross-site scripting vulnerability, which could enable anonymous users to compromise a site. This was reported by Cedric Van Bockhaven and fixed by [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Gary Pendergast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3913:"<p>WordPress 4.1.2 is now available. This is a <strong>critical security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>WordPress versions 4.1.1 and earlier are affected by a critical cross-site scripting vulnerability, which could enable anonymous users to compromise a site. This was reported by <a href="https://cedricvb.be">Cedric Van Bockhaven</a> and fixed by <a href="http://pento.net/">Gary Pendergast</a>, <a href="http://blogwaffe.com/">Mike Adams</a>, and <a href="http://nacin.com/">Andrew Nacin</a> of the WordPress security team.</p>\n<p>We also fixed three other security issues:</p>\n<ul>\n<li>In WordPress 4.1 and higher, files with invalid or unsafe names could be uploaded. Discovered by <a href="http://HSASec.de">Michael Kapfer and Sebastian Kraemer of HSASec</a>.</li>\n<li>In WordPress 3.9 and higher, a very limited cross-site scripting vulnerability could be used as part of a social engineering attack. Discovered by <a href="http://zoczus.blogspot.com/">Jakub Zoczek</a>.</li>\n<li>Some plugins were vulnerable to an SQL injection vulnerability. Discovered by Ben Bidner of the WordPress security team.</li>\n</ul>\n<p>We also made four hardening changes, discovered by <a href="http://codesymphony.co/">J.D. Grimes</a>, Divyesh Prajapati, <a href="http://www.allancollins.net/">Allan Collins</a>, <a href="https://sucuri.net/">Marc-Alexandre Montpas</a> and <a href="https://profiles.wordpress.org/jblz">Jeff Bowen</a>.</p>\n<p>We appreciated the <a href="https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/">responsible disclosure</a> of these issues directly to our security team. For more information, see the <a href="https://codex.wordpress.org/Version_4.1.2">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.1?rev=32234&amp;stop_rev=32144">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.1.2</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now.&#8221; Sites that support automatic background updates are already beginning to update to WordPress 4.1.2.</p>\n<p>Thanks to everyone who contributed to 4.1.2: <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/xknown">Alex Concha</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/vortfu">Ben Bidner</a>, <a href="https://profiles.wordpress.org/boonbgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/DrewAPicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, and <a href="https://profiles.wordpress.org/mdawaffe">Mike Adams</a>.</p>\n<p>A number of plugins also released security fixes yesterday. Keep everything updated to stay secure. If you’re a plugin author, please read <a href="https://make.wordpress.org/plugins/2015/04/20/fixing-add_query_arg-and-remove_query_arg-usage/">this post</a> to confirm that your plugin is not affected by the same issue. Thank you to all of the plugin authors who worked closely with our security team to ensure a coordinated response.</p>\n<p><em>Already testing WordPress 4.2? The third release candidate is now available (<a href="https://wordpress.org/wordpress-4.2-RC3.zip">zip</a>) and it contains these fixes. For more on 4.2, see <a href="https://wordpress.org/news/2015/04/wordpress-4-2-release-candidate/">the RC 1 announcement post</a>.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/04/wordpress-4-1-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.2 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2015/04/wordpress-4-2-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2015/04/wordpress-4-2-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 15 Apr 2015 19:07:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3609";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:334:"The release candidate for WordPress 4.2 is now available. We&#8217;ve made more than 140 changes since releasing Beta 4 a week and a half ago. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.2 on Wednesday, [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2328:"<p>The release candidate for WordPress 4.2 is now available.</p>\n<p>We&#8217;ve made more than <a href="https://core.trac.wordpress.org/log?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=32136&amp;stop_rev=31996&amp;limit=100">140 changes</a> since releasing Beta 4 a week and a half ago. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.2 on <strong>Wednesday, April 22</strong>, but we need your help to get there.</p>\n<p>If you haven’t tested 4.2 yet, now is the time! (Please though, not on your live site unless you’re adventurous.)</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.2 RC1, you can use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin or you can <a href="https://wordpress.org/wordpress-4.2-RC1.zip">download the release candidate here</a> (zip). </p>\n<p>For more information about what’s new in version 4.2, check out the <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/">Beta 1</a>, <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-2/">Beta 2</a>, <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-3/">Beta 3</a>, and <a href="https://wordpress.org/news/2015/04/wordpress-4-2-beta-4/">Beta 4</a> blog posts.</p>\n<p><strong>Developers</strong>, please test your plugins and themes against WordPress 4.2 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.2 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>\n<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/4-2-dev-notes/">notes for developers</a> for 4.2.</p>\n<p><em>Im-Press-ive saving</em><br />\n<em>Achievement unlocked: RC</em><br />\n<em>Release here we come</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2015/04/wordpress-4-2-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Improvements to WordPress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/04/improvements-to-wordpress-org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:74:"https://wordpress.org/news/2015/04/improvements-to-wordpress-org/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 04 Apr 2015 20:19:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:4:"Meta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3494";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:335:"If you visit WordPress.org regularly you might have noticed some changes around the place. If you don’t, now’s the time to check them out! We’ve been working hard to improve the site to make it more useful to everyone, both developers and users, and we hope you like what we’ve done. New Theme and Plugin Directories [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"samuelsidler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:5551:"<p>If you visit WordPress.org regularly you might have noticed some changes around the place. If you don’t, now’s the time to check them out! We’ve been working hard to improve the site to make it more useful to everyone, both developers and users, and we hope you like what we’ve done.</p>\n<h2>New Theme and Plugin Directories</h2>\n<p>Since WordPress 3.8, you’ve been enjoying improved theme management in your WordPress admin, and in WordPress 4.0 plugin management was refined. We’ve brought these experiences from your admin and re-created them right here on WordPress.org.</p>\n<h3>Theme Directory</h3>\n<p>The <a href="https://wordpress.org/themes/">Theme Directory</a> has a better browsing experience, with handy tabs where you can view featured, popular, and the latest themes. As with the theme experience in your admin, you can use the feature filter to browse for just the right theme for your WordPress website.</p>\n<p><img class="alignnone size-large wp-image-3572" src="https://wordpress.org/news/files/2015/04/theme-directory-1024x768.png" alt="theme-directory" width="692" height="519" /></p>\n<p>Click on a theme to get more information about it, including shiny screenshots, ratings, and statistics.</p>\n<p><img class="alignnone size-large wp-image-3573" src="https://wordpress.org/news/files/2015/04/theme-directory-individual-1024x768.png" alt="theme-directory-individual" width="692" height="519" /></p>\n<p>Konstantin Obenland <a href="https://make.wordpress.org/meta/2015/03/10/new-theme-directory/">posted a good overview</a> of everything involved with the theme directory overhaul and followed up with <a href="https://make.wordpress.org/meta/2015/03/31/theme-directory-stats/">a post on improved statistics</a>.</p>\n<h3>Plugin Directory</h3>\n<p>The <a href="https://wordpress.org/plugins/">Plugin Directory</a> has a brand new theme that mirrors the experience in your WordPress admin, with a more visual experience, and better search and statistics.</p>\n<p><img class="alignnone size-large wp-image-3594" src="https://wordpress.org/news/files/2015/04/plugin-directory-1024x768.png" alt="plugin-directory" width="692" height="519" /></p>\n<p>As well as a facelift, there are some great new features for you to play around with:</p>\n<ul>\n<li>Favorites – when you’re logged in to you WordPress.org account, this page gives you direct access to the plugins that you have favorited.</li>\n<li>Beta Testing – try out plugins where developers are experimenting with new features for WordPress.</li>\n<li>Search by plugin author – you can search for a plugin author using their username.</li>\n<li>Better statistics – listings now display the number of active installs so you can see how many people are actually using a plugin.</li>\n</ul>\n<p>An <a href="https://make.wordpress.org/meta/2015/03/04/new-plugin-directory-theme/">overview of the new theme</a> was posted by Scott Reilly.</p>\n<h2>Better Statistics</h2>\n<p>We’ve made huge improvements to <a href="https://wordpress.org/about/stats/">our statistics</a>. This gives us more useful information about the WordPress versions people are using, their PHP version, and their MySQL version.</p>\n<p>Already these new statistics have provided us with useful insights into WordPress usage.</p>\n<ul>\n<li>More than 43% of all sites are running the latest version of WordPress. Previously, we thought only 10% of sites were up-to-date. By excluding sites that are no longer online we were able to improve these statistics.</li>\n<li>We were able to clear up the data around WordPress 3.0, bringing it more in line with expectations. This anomaly was a by-product of spammers.</li>\n<li>Only 15.9% of sites are using PHP 5.2, which is better than we thought.</li>\n</ul>\n<p>Over the coming months we’ll be able to use these statistics to bring you new tools and improvements, and to make more informed decisions across the board. Read <a href="https://make.wordpress.org/meta/2015/03/01/major-update-to-our-version-stats-for-php-mysql-and-wordpress/">Andrew Nacin&#8217;s post about these changes</a> for more background.</p>\n<h2>Thanks!</h2>\n<p>Thanks to everyone who contributed to the theme directory redesign, the plugin directory refresh, and improved statistics: <a href="https://profiles.wordpress.org/deconf">Alin Marcu</a>, <a href="https://profiles.wordpress.org/colorful-tones/">Damon Cook</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/mj12982">Jan Cavan Boulas</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/BrashRebel">Kyle Maurer</a>, <a href="https://profiles.wordpress.org/matveb">Matías Ventura</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/nataliemac">Natalie MacLees</a>, <a href="https://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="https://profiles.wordpress.org/samuelsidler">Samuel Sidler</a>, <a href="https://profiles.wordpress.org/Otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/siobhan">Siobhan McKeown</a>.</p>\n<p>If you want to help out or follow along with future WordPress.org projects, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/meta/">meta development blog</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:70:"https://wordpress.org/news/2015/04/improvements-to-wordpress-org/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.2 Beta 4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/04/wordpress-4-2-beta-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/04/wordpress-4-2-beta-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 03 Apr 2015 13:05:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3566";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"WordPress 4.2 Beta 4 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2694:"<p>WordPress 4.2 Beta 4 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.2-beta4.zip">download the beta here</a> (zip).</p>\n<p>For more information about what’s new in version 4.2, check out the <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/">Beta 1</a>, <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-2/">Beta 2</a>, and <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-3/">Beta 3</a> blog posts. Some of the changes in Beta 4 include:</p>\n<ul>\n<li>Incrementally improved the experience when <strong>accessing the Customizer on mobile</strong>. Please test on your mobile devices and let us know if anything seems wonky.</li>\n<li>Added the ability to make <strong>admin notices dismissible</strong>. Plugin and theme authors: adding <code>.notice</code> and <code>.is-dismissible</code> as adjacent classes to your notice containers should automatically make them dismissible. Please test.</li>\n<li>Fixed some reported issues with <strong>backward-compatibility issues</strong> caused by the modularization of core JS files.</li>\n<li>Removed the <strong>ability to swipe the admin menu open and closed</strong> on touch devices due to reports of some issues with built-in history navigation on certain platforms.</li>\n<li>Improved <strong>accessibility of the WordPress admin</strong> by adding landmark roles. Screen reader users: please test in any core admin screens.</li>\n<li><strong>Various bug fixes</strong>. We&#8217;ve made <a href="https://core.trac.wordpress.org/log?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=31996&amp;stop_rev=31902&amp;limit=100">more than 90 changes</a> in the last week.</li>\n</ul>\n<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.2">everything we’ve fixed</a>.</p>\n<p><em>Dismiss notices</em><br />\n<em>Customizer on mobile</em><br />\n<em>RC nearly here</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2015/04/wordpress-4-2-beta-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.2 Beta 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Mar 2015 18:32:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3522";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"WordPress 4.2 Beta 3 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2986:"<p>WordPress 4.2 Beta 3 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.2-beta3.zip">download the beta here</a> (zip).</p>\n<p>For more information about what’s new in version 4.2, check out the <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/">Beta 1</a> and <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-2/">Beta 2</a> blog posts. Some of the changes in Beta 3 include:</p>\n<ul>\n<li>Removed <strong>Shiny Installs</strong> functionality due to concerns about the activation workflow. Please test the remaining &#8220;Shiny Updates&#8221; functionality from both the Plugins &gt; Add New and Plugins screens to ensure in-line updating still works as well as before.</li>\n<li>Fixed an issue with the <strong>Comments Quick Edit</strong> layout breaking on smaller screens. Please test on your mobile devices.</li>\n<li>Improved <strong>accessibility of login screen errors</strong>. Screen reader users: please let us know if you encounter any issues.</li>\n<li>Refined the <strong>emoji compatibility</strong> script to only load on the front- and back-end if the browser requires it. If you&#8217;re using a legacy web browser, please test.</li>\n<li>Fixed several issues in <strong>Press This</strong> with inserted images being improperly linked to locations other than the source site. Go ahead, &#8220;press&#8221; a site with images on the page and tell us if the image links aren&#8217;t working as you&#8217;d expect.</li>\n<li>Standardized the <strong>time display format</strong> in a variety of admin screens, switching to 24-hour notation where a.m. or p.m. are not specified. Please let us know if you notice you notice anything amiss!</li>\n<li><strong>Various other bug fixes</strong>. We&#8217;ve made <a href="https://core.trac.wordpress.org/log?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=31901&amp;stop_rev=31835&amp;limit=100">more than 65 changes</a> in the last week.</li>\n</ul>\n<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.2">everything we’ve fixed</a>.</p>\n<p><em>Emoji loader</em><br />\n<em>&#8220;Shiny Updates&#8221; still stand firm</em><br />\n<em>Beta 3, please test!</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.2 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Mar 2015 19:30:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3498";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"WordPress 4.2 Beta 2 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2326:"<p>WordPress 4.2 Beta 2 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.2-beta2.zip">download the beta here</a> (zip).</p>\n<p>For more information about what’s new in version 4.2, <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/">check out the Beta 1 blog post</a>. Some of the changes in Beta 2 include:</p>\n<ul>\n<li>Added support for entering FTP and SSH credentials when <strong>updating plugins in-place</strong>. FTP and SSH users, please test!</li>\n<li><strong>Improved cross-browser support for emoji</strong> throughout WordPress. If you&#8217;re using an older web browser, please tell us if you have problems using emoji.</li>\n<li>Further <strong>refined Press This authoring</strong> with auto-embedded media and better content scanning. We&#8217;d love to know how auto-embeds work for you.</li>\n<li>Added a constructor and improved method consistency in <code>WP_Comment_Query</code>. Developers: if you&#8217;re extending <code>WP_Comment_Query</code>, please let us know if you run into any issues.</li>\n<li><strong>Various bug fixes</strong>. We&#8217;ve made <a href="https://core.trac.wordpress.org/log?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=31834&amp;stop_rev=31763&amp;limit=100">more than 70 changes</a> in the last week.</li>\n</ul>\n<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.2">everything we’ve fixed</a>.</p>\n<p><em>Test some emoji</em><br />\n<em>FTP and SSH</em><br />\n<em>Let&#8217;s &#8220;Press&#8221; some embeds!</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.2 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 23:22:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3446";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.2 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4275:"<p>WordPress 4.2 Beta 1 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.2-beta1.zip">download the beta here</a> (zip).</p>\n<p>4.2 is due out next month, but to get there, we need your help testing what we&#8217;ve been working on:</p>\n<ul>\n<li><strong>Press This</strong> has been completely revamped to make sharing content from around the web easier than ever. The new workflow is mobile friendly, and we&#8217;d love for you to try it out on all of your devices. Navigate to the Tools screen in your WordPress backend to get started (<a href="https://core.trac.wordpress.org/ticket/31373">#31373</a>). </li>\n<li><strong>Browsing and switching installed themes</strong> has been added to the Customizer to make switching faster and more convenient. We&#8217;re especially interested to know if this helps streamline the process of setting up your site (<a href="https://core.trac.wordpress.org/ticket/31303">#31303</a>).</li>\n<li>The workflow for <strong>updating and installing plugins</strong> just got more intuitive with the ability to install or update in-place from the Plugins screens. Try it out and let us know what you think! (<a href="https://core.trac.wordpress.org/ticket/29820">#29820</a>)</li>\n<li>If you felt like <strong>emoji</strong> were starkly missing from your content toolbox, worry no more. We&#8217;ve added emoji support nearly everywhere, even post slugs <img src="https://s.w.org/images/core/emoji/72x72/1f44d.png" alt="👍" class="wp-smiley" style="height: 1em; max-height: 1em;" /> (<a href="https://core.trac.wordpress.org/ticket/31242">#31242</a>).</li>\n</ul>\n<p><strong>Developers</strong>: There have been a lot of changes for you to test as well, including:</p>\n<ul>\n<li><strong>Taxonomy Roadmap:</strong> Terms shared across multiple taxonomies will <a href="https://make.wordpress.org/core/2015/02/16/taxonomy-term-splitting-in-4-2-a-developer-guide/">now be split</a> into separate terms when one of them is updated. Please let us know if you hit any snags (<a href="https://core.trac.wordpress.org/ticket/5809/">#5809</a>).</li>\n<li>New <code>wp.a11y.speak()</code> functionality helps your JavaScript talk to screen readers to better inform impaired users what&#8217;s happening on-screen. Try it out in your plugin or theme and let us know if you notice any adverse affects (<a href="https://core.trac.wordpress.org/ticket/31368/">#31368</a>).</li>\n<li>Named clause support has been added to <code>WP_Query</code>, <code>WP_Comment_Query</code>, and <code>WP_User_Query</code>, allowing specific <code>meta_query</code> clauses to be used with <code>orderby</code>. If you have any complex queries, please test them (<a href="https://core.trac.wordpress.org/ticket/31045/">#31045</a>, <a href="https://core.trac.wordpress.org/ticket/31265/">#31265</a>).</li>\n</ul>\n<p>If you want a more in-depth view of what changes have made it into 4.2, <a href="https://make.wordpress.org/core/tag/week-in-core/">check out the weekly review posts</a> on the main development blog.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.2">everything we’ve fixed</a> so far.</p>\n<p>Happy testing!</p>\n<p><em>Press This: switch a theme</em><br />\n<em>Save time installing plugins</em><br />\n<em>Testing makes us</em> <img src="https://s.w.org/images/core/emoji/72x72/1f603.png" alt="😃" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 4.1.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/02/wordpress-4-1-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/02/wordpress-4-1-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 23:40:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3436";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1. Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months. For a full [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3086:"<p>WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1.</p>\n<p>Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months.</p>\n<p class="p1"><span class="s1">For a full list of changes, consult the <a href="https://core.trac.wordpress.org/query?milestone=4.1.1&amp;group=severity&amp;order=component">list of tickets</a> and the <a href="https://core.trac.wordpress.org/log/branches/4.1?stop_rev=30974&amp;rev=31474">changelog</a>. We fixed one annoying issue where a tag and a category with the same name could get muddled and prevent each other from being updated.</span></p>\n<p>If you are one of the millions already running WordPress 4.1 and your site, we’ve started rolling out automatic background updates for 4.1.1 for sites <a href="https://wordpress.org/plugins/background-update-tester/">that support them</a>. Otherwise, <a href="https://wordpress.org/download/">download WordPress 4.1.1</a> or visit <strong>Dashboard → Updates</strong> and simply click “Update Now.”</p>\n<p>Thanks to everyone who contributed to 4.1.1: <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/hissy">Takuro Hishikawa</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/iseulde">Iseulde</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/sippis">sippis</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, and <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>.</p>\n<p>It is with both great honor and sadness we also recognize Kim Parsell as a contributor to this release and a <a href="https://make.wordpress.org/docs/2015/01/05/rip-kim-parsell/">truly beloved member of the community</a> until her untimely passing in December. The project is working to establish a conference travel <a href="https://make.wordpress.org/community/2015/01/15/remembering-kim-parsell/">scholarship</a> in her memory. We miss you, Kim.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/02/wordpress-4-1-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:32:"https://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Thu, 30 Apr 2015 19:13:40 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:10:"x-pingback";s:37:"https://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Mon, 27 Apr 2015 18:34:51 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20130910230210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(370, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430464421', 'no'),
(371, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430421221', 'no'),
(373, 'auto_updater.lock', '1430421530', 'no'),
(374, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1430465368', 'no'),
(375, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/04/wordpress-4-2-1/''>WordPress 4.2.1 Security Release</a> <span class="rss-date">April 27, 2015</span><div class="rssSummary">WordPress 4.2.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by Jouko Pynnönen. [&hellip;]</div></li></ul></div><div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Operation timed out after 9579 milliseconds with 36587 out of 205833 bytes received</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(376, 'scabn_options', 'a:14:{s:8:"cart_url";s:50:"http://localhost/gamersseal/shopping-cart/checkout";s:8:"currency";s:3:"AUD";s:8:"template";s:7:"default";s:12:"paypal_email";s:0:"";s:17:"paypal_cancel_url";s:0:"";s:16:"paypal_pdt_token";s:0:"";s:15:"openssl_command";s:0:"";s:19:"paypal_my_cert_file";s:0:"";s:15:"paypal_key_file";s:0:"";s:23:"paypal_paypal_cert_file";s:0:"";s:14:"paypal_cert_id";s:0:"";s:13:"gc_merchantid";s:0:"";s:14:"gc_merchantkey";s:0:"";s:12:"analytics_id";s:0:"";}', 'yes'),
(377, '_transient_timeout_settings_errors', '1430422419', 'no'),
(378, '_transient_settings_errors', 'a:1:{i:0;a:4:{s:7:"setting";s:7:"general";s:4:"code";s:16:"settings_updated";s:7:"message";s:15:"Settings saved.";s:4:"type";s:7:"updated";}}', 'no'),
(379, '_transient_twentyfifteen_categories', '1', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=33 ;

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
(20, 20, '_menu_item_url', ''),
(24, 2, '_edit_lock', '1430322496:1'),
(25, 2, '_edit_last', '1'),
(26, 1, '_edit_lock', '1430422784:1'),
(27, 1, '_edit_last', '1'),
(30, 25, '_edit_lock', '1430422448:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-04-27 15:54:38', '2015-04-27 15:54:38', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!\r\n\r\n[view_add_to_cart id=2]\r\n\r\n[scabn name="dd" price="525" b_title="Add To Cart"]', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-04-30 19:34:57', '2015-04-30 19:34:57', '', 0, 'http://localhost/gamingmobileapp/?p=1', 0, 'post', '', 1),
(2, 1, '2015-04-27 15:54:38', '2015-04-27 15:54:38', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin'' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href="http://localhost/gamingmobileapp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!\r\n\r\n&nbsp;', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-04-29 15:50:35', '2015-04-29 15:50:35', '', 0, 'http://localhost/gamingmobileapp/?page_id=2', 0, 'page', '', 0),
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
(20, 1, '2015-04-27 17:11:49', '2015-04-27 17:11:49', ' ', '', '', 'publish', 'open', 'open', '', '20', '', '', '2015-04-27 17:11:49', '2015-04-27 17:11:49', '', 0, 'http://localhost/gamingmobileapp/?p=20', 2, 'nav_menu_item', '', 0),
(22, 1, '2015-04-29 15:39:41', '2015-04-29 15:39:41', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin'' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href="http://localhost/gamingmobileapp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!\r\n\r\n[view_add_to_cart id=111]', 'Sample Page', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-04-29 15:39:41', '2015-04-29 15:39:41', '', 2, 'http://localhost/gamersseal/2-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2015-04-29 15:41:16', '2015-04-29 15:41:16', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin'' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href="http://localhost/gamingmobileapp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!\r\n\r\n[view_add_to_cart id=2]', 'Sample Page', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-04-29 15:41:16', '2015-04-29 15:41:16', '', 2, 'http://localhost/gamersseal/2-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2015-04-29 15:44:36', '2015-04-29 15:44:36', '[eshop_show_cart]', 'Shopping Cart', '', 'publish', 'closed', 'closed', '', 'shopping-cart', '', '', '2015-04-29 15:44:36', '2015-04-29 15:44:36', '', 0, 'http://localhost/gamersseal/shopping-cart/', 0, 'page', '', 0),
(25, 1, '2015-04-29 15:44:36', '2015-04-29 15:44:36', '[eshop_show_checkout]', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2015-04-29 15:44:36', '2015-04-29 15:44:36', '', 24, 'http://localhost/gamersseal/shopping-cart/checkout/', 0, 'page', '', 0),
(26, 1, '2015-04-29 15:44:36', '2015-04-29 15:44:36', '[eshop_show_success]', 'Thank You for your order', '', 'publish', 'closed', 'closed', '', 'thank-you', '', '', '2015-04-29 15:44:36', '2015-04-29 15:44:36', '', 24, 'http://localhost/gamersseal/shopping-cart/thank-you/', 0, 'page', '', 0),
(27, 1, '2015-04-29 15:44:36', '2015-04-29 15:44:36', '[eshop_show_cancel]', 'Cancelled Order', '', 'publish', 'closed', 'closed', '', 'cancelled-order', '', '', '2015-04-29 15:44:36', '2015-04-29 15:44:36', '', 24, 'http://localhost/gamersseal/shopping-cart/cancelled-order/', 0, 'page', '', 0),
(28, 1, '2015-04-29 15:44:36', '2015-04-29 15:44:36', '[eshop_show_shipping]', 'Shipping Rates', '', 'publish', 'closed', 'closed', '', 'shipping-rates', '', '', '2015-04-29 15:44:36', '2015-04-29 15:44:36', '', 0, 'http://localhost/gamersseal/shipping-rates/', 0, 'page', '', 0),
(29, 1, '2015-04-29 15:44:36', '2015-04-29 15:44:36', '[eshop_show_downloads]', 'Downloads', '', 'publish', 'closed', 'closed', '', 'downloads', '', '', '2015-04-29 15:44:36', '2015-04-29 15:44:36', '', 0, 'http://localhost/gamersseal/downloads/', 0, 'page', '', 0),
(30, 1, '2015-04-29 15:50:35', '2015-04-29 15:50:35', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin'' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href="http://localhost/gamingmobileapp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!\r\n\r\n&nbsp;', 'Sample Page', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-04-29 15:50:35', '2015-04-29 15:50:35', '', 2, 'http://localhost/gamersseal/2-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2015-04-29 15:50:55', '2015-04-29 15:50:55', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!\r\n\r\n[view_add_to_cart id=2]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-04-29 15:50:55', '2015-04-29 15:50:55', '', 1, 'http://localhost/gamersseal/1-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2015-04-30 19:32:53', '2015-04-30 19:32:53', '[eshop_show_checkout]', 'Checkout', '', 'inherit', 'open', 'open', '', '25-autosave-v1', '', '', '2015-04-30 19:32:53', '2015-04-30 19:32:53', '', 25, 'http://localhost/gamersseal/25-autosave-v1/', 0, 'revision', '', 0),
(34, 1, '2015-04-30 19:34:57', '2015-04-30 19:34:57', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!\r\n\r\n[view_add_to_cart id=2]\r\n\r\n[scabn name="dd" price="525" b_title="Add To Cart"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-04-30 19:34:57', '2015-04-30 19:34:57', '', 1, 'http://localhost/gamersseal/1-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2015-04-30 19:35:07', '2015-04-30 19:35:07', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!\r\n\r\n[view_add_to_cart id=2]\r\n\r\n[scabn name="dd" price="525" b_title="Add To Cart"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-autosave-v1', '', '', '2015-04-30 19:35:07', '2015-04-30 19:35:07', '', 1, 'http://localhost/gamersseal/1-autosave-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_signups`
--

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

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=36 ;

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
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:4:{s:64:"12c24c1c5bd70d684db862cc32596d853bbd21427af25457cd6c09b8e7692c22";a:4:{s:10:"expiration";i:1431359699;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1430150099;}s:64:"fba5060412cf33eaf36e2bdaa33756cd265d7ffa1ef412245923debbd5374655";a:4:{s:10:"expiration";i:1430460986;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0";s:5:"login";i:1430288186;}s:64:"277c5c14019f52149ebeeeed3d5ecd715c4cbc9ddaf46bb616551c716f0b8f61";a:4:{s:10:"expiration";i:1430546526;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0";s:5:"login";i:1430373726;}s:64:"1de850f6c138e304626a5e03c6e477fb696dce0f29834d4aa9bd90b5acc5c643";a:4:{s:10:"expiration";i:1430594938;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1430422138;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'last_activity', '2015-04-30 19:41:42'),
(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:23:"add-buddypress-nav-menu";i:1;s:8:"add-post";i:2;s:12:"add-post_tag";i:3;s:15:"add-post_format";}'),
(19, 1, 'listings-items-per-page', '10'),
(20, 1, 'listings-category', '0'),
(21, 1, 'wp_user-settings', 'mfold=o&editor=tinymce'),
(22, 1, 'wp_user-settings-time', '1430321515'),
(23, 2, 'nickname', 'test'),
(24, 2, 'first_name', 'test'),
(25, 2, 'last_name', 'test'),
(26, 2, 'description', ''),
(27, 2, 'rich_editing', 'true'),
(28, 2, 'comment_shortcuts', 'false'),
(29, 2, 'admin_color', 'fresh'),
(30, 2, 'use_ssl', '0'),
(31, 2, 'show_admin_bar_front', 'true'),
(32, 2, 'wp_capabilities', 'a:1:{s:5:"guest";b:1;}'),
(33, 2, 'wp_user_level', '0'),
(34, 2, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(35, 1, 'wp_awpcp-admin-categories-results', '10');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BNIcYoBp4nbPGJz8/Vaz3tSuKO0LS41', 'admin', 'muhammadsufiangee@gmail.com', '', '2015-04-27 15:54:37', '', 0, 'admin'),
(2, 'test', '$P$BS6C.tQxX3lgwBXE7trT.5T7t.Wx2.0', 'test', 'test@gmail.com', '', '2015-04-29 16:12:04', '', 0, 'test test');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
