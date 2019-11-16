-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2019 at 02:24 AM
-- Server version: 10.2.22-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phoeni24_cebu`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `log_trusted_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_trusted_port` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_remote_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_remote_port` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_received` float NOT NULL DEFAULT 0,
  `log_send` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id_from` int(11) NOT NULL,
  `user_id_to` int(11) NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_unread` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_info`
--

CREATE TABLE `message_info` (
  `info` varchar(500) NOT NULL,
  `show_info` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_info`
--

INSERT INTO `message_info` (`info`, `show_info`) VALUES
('Do not use for Torrent Application !', 1),
('Modified Script by: -Syndicate- [PHCorner]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `private-vouchers`
--

CREATE TABLE `private-vouchers` (
  `code_name` varchar(50) NOT NULL,
  `user_id` int(100) NOT NULL,
  `reseller_id` int(100) NOT NULL,
  `is_used` int(1) NOT NULL,
  `date_used` varchar(50) NOT NULL,
  `time_stamp` text NOT NULL,
  `duration` bigint(50) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `private-vouchers`
--

INSERT INTO `private-vouchers` (`code_name`, `user_id`, `reseller_id`, `is_used`, `date_used`, `time_stamp`, `duration`) VALUES
('AVB-GAJI-W2F-66DQ', 1, 1, 1, '2018-04-21 07:27:48', '2018-04-21 07:27:40', 2592000),
('HW4-I0SE-2BG-OIMG', 2260, 1, 1, '2018-04-21 07:38:19', '2018-04-21 07:38:15', 2592000),
('5HG-UTQF-GY1-VK5P', 2259, 1, 1, '2018-04-21 07:39:15', '2018-04-21 07:39:05', 2592000),
('0VC-XFH2-JFQ-NQWI', 2260, 1, 1, '2018-04-21 07:40:32', '2018-04-21 07:40:22', 2592000),
('6NM-KYVM-3K1-KE2R', 2259, 1, 1, '2018-04-21 07:52:44', '2018-04-21 07:52:33', 2592000),
('G6H-LH1T-CQM-W4A4', 2261, 1, 1, '2018-04-21 21:09:21', '2018-04-21 21:09:19', 2592000),
('CB4-AWEP-02O-DXYU', 1, 1, 1, '2018-04-23 07:54:13', '2018-04-23 07:52:51', 2592000),
('VFR-6GSQ-K1G-GQ02', 2265, 1, 1, '2018-04-26 05:01:39', '2018-04-26 05:01:34', 2592000),
('FRM-QIK2-3HA-3VDH', 0, 1, 0, '', '2018-04-26 12:02:23', 2592000),
('O5Z-HDRS-OH2-1RR1', 0, 2267, 0, '', '2019-04-13 01:32:46', 2592000);

-- --------------------------------------------------------

--
-- Table structure for table `server_list`
--

CREATE TABLE `server_list` (
  `server_id` int(255) NOT NULL,
  `server_name` varchar(25) NOT NULL,
  `server_ip` varchar(20) NOT NULL,
  `server_category` enum('premium','vip','proxy') NOT NULL DEFAULT 'premium',
  `server_tcp` varchar(15) NOT NULL DEFAULT 'tcp1',
  `server_parser` varchar(255) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `value` text NOT NULL,
  `title` text NOT NULL,
  `placeholder` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `title`, `placeholder`) VALUES
(1, 'site_name', 'Cebunet VPN', 'Site Name', 'Site Name'),
(2, 'home_title', 'WELCOME TO Cebunet VPN', 'Home Title', 'Home Title'),
(3, 'home_message', 'Hello Welcome To Cebunet VPN', 'Home Message (HTML DISABLED) Warning: Fix homepage with wysiwyg', 'Home Message'),
(4, 'home_theme', 'success', 'Home Theme', 'default | primary | success | info | warning | danger | blue | teal | orange | red'),
(5, 'brand_color', 'yellow', 'Brand Color', 'Color Code'),
(6, 'link_color', 'red', 'Link Color', 'Color Code'),
(7, 'google_ads', 'Login using your existing account, if you\'re not registered contact our team to assist you.', 'Google Ads Code', 'Google Ads Code'),
(8, 'is_maintenance', '0', 'Maintenance Mode (Freeze Accounts)', 'Set value to 1 to freeze all account, otherwise set to 0.');

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE `site_options` (
  `email_validation` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_options`
--

INSERT INTO `site_options` (`email_validation`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL DEFAULT '',
  `user_pass` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(50) NOT NULL DEFAULT '',
  `full_name` varchar(50) NOT NULL,
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddress` varchar(50) NOT NULL DEFAULT '0.0.0.0',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `code` varchar(10) NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT 0,
  `is_vip` tinyint(1) NOT NULL DEFAULT 0,
  `duration` bigint(50) NOT NULL DEFAULT 0,
  `is_reseller` tinyint(1) NOT NULL DEFAULT 0,
  `credits` int(20) NOT NULL DEFAULT 0,
  `upline` int(10) NOT NULL DEFAULT 1,
  `location` text NOT NULL,
  `payment` text NOT NULL,
  `contact` text NOT NULL,
  `frozen` tinyint(1) NOT NULL,
  `vip_duration` bigint(50) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_connected` tinyint(1) NOT NULL DEFAULT 0,
  `user_rank` enum('Admin','Sub Admin','Reseller','Sub Reseller','Client') NOT NULL DEFAULT 'Client',
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `private_duration` bigint(50) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `user_email`, `full_name`, `regdate`, `ipaddress`, `lastlogin`, `is_active`, `code`, `is_validated`, `is_vip`, `duration`, `is_reseller`, `credits`, `upline`, `location`, `payment`, `contact`, `frozen`, `vip_duration`, `is_admin`, `is_connected`, `user_rank`, `is_private`, `private_duration`) VALUES
(1, 'Synapse', 'J09463323430', 'admin@gmail.com', 'Syndicate Panel', '2018-04-21 06:52:22', '120.29.85.222', '2019-04-13 01:43:08', 1, '', 1, 0, 6076980, 0, 99999, 1, 'PH', 'Any', '', 0, 9507660, 1, 0, 'Admin', 1, 5184000),
(2267, 'tester', 'tester', 'syndicate@gmail.com', 'Adminstrator', '2018-06-19 12:23:08', '222.127.118.19', '2019-04-14 18:24:48', 1, '', 1, 0, 30464400, 9, 999997, 1, 'PH', '', '', 0, 33056400, 0, 0, 'Admin', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vip-vouchers`
--

CREATE TABLE `vip-vouchers` (
  `code_name` varchar(50) NOT NULL,
  `user_id` int(100) NOT NULL,
  `reseller_id` int(100) NOT NULL,
  `is_used` int(1) NOT NULL,
  `date_used` varchar(50) NOT NULL,
  `time_stamp` text NOT NULL,
  `vip_duration` bigint(50) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vip-vouchers`
--

INSERT INTO `vip-vouchers` (`code_name`, `user_id`, `reseller_id`, `is_used`, `date_used`, `time_stamp`, `vip_duration`) VALUES
('C0D-EE2S-BWF-U1XP', 2259, 1, 1, '2018-04-21 07:44:52', '2018-04-21 07:44:18', 2592000),
('WIY-J0UJ-BMT-JXDR', 1, 1, 1, '2018-04-23 07:55:26', '2018-04-23 07:55:21', 2592000),
('NEE-10G4-SI2-CWLZ', 1, 1, 1, '2018-04-23 07:56:12', '2018-04-23 07:56:07', 2592000),
('MD5-436X-3SZ-EQB2', 0, 1, 0, '', '2018-04-25 23:50:01', 2592000),
('1LC-5CCR-VPL-5BKL', 1, 1, 1, '2018-04-25 23:50:39', '2018-04-25 23:50:28', 1731660),
('DOL-3DT1-BSO-IL13', 2265, 1, 1, '2018-04-26 05:02:52', '2018-04-26 05:02:41', 2592000),
('O5Y-6LOX-Y26-5UXL', 2267, 1, 1, '2018-06-20 06:26:21', '2018-06-20 06:26:17', 2592000),
('FWI-TVVI-3YD-0QN1', 1, 1, 1, '2018-06-20 06:27:23', '2018-06-20 06:27:17', 2592000),
('HOX-S6LO-BNK-TTA1', 2296, 2279, 1, '2018-06-30 12:16:56', '2018-06-30 12:16:35', 2592000),
('IZG-4CPD-WUN-KITX', 2304, 2303, 1, '2018-07-01 00:49:41', '2018-07-01 00:49:11', 2592000),
('IAJ-AIJ6-UWD-EFCQ', 2305, 2303, 1, '2018-07-01 01:47:52', '2018-07-01 01:47:34', 2592000),
('UEI-JYH4-RHZ-RH3V', 2306, 2303, 1, '2018-07-01 02:18:27', '2018-07-01 02:18:15', 2592000),
('RQM-0JMS-F2Q-FM6T', 2309, 2279, 1, '2018-07-01 07:58:41', '2018-07-01 07:58:24', 2592000),
('R6C-D20C-V0R-DPEE', 2311, 2310, 1, '2018-07-02 01:47:03', '2018-07-02 01:46:33', 2592000),
('TKR-04LY-EUZ-Z0BF', 2318, 2279, 1, '2018-07-02 19:59:37', '2018-07-02 19:59:25', 2592000),
('MWG-ONV2-OE4-C5AX', 2321, 2279, 1, '2018-07-03 01:16:07', '2018-07-03 01:15:59', 2592000),
('IDU-EZZU-FDV-1BHQ', 2324, 2279, 1, '2018-07-03 23:03:05', '2018-07-03 23:02:52', 2592000),
('AP3-CS4V-UO6-WKEG', 2326, 2279, 1, '2018-07-04 03:35:27', '2018-07-04 03:35:18', 2592000),
('5V0-KCP2-YKY-4SY5', 2330, 2279, 1, '2018-07-04 21:23:06', '2018-07-04 21:22:51', 2592000),
('P3W-WPWX-TKV-D4G3', 2334, 2279, 1, '2018-07-04 23:15:33', '2018-07-04 23:15:23', 2592000),
('4FX-NF5A-VP1-TOGM', 2336, 2322, 1, '2018-07-04 23:51:02', '2018-07-04 23:50:52', 2592000),
('Z44-JUND-Z4A-N3EN', 2338, 2279, 1, '2018-07-05 08:52:07', '2018-07-05 08:51:58', 2592000),
('HDR-IQVF-3F6-G312', 2339, 2279, 1, '2018-07-05 11:30:47', '2018-07-05 11:30:39', 2592000),
('G0I-PNN3-EUE-K3HJ', 2340, 2279, 1, '2018-07-06 03:36:22', '2018-07-06 03:36:17', 2592000),
('5OU-1DEQ-QD1-K601', 2343, 2325, 1, '2018-07-07 01:35:50', '2018-07-07 01:35:41', 2592000),
('02G-05JU-Q0F-VZCV', 2349, 2322, 1, '2018-07-07 06:30:11', '2018-07-07 06:29:59', 2592000),
('JNA-6UVM-ONL-JKOD', 0, 2279, 0, '', '2018-07-09 11:33:31', 2592000),
('U0B-0X3T-O3N-MK3I', 2356, 2279, 1, '2018-07-11 00:12:01', '2018-07-11 00:11:23', 2592000),
('O60-E4FP-IWY-NRDX', 2361, 2313, 1, '2018-07-13 02:31:31', '2018-07-13 02:31:18', 2592000),
('ZXY-WM1X-EZQ-ENQ1', 2373, 2279, 1, '2018-07-20 13:04:12', '2018-07-20 13:03:51', 2592000),
('FG3-LIJF-DCA-5MOO', 2374, 2279, 1, '2018-07-21 08:30:33', '2018-07-21 08:30:02', 2592000),
('4BG-066N-FH5-KJUO', 2375, 2279, 1, '2018-07-21 09:44:13', '2018-07-21 09:44:02', 2592000),
('SRP-WRV1-BO1-0NTY', 2376, 2279, 1, '2018-07-22 01:31:43', '2018-07-22 01:31:30', 2592000),
('IRU-QIU1-325-IB3M', 2377, 2279, 1, '2018-07-22 08:27:38', '2018-07-22 08:27:26', 2592000),
('QWU-Y5S1-F53-Q3L6', 2378, 2279, 1, '2018-07-24 07:32:29', '2018-07-24 07:32:15', 2592000),
('ZE4-TMFI-SNP-EAS2', 2379, 2279, 1, '2018-07-26 11:19:59', '2018-07-26 11:19:32', 2592000),
('JJN-354F-T5V-UNBH', 2380, 2279, 1, '2018-07-27 10:56:15', '2018-07-27 10:56:01', 2592000),
('C36-JJ6D-NZA-F5XA', 2313, 2313, 1, '2018-07-27 22:08:50', '2018-07-27 22:08:23', 2592000),
('1SK-XYUB-H3V-QIBV', 0, 2325, 0, '', '2018-07-28 04:24:29', 2592000),
('FJY-XPOI-X0J-M1MR', 2354, 2325, 1, '2018-07-28 04:25:04', '2018-07-28 04:24:38', 2592000),
('4GS-IDTF-SII-YKI6', 0, 2325, 0, '', '2018-07-28 04:25:20', 2592000),
('FVK-VDJL-R0A-PEPJ', 2371, 2325, 1, '2018-07-28 04:26:09', '2018-07-28 04:25:29', 2592000),
('R6Z-R1GQ-NJ0-LLX3', 0, 2325, 0, '', '2018-07-28 04:36:27', 2592000),
('3NI-NNON-NO0-CZ1N', 2381, 2325, 1, '2018-07-28 04:36:48', '2018-07-28 04:36:36', 2592000),
('UFP-BKKM-UGK-DQCO', 0, 2325, 0, '', '2018-07-28 04:38:54', 2592000),
('MI1-ZTV1-SQO-OJA1', 2382, 2325, 1, '2018-07-28 04:39:48', '2018-07-28 04:39:03', 2592000),
('33S-52FZ-EIB-6VYR', 0, 2325, 0, '', '2018-07-28 04:40:36', 2592000),
('YZN-YSSQ-5JX-QF43', 2383, 2325, 1, '2018-07-28 04:40:55', '2018-07-28 04:40:45', 2592000),
('KV0-54VP-LX2-OZZ0', 2385, 2279, 1, '2018-07-30 00:45:24', '2018-07-30 00:44:39', 2592000),
('XQH-XXZD-UOR-JVVP', 2386, 2279, 1, '2018-08-01 11:45:46', '2018-08-01 11:45:03', 2592000),
('CNW-C0N1-0PP-GW1F', 0, 2325, 0, '', '2018-08-02 00:55:26', 2592000),
('FYY-EZAE-TI0-TOAA', 2387, 2325, 1, '2018-08-02 00:55:46', '2018-08-02 00:55:35', 2592000),
('ODW-YN6W-6PA-PUMA', 2393, 2279, 1, '2018-08-03 02:38:31', '2018-08-03 02:38:14', 2592000),
('5JD-JQ1N-43Q-VN2I', 2396, 2279, 1, '2018-08-04 01:19:09', '2018-08-04 01:18:51', 2592000),
('H20-T3FB-QTW-MPAB', 0, 2325, 0, '', '2018-08-04 05:20:26', 2592000),
('YMI-6VDO-VEU-OCBH', 2398, 2325, 1, '2018-08-04 05:20:56', '2018-08-04 05:20:35', 2592000),
('ZST-GE1G-3JL-1A4A', 0, 2325, 0, '', '2018-08-04 05:52:58', 2592000),
('TQA-6UYO-LC6-L1VX', 2399, 2325, 1, '2018-08-04 05:53:36', '2018-08-04 05:53:07', 2592000),
('T6J-0QCE-LGY-6ETT', 0, 2325, 0, '', '2018-08-05 23:06:02', 2592000),
('RRK-ISRA-BFJ-PCFS', 2384, 2325, 1, '2018-08-05 23:06:28', '2018-08-05 23:06:11', 2592000),
('Y4K-T2NS-OYJ-3HCW', 2401, 2279, 1, '2018-08-07 04:10:16', '2018-08-07 04:10:00', 2592000),
('ZYM-DCWH-SSX-HH11', 2406, 2279, 1, '2018-08-11 07:55:30', '2018-08-11 07:55:16', 2592000),
('TH5-UW22-NE1-J51S', 2407, 2279, 1, '2018-08-11 08:02:56', '2018-08-11 08:02:21', 2592000),
('ZAX-3KVC-O4H-P4AR', 2410, 2279, 1, '2018-08-13 09:45:15', '2018-08-13 09:45:00', 2592000),
('G5R-T1BM-F2F-GBWE', 2361, 2313, 1, '2018-08-16 05:56:04', '2018-08-16 05:55:44', 2592000),
('RTB-YRGE-HSR-363F', 2313, 2313, 1, '2018-08-16 05:56:34', '2018-08-16 05:56:22', 2592000),
('3GC-OU1Q-2W5-QPQP', 2267, 1, 1, '2018-08-16 12:17:59', '2018-08-16 12:14:36', 2592000),
('0IN-GFJ5-ACL-HTLF', 2267, 1, 1, '2018-08-16 12:23:02', '2018-08-16 12:22:41', 31104000),
('U2D-0TLK-RQL-OS0W', 2414, 2279, 1, '2018-08-17 09:35:49', '2018-08-17 09:35:33', 2592000),
('Q6R-4ONI-JLD-W0NE', 2321, 2279, 1, '2018-08-21 08:19:42', '2018-08-21 08:19:08', 2592000);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `code_name` varchar(50) NOT NULL,
  `user_id` int(100) NOT NULL,
  `reseller_id` int(100) NOT NULL,
  `is_used` int(1) NOT NULL,
  `date_used` varchar(50) NOT NULL,
  `time_stamp` text NOT NULL,
  `duration` bigint(50) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`code_name`, `user_id`, `reseller_id`, `is_used`, `date_used`, `time_stamp`, `duration`) VALUES
('A5Y-JFB6-TLE-AW11', 2259, 1, 1, '2018-04-21 07:44:02', '2018-04-21 07:43:50', 2592000),
('0AU-HS64-GER-L01Q', 1, 1, 1, '2018-04-25 23:52:12', '2018-04-25 23:48:20', 2592000),
('Y56-KTIQ-WQ4-S461', 1, 1, 1, '2018-04-25 23:53:00', '2018-04-25 23:52:50', 892980),
('NOE-BSS5-4DS-CGXP', 2263, 1, 1, '2018-04-26 02:25:09', '2018-04-26 02:24:51', 2592000),
('U0Q-IPNU-NJE-QCEI', 2265, 1, 1, '2018-04-26 05:01:19', '2018-04-26 05:01:14', 2592000),
('OSG-Q1PW-X2R-0JLQ', 2267, 1, 1, '2018-06-20 06:26:43', '2018-06-20 06:26:41', 2592000),
('XC0-UKZK-A0Z-OILJ', 1, 1, 1, '2018-06-20 06:27:58', '2018-06-20 06:27:54', 2592000),
('DG6-QZKR-EFY-AFCW', 2280, 2279, 1, '2018-06-30 11:38:24', '2018-06-30 11:37:44', 2592000),
('QIW-O2MK-QKL-II4R', 2281, 2279, 1, '2018-06-30 11:40:55', '2018-06-30 11:40:40', 2592000),
('AIJ-ZAOA-53P-ZK3B', 2282, 2279, 1, '2018-06-30 11:42:51', '2018-06-30 11:42:34', 2592000),
('6T1-D2TG-V6H-FJY5', 2283, 2279, 1, '2018-06-30 11:46:01', '2018-06-30 11:45:42', 2592000),
('KKC-AOZV-0E2-MJTA', 2284, 2279, 1, '2018-06-30 11:48:20', '2018-06-30 11:47:56', 2592000),
('YN0-NOMN-A1V-R2BF', 2285, 2279, 1, '2018-06-30 11:50:51', '2018-06-30 11:50:42', 2592000),
('5LP-E3XE-XXE-KD1N', 2286, 2279, 1, '2018-06-30 11:52:45', '2018-06-30 11:52:20', 2592000),
('HRF-Q3TQ-B6Q-ZKNW', 2287, 2279, 1, '2018-06-30 11:56:47', '2018-06-30 11:56:40', 2592000),
('31Y-MKYL-V1T-D3JM', 2288, 2279, 1, '2018-06-30 11:58:29', '2018-06-30 11:58:19', 2592000),
('4YI-TZC1-DB3-6I6K', 2289, 2279, 1, '2018-06-30 12:00:21', '2018-06-30 12:00:12', 2592000),
('Q6L-LCKJ-DD3-CDZ6', 2290, 2279, 1, '2018-06-30 12:02:13', '2018-06-30 12:01:54', 2592000),
('PVB-KVQE-2NW-GBLM', 2291, 2279, 1, '2018-06-30 12:03:48', '2018-06-30 12:03:43', 2592000),
('6C1-GGC5-U2P-2KYI', 2292, 2279, 1, '2018-06-30 12:06:17', '2018-06-30 12:05:56', 2592000),
('REM-RHC2-G35-FMXA', 2293, 2279, 1, '2018-06-30 12:09:12', '2018-06-30 12:09:04', 2592000),
('S0V-WJRP-UK4-104Y', 2294, 2279, 1, '2018-06-30 12:10:24', '2018-06-30 12:10:20', 2592000),
('TXG-WQQS-RKD-JZSA', 2295, 2279, 1, '2018-06-30 12:11:56', '2018-06-30 12:11:40', 2592000),
('ZLD-QKO0-BJ5-POW2', 2297, 2279, 1, '2018-06-30 12:18:24', '2018-06-30 12:18:17', 2592000),
('452-NPKK-HIW-Z1QI', 2298, 2279, 1, '2018-06-30 12:19:53', '2018-06-30 12:19:45', 2592000),
('HNL-JPP3-DXU-1MLJ', 2299, 2279, 1, '2018-06-30 12:21:23', '2018-06-30 12:21:17', 2592000),
('E5L-0MH4-PHG-VZLA', 2300, 2279, 1, '2018-06-30 12:22:40', '2018-06-30 12:22:28', 2592000),
('NPX-EXRE-LZQ-RVY2', 2301, 2279, 1, '2018-06-30 12:24:01', '2018-06-30 12:23:50', 2592000),
('VIQ-D3U1-ZXQ-FTLA', 2302, 2279, 1, '2018-06-30 12:25:38', '2018-06-30 12:25:10', 2592000),
('V1P-YODP-ZZC-LRAW', 2307, 2303, 1, '2018-07-01 04:10:28', '2018-07-01 04:09:55', 2592000),
('XIT-06DP-RZN-VNE6', 2308, 2279, 1, '2018-07-01 07:46:19', '2018-07-01 07:46:10', 2592000),
('I5Q-RGPZ-1JU-S6BD', 2312, 2279, 1, '2018-07-02 09:19:18', '2018-07-02 09:19:05', 2592000),
('PG3-NTSC-YCH-FF62', 2328, 2279, 1, '2018-07-04 21:12:40', '2018-07-04 21:12:13', 2592000),
('WQ2-RJTN-FVY-QDBE', 2331, 2279, 1, '2018-07-04 22:33:55', '2018-07-04 22:33:48', 2592000),
('NVU-WHOQ-OXT-X5LP', 2342, 2322, 1, '2018-07-06 08:05:18', '2018-07-06 08:04:24', 2592000),
('JTM-TJT0-AQQ-6V2K', 2318, 2279, 1, '2018-07-07 20:11:54', '2018-07-07 20:11:22', 2592000),
('GQA-I6ZQ-NGB-TW6S', 2324, 2279, 1, '2018-07-07 20:12:34', '2018-07-07 20:12:16', 2592000),
('DZS-YLSU-WJL-KBFI', 2323, 2279, 1, '2018-07-07 20:13:05', '2018-07-07 20:12:47', 2592000),
('CEP-YRTO-QFR-VOYI', 0, 2279, 0, '', '2018-07-07 20:13:22', 2592000),
('KJ2-XMCO-TCU-133W', 2334, 2279, 1, '2018-07-07 20:15:59', '2018-07-07 20:14:14', 2592000),
('VS5-XM1T-HSG-20DZ', 2330, 2279, 1, '2018-07-07 20:16:41', '2018-07-07 20:16:11', 2592000),
('OZ0-43JY-S12-BRLF', 2321, 2279, 1, '2018-07-07 20:17:20', '2018-07-07 20:16:59', 2592000),
('KX3-ITN1-H0O-WNQ6', 2338, 2279, 1, '2018-07-07 20:22:06', '2018-07-07 20:21:56', 2592000),
('K54-CBDK-2IR-3EQG', 2343, 2325, 1, '2018-07-07 20:56:47', '2018-07-07 20:56:24', 2592000),
('0JC-LRSP-I6I-LG0F', 2358, 2279, 1, '2018-07-11 03:36:04', '2018-07-11 03:35:47', 2592000),
('WOZ-5MYF-XMH-GVJD', 2365, 2279, 1, '2018-07-13 23:14:27', '2018-07-13 23:14:07', 2592000),
('RUC-WWZV-GCA-NJ34', 2366, 2279, 1, '2018-07-13 23:47:31', '2018-07-13 23:47:05', 2592000),
('R3R-T3UH-3EJ-YQYJ', 2388, 2279, 1, '2018-08-02 09:08:22', '2018-08-02 09:07:11', 2592000),
('WPN-OWTG-RV2-H02P', 2389, 2279, 1, '2018-08-02 09:12:01', '2018-08-02 09:11:48', 2592000),
('3TD-NT5L-RVX-0BRB', 2390, 2279, 1, '2018-08-02 23:17:23', '2018-08-02 23:16:40', 2592000),
('SAD-VQ4I-Z3D-KYCV', 2395, 2279, 1, '2018-08-04 00:32:54', '2018-08-04 00:32:33', 2592000),
('MMA-NOWP-6BW-IHSO', 2402, 2279, 1, '2018-08-10 21:50:12', '2018-08-10 21:49:49', 2592000),
('OA4-XZPC-PSK-PPQ3', 2403, 2279, 1, '2018-08-10 23:00:51', '2018-08-10 22:58:15', 2592000),
('KJA-H0WN-PV6-VH4B', 2404, 2279, 1, '2018-08-11 07:39:24', '2018-08-11 07:39:11', 2592000),
('RG5-NSYK-6LY-ZJXJ', 0, 2279, 0, '', '2018-08-13 10:32:19', 2592000),
('3PF-02HB-JRA-1D56', 2411, 2279, 1, '2018-08-13 10:35:10', '2018-08-13 10:34:56', 2592000),
('20N-BT5L-0F5-1DY1', 2412, 2279, 1, '2018-08-16 11:23:20', '2018-08-16 11:22:59', 2592000),
('VTF-3ZJM-10I-EGHT', 2267, 1, 1, '2018-08-16 12:25:58', '2018-08-16 12:25:41', 31104000),
('EII-5AC0-TDY-1HWY', 0, 2279, 0, '', '2018-08-17 09:31:18', 2592000),
('K5X-3X0R-JUT-H54C', 2416, 2279, 1, '2018-08-18 02:40:44', '2018-08-18 02:40:26', 2592000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_info`
--
ALTER TABLE `message_info`
  ADD PRIMARY KEY (`info`);

--
-- Indexes for table `private-vouchers`
--
ALTER TABLE `private-vouchers`
  ADD UNIQUE KEY `code_name` (`code_name`);

--
-- Indexes for table `server_list`
--
ALTER TABLE `server_list`
  ADD PRIMARY KEY (`server_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_email_2` (`user_email`);
ALTER TABLE `users` ADD FULLTEXT KEY `user_email` (`user_email`);

--
-- Indexes for table `vip-vouchers`
--
ALTER TABLE `vip-vouchers`
  ADD UNIQUE KEY `code_name` (`code_name`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD UNIQUE KEY `code_name` (`code_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_list`
--
ALTER TABLE `server_list`
  MODIFY `server_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2424;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
