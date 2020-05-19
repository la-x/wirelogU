-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2020 at 12:02 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wirelog`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `jobID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contractor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jobID`, `contractor`, `location`, `created_at`, `updated_at`) VALUES
(1, 'TAFE South Bank', 'G-L1-NE', '2020-05-18 05:22:21', '2020-05-18 05:22:21'),
(2, 'TAFE South Bank', 'G-L1-SE', '2020-05-18 05:22:29', '2020-05-18 05:22:29'),
(3, 'TAFE South Bank', 'G-L2-NE', '2020-05-18 05:22:38', '2020-05-18 05:22:38'),
(4, 'TAFE South Bank', 'G-L2-SE', '2020-05-18 05:22:46', '2020-05-18 05:22:46'),
(5, 'TAFE South Bank', 'G-L3-NE', '2020-05-18 05:22:54', '2020-05-18 05:22:54'),
(6, 'TAFE South Bank', 'G-L3-SE', '2020-05-18 05:23:04', '2020-05-18 05:23:04'),
(7, 'TAFE South Bank', 'G-L3-SW', '2020-05-18 05:23:13', '2020-05-18 05:23:13'),
(8, 'TAFE South Bank', 'G-L3-NW', '2020-05-18 05:23:27', '2020-05-18 05:23:27'),
(9, 'Contractor!', 'Location!', '2020-05-18 12:30:53', '2020-05-18 13:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `job_log`
--

DROP TABLE IF EXISTS `job_log`;
CREATE TABLE IF NOT EXISTS `job_log` (
  `job_logID` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `jobID` int(11) NOT NULL,
  `technicianID` int(11) NOT NULL,
  PRIMARY KEY (`job_logID`),
  KEY `jobFK` (`jobID`),
  KEY `technicianFK` (`technicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_log`
--

INSERT INTO `job_log` (`job_logID`, `comment`, `timestamp`, `jobID`, `technicianID`) VALUES
(1, 'Technician sheduled for 02/08/19', '2019-07-31 14:00:00', 1, 1),
(2, 'DOL contactor failed, will return tomorrow to replace', '2019-08-01 14:00:00', 1, 2),
(3, 'DOL contactor successfully replaced', '2019-08-02 14:00:00', 1, 2),
(4, 'DOL contactor failed again, will return this afternoon to replace', '2019-12-10 14:00:00', 1, 4),
(5, 'DOL contactor replaced, system returned to normal operation', '2019-12-11 02:30:00', 1, 4),
(6, 'DOL contactor failed for third time in eight months, will return tomorrow to replace. Management advised for upgrade to VSD', '2020-02-15 14:00:00', 1, 5),
(7, 'Variable speed drive approved for upgrade. Sheduled for installation 23/03/2020', '2020-03-21 14:00:00', 1, 1),
(8, 'LED available indicator faulty. LED replaced with 24V AC/DC BA9s', '2020-05-09 13:32:38', 2, 3),
(9, 'PSU faulty upon arrival, system isolated for safety. Will return tomorrow to replace', '2020-05-09 13:33:04', 2, 5),
(10, 'PSU replaced. System now functioning correctly', '2020-05-09 13:33:15', 2, 5),
(11, 'DPDT failed upon arrival, will return 11/05/20', '2020-05-09 13:33:32', 3, 3),
(12, 'DPDT relay replaced, system functioning correctly', '2020-05-09 13:33:48', 3, 3),
(13, 'DPDT faulty and replaced. Functionality returned', '2020-05-09 13:34:15', 3, 2),
(14, 'Faulty DPDT relay upon arrival. History shows this is a regular occurance. Requires further investigation. System isolated until root cause determined', '2020-05-09 13:34:26', 3, 5),
(15, '4-20mA loop broken. Rewired, calibrated, and tested. System returned to normal operation', '2020-05-09 13:34:48', 4, 4),
(16, 'MSB tripped upon arrival. System thoroughly tested for potential root cause. No fault found at time of visit, power reinstated', '2020-05-09 13:35:00', 4, 3),
(17, 'RCD tripped upon arrival. Panel tested for root cause, no fault found. Power reinstated', '2020-05-09 13:35:21', 5, 4),
(18, 'RCD tripped again. Phase to earth fault found on motor windings. Equipment sent off for repair. Circuit isolated and locked off. Power reinstated to remainder of board', '2020-05-09 13:35:33', 5, 2),
(19, 'VSD settings reset to default. VSD reconfigured', '2020-05-09 13:35:46', 6, 3),
(20, 'VSD settings reverted to defalt again. Advised management to repair or upgrade', '2020-05-09 13:35:58', 6, 4),
(21, 'Variable speed drive approved for upgrade. Sheduled for installation 22/05/20', '2020-05-09 13:36:23', 6, 1),
(22, 'Pressure transducer faulty upon arrival. Pressure transducer replaced, data returned', '2020-05-09 13:36:36', 7, 4),
(23, 'PLC fault on output 12. Will return to site tomorrow to replace', '2020-05-09 13:36:49', 7, 5),
(24, 'PSU faulty upon arrival, system isolated for safety. Will return tomorrow to replace', '2020-05-09 13:37:32', 8, 5),
(25, 'LED run indicator faulty. LED replaced with 24V AC/DC BA9s', '2020-05-09 13:37:48', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(24, '2014_10_12_000000_create_users_table', 1),
(25, '2014_10_12_100000_create_password_resets_table', 1),
(26, '2019_08_19_000000_create_failed_jobs_table', 1),
(27, '2020_05_18_121105_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr`
--

DROP TABLE IF EXISTS `qr`;
CREATE TABLE IF NOT EXISTS `qr` (
  `qrID` int(11) NOT NULL AUTO_INCREMENT,
  `img` blob,
  `jobID` int(11) NOT NULL,
  PRIMARY KEY (`qrID`),
  KEY `jobFK` (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qr`
--

INSERT INTO `qr` (`qrID`, `img`, `jobID`) VALUES
(1, 0x696d67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
CREATE TABLE IF NOT EXISTS `technician` (
  `technicianID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  PRIMARY KEY (`technicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `technician`
--

INSERT INTO `technician` (`technicianID`, `name`, `surname`, `email`, `phone`, `position`) VALUES
(1, 'Luke', 'Albert', 'l.albert@wirelog.com.au', '0412332121', 'admin'),
(2, 'Loris', 'Shumpert', 'l.shumpert@wirelog.com.au', '0487642382', 'ICA'),
(3, 'Merlin', 'Hoberg', 'm.hoberg@wirelog.com.au', '0414742843', 'ICA'),
(4, 'Sarah', 'Smith', 's.smith@wirelog.com.au', '0412746253', 'apprentice'),
(5, 'Ozil', 'Zubuc', 'o.zubuc@wirelog.com.au', '0462374832', 'EC&I');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'luke albert', 'l.albert@wirelog.com.au', NULL, '$2y$10$x4oJlQF16UTmCVhp/n4YauHgi3YnrmGuY1Q45iVWg0ndL8WFYH2Fi', NULL, '2020-05-18 05:22:08', '2020-05-18 05:22:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `ulID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `IP` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userMethod` varchar(255) NOT NULL,
  `loginID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ulID`),
  KEY `loginFK` (`loginID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`ulID`, `IP`, `browser`, `timestamp`, `userMethod`, `loginID`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-03-29 13:06:08', 'GET', NULL),
(2, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Mobile Safari/537.36', '2020-03-29 13:12:57', 'GET', NULL),
(3, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Mobile Safari/537.36', '2020-03-29 13:13:00', 'GET', NULL),
(4, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Mobile Safari/537.36', '2020-03-29 13:13:02', 'GET', NULL),
(5, '::1', 'PostmanRuntime/7.24.0', '2020-03-29 13:13:40', 'GET', NULL),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-03-29 13:13:49', 'GET', NULL),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-03-29 13:13:57', 'GET', NULL),
(8, '::1', 'PostmanRuntime/7.24.0', '2020-03-29 13:14:06', 'GET', NULL),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-03-29 13:14:25', 'GET', NULL),
(10, '::1', 'PostmanRuntime/7.24.0', '2020-03-29 13:14:49', 'POST', NULL),
(11, '::1', 'curl/7.68.0', '2020-03-29 13:18:51', 'GET', NULL),
(12, '::1', 'curl/7.68.0', '2020-03-29 13:19:04', 'GET', NULL),
(13, '::1', 'curl/7.68.0', '2020-03-29 13:19:13', 'GET', NULL),
(14, '::1', 'curl/7.68.0', '2020-03-29 13:19:19', 'GET', NULL),
(15, '::1', 'PostmanRuntime/7.24.0', '2020-03-29 13:19:46', 'GET', NULL),
(16, '::1', 'curl/7.68.0', '2020-03-29 13:20:16', 'GET', NULL),
(17, '::1', 'curl/7.68.0', '2020-03-29 13:20:27', 'POST', NULL),
(18, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:39', 'GET', NULL),
(19, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:39', 'GET', NULL),
(20, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:39', 'GET', NULL),
(21, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:39', 'GET', NULL),
(22, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:42', 'GET', NULL),
(23, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:45', 'GET', NULL),
(24, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:48', 'GET', NULL),
(25, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:48', 'GET', NULL),
(26, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:48', 'GET', NULL),
(27, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:49', 'GET', NULL),
(28, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:49', 'GET', NULL),
(29, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:50', 'GET', NULL),
(30, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:52', 'GET', NULL),
(31, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:54', 'GET', NULL),
(32, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:35:59', 'GET', NULL),
(33, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:36:02', 'GET', NULL),
(34, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-07 13:36:05', 'GET', NULL),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-09 13:38:31', 'GET', NULL),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-09 13:38:31', 'GET', NULL),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-09 13:38:31', 'GET', NULL),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-09 13:38:31', 'GET', NULL),
(39, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-09 13:38:40', 'GET', NULL),
(40, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '2020-05-09 13:38:41', 'GET', NULL),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 14:01:31', 'GET', NULL),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 14:01:31', 'GET', NULL),
(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 14:01:31', 'GET', NULL),
(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 14:01:31', 'GET', NULL),
(45, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:02:52', 'GET', NULL),
(46, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:02:52', 'GET', NULL),
(47, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:02:52', 'GET', NULL),
(48, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:02:52', 'GET', NULL),
(49, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:03:08', 'GET', NULL),
(50, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:03:08', 'GET', NULL),
(51, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:03:08', 'GET', NULL),
(52, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:03:08', 'GET', NULL),
(53, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:04:48', 'GET', NULL),
(54, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:04:48', 'GET', NULL),
(55, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:04:48', 'GET', NULL),
(56, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:04:48', 'GET', NULL),
(57, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:05:15', 'GET', NULL),
(58, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:05:15', 'GET', NULL),
(59, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:05:15', 'GET', NULL),
(60, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:05:15', 'GET', NULL),
(61, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:04', 'GET', NULL),
(62, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:04', 'GET', NULL),
(63, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:04', 'GET', NULL),
(64, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:04', 'GET', NULL),
(65, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:13', 'GET', NULL),
(66, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:13', 'GET', NULL),
(67, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:13', 'GET', NULL),
(68, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:13', 'GET', NULL),
(69, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:20', 'GET', NULL),
(70, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:25', 'GET', NULL),
(71, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:25', 'GET', NULL),
(72, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:25', 'GET', NULL),
(73, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '2020-05-18 14:06:25', 'GET', NULL),
(74, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 14:06:45', 'GET', NULL),
(75, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:15', 'GET', NULL),
(76, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:15', 'GET', NULL),
(77, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:15', 'GET', NULL),
(78, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:15', 'GET', NULL),
(79, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:16', 'GET', NULL),
(80, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:19', 'GET', NULL),
(81, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:29:27', 'GET', NULL),
(82, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:30:59', 'GET', NULL),
(83, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:31:02', 'GET', NULL),
(84, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:31:23', 'GET', NULL),
(85, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:31:33', 'GET', NULL),
(86, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:31:33', 'GET', NULL),
(87, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 22:31:33', 'GET', NULL),
(88, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:53:46', 'GET', NULL),
(89, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:53:46', 'GET', NULL),
(90, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:53:46', 'GET', NULL),
(91, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:53:46', 'GET', NULL),
(92, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:54:05', 'GET', NULL),
(93, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:54:19', 'GET', NULL),
(94, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:54:19', 'GET', NULL),
(95, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:54:19', 'GET', NULL),
(96, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:54:19', 'GET', NULL),
(97, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-18 23:54:22', 'GET', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xjob`
--

DROP TABLE IF EXISTS `xjob`;
CREATE TABLE IF NOT EXISTS `xjob` (
  `jobID` int(11) NOT NULL AUTO_INCREMENT,
  `contractor` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xjob`
--

INSERT INTO `xjob` (`jobID`, `contractor`, `location`) VALUES
(1, 'TAFE South Bank', 'G-L1-NE'),
(2, 'TAFE South Bank', 'G-L1-SE'),
(3, 'TAFE South Bank', 'G-L2-NE'),
(4, 'TAFE South Bank', 'G-L2-SE'),
(5, 'TAFE South Bank', 'G-L3-NE'),
(6, 'TAFE South Bank', 'G-L3-SE'),
(7, 'TAFE South Bank', 'G-L3-SW'),
(8, 'TAFE South Bank', 'G-L3-NW');

-- --------------------------------------------------------

--
-- Table structure for table `xlogin`
--

DROP TABLE IF EXISTS `xlogin`;
CREATE TABLE IF NOT EXISTS `xlogin` (
  `loginID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `technicianID` int(11) NOT NULL,
  PRIMARY KEY (`loginID`),
  KEY `technicianFK` (`technicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xlogin`
--

INSERT INTO `xlogin` (`loginID`, `username`, `password`, `technicianID`) VALUES
(1, 'lshumpert', 'Welcome1', 1),
(2, 'lalbert', 'Welcome1', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_log`
--
ALTER TABLE `job_log`
  ADD CONSTRAINT `job_log_ibfk_1` FOREIGN KEY (`technicianID`) REFERENCES `technician` (`technicianID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job_log_ibfk_2` FOREIGN KEY (`jobID`) REFERENCES `xjob` (`jobID`) ON UPDATE CASCADE;

--
-- Constraints for table `qr`
--
ALTER TABLE `qr`
  ADD CONSTRAINT `qr_ibfk_1` FOREIGN KEY (`jobID`) REFERENCES `xjob` (`jobID`) ON UPDATE CASCADE;

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`loginID`) REFERENCES `xlogin` (`loginID`) ON UPDATE CASCADE;

--
-- Constraints for table `xlogin`
--
ALTER TABLE `xlogin`
  ADD CONSTRAINT `xlogin_ibfk_1` FOREIGN KEY (`technicianID`) REFERENCES `technician` (`technicianID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
