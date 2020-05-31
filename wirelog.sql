-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2020 at 10:14 AM
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
  `jobID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contractor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`jobID`),
  KEY `job_id_foreign` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jobID`, `contractor`, `location`, `created_at`, `updated_at`, `id`, `cover_image`) VALUES
(1, 'TAFE South Bank', 'G-L1-NE', '2020-05-31 09:50:09', '2020-05-31 09:58:44', 1, 'wirelog0001_1590918722.png'),
(2, 'TAFE South Bank', 'G-L1-SE', '2020-05-31 09:50:24', '2020-05-31 09:58:52', 1, 'wirelog0002_1590918736.png'),
(3, 'TAFE South Bank', 'G-L2-NE', '2020-05-31 09:50:37', '2020-05-31 09:59:01', 1, 'wirelog0003_1590918751.png'),
(4, 'TAFE South Bank', 'G-L2-SE', '2020-05-31 09:50:46', '2020-05-31 09:59:10', 1, 'wirelog0004_1590918764.png'),
(5, 'TAFE South Bank', 'G-L3-NE', '2020-05-31 09:50:57', '2020-05-31 09:59:27', 1, 'wirelog0005_1590918775.png'),
(6, 'TAFE South Bank', 'G-L3-SE', '2020-05-31 09:51:07', '2020-05-31 09:59:39', 1, 'wirelog0006_1590918791.png'),
(7, 'TAFE South Bank', 'G-L3-SW', '2020-05-31 09:51:23', '2020-05-31 09:59:46', 1, 'wirelog0007_1590919098.png'),
(8, 'TAFE South Bank', 'G-L3-NW', '2020-05-31 09:51:32', '2020-05-31 09:59:53', 1, 'wirelog0008_1590918832.png');

-- --------------------------------------------------------

--
-- Table structure for table `job_log`
--

DROP TABLE IF EXISTS `job_log`;
CREATE TABLE IF NOT EXISTS `job_log` (
  `job_logID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_at` timestamp NOT NULL,
  `u_at` timestamp NOT NULL,
  `jobID` bigint(20) UNSIGNED NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`job_logID`),
  KEY `job_log_jobid_foreign` (`jobID`),
  KEY `job_log_id_foreign` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_log`
--

INSERT INTO `job_log` (`job_logID`, `comment`, `c_at`, `u_at`, `jobID`, `id`) VALUES
(1, 'Technician sheduled for 02/08/19', '2020-05-31 10:01:22', '2020-05-31 10:01:22', 1, 1),
(2, 'DOL contactor failed, will return tomorrow to replace', '2020-05-31 10:02:50', '2020-05-31 10:02:50', 1, 2),
(3, 'DOL contactor successfully replaced', '2020-05-31 10:03:43', '2020-05-31 10:03:43', 1, 2),
(4, 'DOL contactor failed again, will return this afternoon to replace', '2020-05-31 10:05:00', '2020-05-31 10:05:00', 1, 4),
(5, 'DOL contactor replaced, system returned to normal operation', '2020-05-31 10:05:16', '2020-05-31 10:05:16', 1, 4),
(6, 'DOL contactor failed for third time in eight months, will return tomorrow to replace. Management advised for upgrade to VSD', '2020-05-31 10:05:47', '2020-05-31 10:05:47', 1, 5),
(7, 'DOL contactor replaced, system functioning correctly. Awaiting approval for VSD upgrade', '2020-05-31 10:07:00', '2020-05-31 10:07:00', 1, 5),
(8, 'Variable speed drive approved for upgrade. Sheduled for installation 23/03/2020', '2020-05-31 10:07:16', '2020-05-31 10:07:16', 1, 1),
(9, 'LED available indicator faulty. LED replaced with 24V AC/DC BA9s', '2020-05-31 10:07:51', '2020-05-31 10:07:51', 2, 3),
(10, 'PSU faulty upon arrival, system isolated for safety. Will return tomorrow to replace', '2020-05-31 10:08:15', '2020-05-31 10:08:15', 2, 5),
(11, 'PSU replaced. System now functioning correctly', '2020-05-31 10:08:30', '2020-05-31 10:08:30', 2, 5),
(12, 'DPDT failed upon arrival, will return 11/05/20', '2020-05-31 10:09:02', '2020-05-31 10:09:02', 3, 3),
(13, 'DPDT relay replaced, system functioning correctly', '2020-05-31 10:09:16', '2020-05-31 10:09:16', 3, 3),
(14, 'DPDT faulty and replaced. Functionality returned', '2020-05-31 10:09:30', '2020-05-31 10:09:30', 3, 2),
(15, 'Faulty DPDT relay upon arrival. History shows this is a regular occurance. Requires further investigation. System isolated until root cause determined', '2020-05-31 10:09:48', '2020-05-31 10:09:48', 3, 5),
(16, '4-20mA loop broken. Rewired, calibrated, and tested. System returned to normal operation', '2020-05-31 10:10:07', '2020-05-31 10:10:07', 4, 4),
(17, 'MSB tripped upon arrival. System thoroughly tested for potential root cause. No fault found at time of visit, power reinstated', '2020-05-31 10:10:23', '2020-05-31 10:10:23', 4, 3),
(18, 'RCD tripped upon arrival. Panel tested for root cause, no fault found. Power reinstated', '2020-05-31 10:11:07', '2020-05-31 10:11:07', 5, 4),
(19, 'RCD tripped again. Phase to earth fault found on motor windings. Equipment sent off for repair Circuit isolated and locked off. Power reinstated to remainder of board', '2020-05-31 10:11:39', '2020-05-31 10:11:39', 5, 2),
(20, 'VSD settings reset to default. VSD reconfigured', '2020-05-31 10:12:08', '2020-05-31 10:12:08', 6, 3),
(21, 'VSD settings reverted to defalt again. Advised management to repair or upgrade', '2020-05-31 10:12:23', '2020-05-31 10:12:23', 6, 4),
(22, 'Variable speed drive approved for upgrade. Sheduled for installation 22/05/20', '2020-05-31 10:12:37', '2020-05-31 10:12:37', 6, 1),
(23, 'Pressure transducer faulty upon arrival. Pressure transducer replaced, data returned', '2020-05-31 10:12:55', '2020-05-31 10:12:55', 7, 4),
(24, 'PLC fault on output 12. Will return to site tomorrow to replace', '2020-05-31 10:13:12', '2020-05-31 10:13:12', 7, 5),
(25, 'PSU faulty upon arrival, system isolated for safety. Will return tomorrow to replace', '2020-05-31 10:13:33', '2020-05-31 10:13:33', 8, 5),
(26, 'LED run indicator faulty. LED replaced with 24V AC/DC BA9s', '2020-05-31 10:13:49', '2020-05-31 10:13:49', 8, 4);

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(44, '2014_10_12_000000_create_users_table', 1),
(45, '2014_10_12_100000_create_password_resets_table', 1),
(46, '2019_08_19_000000_create_failed_jobs_table', 1),
(47, '2020_05_27_093858_create_jobs_table', 1),
(48, '2020_05_27_100033_create_job_logs_table', 1),
(49, '2020_05_27_100105_create_technicians_table', 1),
(50, '2020_05_31_150423_add_cover_image_to_jobs', 1);

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
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
CREATE TABLE IF NOT EXISTS `technician` (
  `technicianID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`technicianID`),
  KEY `technician_id_foreign` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technician`
--

INSERT INTO `technician` (`technicianID`, `name`, `surname`, `email`, `phone`, `position`, `created_at`, `updated_at`, `id`) VALUES
(1, 'Luke', 'Albert', 'l.albert@wirelog.com.au', '0412332121', 'admin', '2020-05-31 09:45:31', '2020-05-31 09:45:31', 1),
(2, 'Loris', 'Shumpert', 'l.shumpert@wirelog.com.au', '0487642382', 'ICA', '2020-05-31 09:46:09', '2020-05-31 09:46:09', 2),
(3, 'Merlin', 'Hoberg', 'm.hoberg@wirelog.com.au', '0414742843', 'ICA', '2020-05-31 09:46:42', '2020-05-31 09:46:42', 3),
(4, 'Sarah', 'Smith', 's.smith@wirelog.com.au', '0412746253', 'apprentice', '2020-05-31 09:47:07', '2020-05-31 09:47:07', 4),
(5, 'Ozil', 'Zubuc', 'o.zubuc@wirelog.com.au', '0462374832', 'EC&I', '2020-05-31 09:47:31', '2020-05-31 09:47:31', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'l.albert@wirelog.com.au', NULL, '$2y$10$OiIHohV9WgHNvkCkntuVX.MwQtsV0Q.EdEmuFJLaKv3AP/FIEBXvm', NULL, '2020-05-31 09:43:01', '2020-05-31 09:43:01'),
(2, 'l.shumpert@wirelog.com.au', NULL, '$2y$10$GPrqxW7kG7mBqxbjYZTkfe1DgH50MQJy0HivNNIF29IROVPU09yDq', NULL, '2020-05-31 09:43:42', '2020-05-31 09:43:42'),
(3, 'm.hoberg@wirelog.com.au', NULL, '$2y$10$9K4fLonAuAp8QWjJq5ETdOZiGVZg5PybZ1osyqlThWiyAZYlvJF6O', NULL, '2020-05-31 09:44:11', '2020-05-31 09:44:11'),
(4, 's.smith@wirelog.com.au', NULL, '$2y$10$S3Uk2xvAalRVwAMbZkKhB.eM3iaYOZufwbyKizJZaB7sIFc3657Ai', NULL, '2020-05-31 09:44:29', '2020-05-31 09:44:29'),
(5, 'o.zubuc@wirelog.com.au', NULL, '$2y$10$zqLRG41Dc6aom/aVCHYq../cGRUW0wTWJcTJAvmHE9gYjmApYg0Um', NULL, '2020-05-31 09:44:48', '2020-05-31 09:44:48');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
