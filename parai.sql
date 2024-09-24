-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 24, 2024 at 03:42 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parai`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
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
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2024-06-30 21:29:22', '2024-06-30 21:29:22', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
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
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8888/PARAI', 'yes'),
(2, 'home', 'http://localhost:8888/PARAI', 'yes'),
(3, 'blogname', 'parai', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'raju@ou.edu', 'yes'),
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
(28, 'permalink_structure', '', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:13:\"cmb2/init.php\";i:1;s:38:\"cmb_field_map-master/cmb-field-map.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'parai', 'yes'),
(41, 'stylesheet', 'parai', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '57155', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '0', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1735334962', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'wp_attachment_pages_enabled', '0', 'yes'),
(100, 'initial_db_version', '57155', 'yes'),
(101, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(102, 'fresh_site', '1', 'yes'),
(103, 'user_count', '1', 'no'),
(104, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:9:{i:1727152162;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1727170162;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1727170169;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1727213362;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1727213369;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1727213370;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1727645376;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1727731762;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(122, 'recovery_keys', 'a:0:{}', 'yes'),
(125, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1727149310;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:13:\"cmb2/init.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:18:\"w.org/plugins/cmb2\";s:4:\"slug\";s:4:\"cmb2\";s:6:\"plugin\";s:13:\"cmb2/init.php\";s:11:\"new_version\";s:6:\"2.11.0\";s:3:\"url\";s:35:\"https://wordpress.org/plugins/cmb2/\";s:7:\"package\";s:47:\"https://downloads.wordpress.org/plugin/cmb2.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:49:\"https://ps.w.org/cmb2/assets/icon.svg?rev=2866672\";s:3:\"svg\";s:49:\"https://ps.w.org/cmb2/assets/icon.svg?rev=2866672\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/cmb2/assets/banner-1544x500.png?rev=2866672\";s:2:\"1x\";s:59:\"https://ps.w.org/cmb2/assets/banner-772x250.png?rev=2866672\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:5:\"3.8.0\";}}s:7:\"checked\";a:2:{s:13:\"cmb2/init.php\";s:6:\"2.11.0\";s:38:\"cmb_field_map-master/cmb-field-map.php\";s:5:\"2.2.0\";}}', 'off'),
(128, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1727149310;s:7:\"checked\";a:1:{s:5:\"parai\";s:0:\"\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'off'),
(140, 'can_compress_scripts', '1', 'yes'),
(151, 'theme_mods_twentytwentyfour', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1719782986;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'no'),
(152, 'current_theme', '', 'yes'),
(153, 'theme_mods_parai', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(154, 'theme_switched', '', 'yes'),
(157, 'finished_updating_comment_type', '1', 'yes'),
(176, '_site_transient_wp_plugin_dependencies_plugin_data', 'a:0:{}', 'no'),
(177, 'recently_activated', 'a:0:{}', 'yes'),
(197, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}', 'yes'),
(198, '_transient_health-check-site-status-result', '{\"good\":15,\"recommended\":7,\"critical\":1}', 'yes'),
(345, 'category_children', 'a:0:{}', 'yes'),
(378, 'type_children', 'a:0:{}', 'yes'),
(393, 'article_type_children', 'a:0:{}', 'yes'),
(434, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.6.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.6.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.6.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.6.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.6.2-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.6.2\";s:7:\"version\";s:5:\"6.6.2\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:3:\"6.6\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.6.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.6.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.6.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.6.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.6.2-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.6.2-rollback-0.zip\";}s:7:\"current\";s:5:\"6.6.2\";s:7:\"version\";s:5:\"6.6.2\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:3:\"6.6\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1727149310;s:15:\"version_checked\";s:3:\"6.6\";s:12:\"translations\";a:0:{}}', 'off'),
(807, '_site_transient_timeout_php_check_ce267f3653936506950ae9448202043a', '1727273413', 'off'),
(808, '_site_transient_php_check_ce267f3653936506950ae9448202043a', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(815, '_site_transient_timeout_browser_fe0673f2a48d047b912b27e2a0c02f9f', '1727473949', 'off'),
(816, '_site_transient_browser_fe0673f2a48d047b912b27e2a0c02f9f', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"128.0.0.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'off'),
(860, '_site_transient_timeout_wp_theme_files_patterns-de423c0a3a2b86ef037de108c2aed83e', '1727151109', 'off'),
(861, '_site_transient_wp_theme_files_patterns-de423c0a3a2b86ef037de108c2aed83e', 'a:2:{s:7:\"version\";s:0:\"\";s:8:\"patterns\";a:0:{}}', 'off'),
(864, '_site_transient_timeout_theme_roots', '1727151110', 'off'),
(865, '_site_transient_theme_roots', 'a:1:{s:5:\"parai\";s:7:\"/themes\";}', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_edit_lock', '1726869277:1'),
(4, 5, '_edit_last', '1'),
(5, 5, 'location_hardcoded', '14.232443977143987, 78.24808424467149'),
(6, 5, 'location', 'a:3:{s:8:\"latitude\";s:17:\"9.577657763595226\";s:9:\"longitude\";s:17:\"78.61469461728515\";s:8:\"polyline\";s:102:\"[{\"lat\":9.577654104936919,\"lng\":78.61881677328978},{\"lat\":10.085228203211752,\"lng\":77.96144154190455}]\";}'),
(7, 7, '_wp_attached_file', '2024/07/scene-1.png'),
(8, 7, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:4:\"file\";s:19:\"2024/07/scene-1.png\";s:8:\"filesize\";i:2002061;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"scene-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:189271;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"scene-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:52634;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"scene-1-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1176915;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(11, 10, '_wp_attached_file', '2024/07/scene-1.png'),
(12, 10, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:4:\"file\";s:19:\"2024/07/scene-1.png\";s:8:\"filesize\";i:2002061;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"scene-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:189271;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"scene-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:52634;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"scene-1-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1176915;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(37, 5, 'location_latitude', '9.577657763595226'),
(38, 5, 'location_longitude', '78.61469461728515'),
(39, 5, 'location_polyline', '[{\"lat\":9.577654104936919,\"lng\":78.61881677328978},{\"lat\":10.085228203211752,\"lng\":77.96144154190455}]'),
(78, 32, '_wp_attached_file', '2024/07/Screenshot-2024-07-13-at-2.10.56 PM.png'),
(79, 32, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2270;s:6:\"height\";i:1376;s:4:\"file\";s:49:\"2024/07/Screenshot-2024-07-13-at-2.10.56 PM.png\";s:8:\"filesize\";i:4198294;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-07-13-at-2.10.56 PM-300x182.png\";s:5:\"width\";i:300;s:6:\"height\";i:182;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:111950;}s:5:\"large\";a:5:{s:4:\"file\";s:50:\"Screenshot-2024-07-13-at-2.10.56 PM-1024x621.png\";s:5:\"width\";i:1024;s:6:\"height\";i:621;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:858856;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-07-13-at-2.10.56 PM-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:45252;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-07-13-at-2.10.56 PM-768x466.png\";s:5:\"width\";i:768;s:6:\"height\";i:466;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:544730;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:50:\"Screenshot-2024-07-13-at-2.10.56 PM-1536x931.png\";s:5:\"width\";i:1536;s:6:\"height\";i:931;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1619908;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:51:\"Screenshot-2024-07-13-at-2.10.56 PM-2048x1241.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1241;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2515516;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-07-13-at-2.10.56 PM-300x169.png\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:103783;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(80, 5, '_thumbnail_id', '32'),
(81, 33, '_edit_lock', '1721665638:1'),
(82, 33, '_edit_last', '1'),
(83, 33, 'location_latitude', '8.716948098304403'),
(84, 33, 'location_longitude', '77.7676235635071'),
(85, 33, 'location', 'a:3:{s:8:\"latitude\";s:17:\"8.716948098304403\";s:9:\"longitude\";s:16:\"77.7676235635071\";s:8:\"polyline\";s:2:\"[]\";}'),
(86, 35, '_edit_lock', '1726870679:1'),
(87, 35, '_edit_last', '1'),
(88, 35, 'location_latitude', '10.78274151093493'),
(89, 35, 'location_longitude', '79.13147592905274'),
(90, 35, 'location', 'a:3:{s:8:\"latitude\";s:17:\"10.78274151093493\";s:9:\"longitude\";s:17:\"79.13147592905274\";s:8:\"polyline\";s:2:\"[]\";}'),
(92, 39, '_wp_attached_file', '2024/07/IMG_2923-Neli-pillar-copy-scaled.jpeg'),
(93, 40, '_wp_attached_file', '2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-scaled.jpeg'),
(94, 41, '_wp_attached_file', '2024/07/IMG_2956-Nelli-pillar-parai-belw-2-scaled.jpeg'),
(95, 42, '_wp_attached_file', '2024/07/IMG_2959-Nelli-pillar-side-CU-copy-scaled.jpeg'),
(96, 39, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1920;s:4:\"file\";s:45:\"2024/07/IMG_2923-Neli-pillar-copy-scaled.jpeg\";s:8:\"filesize\";i:792739;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:38:\"IMG_2923-Neli-pillar-copy-300x225.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19078;}s:5:\"large\";a:5:{s:4:\"file\";s:39:\"IMG_2923-Neli-pillar-copy-1024x768.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:166360;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:38:\"IMG_2923-Neli-pillar-copy-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7183;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:38:\"IMG_2923-Neli-pillar-copy-768x576.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:99738;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:40:\"IMG_2923-Neli-pillar-copy-1536x1152.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:333750;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:40:\"IMG_2923-Neli-pillar-copy-2048x1536.jpeg\";s:5:\"width\";i:2048;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:546380;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:38:\"IMG_2923-Neli-pillar-copy-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15038;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"1.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"iPhone 13 Pro\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1656869470\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"5.7\";s:3:\"iso\";s:3:\"500\";s:13:\"shutter_speed\";s:4:\"0.04\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:30:\"IMG_2923-Neli-pillar-copy.jpeg\";}'),
(97, 40, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:1920;s:6:\"height\";i:2560;s:4:\"file\";s:59:\"2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-scaled.jpeg\";s:8:\"filesize\";i:982014;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:52:\"IMG_2957-Nelli-pillar-parai-dancer-copy-225x300.jpeg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21357;}s:5:\"large\";a:5:{s:4:\"file\";s:53:\"IMG_2957-Nelli-pillar-parai-dancer-copy-768x1024.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:206521;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:52:\"IMG_2957-Nelli-pillar-parai-dancer-copy-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7992;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"IMG_2957-Nelli-pillar-parai-dancer-copy-768x1024.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:206521;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:54:\"IMG_2957-Nelli-pillar-parai-dancer-copy-1152x1536.jpeg\";s:5:\"width\";i:1152;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:416536;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:54:\"IMG_2957-Nelli-pillar-parai-dancer-copy-1536x2048.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:677904;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:52:\"IMG_2957-Nelli-pillar-parai-dancer-copy-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17587;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"1.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"iPhone 13 Pro\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1656870846\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"5.7\";s:3:\"iso\";s:3:\"500\";s:13:\"shutter_speed\";s:4:\"0.04\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:44:\"IMG_2957-Nelli-pillar-parai-dancer-copy.jpeg\";}'),
(98, 42, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:1920;s:6:\"height\";i:2560;s:4:\"file\";s:54:\"2024/07/IMG_2959-Nelli-pillar-side-CU-copy-scaled.jpeg\";s:8:\"filesize\";i:1087412;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:47:\"IMG_2959-Nelli-pillar-side-CU-copy-225x300.jpeg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:23476;}s:5:\"large\";a:5:{s:4:\"file\";s:48:\"IMG_2959-Nelli-pillar-side-CU-copy-768x1024.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:223816;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:47:\"IMG_2959-Nelli-pillar-side-CU-copy-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8915;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"IMG_2959-Nelli-pillar-side-CU-copy-768x1024.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:223816;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"IMG_2959-Nelli-pillar-side-CU-copy-1152x1536.jpeg\";s:5:\"width\";i:1152;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:459892;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:49:\"IMG_2959-Nelli-pillar-side-CU-copy-1536x2048.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:752615;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:47:\"IMG_2959-Nelli-pillar-side-CU-copy-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16945;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"1.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"iPhone 13 Pro\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1656870915\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"5.7\";s:3:\"iso\";s:3:\"400\";s:13:\"shutter_speed\";s:16:\"0.03030303030303\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:39:\"IMG_2959-Nelli-pillar-side-CU-copy.jpeg\";}'),
(99, 41, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:1920;s:6:\"height\";i:2560;s:4:\"file\";s:54:\"2024/07/IMG_2956-Nelli-pillar-parai-belw-2-scaled.jpeg\";s:8:\"filesize\";i:1211855;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:47:\"IMG_2956-Nelli-pillar-parai-belw-2-225x300.jpeg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:24334;}s:5:\"large\";a:5:{s:4:\"file\";s:48:\"IMG_2956-Nelli-pillar-parai-belw-2-768x1024.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:258098;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:47:\"IMG_2956-Nelli-pillar-parai-belw-2-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8950;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"IMG_2956-Nelli-pillar-parai-belw-2-768x1024.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:258098;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"IMG_2956-Nelli-pillar-parai-belw-2-1152x1536.jpeg\";s:5:\"width\";i:1152;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:526068;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:49:\"IMG_2956-Nelli-pillar-parai-belw-2-1536x2048.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:848241;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:47:\"IMG_2956-Nelli-pillar-parai-belw-2-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19865;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"1.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"iPhone 13 Pro\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1656870843\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"5.7\";s:3:\"iso\";s:3:\"640\";s:13:\"shutter_speed\";s:16:\"0.03030303030303\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:39:\"IMG_2956-Nelli-pillar-parai-belw-2.jpeg\";}'),
(100, 33, '_thumbnail_id', '39'),
(102, 50, '_wp_attached_file', '2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-scaled.jpg'),
(103, 49, '_wp_attached_file', '2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-scaled.jpg'),
(104, 48, '_wp_attached_file', '2024/07/IMG_Nandi-Dravidian-dancer-scaled.jpg'),
(105, 48, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1920;s:4:\"file\";s:45:\"2024/07/IMG_Nandi-Dravidian-dancer-scaled.jpg\";s:8:\"filesize\";i:826956;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:38:\"IMG_Nandi-Dravidian-dancer-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:18475;}s:5:\"large\";a:5:{s:4:\"file\";s:39:\"IMG_Nandi-Dravidian-dancer-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:178738;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:38:\"IMG_Nandi-Dravidian-dancer-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6898;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:38:\"IMG_Nandi-Dravidian-dancer-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:105046;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:40:\"IMG_Nandi-Dravidian-dancer-1536x1152.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:363470;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:40:\"IMG_Nandi-Dravidian-dancer-2048x1536.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:582557;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:38:\"IMG_Nandi-Dravidian-dancer-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14129;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:30:\"IMG_Nandi-Dravidian-dancer.jpg\";}'),
(106, 50, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:1920;s:6:\"height\";i:2560;s:4:\"file\";s:58:\"2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-scaled.jpg\";s:8:\"filesize\";i:1038428;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:51:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:29225;}s:5:\"large\";a:5:{s:4:\"file\";s:52:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:261547;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:51:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9810;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:52:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:261547;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:53:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-1152x1536.jpg\";s:5:\"width\";i:1152;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:482688;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:53:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-1536x2048.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:744983;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:51:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22555;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:43:\"IMG_Nandi-Dravidian-dancer-CU-HEIC-copy.jpg\";}'),
(107, 49, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1920;s:4:\"file\";s:61:\"2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-scaled.jpg\";s:8:\"filesize\";i:1180955;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:54:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:25186;}s:5:\"large\";a:5:{s:4:\"file\";s:55:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:251217;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:54:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9342;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:54:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:146401;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:56:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1536x1152.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:516005;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:56:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-2048x1536.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:831602;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:54:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:18689;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:46:\"IMG_Nandi-Dravidian-dancer-front-HEIC-copy.jpg\";}'),
(108, 35, '_thumbnail_id', '49'),
(110, 33, 'location_polyline', '[]'),
(111, 35, 'location_polyline', '[]'),
(112, 58, '_edit_lock', '1726931710:1'),
(113, 59, '_wp_attached_file', '2024/09/Paraimap-Ramu-Karappu-Sami-Adi.mov'),
(114, 59, '_wp_attachment_metadata', 'a:12:{s:8:\"lossless\";b:0;s:8:\"filesize\";i:20303263;s:9:\"mime_type\";s:9:\"video/mp4\";s:6:\"length\";i:46;s:16:\"length_formatted\";s:4:\"0:46\";s:5:\"width\";i:720;s:6:\"height\";i:576;s:10:\"fileformat\";s:3:\"mp4\";s:10:\"dataformat\";s:9:\"quicktime\";s:5:\"codec\";s:5:\"H.264\";s:5:\"audio\";a:7:{s:10:\"dataformat\";s:3:\"mp4\";s:5:\"codec\";s:19:\"ISO/IEC 14496-3 AAC\";s:11:\"sample_rate\";d:48000;s:8:\"channels\";i:2;s:15:\"bits_per_sample\";i:16;s:8:\"lossless\";b:0;s:11:\"channelmode\";s:6:\"stereo\";}s:17:\"created_timestamp\";i:1719935367;}'),
(115, 60, '_wp_attached_file', '2024/09/Screenshot-2024-09-21-at-9.19.40 AM.png'),
(116, 60, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1316;s:6:\"height\";i:822;s:4:\"file\";s:49:\"2024/09/Screenshot-2024-09-21-at-9.19.40 AM.png\";s:8:\"filesize\";i:1173922;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-09-21-at-9.19.40 AM-300x187.png\";s:5:\"width\";i:300;s:6:\"height\";i:187;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:73081;}s:5:\"large\";a:5:{s:4:\"file\";s:50:\"Screenshot-2024-09-21-at-9.19.40 AM-1024x640.png\";s:5:\"width\";i:1024;s:6:\"height\";i:640;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:606066;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-09-21-at-9.19.40 AM-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:32015;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-09-21-at-9.19.40 AM-768x480.png\";s:5:\"width\";i:768;s:6:\"height\";i:480;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:380451;}s:14:\"homepage-thumb\";a:5:{s:4:\"file\";s:49:\"Screenshot-2024-09-21-at-9.19.40 AM-300x169.png\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:67318;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(117, 58, '_thumbnail_id', '60'),
(118, 58, '_edit_last', '1'),
(119, 58, 'location_latitude', '9.607363099999999'),
(120, 58, 'location_longitude', '78.5676594'),
(121, 58, 'location', 'a:3:{s:8:\"latitude\";s:17:\"9.607363099999999\";s:9:\"longitude\";s:10:\"78.5676594\";s:8:\"polyline\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
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
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2024-06-30 21:29:22', '2024-06-30 21:29:22', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2024-06-30 21:29:22', '2024-06-30 21:29:22', '', 0, 'http://localhost:8888/PARAI/?p=1', 0, 'post', '', 1),
(2, 1, '2024-06-30 21:29:22', '2024-06-30 21:29:22', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost:8888/PARAI/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2024-06-30 21:29:22', '2024-06-30 21:29:22', '', 0, 'http://localhost:8888/PARAI/?page_id=2', 0, 'page', '', 0),
(3, 1, '2024-06-30 21:29:22', '2024-06-30 21:29:22', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost:8888/PARAI.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2024-06-30 21:29:22', '2024-06-30 21:29:22', '', 0, 'http://localhost:8888/PARAI/?page_id=3', 0, 'page', '', 0),
(5, 1, '2024-07-01 00:22:45', '2024-07-01 00:22:45', '<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Learning%20process%20&amp;%20timbre.mp4\"></video></figure>\n<!-- /wp:video -->\n\n<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Tappattam%20&amp;%20Karrapu%20Sami.mp4\"></video></figure>\n<!-- /wp:video -->', 'Kurunji Malar Drumset', '', 'publish', 'open', 'closed', '', 'test', '', '', '2024-09-20 21:53:56', '2024-09-20 21:53:56', '', 0, 'http://localhost:8888/PARAI/?post_type=articles&#038;p=5', 0, 'articles', '', 0),
(6, 1, '2024-07-01 00:22:45', '2024-07-01 00:22:45', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->', 'test', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-01 00:22:45', '2024-07-01 00:22:45', '', 5, 'http://localhost:8888/PARAI/?p=6', 0, 'revision', '', 0),
(7, 1, '2024-07-01 03:47:47', '2024-07-01 03:47:47', '', 'scene 1', '', 'inherit', 'open', 'closed', '', 'scene-1', '', '', '2024-07-01 03:47:47', '2024-07-01 03:47:47', '', 5, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/scene-1.png', 0, 'attachment', 'image/png', 0),
(8, 1, '2024-07-01 03:48:32', '2024-07-01 03:48:32', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->', 'Libraries for Dynamic Library Import', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-01 03:48:32', '2024-07-01 03:48:32', '', 5, 'http://localhost:8888/PARAI/?p=8', 0, 'revision', '', 0),
(10, 1, '2024-07-01 23:30:19', '2024-07-01 23:30:19', '', 'scene 1', '', 'inherit', 'open', 'closed', '', 'scene-1-2', '', '', '2024-07-01 23:30:19', '2024-07-01 23:30:19', '', 0, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/scene-1.png', 0, 'attachment', 'image/png', 0),
(24, 1, '2024-07-13 01:45:19', '2024-07-13 01:45:19', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2024-07-13 01:45:19', '2024-07-13 01:45:19', '', 0, 'http://localhost:8888/PARAI/2024/07/13/navigation/', 0, 'wp_navigation', '', 0),
(26, 1, '2024-07-13 18:50:49', '2024-07-13 18:50:49', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->', 'tesst', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-13 18:50:49', '2024-07-13 18:50:49', '', 5, 'http://localhost:8888/PARAI/?p=26', 0, 'revision', '', 0),
(28, 1, '2024-07-13 18:52:13', '2024-07-13 18:52:13', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->', 'Kurunji Malar Drumset', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-13 18:52:13', '2024-07-13 18:52:13', '', 5, 'http://localhost:8888/PARAI/?p=28', 0, 'revision', '', 0),
(30, 1, '2024-07-13 19:06:58', '2024-07-13 19:06:58', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Learning%20process%20&amp;%20timbre.mp4\"></video></figure>\n<!-- /wp:video -->', 'Kurunji Malar Drumset', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-13 19:06:58', '2024-07-13 19:06:58', '', 5, 'http://localhost:8888/PARAI/?p=30', 0, 'revision', '', 0),
(31, 1, '2024-07-13 19:07:15', '2024-07-13 19:07:15', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Learning%20process%20&amp;%20timbre.mp4\"></video></figure>\n<!-- /wp:video -->\n\n<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Tappattam%20&amp;%20Karrapu%20Sami.mp4\"></video></figure>\n<!-- /wp:video -->', 'Kurunji Malar Drumset', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-13 19:07:15', '2024-07-13 19:07:15', '', 5, 'http://localhost:8888/PARAI/?p=31', 0, 'revision', '', 0),
(32, 1, '2024-07-13 19:11:27', '2024-07-13 19:11:27', '', 'Screenshot 2024-07-13 at 2.10.56 PM', '', 'inherit', 'open', 'closed', '', 'screenshot-2024-07-13-at-2-10-56-pm', '', '', '2024-07-13 19:11:27', '2024-07-13 19:11:27', '', 5, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/Screenshot-2024-07-13-at-2.10.56 PM.png', 0, 'attachment', 'image/png', 0),
(33, 1, '2024-07-13 19:30:06', '2024-07-13 19:30:06', '<!-- wp:gallery {\"columns\":4,\"linkTo\":\"media\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-4 is-cropped\"><!-- wp:image {\"id\":39,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy-1024x768.jpeg\" alt=\"\" class=\"wp-image-39\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":41,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2-768x1024.jpeg\" alt=\"\" class=\"wp-image-41\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":40,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-40\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":42,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-42\"/></a></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>7th Century Nellaiappar Temple in Tirunelveli. Musical Pillars with dancing frame drummer below its base.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><!-- wp:list-item -->\n<li>South Indian/Dravidian style drummers who accompany dancers playing larger frame drums with their hands. These are typically friezes. A sub-category of these include larger, singular figures on columns.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>In most of the temples we documented Dravidian style (primarily male) drummers accompanying female dancers on larger single headed frame drums played with their hands. Drummers were typically bent as though moving or dancing with the dancer, while the bottom edge of the large frame sat on their bent knee. Many friezes with these images were placed across the top edge of a temple room below the ceiling.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Nellaiappar temple in Tirunelvelli includes a four-inch image of a parai accompanying a dancer at the front and on the right side of the base platform of the famous musical pillars (SL). This is just outside the sanctum so likely 7th C. Pandiyan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The subcategory of a Dravidian dancing drummer on a pillar includes the following: A pillar on the front left side of the Nandi Mandabam at the Chola, Brihadeshvara Temple of Thanjavur. While the temple was built by Raja Raja I in 1009 the addition of the Nandi Mandabam was during the Nayaka period, after 1500 (Mitchell 2008). The image is an approximately three-foot tall carving on a column of a single shirtless (south Indian style) drummer dancing with a small frame drum at chest level.</p>\n<!-- /wp:paragraph -->', 'Tirunelveli', '', 'publish', 'open', 'closed', '', 'tirunelveli', '', '', '2024-07-13 21:49:02', '2024-07-13 21:49:02', '', 0, 'http://localhost:8888/PARAI/?post_type=articles&#038;p=33', 0, 'articles', '', 0),
(34, 1, '2024-07-13 19:30:06', '2024-07-13 19:30:06', '', 'Tirunelveli', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2024-07-13 19:30:06', '2024-07-13 19:30:06', '', 33, 'http://localhost:8888/PARAI/?p=34', 0, 'revision', '', 0),
(35, 1, '2024-07-13 19:30:34', '2024-07-13 19:30:34', '<!-- wp:gallery {\"linkTo\":\"media\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":50,\"sizeSlug\":\"large\",\"linkDestination\":\"media\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-scaled.jpg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\" alt=\"\" class=\"wp-image-50\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-scaled.jpg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1024x768.jpg\" alt=\"\" class=\"wp-image-49\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":48,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-scaled.jpg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-1024x768.jpg\" alt=\"\" class=\"wp-image-48\"/></a></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Tanjavur', '', 'publish', 'open', 'closed', '', 'tanjavur', '', '', '2024-09-20 21:56:15', '2024-09-20 21:56:15', '', 0, 'http://localhost:8888/PARAI/?post_type=articles&#038;p=35', 0, 'articles', '', 0),
(36, 1, '2024-07-13 19:30:34', '2024-07-13 19:30:34', '', 'Tanjavur', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2024-07-13 19:30:34', '2024-07-13 19:30:34', '', 35, 'http://localhost:8888/PARAI/?p=36', 0, 'revision', '', 0),
(37, 1, '2024-07-13 19:31:38', '2024-07-13 19:31:38', '<!-- wp:paragraph -->\n<p>7th Century Nellaiappar Temple in Tirunelveli. Musical Pillars with dancing frame drummer below its base.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><!-- wp:list-item -->\n<li>South Indian/Dravidian style drummers who accompany dancers playing larger frame drums with their hands. These are typically friezes. A sub-category of these include larger, singular figures on columns.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>In most of the temples we documented Dravidian style (primarily male) drummers accompanying female dancers on larger single headed frame drums played with their hands. Drummers were typically bent as though moving or dancing with the dancer, while the bottom edge of the large frame sat on their bent knee. Many friezes with these images were placed across the top edge of a temple room below the ceiling.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Nellaiappar temple in Tirunelvelli includes a four-inch image of a parai accompanying a dancer at the front and on the right side of the base platform of the famous musical pillars (SL). This is just outside the sanctum so likely 7th C. Pandiyan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The subcategory of a Dravidian dancing drummer on a pillar includes the following: A pillar on the front left side of the Nandi Mandabam at the Chola, Brihadeshvara Temple of Thanjavur. While the temple was built by Raja Raja I in 1009 the addition of the Nandi Mandabam was during the Nayaka period, after 1500 (Mitchell 2008). The image is an approximately three-foot tall carving on a column of a single shirtless (south Indian style) drummer dancing with a small frame drum at chest level.</p>\n<!-- /wp:paragraph -->', 'Tirunelveli', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2024-07-13 19:31:38', '2024-07-13 19:31:38', '', 33, 'http://localhost:8888/PARAI/?p=37', 0, 'revision', '', 0),
(39, 1, '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 'IMG_2923-Neli-pillar-copy', '', 'inherit', 'open', 'closed', '', 'img_2923-neli-pillar-copy', '', '', '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 33, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy.jpeg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 'IMG_2957-Nelli-pillar-parai-dancer-copy', '', 'inherit', 'open', 'closed', '', 'img_2957-nelli-pillar-parai-dancer-copy', '', '', '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 33, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy.jpeg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 'IMG_2956-Nelli-pillar-parai-belw-2', '', 'inherit', 'open', 'closed', '', 'img_2956-nelli-pillar-parai-belw-2', '', '', '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 33, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2.jpeg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 'IMG_2959-Nelli-pillar-side-CU-copy', '', 'inherit', 'open', 'closed', '', 'img_2959-nelli-pillar-side-cu-copy', '', '', '2024-07-13 19:32:37', '2024-07-13 19:32:37', '', 33, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy.jpeg', 0, 'attachment', 'image/jpeg', 0),
(43, 1, '2024-07-13 19:32:39', '2024-07-13 19:32:39', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/e2249bcc-07de-4c6e-9950-73ce5c664f75\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/fae63a8a-c15b-49cd-ac9e-8501b841dcbf\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/17875c67-b25d-4cbd-b5d7-0b35f57de3fe\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/0a93c62b-e652-4cf3-8466-24b392efe02b\" alt=\"\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>7th Century Nellaiappar Temple in Tirunelveli. Musical Pillars with dancing frame drummer below its base.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><!-- wp:list-item -->\n<li>South Indian/Dravidian style drummers who accompany dancers playing larger frame drums with their hands. These are typically friezes. A sub-category of these include larger, singular figures on columns.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>In most of the temples we documented Dravidian style (primarily male) drummers accompanying female dancers on larger single headed frame drums played with their hands. Drummers were typically bent as though moving or dancing with the dancer, while the bottom edge of the large frame sat on their bent knee. Many friezes with these images were placed across the top edge of a temple room below the ceiling.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Nellaiappar temple in Tirunelvelli includes a four-inch image of a parai accompanying a dancer at the front and on the right side of the base platform of the famous musical pillars (SL). This is just outside the sanctum so likely 7th C. Pandiyan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The subcategory of a Dravidian dancing drummer on a pillar includes the following: A pillar on the front left side of the Nandi Mandabam at the Chola, Brihadeshvara Temple of Thanjavur. While the temple was built by Raja Raja I in 1009 the addition of the Nandi Mandabam was during the Nayaka period, after 1500 (Mitchell 2008). The image is an approximately three-foot tall carving on a column of a single shirtless (south Indian style) drummer dancing with a small frame drum at chest level.</p>\n<!-- /wp:paragraph -->', 'Tirunelveli', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2024-07-13 19:32:39', '2024-07-13 19:32:39', '', 33, 'http://localhost:8888/PARAI/?p=43', 0, 'revision', '', 0),
(44, 1, '2024-07-13 19:33:06', '2024-07-13 19:33:06', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":39,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy-1024x768.jpeg\" alt=\"\" class=\"wp-image-39\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":41,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2-768x1024.jpeg\" alt=\"\" class=\"wp-image-41\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":40,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-40\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":42,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-42\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>7th Century Nellaiappar Temple in Tirunelveli. Musical Pillars with dancing frame drummer below its base.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><!-- wp:list-item -->\n<li>South Indian/Dravidian style drummers who accompany dancers playing larger frame drums with their hands. These are typically friezes. A sub-category of these include larger, singular figures on columns.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>In most of the temples we documented Dravidian style (primarily male) drummers accompanying female dancers on larger single headed frame drums played with their hands. Drummers were typically bent as though moving or dancing with the dancer, while the bottom edge of the large frame sat on their bent knee. Many friezes with these images were placed across the top edge of a temple room below the ceiling.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Nellaiappar temple in Tirunelvelli includes a four-inch image of a parai accompanying a dancer at the front and on the right side of the base platform of the famous musical pillars (SL). This is just outside the sanctum so likely 7th C. Pandiyan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The subcategory of a Dravidian dancing drummer on a pillar includes the following: A pillar on the front left side of the Nandi Mandabam at the Chola, Brihadeshvara Temple of Thanjavur. While the temple was built by Raja Raja I in 1009 the addition of the Nandi Mandabam was during the Nayaka period, after 1500 (Mitchell 2008). The image is an approximately three-foot tall carving on a column of a single shirtless (south Indian style) drummer dancing with a small frame drum at chest level.</p>\n<!-- /wp:paragraph -->', 'Tirunelveli', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2024-07-13 19:33:06', '2024-07-13 19:33:06', '', 33, 'http://localhost:8888/PARAI/?p=44', 0, 'revision', '', 0),
(45, 1, '2024-07-13 19:34:08', '2024-07-13 19:34:08', '<!-- wp:gallery {\"columns\":4,\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-4 is-cropped\"><!-- wp:image {\"id\":39,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy-1024x768.jpeg\" alt=\"\" class=\"wp-image-39\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":41,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2-768x1024.jpeg\" alt=\"\" class=\"wp-image-41\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":40,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-40\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":42,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-42\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>7th Century Nellaiappar Temple in Tirunelveli. Musical Pillars with dancing frame drummer below its base.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><!-- wp:list-item -->\n<li>South Indian/Dravidian style drummers who accompany dancers playing larger frame drums with their hands. These are typically friezes. A sub-category of these include larger, singular figures on columns.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>In most of the temples we documented Dravidian style (primarily male) drummers accompanying female dancers on larger single headed frame drums played with their hands. Drummers were typically bent as though moving or dancing with the dancer, while the bottom edge of the large frame sat on their bent knee. Many friezes with these images were placed across the top edge of a temple room below the ceiling.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Nellaiappar temple in Tirunelvelli includes a four-inch image of a parai accompanying a dancer at the front and on the right side of the base platform of the famous musical pillars (SL). This is just outside the sanctum so likely 7th C. Pandiyan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The subcategory of a Dravidian dancing drummer on a pillar includes the following: A pillar on the front left side of the Nandi Mandabam at the Chola, Brihadeshvara Temple of Thanjavur. While the temple was built by Raja Raja I in 1009 the addition of the Nandi Mandabam was during the Nayaka period, after 1500 (Mitchell 2008). The image is an approximately three-foot tall carving on a column of a single shirtless (south Indian style) drummer dancing with a small frame drum at chest level.</p>\n<!-- /wp:paragraph -->', 'Tirunelveli', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2024-07-13 19:34:08', '2024-07-13 19:34:08', '', 33, 'http://localhost:8888/PARAI/?p=45', 0, 'revision', '', 0),
(46, 1, '2024-07-13 19:34:28', '2024-07-13 19:34:28', '<!-- wp:gallery {\"columns\":4,\"linkTo\":\"media\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-4 is-cropped\"><!-- wp:image {\"id\":39,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2923-Neli-pillar-copy-1024x768.jpeg\" alt=\"\" class=\"wp-image-39\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":41,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2956-Nelli-pillar-parai-belw-2-768x1024.jpeg\" alt=\"\" class=\"wp-image-41\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":40,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2957-Nelli-pillar-parai-dancer-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-40\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":42,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy-scaled.jpeg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_2959-Nelli-pillar-side-CU-copy-768x1024.jpeg\" alt=\"\" class=\"wp-image-42\"/></a></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>7th Century Nellaiappar Temple in Tirunelveli. Musical Pillars with dancing frame drummer below its base.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><!-- wp:list-item -->\n<li>South Indian/Dravidian style drummers who accompany dancers playing larger frame drums with their hands. These are typically friezes. A sub-category of these include larger, singular figures on columns.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>In most of the temples we documented Dravidian style (primarily male) drummers accompanying female dancers on larger single headed frame drums played with their hands. Drummers were typically bent as though moving or dancing with the dancer, while the bottom edge of the large frame sat on their bent knee. Many friezes with these images were placed across the top edge of a temple room below the ceiling.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Nellaiappar temple in Tirunelvelli includes a four-inch image of a parai accompanying a dancer at the front and on the right side of the base platform of the famous musical pillars (SL). This is just outside the sanctum so likely 7th C. Pandiyan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The subcategory of a Dravidian dancing drummer on a pillar includes the following: A pillar on the front left side of the Nandi Mandabam at the Chola, Brihadeshvara Temple of Thanjavur. While the temple was built by Raja Raja I in 1009 the addition of the Nandi Mandabam was during the Nayaka period, after 1500 (Mitchell 2008). The image is an approximately three-foot tall carving on a column of a single shirtless (south Indian style) drummer dancing with a small frame drum at chest level.</p>\n<!-- /wp:paragraph -->', 'Tirunelveli', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2024-07-13 19:34:28', '2024-07-13 19:34:28', '', 33, 'http://localhost:8888/PARAI/?p=46', 0, 'revision', '', 0),
(48, 1, '2024-07-13 19:44:55', '2024-07-13 19:44:55', '', 'IMG_Nandi-Dravidian-dancer', '', 'inherit', 'open', 'closed', '', 'img_nandi-dravidian-dancer', '', '', '2024-07-13 19:44:55', '2024-07-13 19:44:55', '', 35, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2024-07-13 19:44:55', '2024-07-13 19:44:55', '', 'IMG_Nandi-Dravidian-dancer-front-HEIC-copy', '', 'inherit', 'open', 'closed', '', 'img_nandi-dravidian-dancer-front-heic-copy', '', '', '2024-07-13 19:44:55', '2024-07-13 19:44:55', '', 35, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2024-07-13 19:44:55', '2024-07-13 19:44:55', '', 'IMG_Nandi-Dravidian-dancer-CU-HEIC-copy', '', 'inherit', 'open', 'closed', '', 'img_nandi-dravidian-dancer-cu-heic-copy', '', '', '2024-07-13 19:44:55', '2024-07-13 19:44:55', '', 35, 'http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2024-07-13 19:44:58', '2024-07-13 19:44:58', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/1390ef7c-afdd-49de-8c03-696603a1e6fe\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/0775ed96-6f66-419d-ac09-ef6eba3876e0\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"blob:http://localhost:8888/9878eb91-af94-4b1e-bbe5-14d49e5509e3\" alt=\"\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Tanjavur', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2024-07-13 19:44:58', '2024-07-13 19:44:58', '', 35, 'http://localhost:8888/PARAI/?p=51', 0, 'revision', '', 0),
(52, 1, '2024-07-13 19:45:00', '2024-07-13 19:45:00', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":50,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\" alt=\"\" class=\"wp-image-50\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1024x768.jpg\" alt=\"\" class=\"wp-image-49\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":48,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-1024x768.jpg\" alt=\"\" class=\"wp-image-48\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Tanjavur', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2024-07-13 19:45:00', '2024-07-13 19:45:00', '', 35, 'http://localhost:8888/PARAI/?p=52', 0, 'revision', '', 0),
(53, 1, '2024-07-13 19:47:12', '2024-07-13 19:47:12', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":50,\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\" alt=\"\" class=\"wp-image-50\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1024x768.jpg\" alt=\"\" class=\"wp-image-49\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":48,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-1024x768.jpg\" alt=\"\" class=\"wp-image-48\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Tanjavur', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2024-07-13 19:47:12', '2024-07-13 19:47:12', '', 35, 'http://localhost:8888/PARAI/?p=53', 0, 'revision', '', 0),
(54, 1, '2024-07-13 19:48:20', '2024-07-13 19:48:20', '<!-- wp:gallery {\"linkTarget\":\"_blank\",\"linkTo\":\"media\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":50,\"sizeSlug\":\"large\",\"linkDestination\":\"media\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-scaled.jpg\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\" alt=\"\" class=\"wp-image-50\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-scaled.jpg\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1024x768.jpg\" alt=\"\" class=\"wp-image-49\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":48,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-scaled.jpg\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-1024x768.jpg\" alt=\"\" class=\"wp-image-48\"/></a></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Tanjavur', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2024-07-13 19:48:20', '2024-07-13 19:48:20', '', 35, 'http://localhost:8888/PARAI/?p=54', 0, 'revision', '', 0),
(55, 1, '2024-07-13 19:48:30', '2024-07-13 19:48:30', '<!-- wp:gallery {\"linkTo\":\"media\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":50,\"sizeSlug\":\"large\",\"linkDestination\":\"media\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-scaled.jpg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-CU-HEIC-copy-768x1024.jpg\" alt=\"\" class=\"wp-image-50\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-scaled.jpg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-front-HEIC-copy-1024x768.jpg\" alt=\"\" class=\"wp-image-49\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":48,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-scaled.jpg\"><img src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/IMG_Nandi-Dravidian-dancer-1024x768.jpg\" alt=\"\" class=\"wp-image-48\"/></a></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Tanjavur', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2024-07-13 19:48:30', '2024-07-13 19:48:30', '', 35, 'http://localhost:8888/PARAI/?p=55', 0, 'revision', '', 0),
(56, 1, '2024-07-13 19:51:24', '2024-07-13 19:51:24', '<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Learning%20process%20&amp;%20timbre.mp4\"></video></figure>\n<!-- /wp:video -->\n\n<!-- wp:video -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/07/Tappattam%20&amp;%20Karrapu%20Sami.mp4\"></video></figure>\n<!-- /wp:video -->', 'Kurunji Malar Drumset', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2024-07-13 19:51:24', '2024-07-13 19:51:24', '', 5, 'http://localhost:8888/PARAI/?p=56', 0, 'revision', '', 0),
(57, 1, '2024-09-20 21:52:29', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2024-09-20 21:52:29', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/PARAI/?p=57', 0, 'post', '', 0),
(58, 1, '2024-09-21 14:19:59', '2024-09-21 14:19:59', '<!-- wp:video {\"id\":59} -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/09/Paraimap-Ramu-Karappu-Sami-Adi.mov\"></video></figure>\n<!-- /wp:video -->', 'Paraimap Ramu Karappu Sami Adi', '', 'publish', 'open', 'closed', '', 'paraimap-ramu-karappu-sami-adi', '', '', '2024-09-21 14:19:59', '2024-09-21 14:19:59', '', 0, 'http://localhost:8888/PARAI/?post_type=articles&#038;p=58', 0, 'articles', '', 0),
(59, 1, '2024-09-21 14:19:09', '2024-09-21 14:19:09', '', 'Paraimap Ramu Karappu Sami Adi', '', 'inherit', 'open', 'closed', '', 'paraimap-ramu-karappu-sami-adi', '', '', '2024-09-21 14:19:09', '2024-09-21 14:19:09', '', 58, 'http://localhost:8888/PARAI/wp-content/uploads/2024/09/Paraimap-Ramu-Karappu-Sami-Adi.mov', 0, 'attachment', 'video/quicktime', 0),
(60, 1, '2024-09-21 14:19:54', '2024-09-21 14:19:54', '', 'Screenshot 2024-09-21 at 9.19.40 AM', '', 'inherit', 'open', 'closed', '', 'screenshot-2024-09-21-at-9-19-40-am', '', '', '2024-09-21 14:19:54', '2024-09-21 14:19:54', '', 58, 'http://localhost:8888/PARAI/wp-content/uploads/2024/09/Screenshot-2024-09-21-at-9.19.40 AM.png', 0, 'attachment', 'image/png', 0),
(61, 1, '2024-09-21 14:19:59', '2024-09-21 14:19:59', '<!-- wp:video {\"id\":59} -->\n<figure class=\"wp-block-video\"><video controls src=\"http://localhost:8888/PARAI/wp-content/uploads/2024/09/Paraimap-Ramu-Karappu-Sami-Adi.mov\"></video></figure>\n<!-- /wp:video -->', 'Paraimap Ramu Karappu Sami Adi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2024-09-21 14:19:59', '2024-09-21 14:19:59', '', 58, 'http://localhost:8888/PARAI/?p=61', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Historical Place', 'historical-place', 0),
(3, 'Musical Group', 'musical-group', 0),
(4, 'category 3', 'category-3', 0),
(5, 'tag 1', 'tag-1', 0),
(6, 'tag5', 'tag5', 0),
(7, 'tag 2', 'tag-2', 0),
(8, 'post-format-video', 'post-format-video', 0),
(9, 'post-format-gallery', 'post-format-gallery', 0),
(10, 'historical site', 'historical-site', 0),
(11, 'musical group', 'musical-group', 0),
(18, 'ggg', 'ggg', 0),
(21, 'Historical Site', 'historical-site', 0),
(22, 'Musical Group', 'musical-group', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 3, 0),
(5, 11, 0),
(5, 22, 0),
(33, 2, 0),
(33, 10, 0),
(33, 21, 0),
(35, 2, 0),
(35, 10, 0),
(35, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 2),
(3, 3, 'category', '', 0, 1),
(4, 4, 'category', '', 0, 0),
(5, 5, 'post_tag', '', 0, 0),
(6, 6, 'post_tag', '', 0, 0),
(7, 7, 'post_tag', '', 0, 0),
(8, 8, 'post_format', '', 0, 0),
(9, 9, 'post_format', '', 0, 0),
(10, 10, 'type', '', 0, 2),
(11, 11, 'type', '', 0, 1),
(18, 18, 'type', '', 0, 0),
(21, 21, 'article_type', '', 0, 2),
(22, 22, 'article_type', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'false'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"9bd95496541f56c22ecd78349f5163b5f08fb7d9e5bce7afbd29734fa7f256a6\";a:4:{s:10:\"expiration\";i:1727041949;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36\";s:5:\"login\";i:1726869149;}s:64:\"68f8b7f5d08daf5c4c90741e1a9fc664ab250b34998791afc19b3422333d817a\";a:4:{s:10:\"expiration\";i:1727101078;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36\";s:5:\"login\";i:1726928278;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '57'),
(18, 1, 'wp_persisted_preferences', 'a:3:{s:14:\"core/edit-post\";a:1:{s:12:\"welcomeGuide\";b:0;}s:9:\"_modified\";s:24:\"2024-09-21T14:29:47.575Z\";s:4:\"core\";a:3:{s:10:\"openPanels\";a:6:{i:0;s:11:\"post-status\";i:1;s:14:\"featured-image\";i:2;s:23:\"taxonomy-panel-category\";i:3;s:23:\"taxonomy-panel-post_tag\";i:4;s:12:\"post-excerpt\";i:5;s:16:\"discussion-panel\";}s:34:\"isInspectorControlsTabsHintVisible\";b:0;s:26:\"isComplementaryAreaVisible\";b:0;}}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse'),
(20, 1, 'wp_user-settings-time', '1720835144'),
(21, 1, 'closedpostboxes_articles', 'a:0:{}'),
(22, 1, 'metaboxhidden_articles', 'a:0:{}'),
(23, 1, 'meta-box-order_articles', 'a:3:{s:6:\"normal\";s:16:\"location_metabox\";s:8:\"advanced\";s:0:\"\";s:4:\"side\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BYpMkJ1pHdOTOasEfp1zdQAGCypE4X/', 'admin', 'raju@ou.edu', 'http://localhost:8888/PARAI', '2024-06-30 21:29:22', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=866;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
