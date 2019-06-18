-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 18, 2019 at 12:14 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lacrosse`
--

-- --------------------------------------------------------

--
-- Table structure for table `e_contacts`
--

DROP TABLE IF EXISTS `e_contacts`;
CREATE TABLE IF NOT EXISTS `e_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(100) NOT NULL,
  `ec1_name` varchar(250) NOT NULL COMMENT 'emergency contact 1',
  `ec1_num` varchar(20) NOT NULL COMMENT 'emergency contact 1',
  `ec1_relationship` varchar(250) NOT NULL COMMENT 'emergency contact 1',
  `ec2_name` varchar(250) NOT NULL COMMENT 'emergency contact 2',
  `ec2_num` varchar(20) NOT NULL COMMENT 'emergency contact 2',
  `ec2_relationship` varchar(250) NOT NULL COMMENT 'emergency contact 2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_contacts`
--

INSERT INTO `e_contacts` (`id`, `player_id`, `ec1_name`, `ec1_num`, `ec1_relationship`, `ec2_name`, `ec2_num`, `ec2_relationship`) VALUES
(1, 1, 'Daniel James', '9876541233', 'relative', 'Terrie Prince', '4656872213', 'other');

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

DROP TABLE IF EXISTS `guardians`;
CREATE TABLE IF NOT EXISTS `guardians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(100) NOT NULL,
  `g1_name` varchar(250) NOT NULL COMMENT 'guardian 1',
  `g1_email` varchar(250) NOT NULL COMMENT 'guardian 1',
  `g1_phone` varchar(20) NOT NULL COMMENT 'guardian 1',
  `g2_name` varchar(250) DEFAULT NULL COMMENT 'guardian 2',
  `g2_email` varchar(250) DEFAULT NULL COMMENT 'guardian 2',
  `g2_phone` varchar(20) DEFAULT NULL COMMENT 'guardian 2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guardians`
--

INSERT INTO `guardians` (`id`, `player_id`, `g1_name`, `g1_email`, `g1_phone`, `g2_name`, `g2_email`, `g2_phone`) VALUES
(1, 1, 'James Crane', 'xx@xx.com', '9632581478', 'Christine Crane', 'xxx2@xx.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medical_info`
--

DROP TABLE IF EXISTS `medical_info`;
CREATE TABLE IF NOT EXISTS `medical_info` (
  `med_id` int(11) NOT NULL,
  `player_id` int(100) NOT NULL,
  `physician` varchar(100) NOT NULL,
  `dr_phone` varchar(20) NOT NULL,
  `insurance` varchar(250) NOT NULL,
  `policy_num` varchar(100) NOT NULL,
  `insurance_num` varchar(20) NOT NULL,
  `allergies` text NOT NULL,
  `other` text NOT NULL,
  `medications` text NOT NULL,
  PRIMARY KEY (`med_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medical_info`
--

INSERT INTO `medical_info` (`med_id`, `player_id`, `physician`, `dr_phone`, `insurance`, `policy_num`, `insurance_num`, `allergies`, `other`, `medications`) VALUES
(1, 1, 'Dr Lang', '8887779999', 'Cigna', '0012336', '18009990000', 'none', 'none', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `national`
--

DROP TABLE IF EXISTS `national`;
CREATE TABLE IF NOT EXISTS `national` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` varchar(100) NOT NULL,
  `player_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `national_id` (`national_id`),
  UNIQUE KEY `player_id` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `national`
--

INSERT INTO `national` (`id`, `national_id`, `player_id`) VALUES
(1, '001', '001'),
(2, '10025', '002');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `player_id` int(100) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `current_grade` int(2) NOT NULL,
  `dob` varchar(10) NOT NULL COMMENT 'birthday',
  `email` varchar(250) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `address` varchar(250) NOT NULL,
  `address_2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `shirt_size` varchar(5) DEFAULT NULL,
  `short_size` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `fname`, `lname`, `current_grade`, `dob`, `email`, `phone`, `address`, `address_2`, `city`, `zip`, `shirt_size`, `short_size`) VALUES
(1, 'Jane', 'Crane', 10, '01.20.2002', 'xxx@xx.com', '5121231234', '123 St Road', NULL, 'Austin', '78737', 'M', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` varchar(100) NOT NULL,
  `player_id` varchar(100) NOT NULL,
  `school` varchar(50) NOT NULL,
  `year` varchar(20) NOT NULL,
  `grade` int(2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `consent_medical` tinyint(1) NOT NULL,
  `consent_liability` tinyint(1) NOT NULL,
  `consent_conduct_ds` tinyint(1) NOT NULL,
  `consent_conduct_tghsll` tinyint(1) NOT NULL,
  `consent_picture` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow pictures to be posted of the player on site',
  PRIMARY KEY (`reg_id`),
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`reg_id`, `national_id`, `player_id`, `school`, `year`, `grade`, `timestamp`, `consent_medical`, `consent_liability`, `consent_conduct_ds`, `consent_conduct_tghsll`, `consent_picture`) VALUES
(1, '001', '001', 'DSHS', '2019-2020', 10, '2018-12-06 20:15:55', 1, 1, 1, 1, 1),
(2, '10025', '002', 'DSMS', '2019-2020', 8, '2019-04-16 05:59:47', 1, 1, 1, 1, 1),
(3, '001', '001', 'DSHS', '2018-2019', 9, '2017-12-06 20:15:55', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reg_address`
--

DROP TABLE IF EXISTS `reg_address`;
CREATE TABLE IF NOT EXISTS `reg_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `st` varchar(2) NOT NULL DEFAULT 'TX',
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_address`
--

INSERT INTO `reg_address` (`id`, `player_id`, `address`, `city`, `st`, `zip`) VALUES
(1, '001', '123 St Road', 'Austin', 'TX', '78737');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(25) NOT NULL DEFAULT 'user',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `active`) VALUES
(1, 'user', '6f5e85f384e74908d037158efe9a0e7b', 'user', 1),
(2, 'user1', '6f5e85f384e74908d037158efe9a0e7b', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-03-06 23:00:35', '2018-03-06 23:00:35', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_duplicator_packages`
--

DROP TABLE IF EXISTS `wp_duplicator_packages`;
CREATE TABLE IF NOT EXISTS `wp_duplicator_packages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_duplicator_packages`
--

INSERT INTO `wp_duplicator_packages` (`id`, `name`, `hash`, `status`, `created`, `owner`, `package`) VALUES
(1, '20181027_lacrosse', '2d9078d6a12b11dd6710_20181027161207', 100, '2018-10-27 16:12:30', 'lacrosse', 0x4f3a31313a224455505f5061636b616765223a32333a7b733a373a2243726561746564223b733a31393a22323031382d31302d32372031363a31323a3037223b733a373a2256657273696f6e223b733a363a22312e322e3532223b733a393a2256657273696f6e5750223b733a353a22342e392e38223b733a393a2256657273696f6e4442223b733a363a22352e372e3139223b733a31303a2256657273696f6e504850223b733a363a22352e362e3331223b733a393a2256657273696f6e4f53223b733a353a2257494e4e54223b733a323a224944223b693a313b733a343a224e616d65223b733a31373a2232303138313032375f6c6163726f737365223b733a343a2248617368223b733a33353a2232643930373864366131326231316464363731305f3230313831303237313631323037223b733a383a224e616d6548617368223b733a35333a2232303138313032375f6c6163726f7373655f32643930373864366131326231316464363731305f3230313831303237313631323037223b733a343a2254797065223b693a303b733a353a224e6f746573223b733a303a22223b733a393a2253746f726550617468223b733a33393a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d736e617073686f74732f746d70223b733a383a2253746f726555524c223b733a33393a22687474703a2f2f6c6f63616c686f73742f6c6163726f7373652f77702d736e617073686f74732f223b733a383a225363616e46696c65223b733a36333a2232303138313032375f6c6163726f7373655f32643930373864366131326231316464363731305f32303138313032373136313230375f7363616e2e6a736f6e223b733a373a2252756e74696d65223b733a31303a2235322e3031207365632e223b733a373a2245786553697a65223b733a383a223531342e31344b42223b733a373a225a697053697a65223b733a373a2232382e39364d42223b733a363a22537461747573223b4e3b733a363a22575055736572223b733a383a226c6163726f737365223b733a373a2241726368697665223b4f3a31313a224455505f41726368697665223a31393a7b733a31303a2246696c74657244697273223b733a303a22223b733a31313a2246696c74657246696c6573223b733a303a22223b733a31303a2246696c74657245787473223b733a303a22223b733a31333a2246696c74657244697273416c6c223b613a303a7b7d733a31343a2246696c74657246696c6573416c6c223b613a303a7b7d733a31333a2246696c74657245787473416c6c223b613a303a7b7d733a383a2246696c7465724f6e223b693a303b733a31323a224578706f72744f6e6c794442223b693a303b733a343a2246696c65223b733a36353a2232303138313032375f6c6163726f7373655f32643930373864366131326231316464363731305f32303138313032373136313230375f617263686976652e7a6970223b733a363a22466f726d6174223b733a333a225a4950223b733a373a225061636b446972223b733a32323a22433a2f77616d7036342f7777772f6c6163726f737365223b733a343a2253697a65223b693a33303336363135363b733a343a2244697273223b613a303a7b7d733a353a2246696c6573223b613a303a7b7d733a31303a2246696c746572496e666f223b4f3a32333a224455505f417263686976655f46696c7465725f496e666f223a383a7b733a343a2244697273223b4f3a33343a224455505f417263686976655f46696c7465725f53636f70655f4469726563746f7279223a343a7b733a373a225761726e696e67223b613a303a7b7d733a31303a22556e7265616461626c65223b613a303a7b7d733a343a22436f7265223b613a303a7b7d733a383a22496e7374616e6365223b613a303a7b7d7d733a353a2246696c6573223b4f3a32393a224455505f417263686976655f46696c7465725f53636f70655f46696c65223a353a7b733a343a2253697a65223b613a303a7b7d733a373a225761726e696e67223b613a303a7b7d733a31303a22556e7265616461626c65223b613a303a7b7d733a343a22436f7265223b613a303a7b7d733a383a22496e7374616e6365223b613a303a7b7d7d733a343a2245787473223b4f3a32393a224455505f417263686976655f46696c7465725f53636f70655f42617365223a323a7b733a343a22436f7265223b613a303a7b7d733a383a22496e7374616e6365223b613a303a7b7d7d733a393a2255446972436f756e74223b693a303b733a31303a225546696c65436f756e74223b693a303b733a393a2255457874436f756e74223b693a303b733a383a225472656553697a65223b613a303a7b7d733a31313a22547265655761726e696e67223b613a303a7b7d7d733a31343a225265637572736976654c696e6b73223b613a303a7b7d733a31303a22002a005061636b616765223b723a313b733a32393a22004455505f4172636869766500746d7046696c74657244697273416c6c223b613a303a7b7d733a32343a22004455505f41726368697665007770436f72655061746873223b613a363a7b693a303b733a33313a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d61646d696e223b693a313b733a34313a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d636f6e74656e742f75706c6f616473223b693a323b733a34333a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d636f6e74656e742f6c616e677561676573223b693a333b733a34313a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d636f6e74656e742f706c7567696e73223b693a343b733a34303a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d636f6e74656e742f7468656d6573223b693a353b733a33343a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d696e636c75646573223b7d7d733a393a22496e7374616c6c6572223b4f3a31333a224455505f496e7374616c6c6572223a393a7b733a343a2246696c65223b733a36373a2232303138313032375f6c6163726f7373655f32643930373864366131326231316464363731305f32303138313032373136313230375f696e7374616c6c65722e706870223b733a343a2253697a65223b693a3532363438333b733a31303a224f7074734442486f7374223b733a303a22223b733a31303a224f7074734442506f7274223b733a303a22223b733a31303a224f70747344424e616d65223b733a303a22223b733a31303a224f707473444255736572223b733a303a22223b733a31323a224f7074735365637572654f6e223b693a303b733a31343a224f70747353656375726550617373223b733a303a22223b733a31303a22002a005061636b616765223b723a313b7d733a383a224461746162617365223b4f3a31323a224455505f4461746162617365223a31333a7b733a343a2254797065223b733a353a224d7953514c223b733a343a2253697a65223b693a3538363038353b733a343a2246696c65223b733a36363a2232303138313032375f6c6163726f7373655f32643930373864366131326231316464363731305f32303138313032373136313230375f64617461626173652e73716c223b733a343a2250617468223b4e3b733a31323a2246696c7465725461626c6573223b733a303a22223b733a383a2246696c7465724f6e223b693a303b733a343a224e616d65223b4e3b733a31303a22436f6d70617469626c65223b733a303a22223b733a383a22436f6d6d656e7473223b733a32383a224d7953514c20436f6d6d756e69747920536572766572202847504c29223b733a31303a22002a005061636b616765223b723a313b733a32353a22004455505f446174616261736500646253746f726550617468223b733a3130363a22433a2f77616d7036342f7777772f6c6163726f7373652f77702d736e617073686f74732f746d702f32303138313032375f6c6163726f7373655f32643930373864366131326231316464363731305f32303138313032373136313230375f64617461626173652e73716c223b733a32333a22004455505f446174616261736500454f464d61726b6572223b733a303a22223b733a32363a22004455505f4461746162617365006e6574776f726b466c757368223b623a303b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/lacrosse', 'yes'),
(2, 'home', 'http://localhost/lacrosse', 'yes'),
(3, 'blogname', 'Lacrosse', 'yes'),
(4, 'blogdescription', 'Outplay, Outwork, Outlast!', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'rnin068@gmail.com', 'yes'),
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
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=8&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:36:\"contact-form-7/wp-contact-form-7.php\";i:1;s:25:\"duplicator/duplicator.php\";i:2;s:35:\"fancybox-for-wordpress/fancybox.php\";i:3;s:19:\"jetpack/jetpack.php\";i:4;s:39:\"shapely-companion/shapely-companion.php\";i:5;s:53:\"simple-custom-post-order/simple-custom-post-order.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'shapely', 'yes'),
(41, 'stylesheet', 'shapely', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:53:\"simple-custom-post-order/simple-custom-post-order.php\";s:18:\"scporder_uninstall\";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '9', 'yes'),
(84, 'page_on_front', '8', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '21', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:12:\"sidebar-home\";a:8:{i:0;s:23:\"shapely_home_parallax-2\";i:1;s:23:\"shapely_home_parallax-3\";i:2;s:23:\"shapely_home_parallax-4\";i:3;s:23:\"shapely_home_parallax-5\";i:4;s:23:\"shapely_home_parallax-6\";i:5;s:24:\"shapely_home_portfolio-2\";i:6;s:26:\"shapely_home_testimonial-2\";i:7;s:22:\"shapely_home_contact-2\";}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'cron', 'a:6:{i:1551030922;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1551032352;a:1:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1551049235;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1551049257;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1551065444;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(110, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1520387459;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(350, '_site_transient_timeout_theme_roots', '1551032433', 'no'),
(351, '_site_transient_theme_roots', 'a:5:{s:12:\"Parallax-One\";s:7:\"/themes\";s:7:\"shapely\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(158, 'duplicator_version_plugin', '1.2.52', 'yes'),
(170, 'theme_mods_shapely', 'a:18:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:2;s:11:\"social-menu\";i:0;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:14;s:22:\"shapely_logo_dimension\";a:3:{s:5:\"width\";d:25;s:6:\"height\";d:61;s:5:\"ratio\";i:1;}s:9:\"blog_name\";s:0:\"\";s:16:\"blog_layout_view\";s:4:\"grid\";s:11:\"top_callout\";b:1;s:30:\"show_category_on_category_page\";b:1;s:15:\"title_in_header\";b:0;s:16:\"title_above_post\";b:0;s:9:\"post_date\";b:0;s:11:\"post_author\";b:0;s:16:\"post_author_area\";b:0;s:12:\"header_image\";s:73:\"http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-banner-1.png\";s:17:\"header_image_data\";O:8:\"stdClass\":5:{s:13:\"attachment_id\";i:39;s:3:\"url\";s:73:\"http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-banner-1.png\";s:13:\"thumbnail_url\";s:73:\"http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-banner-1.png\";s:6:\"height\";i:225;s:5:\"width\";i:1900;}s:16:\"header_textcolor\";s:6:\"5e1025\";s:16:\"background_color\";s:6:\"ffffff\";}', 'yes'),
(183, 'widget_shapely_home_contact', 'a:2:{s:12:\"_multiwidget\";i:1;i:2;a:8:{s:5:\"title\";s:11:\"Contact Us!\";s:9:\"image_src\";s:0:\"\";s:12:\"body_content\";s:120:\"Mauris vestibulum, metus at semper efficitur, est ex tincidunt elit, vitae tincidunt sem sem in est. Sed eget enim nunc.\";s:5:\"phone\";s:12:\"512-567-3719\";s:7:\"address\";s:0:\"\";s:5:\"email\";s:23:\"dshs.lady.lax@gmail.com\";s:11:\"contactform\";s:0:\"\";s:11:\"socialicons\";s:0:\"\";}}', 'yes'),
(184, 'widget_shapely-social', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(185, 'widget_shapely-page-title', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(186, 'widget_shapely-page-content', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(130, 'can_compress_scripts', '1', 'no'),
(341, '_transient_is_multi_author', '0', 'yes'),
(353, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.1.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.1-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"5.1\";s:7:\"version\";s:3:\"5.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.1.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.1-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"5.1\";s:7:\"version\";s:3:\"5.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.3-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.3\";s:7:\"version\";s:5:\"5.0.3\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.2\";s:7:\"version\";s:5:\"5.0.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1551030639;s:15:\"version_checked\";s:5:\"4.9.9\";s:12:\"translations\";a:0:{}}', 'no'),
(171, 'shapely_backup_settings', '6', 'yes'),
(143, 'current_theme', 'Shapely', 'yes'),
(144, 'theme_mods_Parallax-One', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1520388903;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:11:\"footer-area\";a:0:{}s:13:\"footer-area-2\";a:0:{}s:13:\"footer-area-3\";a:0:{}s:13:\"footer-area-4\";a:0:{}}}}', 'yes'),
(145, 'theme_switched', '', 'yes'),
(167, '_transient_timeout_Parallax-One-update-response', '3040821006', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(168, '_transient_Parallax-One-update-response', 'O:8:\"stdClass\":11:{s:11:\"new_version\";s:6:\"2.1.11\";s:14:\"stable_version\";s:6:\"2.1.11\";s:4:\"name\";s:12:\"Parallax One\";s:4:\"slug\";s:12:\"Parallax-One\";s:7:\"package\";s:469:\"https://themeisle.com/themes/parallax-one/?edd_action=package_download&token=4e584677576d6472566e4a45654668724b3256514d3038344b7a5a32526a64715a30704b6157564756326b31626b59725a6c56615655566f5a6d7031534642744b335653596e685855574a6e646a6453536b38765a577076615373774b3342326254643153577455556d684f544731784b32566c646a6861554752365532523665554a4a576d4a59616a52615a584d784c3364334f5531735a6e56564b3252614d305a43616d6b324d316b364f744353786a30755a365954567949552b6b31694973513d\";s:13:\"download_link\";s:469:\"https://themeisle.com/themes/parallax-one/?edd_action=package_download&token=4e584677576d6472566e4a45654668724b3256514d3038344b7a5a32526a64715a30704b6157564756326b31626b59725a6c56615655566f5a6d7031534642744b335653596e685855574a6e646a6453536b38765a577076615373774b3342326254643153577455556d684f544731784b32566c646a6861554752365532523665554a4a576d4a59616a52615a584d784c3364334f5531735a6e56564b3252614d305a43616d6b324d316b364f744353786a30755a365954567949552b6b31694973513d\";s:3:\"url\";s:88:\"https://themeisle.com/themes/parallax-one/?edd_action=view_changelog&name=Parallax%20One\";s:12:\"last_updated\";s:19:\"2017-06-20 12:51:43\";s:8:\"homepage\";s:42:\"https://themeisle.com/themes/parallax-one/\";s:8:\"sections\";a:2:{s:11:\"description\";s:0:\"\";s:9:\"changelog\";s:25197:\"<h3>v2.1.0.12 - 18/08/2016</h3>\r\n<h4>Changes:</h4>\r\n<ul>\r\n 	<li>Fixed issue with articles embedded in the post page</li>\r\n 	<li>Added compatibility with WPPR plugin</li>\r\n 	<li>Fixed small code issues</li>\r\n</ul>\r\n<h3>v2.1.0.11 - 01/07/2016</h3>\r\n<h4>Changes:</h4>\r\n<ul>\r\n 	<li>Update polish .mo and .po files</li>\r\n 	<li>Allow callto protocol in the frontpage contact section</li>\r\n 	<li>Allow html content in all the sections main areas</li>\r\n 	<li>Remove required actions from Customize</li>\r\n 	<li>\r\n<h3>v2.1.0.10 - 02/06/2016</h3>\r\n<h4>Changes:</h4>\r\n<h4></h4>\r\n</li>\r\n 	<li>Development</li>\r\n 	<li>\r\n<h3>v2.1.0.9 - 18/05/2016</h3>\r\n<h4>Changes:</h4>\r\n<h4></h4>\r\n</li>\r\n 	<li>Fixed #358 Issue with Jetpack sharing on latest news</li>\r\n 	<li>### 2.1.0.8 - 18/04/2016Changes: Fixed image not showing in Services section\r\n\r\nFor some reasons, in one of our previous commits we changed the link to image and image to link which was causing this issue.\r\n Merge pull request #370 from HardeepAsrani/development\r\n\r\nFixed image not showing in Services section\r\n\r\n### 2.1.0.7 - 14/04/2016\r\n\r\nChanges:\r\n\r\n Our services small css issue\r\n Merge pull request #368 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 2.1.0.6 - 13/04/2016\r\n\r\nChanges:\r\n\r\n Revert \"!!!changes for general plugin\"\r\n\r\nThis reverts commit e008cfceb141af1a928416e93010cfa08921764c.\r\n Fixed WordPress 4.5 scrolling issue\r\n\r\nFixed scrolling issue which was caused after upgrading to WordPress 4.5.\r\n Merge pull request #366 from HardeepAsrani/development\r\n\r\nFixed WordPress 4.5 scrolling issue\r\n Merge pull request #353 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Our services small css issue\r\n\r\n### 2.1.0.5 - 19/02/2016\r\n\r\nChanges:\r\n\r\n Fixed #292 Added character sets\r\n #344 latest news titles issue fixed\r\n\r\nissue fixed.\r\n Merge pull request #346 from Gouravwp/development\r\n\r\n#344 latest news titles issue fixed\r\n #233 - added custom hooks\r\n #345 - start page from top if no title and frontpage\r\n see the icon in dropdown in customizer\r\n fix #347 - woocommerce ratings not displaying properly\r\n fix #343 - fix latest news section when wr megamenu is installed\r\n #339 - added social icons in team section\r\n #329 - make parallax-one seo friendly, only one h1 on page, all images with alt\r\n #296 - js loading slow in menu\r\n #272 - allow ul and li inside box\r\n #218 - add editor style\r\n added google icons\r\n added new google icons\r\n added compatibility with SI CAPTCHA Anti-Spam and change form style\r\n Merge pull request #350 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Update translations for polish### 2.1.0.4 - 14/01/2016\r\n\r\nChanges:\r\n\r\n Fixed #338 Added option to remove pinterest style for Testimonials section and Services section\r\n #334, Option to translate the link field from the Services section\r\n French translation for Parallax One\r\n\r\n### 2.1.0.3 - 03/12/2015\r\n\r\nChanges:\r\n\r\n #322 - added control for overlay opacity in first section\r\n #311 - line break in textbox is now interpreted as new line\r\n #307 - use relative url for images\r\n Merge branch \'cristian-ungureanu-development\' into development\r\n\r\n### 2.1.0.2 - 27/11/2015\r\n\r\nChanges:\r\n\r\n Merge pull request #330 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n EDD Compatibility issues\r\n\r\n### 2.1.0.1 - 24/11/2015\r\n\r\nChanges:\r\n\r\n #316 Change date format issue fixed\r\n Merge pull request #324 from Gouravwp/development\r\n\r\n#316 Change date format issue fixed\r\n date format issue fixed\r\n\r\nchange date format .\r\n date format issue fixed\r\n\r\nChange date format\r\n Merge branch \'Gouravwp-development\' into development\r\n #326 Wrong text domain issue\r\n\r\ntext domain issue fixed !\r\n Merge pull request #327 from Gouravwp/development\r\n\r\n#326 Wrong text domain issue\r\n\r\n### 2.1.0.0 - 11/11/2015\r\n\r\nChanges:\r\n\r\n Fixed #291 Date appears twice on blog on moibile\r\n Fixed #320 Background image not working well\r\n Fixed Background image not working well on mobile\r\n\r\n### 2.0.9 - 29/10/2015\r\n\r\nChanges:\r\n\r\n #308 added target=\"_blank\"\r\n\r\nadded target=\"_blank\" in all Social links\r\n Merge pull request #312 from Gouravwp/patch-1\r\n\r\n#308 added target=\"_blank\"\r\n Merge pull request #314 from cristian-ungureanu/development\r\n\r\n!!!fixed shop section\r\n Fixed #301 and #290 translations issues and added brazilian-portuguese translations\r\n\r\n### 2.0.8 - 23/10/2015\r\n\r\nChanges:\r\n\r\n Merge pull request #305 from cristian-ungureanu/development\r\n\r\n!!! #290 - fixed translations\r\n\r\n### 2.0.7 - 22/10/2015\r\n\r\nChanges:\r\n\r\n Merge pull request #295 from cristian-ungureanu/development\r\n\r\n!!!changes for plus plugin\r\n Merge pull request #297 from cristian-ungureanu/development\r\n\r\n!!!fixed special characters in boxes\r\n Merge pull request #302 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Merge pull request #303 from cristian-ungureanu/development\r\n\r\n!!! #293 - allow just few tags in text box\r\n\r\n### 2.0.6 - 12/10/2015\r\n\r\nChanges:\r\n\r\n Fixed #208 check JetPack widgets integration\r\n Fixed #114 EDD integration\r\n Fixed #287 Services images are stretching\r\n Fixed #286 Responsive background for single page on mobile\r\n\r\n### 2.0.5 - 07/10/2015\r\n\r\nChanges:\r\n\r\n Fixed #276 You may be interested in Section in cart\r\n Fixed #284 Latest news issue on mobile\r\n Fixed #283 Reduced big spaces on mobile\r\n Fixed #282 Ribbon background is stretching weird on mobile\r\n\r\n### 2.0.4 - 07/10/2015\r\n\r\nChanges:\r\n\r\n #272 - html tags a , button , strong, em, br are now allowed in box content\r\n #273 - fixed smooth scroll on button click\r\n #270 - fixed payment options image\r\n Merge pull request #274 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Merge pull request #280 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Fixed translation issues for frontpage buttons\r\n Merge pull request #281 from cristian-ungureanu/development\r\n\r\n!!!small changes for plus version### 2.0.3 - 23/09/2015\r\n\r\nChanges:\r\n\r\n #259 - include font wit wp_enqueue_style\r\n #243 - added welcome page\r\n #243 - fixed themecheck errors from welcome page\r\n #251 - options are hiding when they are empty\r\n #243 - added links to documentation\r\n #265 - about section allows now a and button tag\r\n #264 - fixed sections display on mobile and tablet\r\n #268 - fixed sorting in woocommerce shop\r\n Merge pull request #263 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 2.0.2 - 17/09/2015\r\n\r\nChanges:\r\n\r\n this fixes #212 - oEmbed is now responsive\r\n Updated screenshot\r\n removed unused control header text color from customizer, changed background color of repeater fields in customizer from transparent to white\r\n this fixes errors in theme check\r\n added links on features boxes\r\n #207 - postmatic integration\r\n Merge pull request #230 from cristian-ungureanu/development\r\n\r\nthis fixes #212 - oEmbed is now responsive\r\n #235 - include parallax js only if it is activated\r\n #212 - change width and height with max-width and max-height for videos\r\n #207 - fixed Postnatic integration\r\n #237 - align testimonials\r\n #238 - optimize bk\r\n #237 - fix the grid js, when all columns are equal, it adds the box in middle\r\n #238 - optimize ribbon image\r\n #214 accessibility header\r\n Update readme.txt\r\n markdown for readme\r\n\r\nmarkdown-ify the readme\r\n #214 - added aria rols, #112 - added part of schema markup\r\n #112,#214 - removed hybrid code , added tags for markup, validate frontpage\r\n #112 - implement schema markup, validating all pages\r\n fixed comment did not look the same as in old version\r\n Merge pull request #241 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n added menu control with keyboard\r\n Russian translation. Partial\r\n Russian translation. Full\r\n #214 - accessibility ready menu in full width and keyboard control\r\n Merge branch \'maxkoryukov-translation-RU\' into development\r\n #214 - accessibility ready - menu is now responsive\r\n #214 - accessibility ready - added alt attribute to images\r\n fixed top menu when no item is selected\r\n fixed top menu when no menu is selected\r\n this fixes #242\r\n #214 - small fixes\r\n Merge pull request #248 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n #250 - site icon control is not visible in customizer\r\n Fixed #249, translations for frontpage strings\r\n #214 - style links on focus\r\n Merge pull request #252 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n #249 - added translation support for repeater content\r\n Merge pull request #256 from cristian-ungureanu/development\r\n\r\n#249 - added translation support for repeater content### 2.0.1 - 18/08/2015\r\n\r\nChanges:\r\n\r\n #224 - buttons issue\r\n Merge pull request #225 from cristian-ungureanu/development\r\n\r\n#224 - buttons issue\r\n Updated pinterest js plugin AND Removed horizontal scroll on mobile\r\n change meta viewport\r\n Removed logo effect on scroll\r\n Update style.css\r\n Revert \"change meta viewport\"\r\n\r\nThis reverts commit dde5534928ce5fb22d2b0d752def0edac462ba45.\r\n #204 - added git button\r\n Merge pull request #229 from cristian-ungureanu/development\r\n\r\nDevelopment### 2.0.0 - 12/08/2015\r\n\r\nChanges:\r\n\r\n CSS issues\r\n Added parallax efect on header\r\n Replaced pinterest plugin fo Our services and Testimonials\r\n Pinterest style on shop\r\n Fixed Related and Upsells products issue\r\n Parallax issues\r\n optimized screenshot\r\n #215 - suggest short pixel image optimiser plugin\r\n #202 - added textdomain to latest news title\r\n use get_template_part instead of include\r\n added parallax controls\r\n changed name in customizr from header image to header\r\n #215 - added sp zip\r\n Merge pull request #220 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Fixed #221 Header Parallax effect\r\n Fixed #221 parallax effect issue\r\n Fixed #221 Header Parallax effect header height issue\r\n Fixed #221 Parallax effect header issue\r\n Fixed #221 Header parallax issue\r\n #217, #117 - added readme.txt , removed unused images\r\n Merge pull request #222 from cristian-ungureanu/development\r\n\r\n#217, #117 - added readme.txt , removed unused images\r\n Prevent theme from beeing updated by wordpress.org updates\r\n Rename Header section to Background\r\n update conditon of header\r\n Merge pull request #223 from cristian-ungureanu/development\r\n\r\nupdate conditon of header\r\n### 1.0.5 - 27/07/2015\r\n\r\nChanges:\r\n\r\n Home Latest news section redesign\r\n #209 - fixed child theme support\r\n Merge pull request #210 from cristian-ungureanu/development\r\n\r\n#209 - fixed child theme support\r\n Update style.css\r\n\r\n### 1.0.4 - 24/07/2015\r\n\r\nChanges:\r\n\r\n this fixes #198 - responsive header image\r\n #198 - center background image\r\n #199 - latest news section appears only if it has posts\r\n update to #198 - responsive header image\r\n update to #198\r\n update to #199\r\n Merge pull request #200 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Fixed #136 rtl support\r\n Fixed #148 Basic bbpress integration\r\n Small css issue\r\n Update style### 1.0.1 - 17/07/2015\r\n\r\nChanges:\r\n\r\n Update style.css\r\n #190 - rename function\r\n minify js\r\n #188 - update tgm\r\n #147 - contact placeholders\r\n changed the label for contact repeater\r\n Merge pull request #192 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n fix shop when there are only 2 related products\r\n Merge pull request #195 from cristian-ungureanu/development\r\n\r\nfix shop when there are only 2 related products\r\n\r\n### 1.0.0 - 17/07/2015\r\n\r\nChanges:\r\n\r\n #140 - removed escape html in customizer where a tag is needed\r\n speed optimization\r\n Merge pull request #187 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n blogfix , shop fix, inputs fix\r\n Merge pull request #189 from cristian-ungureanu/development\r\n\r\nblogfix , shop fix, inputs fix### 1.0.0 - 15/07/2015\r\n\r\nChanges:\r\n\r\n #179 - prefix functions\r\n #167 - audio/video , #166 - playlist\r\n #158 - use get_template_directory_uri\r\n this fixes #171 - style form fields\r\n fixes #183, #141\r\n minify gridalicious js\r\n Merge pull request #181 from cristian-ungureanu/development\r\n\r\nDevelopment### 1.0.0 - 13/07/2015\r\n\r\nChanges:\r\n\r\n #154 - use esc_html__() and esc_html_e() intstead of __() and _e()\r\n #149 - made control for sticky header\r\n fix menu when it was not displaying\r\n #133 - support more tag\r\n #155 - use selected() function\r\n Merge pull request #178 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 09/07/2015\r\n\r\nChanges:\r\n\r\n this fixes background size\r\n Merge pull request #175 from cristian-ungureanu/development\r\n\r\nthis fixes background size\r\n #158 - change get_stylesheet with get_template,#160 small change to css\r\n Merge pull request #176 from cristian-ungureanu/development\r\n\r\n#158 - change get_stylesheet with get_template,#160 small change to css\r\n\r\n### 1.0.0 - 09/07/2015\r\n\r\nChanges:\r\n\r\n #127 - fixed header/background image\r\n #156 - use wp default textarea control\r\n fixes for last commit\r\n remove function that removes the background\r\n Merge pull request #173 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 09/07/2015\r\n\r\nChanges:\r\n\r\n fixed link to pro\r\n removed pro texts from customizer\r\n added link to intergeo maps in customizer description\r\n removed services sidebar and widget and added repeater in customizer\r\n made testimonials and our team with customizer repeater\r\n this fixes #110 - Remove hide section setting\r\n this fixes #111 - Archive link is not working on homepage\r\n #126 - removed rtl.css\r\n this fixes #99\r\n this fixes #105\r\n this fixes #107 - changed content width\r\n Merge pull request #137 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n this fixes #97 - cursor moves when trying to write smth\r\n this fixes #100\r\n this fixes #103 - gravatar size\r\n this fixes #138 - remove pro button\r\n #119 - removed default contact form\r\n #119 - removed captcha from function.php\r\n Small issues\r\n #118 - added development version for min js and remove wow plugin that was not used\r\n this fixes #115 - change frontpage\r\n #116 - move content from index to home and in index include home template\r\n Fixed #141 Woocommerce related product issue\r\n #121 - scripts versioning\r\n Fixed #165 Galleries broken\r\n #125 - removed favicon\r\n #128 - header now display when static frondpage is set\r\n Fixed #151 text inconsistency\r\n Fixed #150 header subtitle issue\r\n #140 - added overlay on map section\r\n #120 - prefixing and remove same size\r\n #124 - prefixing functions\r\n #146 - removed layouts\r\n #163 - remove disable comments on pages\r\n CSS issues\r\n #162 - use wp_query instead of query_posts\r\n #116 - home.php missing\r\n #159 - move transport in setting args\r\n remove settings parameter from control\r\n Merge pull request #169 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 06/07/2015\r\n\r\nChanges:\r\n\r\n fixed undefined value error #82\r\n Fixed #101 blog font weight AND #102 font comments small AND #104 comments form un-aligned\r\n Fixed #98 Header menu appears late on scroll\r\n optimized images\r\n Fixed #101 blog font weight AND #102 font on comment\r\n Fixed #108 Font on post meta\r\n Fixed #109 Visual issue on sidebar\r\n Increased font size\r\n\r\n### 1.0.0 - 03/07/2015\r\n\r\nChanges:\r\n\r\n Revert \"Development\"\r\n\r\n### 1.0.0 - 01/07/2015\r\n\r\nChanges:\r\n\r\n Fixed #64 Added description and theme uri AND Fixed #91 Comment form looks bad on mobile\r\n Fixed #89 Replaced Our story image\r\n this fixes #93 - disabled comments on full width template too\r\n #75 - panel for background and colors sections\r\n Small issue pinterest style plugin js\r\n Merge pull request #94 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 01/07/2015\r\n\r\nChanges:\r\n\r\n Parallax effect homepage\r\n Contact page form style\r\n small fixes - added control for image on ribbon section and move background controls in appearance\r\n this fixes #75 - added buttons for documentation, support and buy pro\r\n #64 - added tags in style.css\r\n do not display sidebar if is empty\r\n verify variable in general control and in contact section\r\n update theme tags\r\n themecheck fixes\r\n Merge pull request #83 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n #65 - regenerate pot file\r\n this fixes #85 - remove active callback\r\n Merge pull request #84 from cristian-ungureanu/development\r\n\r\n#65 - regenerate pot file\r\n this fixes #88 - added footer socials back\r\n Fixed #87 Add image source in readme AND Fixed #86 ThemeCheck errors\r\n added color controls for headings and text\r\n Fixed #89 Our story image needs to be replaced\r\n Improved js\r\n Merge pull request #90 from cristian-ungureanu/development\r\n\r\nthis fixes #88 - added footer socials back### 1.0.0 - 19/06/2015\r\n\r\nChanges:\r\n\r\n escape all variables\r\n this fixes #58 - added parallax_one_only_customizer in style.css\r\n this fixes #59 - wp_customize declared only once\r\n this fixes #60 - added textdomain for comments_number and for Posted in and display it only if category exists\r\n this fixes #62 - added default background\r\n this fixes #64 - change author name and author uri\r\n this fixes #66 - change function name\r\n this fixes #67 - remove commented code from functions.php\r\n this fixes #68 - remove duplicate add_theme_support(woocommerce) and add comment back to post-thumbnails\r\n this fixes #69 - add text domain for read more and by\r\n this fixes #71 - include divs inside if\r\n Checked W3 validator\r\n Fixed conflict\r\n Merge branch \'cristian-ungureanu-development\' into development\r\n\r\n### 1.0.0 - 18/06/2015\r\n\r\nChanges:\r\n\r\n this fixes #40 - when add a new services widget, control of image works only after save and refresh\r\n this fixes #38 - do not display widget if all fields are empty\r\n removed unused photos and modify default our team widgets to display the same photo\r\n this fixes #33 and #34 - upload images now work in dashboard widgets and user can select image size from media uploader\r\n this fixes #41 - removed logos section from customizer\r\n update to #34 - renamed the function that adds image size to media uploader, added image size for services and customers and added domain name to size labels\r\n Fixed #44 Top area is too small and Fixed pinterest style issue\r\n Fixed conflict\r\n Merge branch \'cristian-ungureanu-development\' into development\r\n added woocommerce support\r\n this fixes #50 - check if undefined in js\r\n this fixes #48 - prefixes for add image size\r\n update to #48\r\n update to #38 - do not display widgets if all fields are empty (for customers and team too)\r\n this fixes #41 - added logos section back on lite version\r\n added transport for logos bar\r\n update to #41\r\n added contact form and map control in customizer. Also made frontpage customizer controls available only on frontpage and map\r\n this fixes #42 - added control to disable comments on pages\r\n Woocommerce style\r\n remove woocommerce file\r\n Merge pull request #55 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n Fixed #54 CSS for logos section\r\n added intergeo maps section to frontpage\r\n change images for happy customers default widgets\r\n Fixed #52 Default image for team member\r\n added wpml-config\r\n Fixed #2 Screenshot\r\n Merge pull request #56 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 05/06/2015\r\n\r\nChanges:\r\n\r\n picture + title fixes\r\n added header section\r\n added contact info section\r\n fixed the default widgets\r\n added default content for contact info section and footer social icons\r\n Fixed #26 Latest news section - Responsive\r\n Merge pull request #31 from cristian-ungureanu/development\r\n\r\npicture + title fixes\r\n Added single page style\r\n Added blog page style\r\n Added blog style\r\n Added style and menu smooth scroll\r\n Added style\r\n changes in default widgets\r\n Merge pull request #36 from cristian-ungureanu/development\r\n\r\nchanges in default widgets\r\n this fixes default widgets\r\n added comments for defaut widgets\r\n Fixed #25 Latest news section slider\r\n Merge pull request #37 from cristian-ungureanu/development\r\n\r\nthis fixes default widgets\r\n\r\n### 1.0.0 - 12/05/2015\r\n\r\nChanges:\r\n\r\n Removed Logos section and Sections order from Lite version\r\n Sticky footer\r\n Logo max height\r\n removed logos section widget file\r\n Update homepage Latest news js\r\n added logos section in customizer, added latest news section in frontpage and customizer (needs some css updates), made a custom control for all texts in customizer instead of making a separate class for each one\r\n Updated css\r\n Merge pull request #24 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n fixed show/hide section with transport\r\n added updated style\r\n added latest news section\r\n close divs from header in single.php\r\n added team widget with social icons repeater (works only in dashboard, not in customizer yet)\r\n Updated style for project team\r\n repaired the project team widget to work in customizer too, added project team panel in customizer\r\n Merge pull request #27 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n changed all project team to our team\r\n Merge pull request #28 from cristian-ungureanu/development\r\n\r\nchanged all project team to our team\r\n Fixed default widgets for Our team section\r\n added our services section\r\n added template-blog\r\n added Our Story section\r\n added ribbon section\r\n added pannel for ribbon section\r\n Merge pull request #29 from cristian-ungureanu/development\r\n\r\nadded our services section\r\n\r\n### 1.0.0 - 24/04/2015\r\n\r\nChanges:\r\n\r\n Fixed #19, made apply button visible in logos widgets\r\n added drag and drop for repeater icons\r\n added customers widget\r\n Fixed conflict\r\n Merge branch \'cristian-ungureanu-development\' into development\r\n Default widgets in customizer for Happy Customers sidebar\r\n added drag and drop to change sections order in customizer->sections order\r\n added description for sections order\r\n added logos section in customizer\r\n added happy customers section in customizer\r\n added default widgets for logos section\r\n Merge pull request #21 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 21/04/2015\r\n\r\nChanges:\r\n\r\n Added css\r\n Update testimonials css\r\n Fixed #11 Site title and Tagline\r\n Fixed #9 Social icons repreater in customizer need some design\r\n added 4 sidebar sections in footer\r\n added transport postMessage\r\n added logos section\r\n Merge pull request #15 from cristian-ungureanu/development\r\n\r\nDevelopment\r\n\r\n### 1.0.0 - 14/04/2015\r\n\r\nChanges:\r\n\r\n added logo and disable preloader in customizer in General options section\r\n added footer menu in functions.php and in footer.php; added style for li a in footer menu because you can not add classes on li a elements in wp_nav menu\r\n added select menu option in customizer -> footer options; added copyright in customizer -> footer options;\r\n added social repeater in footer\r\n Fixed #3 Dropdown menu issue\r\n Fixed #7 Mobile menu not working when no menu is not selected in wp\r\n Merge pull request #8 from cristian-ungureanu/development\r\n\r\nHeader/Footer changes\r\n Fixed #12, added Site title and tagline when no logo is selected\r\n\r\n### 1.5.4 - 05/03/2015\r\n\r\nChanges:\r\n\r\n Latest news issue on iPad\r\n Woocommerce display for older versions\r\n Branding\r\n\r\n- Modified background image\r\n+ added focus images\r\n Branding - follow-up\r\n\r\nremoved unnecessary images\r\nadded screenshot\r\n Replaced screenshot\r\n Merge pull request #74 from DragosBubu/development\r\n\r\nBranding\r\n\r\n### 1.0.5 - 17/10/2014\r\n\r\nChanges:\r\n\r\n First version\r\n some fixes for responsive\r\n I added and plugin\r\n removed error.log\r\n sync with wp.org</li>\r\n</ul><h3>v2.1.0.13 - 12/10/2016</h3> <h4>Changes: </h4><ul><li>Make contact form on contact page full width when the page content is empty\r\n</li><li>Fixed issue with large menus loading slowly in header\r\n</li><li>Improved code\r\n</li><li>Make About section full width when no image is selected\r\n</li><li>Add an improved icon picker in customizer</li></ul><h3>v2.1.1 - 12/11/2016</h3> <h4>Changes: </h4><ul><li>New option for animations on frontpage\r\n</li><li>Added grunt and fixed issues\r\n</li><li>Update icons to use Font Awesome</li></ul><h3>v2.1.2 - 28/11/2016</h3> <h4>Changes: </h4><ul><li>NEW template for SiteOrigin compatibility\r\n</li><li>Updated grunt and fixed issues\r\n</li><li>Reorganize customize upsells\r\n</li><li>Update images license</li></ul><h3>v2.1.3 - 11/12/2016</h3> <h4>Changes: </h4><ul><li>Fixed function parallax_one_comment not found error</li></ul><h3>v2.1.4 - 18/01/2017</h3> <h4>Changes: </h4><ul><li>Added animations for the Contact section\r\n</li><li>Fixed incompatibility issues with Parallax One Plus plugin</li></ul><h3>v2.1.5 - 19/04/2017</h3> <h4>Changes: </h4><ul><li>Improved compatibility with WPML and Polylang\r\n</li><li>Fixed function checking for repeater content values</li></ul><h3>v2.1.6 - 03/05/2017</h3> <h4>Changes: </h4><ul><li>Fixed escaping issues in the Services and Testimonials sections\r\n</li><li>Added support for WooCommerce 3.0.0 gallery</li></ul><h3>v2.1.7 - 03/08/2017</h3> <h4>Changes: </h4><ul><li>Fixed translation issues</li></ul><h3>v2.1.8 - 07/09/2017</h3> <h4>Changes: </h4><ul><li>Fixed error causing animations to not work properly on the frontpage</li></ul><h3>v2.1.9 - 07/09/2017</h3> <h4>Changes: </h4><ul><li>Removed whitespaces in repeater controls options\r</li><li>Fix the console error Uncaught TypeError: jQuery(...).parallaxonegridpinterest is not a function which appeared with W3TC with js minify auto activated</li></ul><h3>v2.1.10 - 09/11/2017</h3> <h4>Changes: </h4><ul><li>Updated PHPCS and fixed all the errors\r</li><li>Fixed background issue on iOS in Ribbon section\r</li><li>Added retirement notice</li></ul><h3>v2.1.11 - 22/02/2018</h3> <h4>Changes: </h4><ul><li>Fixed compatibility issues with WooCommerce 3.3</li></ul>\";}s:7:\"banners\";s:41:\"a:2:{s:4:\"high\";s:0:\"\";s:3:\"low\";s:0:\"\";}\";}', 'no'),
(157, 'duplicator_settings', 'a:10:{s:7:\"version\";s:6:\"1.2.52\";s:18:\"uninstall_settings\";b:1;s:15:\"uninstall_files\";b:1;s:16:\"uninstall_tables\";b:1;s:13:\"package_debug\";b:0;s:17:\"package_mysqldump\";b:1;s:22:\"package_mysqldump_path\";s:0:\"\";s:24:\"package_phpdump_qrylimit\";s:3:\"100\";s:17:\"package_zip_flush\";b:0;s:20:\"storage_htaccess_off\";b:0;}', 'yes'),
(152, 'recently_activated', 'a:0:{}', 'yes'),
(176, 'widget_shapely_recent_posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(177, 'widget_shapely-cats', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(178, 'widget_shapely_home_parallax', 'a:6:{s:12:\"_multiwidget\";i:1;i:2;a:9:{s:5:\"title\";s:14:\"Girls Lacrosse\";s:9:\"image_src\";s:79:\"http://localhost/lacrosse/wp-content/uploads/2018/03/goalie_stick_ball_8502.jpg\";s:9:\"image_pos\";s:16:\"background-small\";s:12:\"body_content\";s:22:\"Dripping Spring, Texas\";s:7:\"button1\";s:6:\"Roster\";s:7:\"button2\";s:8:\"Schedule\";s:12:\"button1_link\";s:1:\"#\";s:12:\"button2_link\";s:1:\"#\";s:13:\"border_bottom\";s:0:\"\";}i:3;a:9:{s:5:\"title\";s:8:\"About Us\";s:9:\"image_src\";s:81:\"http://localhost/lacrosse/wp-content/uploads/2018/03/lax_tiger-e1520393027734.jpg\";s:9:\"image_pos\";s:6:\"bottom\";s:12:\"body_content\";s:276:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pulvinar luctus sem, eget porta orci. Maecenas molestie dui id diam feugiat, eu tincidunt mauris aliquam. Duis commodo vitae ligula et interdum. Maecenas faucibus mattis imperdiet. In rhoncus ac ligula id ultricies.\";s:7:\"button1\";s:0:\"\";s:7:\"button2\";s:0:\"\";s:12:\"button1_link\";s:0:\"\";s:12:\"button2_link\";s:0:\"\";s:13:\"border_bottom\";s:0:\"\";}i:4;a:9:{s:5:\"title\";s:12:\"Registration\";s:9:\"image_src\";s:0:\"\";s:9:\"image_pos\";s:6:\"bottom\";s:12:\"body_content\";s:159:\"BE SURE AND RENEW YOUR US LACROSSE MEMBERSHIP OR JOIN BEFORE  FILLING OUT THIS FORM AS YOU WILL NEED YOUR MEMBERSHIP NUMBER AND EXPIRATION DATE FOR THIS FORM!!\";s:7:\"button1\";s:11:\"US Lacrosse\";s:7:\"button2\";s:15:\"DS Registration\";s:12:\"button1_link\";s:36:\"http://www.uslacrosse.org/membership\";s:12:\"button2_link\";s:1:\"#\";s:13:\"border_bottom\";s:2:\"on\";}i:5;a:9:{s:5:\"title\";s:22:\"Small Parallax Section\";s:9:\"image_src\";s:101:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/12/photo-1452723312111-3a7d0db0e024.jpg\";s:9:\"image_pos\";s:16:\"background-small\";s:12:\"body_content\";s:220:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus imperdiet rhoncus porta. Ut quis sem quis purus lobortis dictum. Aliquam nec dignissim nisl. Vivamus cursus feugiat sapien, eget tincidunt leo ornare quis.\";s:7:\"button1\";s:9:\"MORE INFO\";s:7:\"button2\";s:0:\"\";s:12:\"button1_link\";s:1:\"#\";s:12:\"button2_link\";s:0:\"\";s:13:\"border_bottom\";s:0:\"\";}i:6;a:9:{s:5:\"title\";s:17:\"Limitless Options\";s:9:\"image_src\";s:103:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/12/photo-1440557653082-e8e186733eeb-1.jpg\";s:9:\"image_pos\";s:6:\"bottom\";s:12:\"body_content\";s:181:\"Phasellus sed nisi ac dui interdum semper. Etiam consequat fermentum sollicitudin. Fusce vulputate porta faucibus. Vivamus nulla tellus, accumsan non efficitur id, pretium quis ante\";s:7:\"button1\";s:12:\"Download Now\";s:7:\"button2\";s:0:\"\";s:12:\"button1_link\";s:1:\"#\";s:12:\"button2_link\";s:0:\"\";s:13:\"border_bottom\";s:0:\"\";}}', 'yes'),
(179, 'widget_shapely_home_features', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(180, 'widget_shapely_home_cfa', 'a:2:{s:12:\"_multiwidget\";i:1;i:2;a:3:{s:5:\"title\";s:41:\"Do you like this awesome WordPress theme?\";s:6:\"button\";s:12:\"Download Now\";s:11:\"button_link\";s:1:\"#\";}}', 'yes'),
(181, 'widget_shapely_home_clients', 'a:2:{s:12:\"_multiwidget\";i:1;i:2;a:2:{s:5:\"title\";s:0:\"\";s:11:\"client_logo\";a:2:{s:3:\"img\";a:9:{i:0;s:82:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/colorlib-logo.png\";i:1;s:76:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/js-logo.png\";i:2;s:79:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/html5-logo.png\";i:3;s:77:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/css-logo.png\";i:4;s:78:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/less-logo.png\";i:5;s:78:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/sass-logo.png\";i:6;s:83:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/bootstrap-logo.jpg\";i:7;s:79:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/adobe-logo.png\";i:8;s:82:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/03/facebook-logo.png\";}s:4:\"link\";a:9:{i:0;s:0:\"\";i:1;s:1:\"#\";i:2;s:1:\"#\";i:3;s:1:\"#\";i:4;s:1:\"#\";i:5;s:1:\"#\";i:6;s:1:\"#\";i:7;s:1:\"#\";i:8;s:1:\"#\";}}}}', 'yes'),
(182, 'widget_shapely_video_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(211, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.0.1\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1520389158;s:7:\"version\";s:5:\"5.0.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(191, 'jetpack_activated', '1', 'yes'),
(194, 'jetpack_activation_source', 'a:2:{i:0;s:7:\"unknown\";i:1;N;}', 'yes'),
(195, 'jetpack_sync_settings_disable', '0', 'yes'),
(198, 'jetpack_available_modules', 'a:1:{s:3:\"5.9\";a:43:{s:18:\"after-the-deadline\";s:3:\"1.1\";s:8:\"carousel\";s:3:\"1.5\";s:13:\"comment-likes\";s:3:\"5.1\";s:8:\"comments\";s:3:\"1.4\";s:12:\"contact-form\";s:3:\"1.3\";s:20:\"custom-content-types\";s:3:\"3.1\";s:10:\"custom-css\";s:3:\"1.7\";s:21:\"enhanced-distribution\";s:3:\"1.2\";s:16:\"google-analytics\";s:3:\"4.5\";s:19:\"gravatar-hovercards\";s:3:\"1.1\";s:15:\"infinite-scroll\";s:3:\"2.0\";s:8:\"json-api\";s:3:\"1.9\";s:5:\"latex\";s:3:\"1.1\";s:11:\"lazy-images\";s:5:\"5.6.0\";s:5:\"likes\";s:3:\"2.2\";s:6:\"manage\";s:3:\"3.4\";s:8:\"markdown\";s:3:\"2.8\";s:9:\"masterbar\";s:3:\"4.8\";s:9:\"minileven\";s:3:\"1.8\";s:7:\"monitor\";s:3:\"2.6\";s:5:\"notes\";s:3:\"1.9\";s:6:\"photon\";s:3:\"2.0\";s:13:\"post-by-email\";s:3:\"2.0\";s:7:\"protect\";s:3:\"3.4\";s:9:\"publicize\";s:3:\"2.0\";s:3:\"pwa\";s:5:\"5.6.0\";s:13:\"related-posts\";s:3:\"2.9\";s:6:\"search\";s:3:\"5.0\";s:9:\"seo-tools\";s:3:\"4.4\";s:10:\"sharedaddy\";s:3:\"1.1\";s:10:\"shortcodes\";s:3:\"1.1\";s:10:\"shortlinks\";s:3:\"1.1\";s:8:\"sitemaps\";s:3:\"3.9\";s:3:\"sso\";s:3:\"2.6\";s:5:\"stats\";s:3:\"1.1\";s:13:\"subscriptions\";s:3:\"1.2\";s:13:\"tiled-gallery\";s:3:\"2.1\";s:10:\"vaultpress\";s:5:\"0:1.2\";s:18:\"verification-tools\";s:3:\"3.0\";s:10:\"videopress\";s:3:\"2.5\";s:17:\"widget-visibility\";s:3:\"2.4\";s:7:\"widgets\";s:3:\"1.2\";s:7:\"wordads\";s:5:\"4.5.0\";}}', 'yes'),
(199, 'jetpack_options', 'a:4:{s:7:\"version\";s:14:\"5.9:1520389153\";s:11:\"old_version\";s:14:\"5.9:1520389153\";s:28:\"fallback_no_verify_ssl_certs\";i:0;s:9:\"time_diff\";i:0;}', 'yes'),
(200, 'widget_shapely_home_testimonial', 'a:2:{s:12:\"_multiwidget\";i:1;i:2;a:3:{s:5:\"title\";s:22:\"What Our Customers Say\";s:5:\"limit\";i:5;s:9:\"image_src\";s:101:\"https://colorlib.com/shapely/wp-content/uploads/sites/12/2016/12/photo-1451417379553-15d8e8f49cde.jpg\";}}', 'yes'),
(201, 'widget_shapely_home_portfolio', 'a:2:{s:12:\"_multiwidget\";i:1;i:2;a:2:{s:5:\"title\";s:19:\"Our Latest Projects\";s:12:\"body_content\";s:51:\"Here is our latest projects. You&#039;ll love them!\";}}', 'yes'),
(204, 'do_activate', '0', 'yes'),
(203, 'jetpack_testimonial', '0', 'yes'),
(220, 'scporder_install', '1', 'yes'),
(354, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1551030639;s:7:\"checked\";a:5:{s:12:\"Parallax-One\";s:6:\"2.1.11\";s:7:\"shapely\";s:5:\"1.2.1\";s:13:\"twentyfifteen\";s:3:\"1.9\";s:15:\"twentyseventeen\";s:3:\"1.4\";s:13:\"twentysixteen\";s:3:\"1.4\";}s:8:\"response\";a:4:{s:7:\"shapely\";a:4:{s:5:\"theme\";s:7:\"shapely\";s:11:\"new_version\";s:5:\"1.2.4\";s:3:\"url\";s:37:\"https://wordpress.org/themes/shapely/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/theme/shapely.1.2.4.zip\";}s:13:\"twentyfifteen\";a:4:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.2.4.zip\";}s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.1.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.9.zip\";}}s:12:\"translations\";a:0:{}}', 'no'),
(355, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1551030640;s:7:\"checked\";a:8:{s:19:\"akismet/akismet.php\";s:5:\"4.0.2\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.0.1\";s:25:\"duplicator/duplicator.php\";s:6:\"1.2.52\";s:35:\"fancybox-for-wordpress/fancybox.php\";s:6:\"3.0.13\";s:9:\"hello.php\";s:3:\"1.6\";s:19:\"jetpack/jetpack.php\";s:3:\"5.9\";s:39:\"shapely-companion/shapely-companion.php\";s:5:\"1.2.1\";s:53:\"simple-custom-post-order/simple-custom-post-order.php\";s:5:\"2.3.2\";}s:8:\"response\";a:7:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.1.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007\";s:2:\"1x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:14:\"upgrade_notice\";s:147:\"<p>Read the <a href=\"https://contactform7.com/category/releases/\">release announcement post</a> before upgrading. There is an important notice.</p>\";s:6:\"tested\";s:5:\"5.0.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:25:\"duplicator/duplicator.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:24:\"w.org/plugins/duplicator\";s:4:\"slug\";s:10:\"duplicator\";s:6:\"plugin\";s:25:\"duplicator/duplicator.php\";s:11:\"new_version\";s:5:\"1.3.8\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/duplicator/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/duplicator.1.3.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/duplicator/assets/icon-256x256.png?rev=1298463\";s:2:\"1x\";s:63:\"https://ps.w.org/duplicator/assets/icon-128x128.png?rev=1298463\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/duplicator/assets/banner-772x250.png?rev=1645055\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.0.3\";s:12:\"requires_php\";s:6:\"5.2.17\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:35:\"fancybox-for-wordpress/fancybox.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:36:\"w.org/plugins/fancybox-for-wordpress\";s:4:\"slug\";s:22:\"fancybox-for-wordpress\";s:6:\"plugin\";s:35:\"fancybox-for-wordpress/fancybox.php\";s:11:\"new_version\";s:5:\"3.1.9\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/fancybox-for-wordpress/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.1.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321\";s:2:\"1x\";s:75:\"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:77:\"https://ps.w.org/fancybox-for-wordpress/assets/banner-772x250.jpg?rev=1864321\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.1\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:19:\"jetpack/jetpack.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/jetpack\";s:4:\"slug\";s:7:\"jetpack\";s:6:\"plugin\";s:19:\"jetpack/jetpack.php\";s:11:\"new_version\";s:5:\"7.0.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/jetpack/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/jetpack.7.0.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/jetpack/assets/icon-256x256.png?rev=1791404\";s:2:\"1x\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=1791404\";s:3:\"svg\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=1791404\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/jetpack/assets/banner-1544x500.png?rev=1791404\";s:2:\"1x\";s:62:\"https://ps.w.org/jetpack/assets/banner-772x250.png?rev=1791404\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.0.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:39:\"shapely-companion/shapely-companion.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:31:\"w.org/plugins/shapely-companion\";s:4:\"slug\";s:17:\"shapely-companion\";s:6:\"plugin\";s:39:\"shapely-companion/shapely-companion.php\";s:11:\"new_version\";s:5:\"1.2.4\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/shapely-companion/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/shapely-companion.1.2.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/shapely-companion/assets/icon-256x256.jpg?rev=1567092\";s:2:\"1x\";s:70:\"https://ps.w.org/shapely-companion/assets/icon-256x256.jpg?rev=1567092\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/shapely-companion/assets/banner-772x250.jpg?rev=1567092\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.1\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:53:\"simple-custom-post-order/simple-custom-post-order.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:38:\"w.org/plugins/simple-custom-post-order\";s:4:\"slug\";s:24:\"simple-custom-post-order\";s:6:\"plugin\";s:53:\"simple-custom-post-order/simple-custom-post-order.php\";s:11:\"new_version\";s:5:\"2.4.1\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/simple-custom-post-order/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/simple-custom-post-order.2.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/simple-custom-post-order/assets/icon-256x256.jpg?rev=1859717\";s:2:\"1x\";s:77:\"https://ps.w.org/simple-custom-post-order/assets/icon-256x256.jpg?rev=1859717\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:79:\"https://ps.w.org/simple-custom-post-order/assets/banner-772x250.jpg?rev=1859717\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.1\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(345, 'duplicator_ui_view_state', 'a:3:{s:22:\"dup-pack-storage-panel\";s:1:\"1\";s:22:\"dup-pack-archive-panel\";s:1:\"1\";s:24:\"dup-pack-installer-panel\";s:1:\"1\";}', 'yes'),
(346, 'duplicator_package_active', 'O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2018-10-27 16:12:07\";s:7:\"Version\";s:6:\"1.2.52\";s:9:\"VersionWP\";s:5:\"4.9.8\";s:9:\"VersionDB\";s:6:\"5.7.19\";s:10:\"VersionPHP\";s:6:\"5.6.31\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:17:\"20181027_lacrosse\";s:4:\"Hash\";s:35:\"2d9078d6a12b11dd6710_20181027161207\";s:8:\"NameHash\";s:53:\"20181027_lacrosse_2d9078d6a12b11dd6710_20181027161207\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:39:\"C:/wamp64/www/lacrosse/wp-snapshots/tmp\";s:8:\"StoreURL\";s:39:\"http://localhost/lacrosse/wp-snapshots/\";s:8:\"ScanFile\";s:63:\"20181027_lacrosse_2d9078d6a12b11dd6710_20181027161207_scan.json\";s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";O:11:\"DUP_Archive\":19:{s:10:\"FilterDirs\";s:0:\"\";s:11:\"FilterFiles\";s:0:\"\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:14:\"FilterFilesAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:0;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";N;s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:22:\"C:/wamp64/www/lacrosse\";s:4:\"Size\";i:0;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":8:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":4:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":5:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":2:{s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;s:8:\"TreeSize\";a:0:{}s:11:\"TreeWarning\";a:0:{}}s:14:\"RecursiveLinks\";a:0:{}s:10:\"\0*\0Package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2018-10-27 16:12:07\";s:7:\"Version\";s:6:\"1.2.52\";s:9:\"VersionWP\";s:5:\"4.9.8\";s:9:\"VersionDB\";s:6:\"5.7.19\";s:10:\"VersionPHP\";s:6:\"5.6.31\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:17:\"20181027_lacrosse\";s:4:\"Hash\";s:35:\"2d9078d6a12b11dd6710_20181027161207\";s:8:\"NameHash\";s:53:\"20181027_lacrosse_2d9078d6a12b11dd6710_20181027161207\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:39:\"C:/wamp64/www/lacrosse/wp-snapshots/tmp\";s:8:\"StoreURL\";s:39:\"http://localhost/lacrosse/wp-snapshots/\";s:8:\"ScanFile\";N;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";r:22;s:9:\"Installer\";O:13:\"DUP_Installer\":9:{s:4:\"File\";N;s:4:\"Size\";i:0;s:10:\"OptsDBHost\";s:0:\"\";s:10:\"OptsDBPort\";s:0:\"\";s:10:\"OptsDBName\";s:0:\"\";s:10:\"OptsDBUser\";s:0:\"\";s:12:\"OptsSecureOn\";i:0;s:14:\"OptsSecurePass\";s:0:\"\";s:10:\"\0*\0Package\";r:58;}s:8:\"Database\";O:12:\"DUP_Database\":13:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";N;s:4:\"File\";N;s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:28:\"MySQL Community Server (GPL)\";s:10:\"\0*\0Package\";r:58;s:25:\"\0DUP_Database\0dbStorePath\";N;s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;}}s:29:\"\0DUP_Archive\0tmpFilterDirsAll\";a:0:{}s:24:\"\0DUP_Archive\0wpCorePaths\";a:6:{i:0;s:31:\"C:/wamp64/www/lacrosse/wp-admin\";i:1;s:41:\"C:/wamp64/www/lacrosse/wp-content/uploads\";i:2;s:43:\"C:/wamp64/www/lacrosse/wp-content/languages\";i:3;s:41:\"C:/wamp64/www/lacrosse/wp-content/plugins\";i:4;s:40:\"C:/wamp64/www/lacrosse/wp-content/themes\";i:5;s:34:\"C:/wamp64/www/lacrosse/wp-includes\";}}s:9:\"Installer\";r:80;s:8:\"Database\";r:90;}', 'yes'),
(212, 'shapely_imported_demo', '1', 'yes'),
(302, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:17:\"rnin068@gmail.com\";s:7:\"version\";s:5:\"4.9.9\";s:9:\"timestamp\";i:1551030639;}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(223, 'mfbfw', 'a:47:{s:6:\"border\";s:0:\"\";s:11:\"borderColor\";s:7:\"#BBBBBB\";s:15:\"showCloseButton\";s:2:\"on\";s:11:\"closeHorPos\";s:5:\"right\";s:11:\"closeVerPos\";s:3:\"top\";s:12:\"paddingColor\";s:7:\"#FFFFFF\";s:7:\"padding\";s:2:\"10\";s:11:\"overlayShow\";s:2:\"on\";s:12:\"overlayColor\";s:7:\"#666666\";s:14:\"overlayOpacity\";s:3:\"0.3\";s:9:\"titleShow\";s:2:\"on\";s:13:\"titlePosition\";s:6:\"inside\";s:10:\"titleColor\";s:7:\"#333333\";s:13:\"showNavArrows\";s:2:\"on\";s:11:\"zoomOpacity\";s:2:\"on\";s:11:\"zoomSpeedIn\";s:3:\"500\";s:12:\"zoomSpeedOut\";s:3:\"500\";s:15:\"zoomSpeedChange\";s:3:\"300\";s:12:\"transitionIn\";s:4:\"fade\";s:13:\"transitionOut\";s:4:\"fade\";s:6:\"easing\";s:0:\"\";s:8:\"easingIn\";s:11:\"easeOutBack\";s:9:\"easingOut\";s:10:\"easeInBack\";s:12:\"easingChange\";s:14:\"easeInOutQuart\";s:10:\"imageScale\";s:2:\"on\";s:14:\"centerOnScroll\";s:2:\"on\";s:18:\"hideOnContentClick\";s:0:\"\";s:18:\"hideOnOverlayClick\";s:2:\"on\";s:18:\"enableEscapeButton\";s:2:\"on\";s:6:\"cyclic\";s:0:\"\";s:10:\"mouseWheel\";s:0:\"\";s:11:\"galleryType\";s:3:\"all\";s:16:\"customExpression\";s:74:\"jQuery(thumbnails).addClass(\"fancybox\").attr(\"rel\",\"fancybox\").getTitle();\";s:14:\"autoDimensions\";s:2:\"on\";s:10:\"frameWidth\";s:3:\"560\";s:11:\"frameHeight\";s:3:\"340\";s:12:\"loadAtFooter\";s:0:\"\";s:14:\"callbackEnable\";s:0:\"\";s:15:\"callbackOnStart\";s:31:\"function() { alert(\"Start!\"); }\";s:16:\"callbackOnCancel\";s:32:\"function() { alert(\"Cancel!\"); }\";s:18:\"callbackOnComplete\";s:34:\"function() { alert(\"Complete!\"); }\";s:17:\"callbackOnCleanup\";s:33:\"function() { alert(\"CleanUp!\"); }\";s:15:\"callbackOnClose\";s:31:\"function() { alert(\"Close!\"); }\";s:8:\"nojQuery\";s:0:\"\";s:16:\"extraCallsEnable\";s:0:\"\";s:14:\"extraCallsData\";s:0:\"\";s:9:\"uninstall\";s:0:\"\";}', 'yes'),
(224, 'mfbfw_active_version', '3.0.12', 'yes'),
(255, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(61, 29, '_edit_last', '1'),
(60, 27, '_wp_page_template', 'page-templates/no-sidebar.php'),
(6, 7, '_form', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]'),
(7, 7, '_mail', 'a:8:{s:7:\"subject\";s:25:\"Lacrosse \"[your-subject]\"\";s:6:\"sender\";s:31:\"[your-name] <rnin068@gmail.com>\";s:4:\"body\";s:172:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Lacrosse (http://localhost/lacrosse)\";s:9:\"recipient\";s:17:\"rnin068@gmail.com\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(8, 7, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:25:\"Lacrosse \"[your-subject]\"\";s:6:\"sender\";s:28:\"Lacrosse <rnin068@gmail.com>\";s:4:\"body\";s:114:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Lacrosse (http://localhost/lacrosse)\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:27:\"Reply-To: rnin068@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(9, 7, '_messages', 'a:8:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";}'),
(10, 7, '_additional_settings', NULL),
(11, 7, '_locale', 'en_US'),
(12, 8, '_wp_page_template', 'page-templates/template-home.php'),
(16, 12, '_wp_attached_file', '2018/03/Lacrosse-Transparent-PNG-e1520390105597.png'),
(17, 12, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:25;s:6:\"height\";i:61;s:4:\"file\";s:51:\"2018/03/Lacrosse-Transparent-PNG-e1520390105597.png\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"Lacrosse-Transparent-PNG-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"Lacrosse-Transparent-PNG-124x300.png\";s:5:\"width\";i:124;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"Lacrosse-Transparent-PNG-422x1024.png\";s:5:\"width\";i:422;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:36:\"Lacrosse-Transparent-PNG-496x530.png\";s:5:\"width\";i:496;s:6:\"height\";i:530;s:9:\"mime-type\";s:9:\"image/png\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:36:\"Lacrosse-Transparent-PNG-496x350.png\";s:5:\"width\";i:496;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:36:\"Lacrosse-Transparent-PNG-350x300.png\";s:5:\"width\";i:350;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(18, 13, '_wp_attached_file', '2018/03/cropped-Lacrosse-Transparent-PNG.png'),
(19, 13, '_wp_attachment_context', 'custom-logo'),
(20, 13, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:496;s:6:\"height\";i:1204;s:4:\"file\";s:44:\"2018/03/cropped-Lacrosse-Transparent-PNG.png\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"cropped-Lacrosse-Transparent-PNG-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:44:\"cropped-Lacrosse-Transparent-PNG-124x300.png\";s:5:\"width\";i:124;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:45:\"cropped-Lacrosse-Transparent-PNG-422x1024.png\";s:5:\"width\";i:422;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:44:\"cropped-Lacrosse-Transparent-PNG-496x530.png\";s:5:\"width\";i:496;s:6:\"height\";i:530;s:9:\"mime-type\";s:9:\"image/png\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:44:\"cropped-Lacrosse-Transparent-PNG-496x350.png\";s:5:\"width\";i:496;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:44:\"cropped-Lacrosse-Transparent-PNG-350x300.png\";s:5:\"width\";i:350;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(21, 12, '_edit_lock', '1520389978:1'),
(22, 12, '_wp_attachment_backup_sizes', 'a:3:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:496;s:6:\"height\";i:1204;s:4:\"file\";s:28:\"Lacrosse-Transparent-PNG.png\";}s:18:\"full-1520390094544\";a:3:{s:5:\"width\";i:100;s:6:\"height\";i:243;s:4:\"file\";s:43:\"Lacrosse-Transparent-PNG-e1520390086121.png\";}s:18:\"full-1520390105597\";a:3:{s:5:\"width\";i:50;s:6:\"height\";i:121;s:4:\"file\";s:43:\"Lacrosse-Transparent-PNG-e1520390094544.png\";}}'),
(23, 12, '_edit_last', '1'),
(24, 14, '_wp_attached_file', '2018/03/cropped-Lacrosse-Transparent-PNG-e1520390105597.png'),
(25, 14, '_wp_attachment_context', 'custom-logo'),
(26, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:25;s:6:\"height\";i:61;s:4:\"file\";s:59:\"2018/03/cropped-Lacrosse-Transparent-PNG-e1520390105597.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(29, 16, '_wp_attached_file', '2018/03/lax.png'),
(30, 16, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:174;s:6:\"height\";i:156;s:4:\"file\";s:15:\"2018/03/lax.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"lax-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(33, 18, '_wp_attached_file', '2018/03/download.jpg'),
(34, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:348;s:6:\"height\";i:145;s:4:\"file\";s:20:\"2018/03/download.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"download-150x145.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:145;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"download-300x125.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(36, 20, '_wp_attached_file', '2018/03/goalie_stick_ball_8502.jpg'),
(37, 20, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:34:\"2018/03/goalie_stick_ball_8502.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"goalie_stick_ball_8502-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"goalie_stick_ball_8502-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:34:\"goalie_stick_ball_8502-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:35:\"goalie_stick_ball_8502-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:35:\"goalie_stick_ball_8502-1110x530.jpg\";s:5:\"width\";i:1110;s:6:\"height\";i:530;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:34:\"goalie_stick_ball_8502-730x350.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:34:\"goalie_stick_ball_8502-350x300.jpg\";s:5:\"width\";i:350;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"2.8\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:19:\"Canon EOS REBEL T2i\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1427890905\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"28\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:8:\"0.003125\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(38, 21, '_wp_attached_file', '2018/03/DSHSGL15094175424966_20150908141400176.png'),
(39, 21, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:299;s:6:\"height\";i:289;s:4:\"file\";s:50:\"2018/03/DSHSGL15094175424966_20150908141400176.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:50:\"DSHSGL15094175424966_20150908141400176-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(48, 24, '_wp_attached_file', '2018/03/lax_tiger-e1520393027734.jpg'),
(49, 24, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:717;s:4:\"file\";s:36:\"2018/03/lax_tiger-e1520393027734.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"lax_tiger-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"lax_tiger-300x179.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:179;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"lax_tiger-768x459.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:459;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:22:\"lax_tiger-1024x612.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:612;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:22:\"lax_tiger-1110x530.jpg\";s:5:\"width\";i:1110;s:6:\"height\";i:530;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:21:\"lax_tiger-730x350.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:21:\"lax_tiger-350x300.jpg\";s:5:\"width\";i:350;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(50, 24, '_edit_lock', '1520392900:1'),
(52, 24, '_wp_attachment_backup_sizes', 'a:1:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:1450;s:6:\"height\";i:866;s:4:\"file\";s:13:\"lax_tiger.jpg\";}}'),
(53, 24, '_edit_last', '1'),
(58, 27, '_edit_last', '1'),
(59, 27, '_edit_lock', '1520395137:1'),
(62, 29, '_edit_lock', '1520394727:1'),
(63, 29, '_wp_page_template', 'default'),
(64, 31, '_menu_item_type', 'post_type'),
(65, 31, '_menu_item_menu_item_parent', '0'),
(66, 31, '_menu_item_object_id', '27'),
(67, 31, '_menu_item_object', 'page'),
(68, 31, '_menu_item_target', ''),
(69, 31, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(70, 31, '_menu_item_xfn', ''),
(71, 31, '_menu_item_url', ''),
(73, 32, '_menu_item_type', 'post_type'),
(74, 32, '_menu_item_menu_item_parent', '31'),
(75, 32, '_menu_item_object_id', '29'),
(76, 32, '_menu_item_object', 'page'),
(77, 32, '_menu_item_target', ''),
(78, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(79, 32, '_menu_item_xfn', ''),
(80, 32, '_menu_item_url', ''),
(82, 33, '_menu_item_type', 'post_type'),
(83, 33, '_menu_item_menu_item_parent', '0'),
(84, 33, '_menu_item_object_id', '8'),
(85, 33, '_menu_item_object', 'page'),
(86, 33, '_menu_item_target', ''),
(87, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(88, 33, '_menu_item_xfn', ''),
(89, 33, '_menu_item_url', ''),
(101, 38, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1390;s:6:\"height\";i:381;s:4:\"file\";s:18:\"2018/03/banner.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"banner-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"banner-300x82.png\";s:5:\"width\";i:300;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"banner-768x211.png\";s:5:\"width\";i:768;s:6:\"height\";i:211;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:19:\"banner-1024x281.png\";s:5:\"width\";i:1024;s:6:\"height\";i:281;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:19:\"banner-1110x381.png\";s:5:\"width\";i:1110;s:6:\"height\";i:381;s:9:\"mime-type\";s:9:\"image/png\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:18:\"banner-730x350.png\";s:5:\"width\";i:730;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:18:\"banner-350x300.png\";s:5:\"width\";i:350;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(94, 37, '_wp_attached_file', '2018/03/cropped-banner.png'),
(95, 37, '_wp_attachment_context', 'custom-header'),
(96, 37, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1900;s:6:\"height\";i:225;s:4:\"file\";s:26:\"2018/03/cropped-banner.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"cropped-banner-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"cropped-banner-300x36.png\";s:5:\"width\";i:300;s:6:\"height\";i:36;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:25:\"cropped-banner-768x91.png\";s:5:\"width\";i:768;s:6:\"height\";i:91;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:27:\"cropped-banner-1024x121.png\";s:5:\"width\";i:1024;s:6:\"height\";i:121;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:27:\"cropped-banner-1110x225.png\";s:5:\"width\";i:1110;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:26:\"cropped-banner-730x225.png\";s:5:\"width\";i:730;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:26:\"cropped-banner-350x225.png\";s:5:\"width\";i:350;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:36;}'),
(97, 37, '_wp_attachment_custom_header_last_used_shapely', '1520395625'),
(98, 37, '_wp_attachment_is_custom_header', 'shapely'),
(100, 38, '_wp_attached_file', '2018/03/banner.png'),
(102, 39, '_wp_attached_file', '2018/03/cropped-banner-1.png'),
(103, 39, '_wp_attachment_context', 'custom-header'),
(104, 39, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1900;s:6:\"height\";i:225;s:4:\"file\";s:28:\"2018/03/cropped-banner-1.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"cropped-banner-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"cropped-banner-1-300x36.png\";s:5:\"width\";i:300;s:6:\"height\";i:36;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:27:\"cropped-banner-1-768x91.png\";s:5:\"width\";i:768;s:6:\"height\";i:91;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:29:\"cropped-banner-1-1024x121.png\";s:5:\"width\";i:1024;s:6:\"height\";i:121;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-full\";a:4:{s:4:\"file\";s:29:\"cropped-banner-1-1110x225.png\";s:5:\"width\";i:1110;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}s:16:\"shapely-featured\";a:4:{s:4:\"file\";s:28:\"cropped-banner-1-730x225.png\";s:5:\"width\";i:730;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shapely-grid\";a:4:{s:4:\"file\";s:28:\"cropped-banner-1-350x225.png\";s:5:\"width\";i:350;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:38;}'),
(105, 39, '_wp_attachment_custom_header_last_used_shapely', '1520396186'),
(106, 39, '_wp_attachment_is_custom_header', 'shapely');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-03-06 23:00:35', '2018-03-06 23:00:35', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-03-06 23:00:35', '2018-03-06 23:00:35', '', 0, 'http://localhost/lacrosse/?p=1', 0, 'post', '', 1),
(2, 1, '2018-03-06 23:00:35', '2018-03-06 23:00:35', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/lacrosse/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-03-06 23:00:35', '2018-03-06 23:00:35', '', 0, 'http://localhost/lacrosse/?page_id=2', 0, 'page', '', 0),
(28, 1, '2018-03-07 03:53:23', '2018-03-07 03:53:23', 'In order to register to be a Dripping Springs Girl\'s Lacrosse team member, you will need a US Lacrosse membership number and expiration date. If you need to register or renew a membership, that can be done at the national <a href=\"http://www.uslacrosse.org/membership\">US Lacrosse</a> website.\r\n\r\nUpon having you membership number, please fill out the Dripping Spring Registration from.\r\n\r\nRegistration Dues:\r\n\r\n$600\r\n\r\nPayment Methods:\r\n\r\nChecks Payable to:  DSHS Girls Lacrosse\r\n\r\nPaypal:\r\n\r\n&lt;link&gt;\r\n\r\n&nbsp;\r\n\r\nA sports physical will be needed as well before the first league game which will probably be late Jan, early Feb.\r\n\r\n****** We are not able to obtain sports physicals from the school. The player will need to request a hard copy from the athletic department, if they have one.******', 'Registration', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2018-03-07 03:53:23', '2018-03-07 03:53:23', '', 27, 'http://localhost/lacrosse/2018/03/07/27-revision-v1/', 0, 'revision', '', 0),
(6, 0, '2018-03-07 04:16:26', '0000-00-00 00:00:00', '', 'Shapely Backup Settings', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-03-07 04:16:26', '2018-03-07 04:16:26', '', 0, 'http://localhost/lacrosse/?page_id=6', 0, 'page', '', 0),
(7, 1, '2018-03-07 02:19:18', '2018-03-07 02:19:18', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]\nLacrosse \"[your-subject]\"\n[your-name] <rnin068@gmail.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Lacrosse (http://localhost/lacrosse)\nrnin068@gmail.com\nReply-To: [your-email]\n\n0\n0\n\nLacrosse \"[your-subject]\"\nLacrosse <rnin068@gmail.com>\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Lacrosse (http://localhost/lacrosse)\n[your-email]\nReply-To: rnin068@gmail.com\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2018-03-07 02:19:18', '2018-03-07 02:19:18', '', 0, 'http://localhost/lacrosse/?post_type=wpcf7_contact_form&p=7', 0, 'wpcf7_contact_form', '', 0),
(8, 1, '2018-03-07 02:19:19', '2018-03-07 02:19:19', '', 'Front Page', '', 'publish', 'closed', 'closed', '', 'front-page', '', '', '2018-03-07 02:19:19', '2018-03-07 02:19:19', '', 0, 'http://localhost/lacrosse/front-page/', 0, 'page', '', 0),
(9, 1, '2018-03-07 02:19:19', '2018-03-07 02:19:19', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2018-03-07 02:19:19', '2018-03-07 02:19:19', '', 0, 'http://localhost/lacrosse/blog/', 0, 'page', '', 0),
(12, 1, '2018-03-07 02:33:16', '2018-03-07 02:33:16', '', 'Lacrosse-Transparent-PNG', '', 'inherit', 'open', 'closed', '', 'lacrosse-transparent-png', '', '', '2018-03-07 02:35:18', '2018-03-07 02:35:18', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/Lacrosse-Transparent-PNG.png', 0, 'attachment', 'image/png', 0),
(13, 1, '2018-03-07 02:33:34', '2018-03-07 02:33:34', 'http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-Lacrosse-Transparent-PNG.png', 'cropped-Lacrosse-Transparent-PNG.png', '', 'inherit', 'open', 'closed', '', 'cropped-lacrosse-transparent-png-png', '', '', '2018-03-07 02:33:34', '2018-03-07 02:33:34', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-Lacrosse-Transparent-PNG.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2018-03-07 02:36:26', '2018-03-07 02:36:26', 'http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-Lacrosse-Transparent-PNG-e1520390105597.png', 'cropped-Lacrosse-Transparent-PNG-e1520390105597.png', '', 'inherit', 'open', 'closed', '', 'cropped-lacrosse-transparent-png-e1520390105597-png', '', '', '2018-03-07 02:36:26', '2018-03-07 02:36:26', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-Lacrosse-Transparent-PNG-e1520390105597.png', 0, 'attachment', 'image/png', 0),
(16, 1, '2018-03-07 02:41:14', '2018-03-07 02:41:14', '', 'lax', '', 'inherit', 'open', 'closed', '', 'lax', '', '', '2018-03-07 02:41:14', '2018-03-07 02:41:14', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/lax.png', 0, 'attachment', 'image/png', 0),
(17, 1, '2018-03-07 02:44:15', '2018-03-07 02:44:15', '', 'Shapely Backup Settings', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2018-03-07 02:44:15', '2018-03-07 02:44:15', '', 6, 'http://localhost/lacrosse/2018/03/07/6-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2018-03-07 02:45:13', '2018-03-07 02:45:13', '', 'download', '', 'inherit', 'open', 'closed', '', 'download', '', '', '2018-03-07 02:45:13', '2018-03-07 02:45:13', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/download.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2018-03-07 02:47:27', '2018-03-07 02:47:27', '', 'goalie_stick_ball_8502', '', 'inherit', 'open', 'closed', '', 'goalie_stick_ball_8502', '', '', '2018-03-07 02:47:27', '2018-03-07 02:47:27', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/goalie_stick_ball_8502.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2018-03-07 02:58:02', '2018-03-07 02:58:02', '', 'DSHSGL15094175424966_20150908141400176', '', 'inherit', 'open', 'closed', '', 'dshsgl15094175424966_20150908141400176', '', '', '2018-03-07 02:58:02', '2018-03-07 02:58:02', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/DSHSGL15094175424966_20150908141400176.png', 0, 'attachment', 'image/png', 0),
(24, 1, '2018-03-07 03:22:54', '2018-03-07 03:22:54', '', 'lax_tiger', '', 'inherit', 'open', 'closed', '', 'lax_tiger', '', '', '2018-03-07 03:23:55', '2018-03-07 03:23:55', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/lax_tiger.jpg', 0, 'attachment', 'image/jpeg', 0),
(27, 1, '2018-03-07 03:53:23', '2018-03-07 03:53:23', 'In order to register to be a Dripping Springs Girl\'s Lacrosse team member, you will need a US Lacrosse membership number and expiration date. If you need to register or renew a membership, that can be done at the national <a href=\"http://www.uslacrosse.org/membership\">US Lacrosse</a> website.\r\n\r\nUpon having you membership number, please fill out the Dripping Spring Registration from.\r\n\r\nRegistration Dues:\r\n\r\n$600\r\n\r\nPayment Methods:\r\n\r\nChecks Payable to:  DSHS Girls Lacrosse\r\n\r\nPaypal:\r\n\r\n&lt;link&gt;\r\n\r\n&nbsp;\r\n\r\nA sports physical will be needed as well before the first league game which will probably be late Jan, early Feb.\r\n\r\n****** We are not able to obtain sports physicals from the school. The player will need to request a hard copy from the athletic department, if they have one.******', 'Registration', '', 'publish', 'closed', 'closed', '', 'registration', '', '', '2018-03-07 03:58:56', '2018-03-07 03:58:56', '', 0, 'http://localhost/lacrosse/?page_id=27', 0, 'page', '', 0),
(29, 1, '2018-03-07 03:54:06', '2018-03-07 03:54:06', '&lt;REGISTRATION FORM&gt;', 'form', '', 'publish', 'closed', 'closed', '', 'form', '', '', '2018-03-07 03:54:06', '2018-03-07 03:54:06', '', 27, 'http://localhost/lacrosse/?page_id=29', 0, 'page', '', 0),
(30, 1, '2018-03-07 03:54:06', '2018-03-07 03:54:06', '&lt;REGISTRATION FORM&gt;', 'form', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-03-07 03:54:06', '2018-03-07 03:54:06', '', 29, 'http://localhost/lacrosse/2018/03/07/29-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2018-03-07 03:55:43', '2018-03-07 03:55:43', ' ', '', '', 'publish', 'closed', 'closed', '', '31', '', '', '2018-03-07 03:58:04', '2018-03-07 03:58:04', '', 0, 'http://localhost/lacrosse/?p=31', 2, 'nav_menu_item', '', 0),
(32, 1, '2018-03-07 03:55:43', '2018-03-07 03:55:43', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2018-03-07 03:58:04', '2018-03-07 03:58:04', '', 27, 'http://localhost/lacrosse/?p=32', 3, 'nav_menu_item', '', 0),
(33, 1, '2018-03-07 03:55:43', '2018-03-07 03:55:43', '', 'Home', '', 'publish', 'closed', 'closed', '', '33', '', '', '2018-03-07 03:58:04', '2018-03-07 03:58:04', '', 0, 'http://localhost/lacrosse/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2018-03-07 03:59:00', '2018-03-07 03:59:00', 'In order to register to be a Dripping Springs Girl\'s Lacrosse team member, you will need a US Lacrosse membership number and expiration date. If you need to register or renew a membership, that can be done at the national <a href=\"http://www.uslacrosse.org/membership\">US Lacrosse</a> website.\r\n\r\nUpon having you membership number, please fill out the Dripping Spring Registration from.\r\n\r\nRegistration Dues:\r\n\r\n$600\r\n\r\nPayment Methods:\r\n\r\nChecks Payable to:  DSHS Girls Lacrosse\r\n\r\nPaypal:\r\n\r\n&lt;link&gt;\r\n\r\n&nbsp;\r\n\r\nA sports physical will be needed as well before the first league game which will probably be late Jan, early Feb.\r\n\r\n****** We are not able to obtain sports physicals from the school. The player will need to request a hard copy from the athletic department, if they have one.******', 'Registration', '', 'inherit', 'closed', 'closed', '', '27-autosave-v1', '', '', '2018-03-07 03:59:00', '2018-03-07 03:59:00', '', 27, 'http://localhost/lacrosse/2018/03/07/27-autosave-v1/', 0, 'revision', '', 0),
(38, 1, '2018-03-07 04:08:58', '2018-03-07 04:08:58', '', 'banner', '', 'inherit', 'open', 'closed', '', 'banner', '', '', '2018-03-07 04:08:58', '2018-03-07 04:08:58', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/banner.png', 0, 'attachment', 'image/png', 0),
(37, 1, '2018-03-07 04:07:04', '2018-03-07 04:07:04', '', 'cropped-banner.png', '', 'inherit', 'open', 'closed', '', 'cropped-banner-png', '', '', '2018-03-07 04:07:04', '2018-03-07 04:07:04', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-banner.png', 0, 'attachment', 'image/png', 0),
(39, 1, '2018-03-07 04:09:10', '2018-03-07 04:09:10', '', 'cropped-banner-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-banner-1-png', '', '', '2018-03-07 04:09:10', '2018-03-07 04:09:10', '', 0, 'http://localhost/lacrosse/wp-content/uploads/2018/03/cropped-banner-1.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  `term_order` int(4) DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`, `term_order`) VALUES
(1, 'Uncategorized', 'uncategorized', 0, 0),
(2, 'default', 'default', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(31, 2, 0),
(32, 2, 0),
(33, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'lacrosse'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"c69ca5372cc73d72b0741fb9082eaa67f4108bd8b70e06038cf8462bfa4568d7\";a:4:{s:10:\"expiration\";i:1540829331;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1540656531;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '40'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:2:\"::\";}'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(21, 1, 'wp_user-settings', 'libraryContent=browse'),
(22, 1, 'wp_user-settings-time', '1520390025'),
(23, 1, 'nav_menu_recently_edited', '2'),
(24, 1, 'shapely_welcome_notification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'lacrosse', '$P$BtuYtEmjXT/PuLPpnO931hEGT0cDWL/', 'lacrosse', 'rnin068@gmail.com', '', '2018-03-06 23:00:35', '1540656497:$P$BnUhszeTM7AVQ9tC7xAKBpIdEMS3TX.', 0, 'lacrosse');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
