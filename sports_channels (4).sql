-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2025 at 07:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sports_channels`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(16, 'Asia'),
(9, 'Basketball'),
(10, 'Cricket'),
(8, 'Football'),
(13, 'International'),
(17, 'Latin America'),
(18, 'Live Sports'),
(12, 'Mixed Sports'),
(19, 'Sports News'),
(11, 'Tennis'),
(14, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `live_status` tinyint(1) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','hidden') DEFAULT 'active',
  `embed_code` text DEFAULT NULL,
  `hidden_start` datetime DEFAULT NULL,
  `hidden_end` datetime DEFAULT NULL,
  `access_level` enum('all','premium') DEFAULT 'all'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `slug`, `logo`, `link`, `description`, `live_status`, `category_id`, `icon`, `created_at`, `status`, `embed_code`, `hidden_start`, `hidden_end`, `access_level`) VALUES
(11, '+ Foot', '-foot', 'https://stitichsports.com/images/small_picture/small_pic895.jpg', 'https://antenasport.online/canalfootfr.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(12, 'A Spor', 'a-spor', 'https://stitichsports.com/images/small_picture/small_pic619.jpg', 'https://daddylive1.ru/live/stream-139.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(13, 'A Sports', 'a-sports', 'https://stitichsports.com/images/small_picture/small_pic538.jpg', 'https://stream.crichd.sc/update/asportshd.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(14, 'A Sports Tv', 'a-sports-tv', 'https://stitichsports.com/images/small_picture/small_pic544.jpg', 'https://stream.crichd.sc/update/asportshd.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(15, 'ACC Network', 'acc-network', 'https://stitichsports.com/images/small_picture/small_pic862.jpg', 'https://daddylive1.ru/live/stream-664.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(16, 'ACCN Espn', 'accn-espn', 'https://stitichsports.com/images/small_picture/small_pic509.jpg', 'https://daddylive1.ru/live/stream-664.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(17, 'AFN Sports', 'afn-sports', 'https://stitichsports.com/images/small_picture/small_pic735.jpg', 'https://daddylive1.ru/live/stream-10.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(18, 'AFN Sports 2', 'afn-sports-2', 'https://stitichsports.com/images/small_picture/small_pic813.jpg', 'https://daddylive1.ru/live/stream-157.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'premium'),
(19, 'Al Kass Five', 'al-kass-five', 'https://stitichsports.com/images/small_picture/small_pic492.jpg', 'https://www.alkass.net/alkass/live.aspx?ch=online', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'premium'),
(20, 'Al Kass Four', 'al-kass-four', 'https://stitichsports.com/images/small_picture/small_pic106.jpg', 'https://daddylive1.ru/live/stream-784.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'premium'),
(21, 'Al Kass One', 'al-kass-one', 'https://stitichsports.com/images/small_picture/small_pic104.jpg', 'https://daddylive1.ru/live/stream-781.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'premium'),
(22, 'Al Kass Online', 'al-kass-online', 'https://stitichsports.com/images/small_picture/small_pic493.jpg', 'https://www.alkass.net/alkass/live.aspx?ch=online', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'premium'),
(23, 'Al Kass Two', 'al-kass-two', 'https://stitichsports.com/images/small_picture/small_pic105.jpg', 'https://daddylive1.ru/live/stream-782.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(24, 'Antena 1', 'antena-1', 'https://stitichsports.com/images/small_picture/small_pic855.jpg', 'https://antennasports.ru/antena1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(25, 'Arena Sport 1', 'arena-sport-1', 'https://stitichsports.com/images/small_picture/small_pic352.jpg', 'https://antennasports.ru/channel/ArenaSport1[SI]', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(26, 'Arena Sport 1 BiH', 'arena-sport-1-bih', 'https://stitichsports.com/images/small_picture/small_pic802.jpg', 'https://daddylive1.ru/live/stream-134.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(27, 'Arena Sport 1 Pr', 'arena-sport-1-pr', 'https://stitichsports.com/images/small_picture/small_pic787.jpg', 'https://daddylive1.ru/live/stream-134.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(28, 'Arena Sport 2', 'arena-sport-2', 'https://stitichsports.com/images/small_picture/small_pic353.jpg', 'https://daddylive1.ru/live/stream-430.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(29, 'Arena Sport 2 Pr', 'arena-sport-2-pr', 'https://stitichsports.com/images/small_picture/small_pic788.jpg', 'https://daddylive1.ru/live/stream-135.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(30, 'Arena Sport 3', 'arena-sport-3', 'https://stitichsports.com/images/small_picture/small_pic354.jpg', 'https://daddylive1.ru/live/stream-431.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(31, 'Arena Sport 3 Pr', 'arena-sport-3-pr', 'https://stitichsports.com/images/small_picture/small_pic789.jpg', 'https://daddylive1.ru/live/stream-139.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(32, 'Arena Sport 4', 'arena-sport-4', 'https://stitichsports.com/images/small_picture/small_pic355.jpg', 'https://daddylive1.ru/live/stream-581.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(33, 'Arena Sport 5', 'arena-sport-5', 'https://stitichsports.com/images/small_picture/small_pic356.jpg', 'https://daddylive1.ru/live/stream-23.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(34, 'ART Sport', 'art-sport', 'https://stitichsports.com/images/small_picture/small_pic584.jpg', 'https://daddylive1.ru/live/stream-163.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(35, 'ART Sport 2', 'art-sport-2', 'https://stitichsports.com/images/small_picture/small_pic838.jpg', 'https://daddylive1.ru/live/stream-173.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(36, 'ARTE Tv', 'arte-tv', 'https://stitichsports.com/images/small_picture/small_pic682.jpg', 'https://latestupdatespk.com/streamlivetv/46-arte', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(37, 'Astro Arena', 'astro-arena', 'https://stitichsports.com/images/small_picture/small_pic631.jpg', 'https://daddylive1.ru/live/stream-123.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(38, 'Astro Cricket', 'astro-cricket', 'https://stitichsports.com/images/small_picture/small_pic511.jpg', 'https://daddylive1.ru/live/stream-370.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'hidden', NULL, NULL, NULL, 'all'),
(39, 'Astro Supersport', 'astro-supersport', 'https://stitichsports.com/images/small_picture/small_pic431.jpg', 'https://daddylive1.ru/live/stream-123.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(40, 'Astro Supersport 2', 'astro-supersport-2', 'https://stitichsports.com/images/small_picture/small_pic624.jpg', 'https://daddylive1.ru/live/stream-124.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(41, 'Astro Supersport 3', 'astro-supersport-3', 'https://stitichsports.com/images/small_picture/small_pic384.jpg', 'https://daddylive1.ru/live/stream-125.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(42, 'Astro Supersport 4', 'astro-supersport-4', 'https://stitichsports.com/images/small_picture/small_pic433.jpg', 'https://daddylive1.ru/live/stream-126.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(43, 'Astro Supersport 5', 'astro-supersport-5', 'https://stitichsports.com/images/small_picture/small_pic623.jpg', 'https://daddylive1.ru/live/stream-43.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(44, 'ATN Cricket Plus', 'atn-cricket-plus', 'https://stitichsports.com/images/small_picture/small_pic786.jpg', 'https://stream.crichd.sc/update/willowcricket.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(45, 'Azteca 7', 'azteca-7', 'https://stitichsports.com/images/small_picture/small_pic779.jpg', 'https://daddylive1.ru/live/stream-3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(46, 'Bahrain Sports', 'bahrain-sports', 'https://stitichsports.com/images/small_picture/small_pic171.jpg', 'https://www.elahmad.com/tv/radiant.php?id=bahrain_sport', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(47, 'Bahrain Sports 2', 'bahrain-sports-2', 'https://stitichsports.com/images/small_picture/small_pic174.jpg', 'http://www.elahmad.com/tv/radiant.php?id=bahrain_sport_2', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(48, 'Bally Sports', 'bally-sports', 'https://stitichsports.com/images/small_picture/small_pic707.jpg', 'https://daddylive1.ru/live/stream-20.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(49, 'Band Sports', 'band-sports', 'https://stitichsports.com/images/small_picture/small_pic664.jpg', 'https://daddylive1.ru/live/stream-68.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(50, 'Barca Tv', 'barca-tv', 'https://stitichsports.com/images/small_picture/small_pic814.jpg', 'https://d.daddylivehd.sx/embed/stream-357.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(51, 'BBC Alba', 'bbc-alba', 'https://stitichsports.com/images/small_picture/small_pic835.jpg', 'https://daddylive1.ru/live/stream-68.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(52, 'BBC America', 'bbc-america', 'https://stitichsports.com/images/small_picture/small_pic798.jpg', 'https://daddylive1.ru/live/stream-305.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(53, 'BBC Four', 'bbc-four', 'https://stitichsports.com/images/small_picture/small_pic759.jpg', 'https://daddylive1.ru/live/stream-359.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(54, 'BBC One', 'bbc-one', 'https://stitichsports.com/images/small_picture/small_pic467.jpg', 'https://daddylive1.ru/live/stream-356.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(55, 'BBC Sport', 'bbc-sport', 'https://stitichsports.com/images/small_picture/small_pic628.jpg', 'https://daddylive1.ru/live/stream-356.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(56, 'BBC Three', 'bbc-three', 'https://stitichsports.com/images/small_picture/small_pic899.jpg', 'https://daddylive1.ru/live/stream-68.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(57, 'BBC Two', 'bbc-two', 'https://stitichsports.com/images/small_picture/small_pic494.jpg', 'https://stream.crichd.sc/update/ch2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(58, 'BBC Two Wales', 'bbc-two-wales', 'https://stitichsports.com/images/small_picture/small_pic834.jpg', 'https://daddylive1.ru/live/stream-152.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(59, 'beIN Sports 1 AR', 'bein-sports-1-ar', 'https://stitichsports.com/images/small_picture/small_pic606.jpg', 'https://daddylive1.ru/live/stream-91.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(60, 'beIN Sports 1 Canli', 'bein-sports-1-canli', 'https://stitichsports.com/images/small_picture/small_pic513.jpg', 'https://daddylive1.ru/live/stream-62.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(61, 'beIN Sports 1 En', 'bein-sports-1-en', 'https://stitichsports.com/images/small_picture/small_pic485.jpg', 'https://daddylive1.ru/live/stream-61.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(62, 'beIN Sports 1 FR', 'bein-sports-1-fr', 'https://stitichsports.com/images/small_picture/small_pic337.jpg', 'https://daddylive1.ru/live/stream-116.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(63, 'beIN Sports 1 HD', 'bein-sports-1-hd', 'https://stitichsports.com/images/small_picture/small_pic605.jpg', 'https://daddylive1.ru/live/stream-91.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(64, 'beIN Sports 1 PR', 'bein-sports-1-pr', 'https://stitichsports.com/images/small_picture/small_pic609.jpg', 'https://daddylive1.ru/live/stream-98.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(65, 'beIN Sports 2 AR', 'bein-sports-2-ar', 'https://stitichsports.com/images/small_picture/small_pic607.jpg', 'https://daddylive1.ru/live/stream-92.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(66, 'beIN Sports 2 Canli', 'bein-sports-2-canli', 'https://stitichsports.com/images/small_picture/small_pic514.jpg', 'https://daddylive1.ru/live/stream-63.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(67, 'beIN Sports 2 En', 'bein-sports-2-en', 'https://stitichsports.com/images/small_picture/small_pic462.jpg', 'https://daddylive1.ru/live/stream-90.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(68, 'beIN Sports 2 FR', 'bein-sports-2-fr', 'https://stitichsports.com/images/small_picture/small_pic338.jpg', 'https://daddylive1.ru/live/stream-117.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(69, 'beIN Sports 2 HD', 'bein-sports-2-hd', 'https://stitichsports.com/images/small_picture/small_pic589.jpg', 'https://daddylive1.ru/live/stream-92.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(70, 'beIN Sports 2 PR', 'bein-sports-2-pr', 'https://stitichsports.com/images/small_picture/small_pic610.jpg', 'https://daddylive1.ru/live/stream-99.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(71, 'beIN Sports 3 AR', 'bein-sports-3-ar', 'https://stitichsports.com/images/small_picture/small_pic608.jpg', 'https://daddylive1.ru/live/stream-93.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(72, 'beIN Sports 3 Canli', 'bein-sports-3-canli', 'https://stitichsports.com/images/small_picture/small_pic515.jpg', 'https://daddylive1.ru/live/stream-64.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(73, 'beIN Sports 3 En', 'bein-sports-3-en', 'https://stitichsports.com/images/small_picture/small_pic486.jpg', 'https://daddylive1.ru/live/stream-46.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(74, 'beIN Sports 3 FR', 'bein-sports-3-fr', 'https://stitichsports.com/images/small_picture/small_pic339.jpg', 'https://stream.crichd.sc/update/bein3fr.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(75, 'beIN Sports 3 HD', 'bein-sports-3-hd', 'https://stitichsports.com/images/small_picture/small_pic590.jpg', 'https://daddylive1.ru/live/stream-93.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(76, 'beIN Sports 3 PR', 'bein-sports-3-pr', 'https://stitichsports.com/images/small_picture/small_pic611.jpg', 'https://daddylive1.ru/live/stream-100.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(77, 'beIN Sports 4 AR', 'bein-sports-4-ar', 'https://stitichsports.com/images/small_picture/small_pic585.jpg', 'https://daddylive1.ru/live/stream-94.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(78, 'beIN Sports 4 Canli', 'bein-sports-4-canli', 'https://stitichsports.com/images/small_picture/small_pic503.jpg', 'https://daddylive1.ru/live/stream-67.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(79, 'beIN Sports 4 FR', 'bein-sports-4-fr', 'https://stitichsports.com/images/small_picture/small_pic378.jpg', 'https://daddylive1.ru/live/stream-94.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(80, 'beIN Sports 4 HD', 'bein-sports-4-hd', 'https://stitichsports.com/images/small_picture/small_pic595.jpg', 'https://daddylive1.ru/live/stream-94.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(81, 'beIN Sports 5 AR', 'bein-sports-5-ar', 'https://stitichsports.com/images/small_picture/small_pic578.jpg', 'https://daddylive1.ru/live/stream-95.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(82, 'beIN Sports 5 FR', 'bein-sports-5-fr', 'https://stitichsports.com/images/small_picture/small_pic463.jpg', 'https://daddylive1.ru/live/ch95.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(83, 'beIN Sports 6 AR', 'bein-sports-6-ar', 'https://stitichsports.com/images/small_picture/small_pic579.jpg', 'https://daddylive1.ru/live/stream-96.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(84, 'beIN Sports 7', 'bein-sports-7', 'https://stitichsports.com/images/small_picture/small_pic639.jpg', 'https://daddylive1.ru/live/stream-97.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(85, 'beIN Sports Haber', 'bein-sports-haber', 'https://stitichsports.com/images/small_picture/small_pic594.jpg', 'https://tutelehd3.xyz/online.php?a=76', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(86, 'beIN Sports HD', 'bein-sports-hd', 'https://stitichsports.com/images/small_picture/small_pic340.jpg', 'https://daddylive1.ru/live/stream-425.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(87, 'beIN Sports Max 1', 'bein-sports-max-1', 'https://stitichsports.com/images/small_picture/small_pic867.jpg', 'https://daddylive1.ru/live/stream-296.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(88, 'beIN Sports Max 10', 'bein-sports-max-10', 'https://stitichsports.com/images/small_picture/small_pic553.jpg', 'https://daddylive1.ru/live/stream-500.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(89, 'beIN Sports Max 2', 'bein-sports-max-2', 'https://stitichsports.com/images/small_picture/small_pic868.jpg', 'https://daddylive1.ru/live/stream-297.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(90, 'beIN Sports Max 3', 'bein-sports-max-3', 'https://stitichsports.com/images/small_picture/small_pic869.jpg', 'https://daddylive1.ru/live/stream-298.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(91, 'beIN Sports Max 4', 'bein-sports-max-4', 'https://stitichsports.com/images/small_picture/small_pic541.jpg', 'https://daddylive1.ru/live/stream-494.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(92, 'beIN Sports Max 5', 'bein-sports-max-5', 'https://stitichsports.com/images/small_picture/small_pic549.jpg', 'https://daddylive1.ru/live/stream-495.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(93, 'beIN Sports Max 6', 'bein-sports-max-6', 'https://stitichsports.com/images/small_picture/small_pic542.jpg', 'https://daddylive1.ru/live/stream-496.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(94, 'beIN Sports Max 7', 'bein-sports-max-7', 'https://stitichsports.com/images/small_picture/small_pic550.jpg', 'https://daddylive1.ru/live/stream-497.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(95, 'beIN Sports Max 8', 'bein-sports-max-8', 'https://stitichsports.com/images/small_picture/small_pic551.jpg', 'https://daddylive1.ru/live/stream-498.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(96, 'beIN Sports Max 9', 'bein-sports-max-9', 'https://stitichsports.com/images/small_picture/small_pic552.jpg', 'https://daddylive1.ru/live/stream-499.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(97, 'beIN SPORTS XTRA', 'bein-sports-xtra', 'https://stitichsports.com/images/small_picture/small_pic831.jpg', 'https://daddylive1.ru/live/ch100.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(98, 'beIN SPORTS XTRA 2', 'bein-sports-xtra-2', 'https://stitichsports.com/images/small_picture/small_pic864.jpg', 'https://stream.crichd.sc/update/bein2xtra.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(99, 'Belarus 5', 'belarus-5', 'https://stitichsports.com/images/small_picture/small_pic894.jpg', 'https://daddylive1.ru/live/stream-11.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(100, 'Benfica Tv', 'benfica-tv', 'https://stitichsports.com/images/small_picture/small_pic409.jpg', 'https://daddylive1.ru/live/stream-380.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(101, 'Big Bash', 'big-bash', 'https://stitichsports.com/images/small_picture/small_pic366.jpg', 'https://stream.crichd.sc/update/willowcricket.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(102, 'Big Ten Network', 'big-ten-network', 'https://stitichsports.com/images/small_picture/small_pic499.jpg', 'https://daddylive1.ru/live/stream-397.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(103, 'Blue Sport 1', 'blue-sport-1', 'https://stitichsports.com/images/small_picture/small_pic777.jpg', 'https://daddylive1.ru/live/stream-27.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(104, 'Blue Sport 2', 'blue-sport-2', 'https://stitichsports.com/images/small_picture/small_pic778.jpg', 'https://daddylive1.ru/live/stream-27.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(105, 'BNT 1', 'bnt-1', 'https://stitichsports.com/images/small_picture/small_pic870.jpg', 'https://daddylive1.ru/live/stream-13.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(106, 'BNT 3', 'bnt-3', 'https://stitichsports.com/images/small_picture/small_pic856.jpg', 'https://daddylive1.ru/live/stream-17.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(107, 'Box Nation', 'box-nation', 'https://stitichsports.com/images/small_picture/small_pic525.jpg', 'https://stream.crichd.sc/update/do7.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(108, 'BT Sport 1', 'bt-sport-1', 'https://stitichsports.com/images/small_picture/small_pic202.jpg', 'https://stream.crichd.sc/update/bt1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(109, 'BT Sport 2', 'bt-sport-2', 'https://stitichsports.com/images/small_picture/small_pic203.jpg', 'https://stream.crichd.sc/update/bt2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(110, 'BT Sport 3', 'bt-sport-3', 'https://stitichsports.com/images/small_picture/small_pic204.jpg', 'https://stream.crichd.sc/update/bteu.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(111, 'BT Sport 4', 'bt-sport-4', 'https://stitichsports.com/images/small_picture/small_pic803.jpg', 'https://daddylive1.ru/live/stream-34.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(112, 'BT Sport 5', 'bt-sport-5', 'https://stitichsports.com/images/small_picture/small_pic801.jpg', 'https://stream.crichd.sc/update/ch10.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(113, 'BT Sport 6', 'bt-sport-6', 'https://stitichsports.com/images/small_picture/small_pic832.jpg', 'https://stream.crichd.sc/update/ch11.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(114, 'BT Sport 7', 'bt-sport-7', 'https://stitichsports.com/images/small_picture/small_pic833.jpg', 'https://stream.crichd.sc/update/ch12.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(115, 'BT Sport 8', 'bt-sport-8', 'https://stitichsports.com/images/small_picture/small_pic849.jpg', 'https://stream.crichd.sc/update/ch13.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(116, 'BT Sport Box Office', 'bt-sport-box-office', 'https://stitichsports.com/images/small_picture/small_pic893.jpg', 'https://stream.crichd.sc/update/espn.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(117, 'BT Sport Espn', 'bt-sport-espn', 'https://stitichsports.com/images/small_picture/small_pic201.jpg', 'https://stream.crichd.sc/update/espn.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(118, 'BTv', 'btv', 'https://stitichsports.com/images/small_picture/small_pic613.jpg', 'https://daddylive1.ru/live/stream-380.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(119, 'Bundesliga 1', 'bundesliga-1', 'https://stitichsports.com/images/small_picture/small_pic804.jpg', 'https://daddylive1.ru/live/stream-558.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(120, 'Bundesliga 2', 'bundesliga-2', 'https://stitichsports.com/images/small_picture/small_pic806.jpg', 'https://daddylive1.ru/live/stream-15.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(121, 'Bundesliga 3', 'bundesliga-3', 'https://stitichsports.com/images/small_picture/small_pic805.jpg', 'https://daddylive1.ru/live/stream-3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(122, 'Bundesliga 4', 'bundesliga-4', 'https://stitichsports.com/images/small_picture/small_pic807.jpg', 'https://daddylive1.ru/live/stream-16.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(123, 'Bundesliga 5', 'bundesliga-5', 'https://stitichsports.com/images/small_picture/small_pic820.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(124, 'C More Live 3', 'c-more-live-3', 'https://stitichsports.com/images/small_picture/small_pic612.jpg', 'https://daddylive1.ru/live/stream-747.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(125, 'Cablenet Sports 1', 'cablenet-sports-1', 'https://stitichsports.com/images/small_picture/small_pic825.jpg', 'https://daddylive1.ru/live/stream-55.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(126, 'Canal + Premium', 'canal--premium', 'https://stitichsports.com/images/small_picture/small_pic774.jpg', 'https://daddylive1.ru/live/stream-566.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(127, 'Canal + Sport', 'canal--sport', 'https://stitichsports.com/images/small_picture/small_pic199.jpg', 'https://antenasport.online/canalplusfr.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(128, 'Canal + Sport 2', 'canal--sport-2', 'https://stitichsports.com/images/small_picture/small_pic382.jpg', 'https://daddylive1.ru/live/stream-122.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(129, 'Canal + Sport 3', 'canal--sport-3', 'https://stitichsports.com/images/small_picture/small_pic827.jpg', 'https://daddylive1.ru/live/stream-48.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(130, 'Canal 10', 'canal-10', 'https://stitichsports.com/images/small_picture/small_pic882.jpg', 'https://daddylive1.ru/live/stream-55.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(131, 'Canal 11', 'canal-11', 'https://stitichsports.com/images/small_picture/small_pic577.jpg', 'https://daddylive1.ru/live/stream-540.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(132, 'Canal+', 'canal', 'https://stitichsports.com/images/small_picture/small_pic393.jpg', 'https://daddylive1.ru/live/stream-122.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(133, 'Canal+ Family', 'canal-family', 'https://stitichsports.com/images/small_picture/small_pic775.jpg', 'https://daddylive1.ru/live/stream-567.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(134, 'Canal+ Formula 1', 'canal-formula-1', 'https://stitichsports.com/images/small_picture/small_pic912.jpg', 'https://daddylive1.ru/live/stream-273.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(135, 'Canal+ Sport 2 Pl', 'canal-sport-2-pl', 'https://stitichsports.com/images/small_picture/small_pic808.jpg', 'https://daddylive1.ru/live/stream-73.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(136, 'Canal+ Sport 5', 'canal-sport-5', 'https://stitichsports.com/images/small_picture/small_pic917.jpg', 'https://daddylive1.ru/live/stream-75.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(137, 'Canal+ Sport Pl', 'canal-sport-pl', 'https://stitichsports.com/images/small_picture/small_pic860.jpg', 'https://daddylive1.ru/live/stream-48.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(138, 'Caracol Tv', 'caracol-tv', 'https://stitichsports.com/images/small_picture/small_pic854.jpg', 'https://daddylive1.ru/live/stream-25.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(139, 'CBC Sports', 'cbc-sports', 'https://stitichsports.com/images/small_picture/small_pic621.jpg', 'https://daddylive1.ru/live/stream-13.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(140, 'CBS Sports', 'cbs-sports', 'https://stitichsports.com/images/small_picture/small_pic368.jpg', 'https://daddylive1.ru/live/stream-308.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(141, 'Channel 4', 'channel-4', 'https://stitichsports.com/images/small_picture/small_pic904.jpg', 'https://daddylive1.ru/live/stream-354.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(142, 'Chelsea Tv', 'chelsea-tv', 'https://stitichsports.com/images/small_picture/small_pic404.jpg', 'https://daddylive1.ru/live/stream-3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(143, 'Claro Sports', 'claro-sports', 'https://stitichsports.com/images/small_picture/small_pic853.jpg', 'https://daddylive1.ru/live/stream-76.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(144, 'CNBC', 'cnbc', 'https://stitichsports.com/images/small_picture/small_pic637.jpg', 'https://daddylive1.ru/live/stream-53.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(145, 'Combate', 'combate', 'https://stitichsports.com/images/small_picture/small_pic743.jpg', 'https://daddylive1.ru/live/stream-89.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(146, 'Cosmote Sport 1', 'cosmote-sport-1', 'https://stitichsports.com/images/small_picture/small_pic733.jpg', 'https://daddylive1.ru/live/stream-622.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(147, 'Cosmote Sport 2', 'cosmote-sport-2', 'https://stitichsports.com/images/small_picture/small_pic828.jpg', 'https://antennasports.ru/cosmote2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(148, 'Cosmote Sport 3', 'cosmote-sport-3', 'https://stitichsports.com/images/small_picture/small_pic902.jpg', 'https://antennasports.ru/cosmote3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(149, 'Cricket 2024', 'cricket-2024', 'https://stitichsports.com/images/small_picture/small_pic497.jpg', 'https://stream.crichd.sc/update/asportshd.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(150, 'CricLife 1', 'criclife-1', 'https://stitichsports.com/images/small_picture/small_pic916.jpg', 'https://crichdstreaming.xyz/embed2.php?id=spch32', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(151, 'CT Sport', 'ct-sport', 'https://stitichsports.com/images/small_picture/small_pic784.jpg', 'https://daddylive1.ru/live/stream-7.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(152, 'Cuatro HD', 'cuatro-hd', 'https://stitichsports.com/images/small_picture/small_pic816.jpg', 'https://daddylive1.ru/live/stream-477.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(153, 'DAZN 1 BR', 'dazn-1-br', 'https://stitichsports.com/images/small_picture/small_pic520.jpg', 'https://daddylive1.ru/live/stream-445.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(154, 'DAZN 1 ES', 'dazn-1-es', 'https://stitichsports.com/images/small_picture/small_pic521.jpg', 'https://antenasport.online/dazn1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(155, 'DAZN 1 UK', 'dazn-1-uk', 'https://stitichsports.com/images/small_picture/small_pic383.jpg', 'https://v2.sportsonline.si/channels/hd/hd3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(156, 'DAZN 2 ES', 'dazn-2-es', 'https://stitichsports.com/images/small_picture/small_pic522.jpg', 'https://daddylive1.ru/live/stream-427.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(157, 'DAZN 2 UK', 'dazn-2-uk', 'https://stitichsports.com/images/small_picture/small_pic547.jpg', 'https://daddylive1.ru/live/stream-446.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(158, 'DAZN 3 ES', 'dazn-3-es', 'https://stitichsports.com/images/small_picture/small_pic523.jpg', 'https://antenasport.online/dazn3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(159, 'DAZN 4 ES', 'dazn-4-es', 'https://stitichsports.com/images/small_picture/small_pic524.jpg', 'https://antenasport.online/dazn4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(160, 'DAZN F1 ES', 'dazn-f1-es', 'https://stitichsports.com/images/small_picture/small_pic459.jpg', 'https://antenasport.online/daznf1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(161, 'DAZN LaLiga', 'dazn-laliga', 'https://stitichsports.com/images/small_picture/small_pic829.jpg', 'https://daddylive1.ru/live/stream-538.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(162, 'DAZN LaLiga 2', 'dazn-laliga-2', 'https://stitichsports.com/images/small_picture/small_pic903.jpg', 'https://antenasport.online/liga2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(163, 'Diema Sport', 'diema-sport', 'https://stitichsports.com/images/small_picture/small_pic438.jpg', 'https://daddylive1.ru/live/stream-465.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(164, 'Diema Sport 2', 'diema-sport-2', 'https://stitichsports.com/images/small_picture/small_pic439.jpg', 'https://daddylive1.ru/live/stream-466.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(165, 'Diema Sport 3', 'diema-sport-3', 'https://stitichsports.com/images/small_picture/small_pic626.jpg', 'https://daddylive1.ru/live/stream-467.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(166, 'Digi Sport 1', 'digi-sport-1', 'https://stitichsports.com/images/small_picture/small_pic197.jpg', 'https://antennasports.ru/digisport1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(167, 'Digi Sport 2', 'digi-sport-2', 'https://stitichsports.com/images/small_picture/small_pic379.jpg', 'https://antennasports.ru/digisport2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(168, 'Digi Sport 3', 'digi-sport-3', 'https://stitichsports.com/images/small_picture/small_pic380.jpg', 'https://antennasports.ru/digisport3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(169, 'Digi Sport 4', 'digi-sport-4', 'https://stitichsports.com/images/small_picture/small_pic526.jpg', 'https://antennasports.ru/digisport4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(170, 'Directo Gol', 'directo-gol', 'https://stitichsports.com/images/small_picture/small_pic598.jpg', 'https://daddylive1.ru/live/stream-21.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(171, 'DirecTv Sports', 'directv-sports', 'https://stitichsports.com/images/small_picture/small_pic555.jpg', 'https://tutelehd3.xyz/online.php?a=6', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(172, 'DirecTv Sports 2', 'directv-sports-2', 'https://stitichsports.com/images/small_picture/small_pic556.jpg', 'https://tutelehd3.xyz/online.php?a=7', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(173, 'DirecTv Sports Plus', 'directv-sports-plus', 'https://stitichsports.com/images/small_picture/small_pic557.jpg', 'https://tutelehd3.xyz/online.php?a=8', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(174, 'DR 1', 'dr-1', 'https://stitichsports.com/images/small_picture/small_pic732.jpg', 'https://daddylive1.ru/live/stream-161.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(175, 'DR 2', 'dr-2', 'https://stitichsports.com/images/small_picture/small_pic884.jpg', 'https://daddylive1.ru/live/stream-160.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(176, 'Dubai Sports 1', 'dubai-sports-1', 'https://stitichsports.com/images/small_picture/small_pic405.jpg', 'https://daddylive1.ru/live/stream-156.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(177, 'Dubai Sports 2', 'dubai-sports-2', 'https://stitichsports.com/images/small_picture/small_pic865.jpg', 'https://daddylive1.ru/live/stream-157.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(178, 'Een Channel', 'een-channel', 'https://stitichsports.com/images/small_picture/small_pic875.jpg', 'https://daddylive1.ru/live/stream-24.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(179, 'Eir Sports 1', 'eir-sports-1', 'https://stitichsports.com/images/small_picture/small_pic470.jpg', 'https://www.ustream.to/embed?id=eir-sport-1', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(180, 'Eir Sports 2', 'eir-sports-2', 'https://stitichsports.com/images/small_picture/small_pic471.jpg', 'https://daddylive1.ru/live/stream-455.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(181, 'Eleven 1', 'eleven-1', 'https://stitichsports.com/images/small_picture/small_pic454.jpg', 'https://sportsonline.sx/channels/pt/eleven1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(182, 'Eleven 1 Poland', 'eleven-1-poland', 'https://stitichsports.com/images/small_picture/small_pic793.jpg', 'https://daddylive1.ru/live/stream-71.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(183, 'Eleven 2', 'eleven-2', 'https://stitichsports.com/images/small_picture/small_pic465.jpg', 'https://v3.sportsonline.to/channels/pt/eleven2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(184, 'Eleven 2 Poland', 'eleven-2-poland', 'https://stitichsports.com/images/small_picture/small_pic794.jpg', 'https://daddylive1.ru/live/stream-72.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(185, 'Eleven 3', 'eleven-3', 'https://stitichsports.com/images/small_picture/small_pic386.jpg', 'https://sportsonline.sx/channels/pt/eleven3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(186, 'Eleven 4', 'eleven-4', 'https://stitichsports.com/images/small_picture/small_pic592.jpg', 'https://daddylive1.ru/live/stream-458.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(187, 'Eleven 5', 'eleven-5', 'https://stitichsports.com/images/small_picture/small_pic618.jpg', 'https://daddylive1.ru/live/stream-459.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(188, 'Eleven 6', 'eleven-6', 'https://stitichsports.com/images/small_picture/small_pic593.jpg', 'https://daddylive1.ru/live/stream-460.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(189, 'Eleven Pro League', 'eleven-pro-league', 'https://stitichsports.com/images/small_picture/small_pic790.jpg', 'https://daddylive1.ru/live/stream-7.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(190, 'Eleven Sports 1', 'eleven-sports-1', 'https://stitichsports.com/images/small_picture/small_pic357.jpg', 'https://daddylive1.ru/live/stream-71.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(191, 'Eleven Sports 2', 'eleven-sports-2', 'https://stitichsports.com/images/small_picture/small_pic358.jpg', 'https://daddylive1.ru/live/stream-72.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(192, 'Eleven Sports 3', 'eleven-sports-3', 'https://stitichsports.com/images/small_picture/small_pic582.jpg', 'https://daddylive1.ru/live/stream-428.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(193, 'Eleven Sports 4', 'eleven-sports-4', 'https://stitichsports.com/images/small_picture/small_pic527.jpg', 'https://daddylive1.ru/live/stream-429.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(194, 'ERT 1', 'ert-1', 'https://stitichsports.com/images/small_picture/small_pic846.jpg', 'https://daddylive1.ru/live/stream-163.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(195, 'ERT 3', 'ert-3', 'https://stitichsports.com/images/small_picture/small_pic888.jpg', 'https://daddylive1.ru/live/stream-6.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(196, 'ESPN', 'espn', 'https://stitichsports.com/images/small_picture/small_pic200.jpg', 'https://www.sports-stream.click/chtv/ch57.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(197, 'ESPN 1 NL', 'espn-1-nl', 'https://stitichsports.com/images/small_picture/small_pic614.jpg', 'https://daddylive1.ru/live/stream-379.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(198, 'ESPN 2', 'espn-2', 'https://stitichsports.com/images/small_picture/small_pic424.jpg', 'https://www.sports-stream.click/chtv/ch58.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(199, 'ESPN 2 NL', 'espn-2-nl', 'https://stitichsports.com/images/small_picture/small_pic466.jpg', 'https://daddylive1.ru/live/stream-386.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(200, 'ESPN 2 Sur', 'espn-2-sur', 'https://stitichsports.com/images/small_picture/small_pic570.jpg', 'https://daddylive1.ru/live/stream-150.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(201, 'ESPN 2 Vivo', 'espn-2-vivo', 'https://stitichsports.com/images/small_picture/small_pic517.jpg', 'https://daddylive1.ru/live/stream-82.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(202, 'ESPN 3 NL', 'espn-3-nl', 'https://stitichsports.com/images/small_picture/small_pic495.jpg', 'https://tutelehd3.xyz/online.php?a=3', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(203, 'ESPN 4 NL', 'espn-4-nl', 'https://stitichsports.com/images/small_picture/small_pic417.jpg', 'https://daddylive1.ru/live/stream-85.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(204, 'ESPN Brasil', 'espn-brasil', 'https://stitichsports.com/images/small_picture/small_pic430.jpg', 'https://sportsonline.to/channels/bra/br4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(205, 'ESPN Deportes', 'espn-deportes', 'https://stitichsports.com/images/small_picture/small_pic419.jpg', 'https://antenasport.online/espndeportes.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(206, 'ESPN Networks', 'espn-networks', 'https://stitichsports.com/images/small_picture/small_pic615.jpg', 'https://tutelehd3.xyz/online.php?a=18', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(207, 'ESPN Premium', 'espn-premium', 'https://stitichsports.com/images/small_picture/small_pic898.jpg', 'https://daddylive1.ru/live/stream-387.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(208, 'ESPN Vivo', 'espn-vivo', 'https://stitichsports.com/images/small_picture/small_pic464.jpg', 'https://daddylive1.ru/live/stream-82.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(209, 'ESPNU', 'espnu', 'https://stitichsports.com/images/small_picture/small_pic498.jpg', 'https://daddylive1.ru/live/stream-316.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(210, 'Eurosport 1', 'eurosport-1', 'https://stitichsports.com/images/small_picture/small_pic213.jpg', 'https://stream.crichd.sc/update/euro1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(211, 'Eurosport 1 Poland', 'eurosport-1-poland', 'https://stitichsports.com/images/small_picture/small_pic809.jpg', 'https://daddylive1.ru/live/stream-57.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(212, 'Eurosport 2', 'eurosport-2', 'https://stitichsports.com/images/small_picture/small_pic214.jpg', 'https://stream.crichd.sc/update/euro2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(213, 'Eurosport 2 Poland', 'eurosport-2-poland', 'https://stitichsports.com/images/small_picture/small_pic810.jpg', 'https://daddylive1.ru/live/stream-58.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(214, 'Foot Plus', 'foot-plus', 'https://stitichsports.com/images/small_picture/small_pic533.jpg', 'https://stream.crichd.sc/update/fox502.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(215, 'Fox 502 HD', 'fox-502-hd', 'https://stitichsports.com/images/small_picture/small_pic659.jpg', 'https://stream.crichd.sc/update/fox502.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(216, 'Fox 503 HD', 'fox-503-hd', 'https://stitichsports.com/images/small_picture/small_pic660.jpg', 'https://stream.crichd.sc/update/fox503.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(217, 'Fox Cricket 501', 'fox-cricket-501', 'https://stitichsports.com/images/small_picture/small_pic591.jpg', 'https://stream.crichd.sc/update/fox501.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(218, 'FOX Deportes', 'fox-deportes', 'https://stitichsports.com/images/small_picture/small_pic560.jpg', 'https://antenasport.online/foxdeportes.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(219, 'Fox Footy 504', 'fox-footy-504', 'https://stitichsports.com/images/small_picture/small_pic661.jpg', 'https://stream.crichd.sc/update/fox504.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(220, 'Fox HD', 'fox-hd', 'https://stitichsports.com/images/small_picture/small_pic371.jpg', 'https://daddylive1.ru/live/stream-54.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(221, 'Fox League', 'fox-league', 'https://stitichsports.com/images/small_picture/small_pic369.jpg', 'https://stream.crichd.sc/update/fox502.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(222, 'FOX Network', 'fox-network', 'https://stitichsports.com/images/small_picture/small_pic883.jpg', 'https://daddylive1.ru/live/stream-54.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(223, 'Fox NFL', 'fox-nfl', 'https://stitichsports.com/images/small_picture/small_pic576.jpg', 'https://daddylive1.ru/live/stream-54.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(224, 'FOX Soccer Plus', 'fox-soccer-plus', 'https://stitichsports.com/images/small_picture/small_pic500.jpg', 'https://antenasport.online/foxsoccerplus.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(225, 'FOX Sports', 'fox-sports', 'https://stitichsports.com/images/small_picture/small_pic367.jpg', 'https://daddylive1.ru/live/stream-39.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(227, 'FOX Sports 1', 'fox-sports-1', 'https://stitichsports.com/images/small_picture/small_pic423.jpg', 'https://www.sports-stream.click/chtv/ch54.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(228, 'Fox Sports 2', 'fox-sports-2', 'https://stitichsports.com/images/small_picture/small_pic391.jpg', 'https://www.sports-stream.click/chtv/ch55.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(229, 'FOX Sports 3', 'fox-sports-3', 'https://stitichsports.com/images/small_picture/small_pic920.jpg', 'https://daddylive1.ru/live/stream-789.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(230, 'Fox Sports 505', 'fox-sports-505', 'https://stitichsports.com/images/small_picture/small_pic662.jpg', 'https://stream.crichd.sc/update/fox505.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(231, 'Fox Sports 506', 'fox-sports-506', 'https://stitichsports.com/images/small_picture/small_pic663.jpg', 'https://stream.crichd.sc/update/fox506.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all');
INSERT INTO `channels` (`id`, `name`, `slug`, `logo`, `link`, `description`, `live_status`, `category_id`, `icon`, `created_at`, `status`, `embed_code`, `hidden_start`, `hidden_end`, `access_level`) VALUES
(232, 'Fox Sports Premium', 'fox-sports-premium', 'https://stitichsports.com/images/small_picture/small_pic420.jpg', 'https://tutelehd3.xyz/online.php?a=5', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(233, 'Fox Sports Racing', 'fox-sports-racing', 'https://stitichsports.com/images/small_picture/small_pic910.jpg', 'https://daddylive1.ru/live/stream-10.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(234, 'FOX Sports Vivo', 'fox-sports-vivo', 'https://stitichsports.com/images/small_picture/small_pic441.jpg', 'https://daddylive1.ru/live/stream-85.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(235, 'FreeSports', 'freesports', 'https://stitichsports.com/images/small_picture/small_pic457.jpg', 'https://stream.crichd.sc/update/ch3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(236, 'Futbol 1', 'futbol-1', 'https://stitichsports.com/images/small_picture/small_pic341.jpg', 'https://antenasport.online/match1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(237, 'Futbol 2', 'futbol-2', 'https://stitichsports.com/images/small_picture/small_pic342.jpg', 'https://daddylive1.ru/live/stream-137.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(238, 'Futbol 3', 'futbol-3', 'https://stitichsports.com/images/small_picture/small_pic502.jpg', 'https://antenasport.online/match3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(239, 'FUTv', 'futv', 'https://stitichsports.com/images/small_picture/small_pic627.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(240, 'Gazi Tv', 'gazi-tv', 'https://stitichsports.com/images/small_picture/small_pic536.jpg', 'https://stream.crichd.sc/update/gazitv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(241, 'Geo Super', 'geo-super', 'https://stitichsports.com/images/small_picture/small_pic63.jpg', 'https://crichdplayer.xyz/embed2.php?id=geosuper&q=Geo', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(242, 'Gol Mundial', 'gol-mundial', 'https://stitichsports.com/images/small_picture/small_pic880.jpg', 'https://stream.crichd.sc/update/golmun2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(243, 'Golf Channel', 'golf-channel', 'https://stitichsports.com/images/small_picture/small_pic390.jpg', 'https://daddylive1.ru/live/stream-318.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(244, 'GOLPERU', 'golperu', 'https://stitichsports.com/images/small_picture/small_pic416.jpg', 'https://daddylive1.ru/live/stream-21.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(245, 'GOLTv', 'goltv', 'https://stitichsports.com/images/small_picture/small_pic418.jpg', 'https://antenasport.store/goltv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(246, 'GTv', 'gtv', 'https://stitichsports.com/images/small_picture/small_pic539.jpg', 'https://stream.crichd.sc/update/gazitv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(247, 'HNTv', 'hntv', 'https://stitichsports.com/images/small_picture/small_pic376.jpg', 'https://daddylive1.ru/live/stream-134.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(248, 'HRT 2', 'hrt-2', 'https://stitichsports.com/images/small_picture/small_pic736.jpg', 'https://daddylive1.ru/live/stream-6.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(249, 'ICC T20', 'icc-t20', 'https://stitichsports.com/images/small_picture/small_pic616.jpg', 'https://stream.crichd.sc/update/ptv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(250, 'ICC World Cup', 'icc-world-cup', 'https://stitichsports.com/images/small_picture/small_pic434.jpg', 'https://stream.crichd.sc/update/ptv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(251, 'Idman Tv', 'idman-tv', 'https://stitichsports.com/images/small_picture/small_pic177.jpg', 'https://yodaplayer.yodacdn.net/idmanpop/', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(252, 'Infosport +', 'infosport-', 'https://stitichsports.com/images/small_picture/small_pic407.jpg', 'https://daddylive1.ru/live/stream-350.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(253, 'IPL', 'ipl', 'https://stitichsports.com/images/small_picture/small_pic221.jpg', 'https://stream.crichd.sc/update/star1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(254, 'ITv', 'itv', 'https://stitichsports.com/images/small_picture/small_pic468.jpg', 'https://daddylive1.ru/live/stream-350.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(255, 'Itv 1', 'itv-1', 'https://stitichsports.com/images/small_picture/small_pic873.jpg', 'https://stream.crichd.sc/update/ch4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(256, 'ITv2', 'itv2', 'https://stitichsports.com/images/small_picture/small_pic760.jpg', 'https://daddylive1.ru/live/stream-351.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(257, 'ITv4', 'itv4', 'https://stitichsports.com/images/small_picture/small_pic451.jpg', 'https://daddylive1.ru/live/stream-353.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(258, 'Jordan Sport', 'jordan-sport', 'https://stitichsports.com/images/small_picture/small_pic737.jpg', 'https://daddylive1.ru/live/stream-3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(259, 'Kan 11', 'kan-11', 'https://stitichsports.com/images/small_picture/small_pic876.jpg', 'https://daddylive1.ru/live/stream-18.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(260, 'KHL Prime', 'khl-prime', 'https://stitichsports.com/images/small_picture/small_pic332.jpg', 'https://daddylive1.ru/live/stream-55.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(261, 'KSA 2', 'ksa-2', 'https://stitichsports.com/images/small_picture/small_pic652.jpg', 'https://latestupdatespk.com/tv/47-ksa-2', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(262, 'KSA Sports', 'ksa-sports', 'https://stitichsports.com/images/small_picture/small_pic650.jpg', 'https://daddylive1.ru/live/stream-153.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(263, 'KTV Sport', 'ktv-sport', 'https://stitichsports.com/images/small_picture/small_pic859.jpg', 'https://daddylive1.ru/live/stream-153.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(264, 'L Equipe', 'l-equipe', 'https://stitichsports.com/images/small_picture/small_pic534.jpg', 'https://daddylive1.ru/live/stream-645.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(265, 'La Liga 1', 'la-liga-1', 'https://stitichsports.com/images/small_picture/small_pic535.jpg', 'https://antenasport.online/liga1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(266, 'La Liga 2', 'la-liga-2', 'https://stitichsports.com/images/small_picture/small_pic506.jpg', 'https://antennasports.ru/laliga2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(267, 'La Une', 'la-une', 'https://stitichsports.com/images/small_picture/small_pic561.jpg', 'https://daddylive1.ru/live/stream-539.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(268, 'LaLiga SmartBank', 'laliga-smartbank', 'https://stitichsports.com/images/small_picture/small_pic861.jpg', 'https://daddylive1.ru/live/stream-539.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(269, 'LaLiga Tv', 'laliga-tv', 'https://stitichsports.com/images/small_picture/small_pic282.jpg', 'https://daddylive1.ru/live/stream-276.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(270, 'Liga 1 Max', 'liga-1-max', 'https://stitichsports.com/images/small_picture/small_pic921.jpg', 'https://daddylive1.ru/live/stream-4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(271, 'Liga De Camp 2', 'liga-de-camp-2', 'https://stitichsports.com/images/small_picture/small_pic575.jpg', 'https://daddylive1.ru/live/stream-436.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(272, 'Liga De Campeones', 'liga-de-campeones', 'https://stitichsports.com/images/small_picture/small_pic572.jpg', 'https://daddylive1.ru/live/stream-435.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(273, 'Longhorn Network', 'longhorn-network', 'https://stitichsports.com/images/small_picture/small_pic923.jpg', 'https://daddylive1.ru/live/stream-667.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(274, 'M4 Sport', 'm4-sport', 'https://stitichsports.com/images/small_picture/small_pic507.jpg', 'https://daddylive1.ru/live/stream-155.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(275, 'Magenta Sport', 'magenta-sport', 'https://stitichsports.com/images/small_picture/small_pic622.jpg', 'https://www.sports-stream.click/chtv/ch1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(276, 'Match Premier', 'match-premier', 'https://stitichsports.com/images/small_picture/small_pic408.jpg', 'https://daddylive1.ru/live/stream-127.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(277, 'Match! Futbol 1', 'match!-futbol-1', 'https://stitichsports.com/images/small_picture/small_pic333.jpg', 'https://antenasport.online/match1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(278, 'Match! Igra', 'match!-igra', 'https://stitichsports.com/images/small_picture/small_pic334.jpg', 'https://antenasport.online/matchigra.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(279, 'MAVTv', 'mavtv', 'https://stitichsports.com/images/small_picture/small_pic508.jpg', 'https://daddylive1.ru/live/stream-646.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(280, 'MAX Sport 1 HD', 'max-sport-1-hd', 'https://stitichsports.com/images/small_picture/small_pic599.jpg', 'https://antennasports.ru/maxsport1bg.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(281, 'MAX Sport 2 HD', 'max-sport-2-hd', 'https://stitichsports.com/images/small_picture/small_pic600.jpg', 'https://antennasports.ru/maxsport2bg.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(282, 'MAX Sport 3 HD', 'max-sport-3-hd', 'https://stitichsports.com/images/small_picture/small_pic601.jpg', 'https://antennasports.ru/maxsport3bg.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(283, 'MAX Sport 4 HD', 'max-sport-4-hd', 'https://stitichsports.com/images/small_picture/small_pic602.jpg', 'https://antennasports.ru/maxsport4bg.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(284, 'MLB Network', 'mlb-network', 'https://stitichsports.com/images/small_picture/small_pic207.jpg', 'https://daddylive1.ru/live/stream-399.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(285, 'MLB Tv', 'mlb-tv', 'https://stitichsports.com/images/small_picture/small_pic388.jpg', 'https://daddylive1.ru/live/stream-399.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(286, 'Movistar Deportes', 'movistar-deportes', 'https://stitichsports.com/images/small_picture/small_pic554.jpg', 'https://daddylive1.ru/live/stream-436.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(287, 'Movistar Deportes 2', 'movistar-deportes-2', 'https://stitichsports.com/images/small_picture/small_pic824.jpg', 'https://daddylive1.ru/live/stream-437.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(288, 'Movistar La Liga', 'movistar-la-liga', 'https://stitichsports.com/images/small_picture/small_pic563.jpg', 'https://daddylive1.ru/live/stream-84.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(289, 'Movistar La Liga 2', 'movistar-la-liga-2', 'https://stitichsports.com/images/small_picture/small_pic564.jpg', 'https://daddylive1.ru/live/stream-416.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(290, 'Movistar Liga De 1', 'movistar-liga-de-1', 'https://stitichsports.com/images/small_picture/small_pic571.jpg', 'https://daddylive1.ru/live/stream-435.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(291, 'MRT 1', 'mrt-1', 'https://stitichsports.com/images/small_picture/small_pic843.jpg', 'https://daddylive1.ru/live/stream-29.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(292, 'MTV3', 'mtv3', 'https://stitichsports.com/images/small_picture/small_pic877.jpg', 'https://daddylive1.ru/live/stream-29.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(293, 'MultiSports 1', 'multisports-1', 'https://stitichsports.com/images/small_picture/small_pic850.jpg', 'https://daddylive1.ru/live/stream-77.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(294, 'MultiSports 2', 'multisports-2', 'https://stitichsports.com/images/small_picture/small_pic851.jpg', 'https://daddylive1.ru/live/stream-86.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(295, 'MultiSports 3', 'multisports-3', 'https://stitichsports.com/images/small_picture/small_pic852.jpg', 'https://daddylive1.ru/live/stream-153.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(296, 'MUTv', 'mutv', 'https://stitichsports.com/images/small_picture/small_pic581.jpg', 'https://daddylive1.ru/live/stream-377.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(297, 'NBA Tv', 'nba-tv', 'https://stitichsports.com/images/small_picture/small_pic472.jpg', 'https://daddylive1.ru/live/stream-404.php', NULL, 0, 9, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(298, 'NBC Golf', 'nbc-golf', 'https://stitichsports.com/images/small_picture/small_pic755.jpg', 'https://daddylive1.ru/live/stream-318.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(299, 'NBC Sports', 'nbc-sports', 'https://stitichsports.com/images/small_picture/small_pic406.jpg', 'https://daddylive1.ru/live/stream-53.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(300, 'NESN', 'nesn', 'https://stitichsports.com/images/small_picture/small_pic730.jpg', 'https://daddylive1.ru/live/stream-9.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(301, 'NFL Network', 'nfl-network', 'https://stitichsports.com/images/small_picture/small_pic398.jpg', 'https://freeviplive.com/tvon.php?hd=100', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(302, 'NFL Sunday Ticket', 'nfl-sunday-ticket', 'https://stitichsports.com/images/small_picture/small_pic886.jpg', 'https://daddylive1.ru/live/stream-3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(303, 'NHL Network', 'nhl-network', 'https://stitichsports.com/images/small_picture/small_pic765.jpg', 'https://daddylive1.ru/live/stream-406.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(304, 'Nova Sport', 'nova-sport', 'https://stitichsports.com/images/small_picture/small_pic558.jpg', 'https://daddylive1.ru/live/stream-468.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(305, 'Nova Sport 2', 'nova-sport-2', 'https://stitichsports.com/images/small_picture/small_pic395.jpg', 'https://daddylive1.ru/live/stream-632.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(306, 'Nova Sports 1', 'nova-sports-1', 'https://stitichsports.com/images/small_picture/small_pic673.jpg', 'https://daddylive1.ru/live/stream-631.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(307, 'NPO 1', 'npo-1', 'https://stitichsports.com/images/small_picture/small_pic874.jpg', 'https://daddylive1.ru/live/stream-21.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(308, 'NPO 3', 'npo-3', 'https://stitichsports.com/images/small_picture/small_pic841.jpg', 'https://daddylive1.ru/live/stream-26.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(309, 'NRK1', 'nrk1', 'https://stitichsports.com/images/small_picture/small_pic731.jpg', 'https://daddylive1.ru/live/stream-75.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(310, 'NRK2', 'nrk2', 'https://stitichsports.com/images/small_picture/small_pic840.jpg', 'https://daddylive1.ru/live/stream-75.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(311, 'NSport +', 'nsport-', 'https://stitichsports.com/images/small_picture/small_pic427.jpg', 'https://daddylive1.ru/live/stream-75.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(312, 'Olympic', 'olympic', 'https://stitichsports.com/images/small_picture/small_pic580.jpg', 'https://daddylive1.ru/live/stream-97.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(313, 'OnTime Sports', 'ontime-sports', 'https://stitichsports.com/images/small_picture/small_pic728.jpg', 'https://daddylive1.ru/live/stream-156.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(314, 'OnTime Sports 2', 'ontime-sports-2', 'https://stitichsports.com/images/small_picture/small_pic729.jpg', 'https://daddylive1.ru/live/stream-157.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(315, 'OnTime Sports 3', 'ontime-sports-3', 'https://stitichsports.com/images/small_picture/small_pic800.jpg', 'https://daddylive1.ru/live/stream-158.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(316, 'Optus Sport', 'optus-sport', 'https://stitichsports.com/images/small_picture/small_pic629.jpg', 'https://daddylive1.ru/live/stream-28.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(317, 'Orange Sport 1', 'orange-sport-1', 'https://stitichsports.com/images/small_picture/small_pic767.jpg', 'https://daddylive1.ru/live/stream-439.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(318, 'Orange Sport 2', 'orange-sport-2', 'https://stitichsports.com/images/small_picture/small_pic768.jpg', 'https://daddylive1.ru/live/stream-440.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(319, 'Orange Sport 3', 'orange-sport-3', 'https://stitichsports.com/images/small_picture/small_pic769.jpg', 'https://daddylive1.ru/live/stream-441.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(320, 'ORF 1', 'orf-1', 'https://stitichsports.com/images/small_picture/small_pic753.jpg', 'https://antenasport.online/orf1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(321, 'ORF Eins', 'orf-eins', 'https://stitichsports.com/images/small_picture/small_pic871.jpg', 'https://daddylive1.ru/live/stream-23.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(322, 'ORF Sport Plus', 'orf-sport-plus', 'https://stitichsports.com/images/small_picture/small_pic461.jpg', 'https://daddylive1.ru/live/stream-15.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(323, 'OSN Sports', 'osn-sports', 'https://stitichsports.com/images/small_picture/small_pic365.jpg', 'https://stream.crichd.sc/update/tensp.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(324, 'Polsat Sport', 'polsat-sport', 'https://stitichsports.com/images/small_picture/small_pic385.jpg', 'https://antenasport.online/polsatsport1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(325, 'Polsat Sport Extra', 'polsat-sport-extra', 'https://stitichsports.com/images/small_picture/small_pic512.jpg', 'https://daddylive1.ru/live/stream-50.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(326, 'Polsat Sport News', 'polsat-sport-news', 'https://stitichsports.com/images/small_picture/small_pic640.jpg', 'https://daddylive1.ru/live/stream-129.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(327, 'Polsat Sport Pr 1', 'polsat-sport-pr-1', 'https://stitichsports.com/images/small_picture/small_pic632.jpg', 'https://antennasports.ru/polsatpremium1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(328, 'Polsat Sport Pr 2', 'polsat-sport-pr-2', 'https://stitichsports.com/images/small_picture/small_pic812.jpg', 'https://antennasports.ru/polsatpremium2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(329, 'Porto Canal', 'porto-canal', 'https://stitichsports.com/images/small_picture/small_pic909.jpg', 'https://daddylive1.ru/live/stream-718.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(330, 'Premier Sports', 'premier-sports', 'https://stitichsports.com/images/small_picture/small_pic219.jpg', 'https://stream.crichd.sc/update/premier.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(331, 'Premier Sports 1', 'premier-sports-1', 'https://stitichsports.com/images/small_picture/small_pic428.jpg', 'https://stream.crichd.sc/update/premier.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(332, 'Premier Sports 2', 'premier-sports-2', 'https://stitichsports.com/images/small_picture/small_pic588.jpg', 'https://tutelehd3.xyz/online.php?a=148', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(333, 'Premiere', 'premiere', 'https://stitichsports.com/images/small_picture/small_pic397.jpg', 'https://daddylive1.ru/live/stream-88.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(334, 'Prima Sport 1', 'prima-sport-1', 'https://stitichsports.com/images/small_picture/small_pic783.jpg', 'https://antennasports.ru/primasport1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(335, 'Prima Sport 2', 'prima-sport-2', 'https://stitichsports.com/images/small_picture/small_pic780.jpg', 'https://antennasports.ru/primasport2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(336, 'Prima Sport 3', 'prima-sport-3', 'https://stitichsports.com/images/small_picture/small_pic781.jpg', 'https://antennasports.ru/primasport3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(337, 'Prima Sport 4', 'prima-sport-4', 'https://stitichsports.com/images/small_picture/small_pic782.jpg', 'https://antennasports.ru/primasport4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(338, 'Prima Tv', 'prima-tv', 'https://stitichsports.com/images/small_picture/small_pic674.jpg', 'https://daddylive1.ru/live/stream-583.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(339, 'Prime Video', 'prime-video', 'https://stitichsports.com/images/small_picture/small_pic496.jpg', 'https://daddylive1.ru/live/stream-153.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(340, 'Pro Tv', 'pro-tv', 'https://stitichsports.com/images/small_picture/small_pic818.jpg', 'https://antennasports.ru/protv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(341, 'PSL', 'psl', 'https://stitichsports.com/images/small_picture/small_pic220.jpg', 'https://stream.crichd.sc/update/ptv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(342, 'PTV', 'ptv', 'https://stitichsports.com/images/small_picture/small_pic543.jpg', 'https://stream.crichd.sc/update/ptv.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(343, 'PTV Sports', 'ptv-sports', 'https://stitichsports.com/images/small_picture/small_pic6.jpg', 'https://cdn.crichdplays.ru/embed2.php?id=ptvsp', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(344, 'QazSport', 'qazsport', 'https://stitichsports.com/images/small_picture/small_pic796.jpg', 'https://daddylive1.ru/live/stream-13.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(345, 'Racing Tv', 'racing-tv', 'https://stitichsports.com/images/small_picture/small_pic583.jpg', 'https://daddylive1.ru/live/stream-555.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(346, 'Rai 1 HD', 'rai-1-hd', 'https://stitichsports.com/images/small_picture/small_pic633.jpg', 'https://daddylive1.ru/live/stream-882.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(347, 'Rai 2', 'rai-2', 'https://stitichsports.com/images/small_picture/small_pic879.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(348, 'Rai Sport', 'rai-sport', 'https://stitichsports.com/images/small_picture/small_pic410.jpg', 'https://daddylive1.ru/live/stream-12.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(349, 'RCN TV', 'rcn-tv', 'https://stitichsports.com/images/small_picture/small_pic878.jpg', 'https://daddylive1.ru/live/stream-12.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(350, 'RDS Sport', 'rds-sport', 'https://stitichsports.com/images/small_picture/small_pic482.jpg', 'https://www.ustream.to/embed?id=rds-ca', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(351, 'Real Madrid', 'real-madrid', 'https://stitichsports.com/images/small_picture/small_pic501.jpg', 'https://daddylive1.ru/live/stream-12.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(352, 'RMC Sport 1', 'rmc-sport-1', 'https://stitichsports.com/images/small_picture/small_pic359.jpg', 'https://daddylive1.ru/live/stream-119.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(353, 'RMC Sport 2', 'rmc-sport-2', 'https://stitichsports.com/images/small_picture/small_pic360.jpg', 'https://daddylive1.ru/live/stream-120.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(354, 'RMC Sport 3', 'rmc-sport-3', 'https://stitichsports.com/images/small_picture/small_pic361.jpg', 'https://daddylive1.ru/live/stream-76.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(355, 'RMC Sport 4', 'rmc-sport-4', 'https://stitichsports.com/images/small_picture/small_pic896.jpg', 'https://daddylive1.ru/live/stream-120.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(356, 'RSI La 2', 'rsi-la-2', 'https://stitichsports.com/images/small_picture/small_pic750.jpg', 'https://daddylive1.ru/live/stream-23.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(357, 'RSTV', 'rstv', 'https://stitichsports.com/images/small_picture/small_pic68.jpg', 'https://www.youtube.com/embed/hihA6YiCsWM', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(358, 'RTC Tele Liege', 'rtc-tele-liege', 'https://stitichsports.com/images/small_picture/small_pic292.jpg', 'https://rtc.fcst.tv/player/embed/3422309?loc=fr_FR', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(359, 'RTE', 'rte', 'https://stitichsports.com/images/small_picture/small_pic866.jpg', 'https://daddylive1.ru/live/stream-365.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(360, 'RTE 2', 'rte-2', 'https://stitichsports.com/images/small_picture/small_pic747.jpg', 'https://daddylive1.ru/live/stream-365.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(361, 'RTL HD', 'rtl-hd', 'https://stitichsports.com/images/small_picture/small_pic817.jpg', 'https://daddylive1.ru/live/stream-5.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(362, 'RTP 1', 'rtp-1', 'https://stitichsports.com/images/small_picture/small_pic811.jpg', 'https://antennasports.ru/channel/RTP1[PT]', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(363, 'RTP 2', 'rtp-2', 'https://stitichsports.com/images/small_picture/small_pic711.jpg', 'https://daddylive1.ru/live/stream-25.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(364, 'RTS 1', 'rts-1', 'https://stitichsports.com/images/small_picture/small_pic845.jpg', 'https://daddylive1.ru/live/stream-8.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(365, 'RTSH Sport', 'rtsh-sport', 'https://stitichsports.com/images/small_picture/small_pic881.jpg', 'https://daddylive1.ru/live/stream-9.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(366, 'RTVE', 'rtve', 'https://stitichsports.com/images/small_picture/small_pic437.jpg', 'https://daddylive1.ru/live/stream-158.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(367, 'S Sport', 's-sport', 'https://stitichsports.com/images/small_picture/small_pic412.jpg', 'https://daddylive1.ru/live/stream-68.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(368, 'S4C', 's4c', 'https://stitichsports.com/images/small_picture/small_pic892.jpg', 'https://daddylive1.ru/live/stream-670.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(369, 'SEC Espn', 'sec-espn', 'https://stitichsports.com/images/small_picture/small_pic510.jpg', 'https://tutelehd3.xyz/online.php?a=18', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(370, 'SEC Network', 'sec-network', 'https://stitichsports.com/images/small_picture/small_pic863.jpg', 'https://daddylive1.ru/live/stream-385.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(371, 'See Denmark Tv', 'see-denmark-tv', 'https://stitichsports.com/images/small_picture/small_pic919.jpg', 'https://daddylive1.ru/live/stream-811.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(372, 'Servus Tv', 'servus-tv', 'https://stitichsports.com/images/small_picture/small_pic785.jpg', 'https://daddylive1.ru/live/stream-24.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(373, 'Setanta Sports 1', 'setanta-sports-1', 'https://stitichsports.com/images/small_picture/small_pic343.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(374, 'Setanta Sports 2', 'setanta-sports-2', 'https://stitichsports.com/images/small_picture/small_pic344.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(375, 'SKY Bet', 'sky-bet', 'https://stitichsports.com/images/small_picture/small_pic456.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(376, 'Sky Box Office', 'sky-box-office', 'https://stitichsports.com/images/small_picture/small_pic625.jpg', 'https://stream.crichd.sc/update/skybox.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(377, 'Sky Sport 1', 'sky-sport-1', 'https://stitichsports.com/images/small_picture/small_pic540.jpg', 'https://daddylive1.ru/live/stream-588.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(378, 'Sky Sport 1 Italia', 'sky-sport-1-italia', 'https://stitichsports.com/images/small_picture/small_pic447.jpg', 'https://daddylive1.ru/live/stream-588.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(379, 'Sky Sport 10', 'sky-sport-10', 'https://stitichsports.com/images/small_picture/small_pic530.jpg', 'https://daddylive1.ru/live/stream-597.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(380, 'Sky Sport 2', 'sky-sport-2', 'https://stitichsports.com/images/small_picture/small_pic597.jpg', 'https://daddylive1.ru/live/stream-589.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(381, 'Sky Sport 2 Italia', 'sky-sport-2-italia', 'https://stitichsports.com/images/small_picture/small_pic448.jpg', 'https://buzztv.futbol/hd3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(382, 'Sky Sport 24 Italia', 'sky-sport-24-italia', 'https://stitichsports.com/images/small_picture/small_pic476.jpg', 'https://daddylive1.ru/live/stream-590.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(383, 'Sky Sport 3', 'sky-sport-3', 'https://stitichsports.com/images/small_picture/small_pic531.jpg', 'https://daddylive1.ru/live/stream-590.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(384, 'Sky Sport 3 Italia', 'sky-sport-3-italia', 'https://stitichsports.com/images/small_picture/small_pic449.jpg', 'https://daddylive1.ru/live/stream-590.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(385, 'Sky Sport 4', 'sky-sport-4', 'https://stitichsports.com/images/small_picture/small_pic596.jpg', 'https://daddylive1.ru/live/stream-591.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(386, 'Sky Sport 5', 'sky-sport-5', 'https://stitichsports.com/images/small_picture/small_pic504.jpg', 'https://daddylive1.ru/live/stream-592.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(387, 'Sky Sport 6', 'sky-sport-6', 'https://stitichsports.com/images/small_picture/small_pic532.jpg', 'https://daddylive1.ru/live/stream-593.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(388, 'Sky Sport 7', 'sky-sport-7', 'https://stitichsports.com/images/small_picture/small_pic792.jpg', 'https://daddylive1.ru/live/stream-594.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(389, 'Sky Sport 8', 'sky-sport-8', 'https://stitichsports.com/images/small_picture/small_pic528.jpg', 'https://daddylive1.ru/live/stream-595.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(390, 'Sky Sport 9', 'sky-sport-9', 'https://stitichsports.com/images/small_picture/small_pic529.jpg', 'https://daddylive1.ru/live/stream-596.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(391, 'Sky Sport Arena IT', 'sky-sport-arena-it', 'https://stitichsports.com/images/small_picture/small_pic477.jpg', 'https://daddylive1.ru/live/stream-462.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(392, 'Sky Sport Austria 1', 'sky-sport-austria-1', 'https://stitichsports.com/images/small_picture/small_pic573.jpg', 'https://daddylive1.ru/live/stream-559.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(393, 'Sky Sport Austria 2', 'sky-sport-austria-2', 'https://stitichsports.com/images/small_picture/small_pic847.jpg', 'https://daddylive1.ru/live/stream-12.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(394, 'Sky Sport Austria 3', 'sky-sport-austria-3', 'https://stitichsports.com/images/small_picture/small_pic574.jpg', 'https://daddylive1.ru/live/stream-16.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(395, 'Sky Sport Austria 4', 'sky-sport-austria-4', 'https://stitichsports.com/images/small_picture/small_pic848.jpg', 'https://daddylive1.ru/live/stream-11.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(396, 'Sky Sport Calcio', 'sky-sport-calcio', 'https://stitichsports.com/images/small_picture/small_pic446.jpg', 'https://daddylive1.ru/live/stream-870.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(397, 'Sky Sport F1 Italia', 'sky-sport-f1-italia', 'https://stitichsports.com/images/small_picture/small_pic450.jpg', 'https://daddylive1.ru/live/stream-55.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(398, 'Sky Sport Football IT', 'sky-sport-football-it', 'https://stitichsports.com/images/small_picture/small_pic478.jpg', 'https://daddylive1.ru/live/stream-460.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(399, 'Sky Sport Moto GP', 'sky-sport-moto-gp', 'https://stitichsports.com/images/small_picture/small_pic479.jpg', 'https://daddylive1.ru/live/stream-461.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(400, 'Sky Sport Select', 'sky-sport-select', 'https://stitichsports.com/images/small_picture/small_pic915.jpg', 'https://daddylive1.ru/live/stream-587.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(401, 'Sky Sport Serie A', 'sky-sport-serie-a', 'https://stitichsports.com/images/small_picture/small_pic480.jpg', 'https://daddylive1.ru/live/stream-461.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(402, 'SKY Sport Tennis', 'sky-sport-tennis', 'https://stitichsports.com/images/small_picture/small_pic751.jpg', 'https://daddylive1.ru/live/stream-461.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(403, 'Sky Sport Uno', 'sky-sport-uno', 'https://stitichsports.com/images/small_picture/small_pic481.jpg', 'https://daddylive1.ru/live/stream-461.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(404, 'SKY Sports', 'sky-sports', 'https://stitichsports.com/images/small_picture/small_pic196.jpg', 'https://stream.crichd.sc/update/skysn.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(405, 'Sky Sports Action', 'sky-sports-action', 'https://stitichsports.com/images/small_picture/small_pic475.jpg', 'https://stream.crichd.sc/update/skys3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(406, 'Sky Sports Arena', 'sky-sports-arena', 'https://stitichsports.com/images/small_picture/small_pic330.jpg', 'https://stream.crichd.sc/update/skysarena.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(407, 'SKY Sports Cricket', 'sky-sports-cricket', 'https://stitichsports.com/images/small_picture/small_pic215.jpg', 'https://stream.crichd.sc/update/skys2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(408, 'Sky Sports F1', 'sky-sports-f1', 'https://stitichsports.com/images/small_picture/small_pic328.jpg', 'https://stream.crichd.sc/update/skyf1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(409, 'Sky Sports Football', 'sky-sports-football', 'https://stitichsports.com/images/small_picture/small_pic327.jpg', 'https://stream.crichd.sc/update/skysfotb.php', NULL, 0, 8, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(410, 'Sky Sports Golf', 'sky-sports-golf', 'https://stitichsports.com/images/small_picture/small_pic331.jpg', 'https://stream.crichd.sc/update/skys4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(411, 'Sky Sports Hundred', 'sky-sports-hundred', 'https://stitichsports.com/images/small_picture/small_pic426.jpg', 'https://stream.crichd.sc/update/skys2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(412, 'Sky Sports Main', 'sky-sports-main', 'https://stitichsports.com/images/small_picture/small_pic394.jpg', 'https://stream.crichd.sc/update/skys1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(413, 'Sky Sports Mix', 'sky-sports-mix', 'https://stitichsports.com/images/small_picture/small_pic329.jpg', 'https://stream.crichd.sc/update/skysmix.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(414, 'Sky Sports News', 'sky-sports-news', 'https://stitichsports.com/images/small_picture/small_pic586.jpg', 'https://stream.crichd.sc/update/skysn.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(415, 'Sky Sports PL', 'sky-sports-pl', 'https://stitichsports.com/images/small_picture/small_pic209.jpg', 'https://cricfree.live/update/skysportspremier.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(416, 'SONY ESPN', 'sony-espn', 'https://stitichsports.com/images/small_picture/small_pic489.jpg', 'https://crichdplayer.xyz/embed2.php?id=sonysix&q=Sony', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(417, 'Sony Six', 'sony-six', 'https://stitichsports.com/images/small_picture/small_pic205.jpg', 'https://crichdplayer.xyz/embed2.php?id=sonysix&q=Sony', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(418, 'Sony Ten 1', 'sony-ten-1', 'https://stitichsports.com/images/small_picture/small_pic218.jpg', 'https://crichdplayer.xyz/embed2.php?id=ten1&q=Sony', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(419, 'Sony Ten 2', 'sony-ten-2', 'https://stitichsports.com/images/small_picture/small_pic402.jpg', 'https://daddylive1.ru/live/stream-886.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(420, 'Sony Ten 3', 'sony-ten-3', 'https://stitichsports.com/images/small_picture/small_pic403.jpg', 'https://crichdplayer.xyz/embed2.php?id=ten3&q=Sony', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(421, 'Sony Ten 4', 'sony-ten-4', 'https://stitichsports.com/images/small_picture/small_pic415.jpg', 'https://crichdplayer.xyz/embed2.php?id=ten1&q=Sony', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(422, 'Sony Ten 5', 'sony-ten-5', 'https://stitichsports.com/images/small_picture/small_pic890.jpg', 'https://crichdplayer.xyz/embed2.php?id=sonysix', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(423, 'Sonyliv', 'sonyliv', 'https://stitichsports.com/images/small_picture/small_pic435.jpg', 'https://crichdplayer.xyz/embed2.php?id=sonysix&q=Sony', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(424, 'Spark Sport', 'spark-sport', 'https://stitichsports.com/images/small_picture/small_pic655.jpg', 'https://stream.crichd.sc/update/ch10.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(425, 'Sport 1', 'sport-1', 'https://stitichsports.com/images/small_picture/small_pic198.jpg', 'https://daddylive1.ru/live/stream-80.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(427, 'Sport 2', 'sport-2', 'https://stitichsports.com/images/small_picture/small_pic642.jpg', 'https://daddylive1.ru/live/stream-141.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(428, 'Sport 3', 'sport-3', 'https://stitichsports.com/images/small_picture/small_pic643.jpg', 'https://daddylive1.ru/live/stream-142.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(429, 'Sport 4', 'sport-4', 'https://stitichsports.com/images/small_picture/small_pic644.jpg', 'https://daddylive1.ru/live/stream-143.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(430, 'Sport 5', 'sport-5', 'https://stitichsports.com/images/small_picture/small_pic645.jpg', 'https://daddylive1.ru/live/stream-144.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(431, 'Sport 5 Plus', 'sport-5-plus', 'https://stitichsports.com/images/small_picture/small_pic603.jpg', 'https://daddylive1.ru/live/stream-145.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(432, 'Sport BAP3NW', 'sport-bap3nw', 'https://stitichsports.com/images/small_picture/small_pic381.jpg', 'https://daddylive1.ru/live/stream-76.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(433, 'Sport En France', 'sport-en-france', 'https://stitichsports.com/images/small_picture/small_pic363.jpg', 'https://daddylive1.ru/live/stream-122.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(434, 'Sport Tv 1', 'sport-tv-1', 'https://stitichsports.com/images/small_picture/small_pic210.jpg', 'https://v3.sportsonline.si/channels/pt/sporttv1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(435, 'Sport Tv 2', 'sport-tv-2', 'https://stitichsports.com/images/small_picture/small_pic211.jpg', 'https://sportsonline.so/channels/pt/sporttv2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(436, 'Sport Tv 3', 'sport-tv-3', 'https://stitichsports.com/images/small_picture/small_pic212.jpg', 'https://sportsonline.so/channels/pt/sporttv3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(437, 'Sport Tv 4', 'sport-tv-4', 'https://stitichsports.com/images/small_picture/small_pic271.jpg', 'https://sportsonline.to/channels/pt/sporttv4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(438, 'Sport Tv 5', 'sport-tv-5', 'https://stitichsports.com/images/small_picture/small_pic272.jpg', 'https://sportsonline.so/channels/pt/sporttv5.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(439, 'Sport Tv 6', 'sport-tv-6', 'https://stitichsports.com/images/small_picture/small_pic604.jpg', 'https://daddylive1.ru/live/stream-291.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(440, 'Sport Tv+', 'sport-tv', 'https://stitichsports.com/images/small_picture/small_pic842.jpg', 'https://daddylive1.ru/live/stream-28.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(441, 'Sport1+', 'sport1', 'https://stitichsports.com/images/small_picture/small_pic744.jpg', 'https://daddylive1.ru/live/stream-640.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(442, 'SportDigital', 'sportdigital', 'https://stitichsports.com/images/small_picture/small_pic726.jpg', 'https://daddylive1.ru/live/stream-571.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(443, 'Sporting Tv', 'sporting-tv', 'https://stitichsports.com/images/small_picture/small_pic924.jpg', 'https://daddylive1.ru/live/stream-716.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(444, 'Sportklub 1', 'sportklub-1', 'https://stitichsports.com/images/small_picture/small_pic375.jpg', 'https://antenasport.online/sportklub1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(445, 'Sportklub 10', 'sportklub-10', 'https://stitichsports.com/images/small_picture/small_pic710.jpg', 'https://daddylive1.ru/live/stream-108.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(446, 'Sportklub 2', 'sportklub-2', 'https://stitichsports.com/images/small_picture/small_pic399.jpg', 'https://antenasport.online/sportklub2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(447, 'Sportklub 3', 'sportklub-3', 'https://stitichsports.com/images/small_picture/small_pic400.jpg', 'https://antenasport.online/sportklub3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(448, 'Sportklub 4', 'sportklub-4', 'https://stitichsports.com/images/small_picture/small_pic401.jpg', 'https://daddylive1.ru/live/stream-104.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(449, 'SportKlub 5', 'sportklub-5', 'https://stitichsports.com/images/small_picture/small_pic392.jpg', 'https://antennasports.ru/sportklub5.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(450, 'SportKlub 6', 'sportklub-6', 'https://stitichsports.com/images/small_picture/small_pic455.jpg', 'https://daddylive1.ru/live/stream-25.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(451, 'SportKlub 7', 'sportklub-7', 'https://stitichsports.com/images/small_picture/small_pic519.jpg', 'https://daddylive1.ru/live/stream-26.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(452, 'Sportklub HD', 'sportklub-hd', 'https://stitichsports.com/images/small_picture/small_pic709.jpg', 'https://daddylive1.ru/live/stream-453.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(453, 'Sports 18', 'sports-18', 'https://stitichsports.com/images/small_picture/small_pic891.jpg', 'https://stream.crichd.sc/update/willowcricket.php	', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(454, 'Sportsnet ONE', 'sportsnet-one', 'https://stitichsports.com/images/small_picture/small_pic372.jpg', 'https://antennasports.ru/channel/SportsnetOne[CA]', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all');
INSERT INTO `channels` (`id`, `name`, `slug`, `logo`, `link`, `description`, `live_status`, `category_id`, `icon`, `created_at`, `status`, `embed_code`, `hidden_start`, `hidden_end`, `access_level`) VALUES
(455, 'Sportsnet Ontario', 'sportsnet-ontario', 'https://stitichsports.com/images/small_picture/small_pic373.jpg', 'https://antennasports.ru/sportnetontario.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(456, 'Sportsnet World', 'sportsnet-world', 'https://stitichsports.com/images/small_picture/small_pic374.jpg', 'https://daddylive1.ru/live/stream-410.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(457, 'SporTv 1', 'sportv-1', 'https://stitichsports.com/images/small_picture/small_pic442.jpg', 'https://daddylive1.ru/live/stream-78.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(458, 'SPORTV 2', 'sportv-2', 'https://stitichsports.com/images/small_picture/small_pic516.jpg', 'https://daddylive1.ru/live/stream-79.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(459, 'SPORTV 3', 'sportv-3', 'https://stitichsports.com/images/small_picture/small_pic429.jpg', 'https://daddylive1.ru/live/stream-80.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(460, 'SPOTV 2', 'spotv-2', 'https://stitichsports.com/images/small_picture/small_pic634.jpg', 'https://daddylive1.ru/live/stream-43.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(461, 'SRF Sport', 'srf-sport', 'https://stitichsports.com/images/small_picture/small_pic396.jpg', 'https://daddylive1.ru/live/stream-420.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(462, 'SRF Zwei', 'srf-zwei', 'https://stitichsports.com/images/small_picture/small_pic826.jpg', 'https://daddylive1.ru/live/stream-10.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(463, 'SSC Sports', 'ssc-sports', 'https://stitichsports.com/images/small_picture/small_pic651.jpg', 'https://daddylive1.ru/live/stream-1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(464, 'Star 64 WSTR', 'star-64-wstr', 'https://stitichsports.com/images/small_picture/small_pic389.jpg', 'https://daddylive1.ru/live/stream-19.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(465, 'Star Hindi', 'star-hindi', 'https://stitichsports.com/images/small_picture/small_pic546.jpg', 'https://stream.crichd.sc/update/star1hi.php ', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(466, 'Star Sports 1', 'star-sports-1', 'https://stitichsports.com/images/small_picture/small_pic208.jpg', 'https://stream.crichd.sc/update/star.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(467, 'Star Sports 2', 'star-sports-2', 'https://stitichsports.com/images/small_picture/small_pic216.jpg', 'https://cdn.crichdplays.ru/embed2.php?id=starsp2', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(468, 'Star Sports 3', 'star-sports-3', 'https://stitichsports.com/images/small_picture/small_pic473.jpg', 'https://cdn.crichdplays.ru/embed2.php?id=starsp3', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(469, 'Star Sports Hindi', 'star-sports-hindi', 'https://stitichsports.com/images/small_picture/small_pic491.jpg', 'https://stream.crichd.sc/update/star1hi.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(470, 'Star1', 'star1', 'https://stitichsports.com/images/small_picture/small_pic545.jpg', 'https://stream.crichd.sc/update/star.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(471, 'Start Tv', 'start-tv', 'https://stitichsports.com/images/small_picture/small_pic839.jpg', 'https://daddylive1.ru/live/stream-22.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(472, 'Super MaXimo 1', 'super-maximo-1', 'https://stitichsports.com/images/small_picture/small_pic658.jpg', 'https://stream.crichd.sc/update/ssmeximo.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(473, 'Super Sport 1', 'super-sport-1', 'https://stitichsports.com/images/small_picture/small_pic345.jpg', 'https://daddylive1.ru/live/stream-28.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(474, 'Super Sport 2', 'super-sport-2', 'https://stitichsports.com/images/small_picture/small_pic346.jpg', 'https://daddylive1.ru/live/stream-69.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(475, 'Super Sport 3', 'super-sport-3', 'https://stitichsports.com/images/small_picture/small_pic347.jpg', 'https://daddylive1.ru/live/stream-16.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(476, 'Super Sport 4', 'super-sport-4', 'https://stitichsports.com/images/small_picture/small_pic348.jpg', 'https://sportzonline.to/channels/pt/sporttv4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(477, 'Super Sport PSL', 'super-sport-psl', 'https://stitichsports.com/images/small_picture/small_pic649.jpg', 'https://daddylive1.ru/live/stream-413.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(478, 'Super Sports Cricket', 'super-sports-cricket', 'https://stitichsports.com/images/small_picture/small_pic413.jpg', 'https://daddylive1.ru/live/stream-368.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(479, 'SuperSport', 'supersport', 'https://stitichsports.com/images/small_picture/small_pic414.jpg', 'https://daddylive1.ru/live/stream-420.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(480, 'SuperSport 3', 'supersport-3', 'https://stitichsports.com/images/small_picture/small_pic421.jpg', 'https://daddylive1.ru/live/stream-55.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(481, 'SuperSport 4', 'supersport-4', 'https://stitichsports.com/images/small_picture/small_pic425.jpg', 'https://daddylive1.ru/live/stream-56.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(482, 'SuperSport 6', 'supersport-6', 'https://stitichsports.com/images/small_picture/small_pic422.jpg', 'https://daddylive1.ru/live/stream-7.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(483, 'SuperSport Action', 'supersport-action', 'https://stitichsports.com/images/small_picture/small_pic474.jpg', 'https://www.sports-stream.click/chtv/ch60.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(484, 'SuperSport Football', 'supersport-football', 'https://stitichsports.com/images/small_picture/small_pic452.jpg', 'https://www.sports-stream.click/chtv/ch46.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(485, 'SuperSport Golf', 'supersport-golf', 'https://stitichsports.com/images/small_picture/small_pic657.jpg', 'https://daddylive1.ru/live/stream-422.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(486, 'SuperSport GS', 'supersport-gs', 'https://stitichsports.com/images/small_picture/small_pic488.jpg', 'https://www.sports-stream.click/chtv/ch70.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(487, 'SuperSport LaLiga', 'supersport-laliga', 'https://stitichsports.com/images/small_picture/small_pic444.jpg', 'https://daddylive1.ru/live/stream-415.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(488, 'SuperSport Moto', 'supersport-moto', 'https://stitichsports.com/images/small_picture/small_pic823.jpg', 'https://player003.vip/embed2.php?id=supermotorsp', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(489, 'Supersport PL', 'supersport-pl', 'https://stitichsports.com/images/small_picture/small_pic453.jpg', 'https://daddylive1.ru/live/stream-414.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(490, 'SuperSport Rugby', 'supersport-rugby', 'https://stitichsports.com/images/small_picture/small_pic587.jpg', 'https://daddylive1.ru/live/stream-421.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(491, 'SuperSport Tennis', 'supersport-tennis', 'https://stitichsports.com/images/small_picture/small_pic656.jpg', 'https://www.sports-stream.click/chtv/ch69.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(492, 'SuperSport Variety 1', 'supersport-variety-1', 'https://stitichsports.com/images/small_picture/small_pic483.jpg', 'https://www.sports-stream.click/chtv/ch50.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(493, 'SuperSport Variety 2', 'supersport-variety-2', 'https://stitichsports.com/images/small_picture/small_pic440.jpg', 'https://www.sports-stream.click/chtv/ch51.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(494, 'SuperSport Variety 3', 'supersport-variety-3', 'https://stitichsports.com/images/small_picture/small_pic484.jpg', 'https://daddylive1.ru/live/stream-418.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(495, 'SuperSport Variety 4', 'supersport-variety-4', 'https://stitichsports.com/images/small_picture/small_pic487.jpg', 'https://www.sports-stream.click/chtv/ch53.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(496, 'SVT 1', 'svt-1', 'https://stitichsports.com/images/small_picture/small_pic745.jpg', 'https://daddylive1.ru/live/stream-2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(497, 'SVT 2', 'svt-2', 'https://stitichsports.com/images/small_picture/small_pic727.jpg', 'https://daddylive1.ru/live/stream-24.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(498, 'T Sports', 't-sports', 'https://stitichsports.com/images/small_picture/small_pic537.jpg', 'https://crichdstreaming.xyz/embed2.php?id=gtv', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(499, 'TDP', 'tdp', 'https://stitichsports.com/images/small_picture/small_pic620.jpg', 'https://daddylive1.ru/live/stream-529.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(500, 'Telekom Sport', 'telekom-sport', 'https://stitichsports.com/images/small_picture/small_pic830.jpg', 'https://daddylive1.ru/live/stream-66.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(501, 'Telemundo', 'telemundo', 'https://stitichsports.com/images/small_picture/small_pic872.jpg', 'https://daddylive1.ru/live/stream-131.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(502, 'Ten Sports', 'ten-sports', 'https://stitichsports.com/images/small_picture/small_pic217.jpg', 'https://cdn.crichdplays.ru/embed2.php?id=tensp', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(503, 'Tennis Channel', 'tennis-channel', 'https://stitichsports.com/images/small_picture/small_pic922.jpg', 'https://antenasport.online/tennis1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(504, 'Tivibu Spor 2', 'tivibu-spor-2', 'https://stitichsports.com/images/small_picture/small_pic518.jpg', 'https://daddylive1.ru/live/stream-26.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(505, 'TNT Sports', 'tnt-sports', 'https://stitichsports.com/images/small_picture/small_pic469.jpg', 'https://tutelehd3.xyz/online.php?a=149', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(507, 'TNT Sports 1 UK', 'tnt-sports-1-uk', 'https://stitichsports.com/images/small_picture/small_pic905.jpg', 'https://www.sports-stream.click/chtv/ch31.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(508, 'TNT Sports 2', 'tnt-sports-2', 'https://stitichsports.com/images/small_picture/small_pic458.jpg', 'https://tutelehd3.xyz/online.php?a=4', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(509, 'TNT Sports 2 UK', 'tnt-sports-2-uk', 'https://stitichsports.com/images/small_picture/small_pic906.jpg', 'https://www.sports-stream.click/chtv/ch32.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(510, 'TNT Sports 3', 'tnt-sports-3', 'https://stitichsports.com/images/small_picture/small_pic752.jpg', 'https://tutelehd3.xyz/online.php?a=4', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(511, 'TNT Sports 3 UK', 'tnt-sports-3-uk', 'https://stitichsports.com/images/small_picture/small_pic907.jpg', 'https://www.sports-stream.click/chtv/ch33.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(512, 'TNT Sports 4 UK', 'tnt-sports-4-uk', 'https://stitichsports.com/images/small_picture/small_pic908.jpg', 'https://www.sports-stream.click/chtv/ch34.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(513, 'TNT Sports 5', 'tnt-sports-5', 'https://stitichsports.com/images/small_picture/small_pic911.jpg', 'https://www.sports-stream.click/chtv/ch62.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(514, 'TNT Sports 6', 'tnt-sports-6', 'https://stitichsports.com/images/small_picture/small_pic913.jpg', 'https://sons-stream.com/tvon.php?hd=306', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(515, 'TNT Sports 7', 'tnt-sports-7', 'https://stitichsports.com/images/small_picture/small_pic914.jpg', 'https://b5yucast.com/tvon.php?hd=307', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(516, 'TNT Sports Chile', 'tnt-sports-chile', 'https://stitichsports.com/images/small_picture/small_pic858.jpg', 'https://tutelehd3.xyz/online.php?a=149', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(517, 'TRT 1', 'trt-1', 'https://stitichsports.com/images/small_picture/small_pic675.jpg', 'https://daddylive1.ru/live/stream-1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(518, 'TRT Spor', 'trt-spor', 'https://stitichsports.com/images/small_picture/small_pic490.jpg', 'https://daddylive1.ru/live/stream-3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(519, 'True Premier 3', 'true-premier-3', 'https://stitichsports.com/images/small_picture/small_pic837.jpg', 'https://daddylive1.ru/live/stream-15.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(520, 'True Sport 2', 'true-sport-2', 'https://stitichsports.com/images/small_picture/small_pic836.jpg', 'https://stream.crichd.sc/update/tensp.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(521, 'TSN 1', 'tsn-1', 'https://stitichsports.com/images/small_picture/small_pic335.jpg', 'https://antenasport.online/tsn1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(522, 'TSN 2', 'tsn-2', 'https://stitichsports.com/images/small_picture/small_pic336.jpg', 'https://antenasport.online/tsn2.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(523, 'TSN 3', 'tsn-3', 'https://stitichsports.com/images/small_picture/small_pic349.jpg', 'https://antenasport.online/tsn3.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(524, 'TSN 4', 'tsn-4', 'https://stitichsports.com/images/small_picture/small_pic350.jpg', 'https://antenasport.online/tsn4.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(525, 'TSN 5', 'tsn-5', 'https://stitichsports.com/images/small_picture/small_pic351.jpg', 'https://antenasport.online/tsn5.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(526, 'TUDN Tv', 'tudn-tv', 'https://stitichsports.com/images/small_picture/small_pic377.jpg', 'https://daddylive1.ru/live/stream-66.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(527, 'Tv Publica', 'tv-publica', 'https://stitichsports.com/images/small_picture/small_pic236.jpg', 'https://daddylive1.ru/live/stream-166.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(528, 'TV2 SPORT', 'tv2-sport', 'https://stitichsports.com/images/small_picture/small_pic654.jpg', 'https://daddylive1.ru/live/stream-810.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(529, 'TV2 Sport X', 'tv2-sport-x', 'https://stitichsports.com/images/small_picture/small_pic797.jpg', 'https://daddylive1.ru/live/stream-20.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(530, 'TV3 Sport', 'tv3-sport', 'https://stitichsports.com/images/small_picture/small_pic799.jpg', 'https://daddylive1.ru/live/stream-809.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(531, 'TV3+', 'tv3', 'https://stitichsports.com/images/small_picture/small_pic819.jpg', 'https://daddylive1.ru/live/stream-819.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(532, 'TV4 Football', 'tv4-football', 'https://stitichsports.com/images/small_picture/small_pic918.jpg', 'https://daddylive1.ru/live/stream-747.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(533, 'TVI Eleven', 'tvi-eleven', 'https://stitichsports.com/images/small_picture/small_pic548.jpg', 'https://daddylive1.ru/live/stream-128.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(534, 'TVP 2', 'tvp-2', 'https://stitichsports.com/images/small_picture/small_pic771.jpg', 'https://daddylive1.ru/live/stream-561.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(535, 'TVP Sport', 'tvp-sport', 'https://stitichsports.com/images/small_picture/small_pic387.jpg', 'https://daddylive1.ru/live/stream-128.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(536, 'TVR 1', 'tvr-1', 'https://stitichsports.com/images/small_picture/small_pic857.jpg', 'https://antennasports.ru/tvr1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(537, 'Tyc Sports', 'tyc-sports', 'https://stitichsports.com/images/small_picture/small_pic569.jpg', 'https://daddylive1.ru/live/stream-746.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(538, 'USA Network', 'usa-network', 'https://stitichsports.com/images/small_picture/small_pic746.jpg', 'https://daddylive1.ru/live/stream-343.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(539, 'V Sport', 'v-sport', 'https://stitichsports.com/images/small_picture/small_pic901.jpg', 'https://daddylive1.ru/live/stream-1.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(540, 'Viaplay Sports 1', 'viaplay-sports-1', 'https://stitichsports.com/images/small_picture/small_pic822.jpg', 'https://daddylive1.ru/live/stream-451.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(541, 'Viaplay Sports 2', 'viaplay-sports-2', 'https://stitichsports.com/images/small_picture/small_pic885.jpg', 'https://daddylive1.ru/live/stream-550.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(542, 'Viaplay Xtra', 'viaplay-xtra', 'https://stitichsports.com/images/small_picture/small_pic889.jpg', 'https://daddylive1.ru/live/stream-597.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(543, 'VTM', 'vtm', 'https://stitichsports.com/images/small_picture/small_pic695.jpg', 'https://daddylive1.ru/live/stream-14.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(544, 'VTV Plus', 'vtv-plus', 'https://stitichsports.com/images/small_picture/small_pic815.jpg', 'https://daddylive1.ru/live/stream-391.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(545, 'W9', 'w9', 'https://stitichsports.com/images/small_picture/small_pic680.jpg', 'https://daddylive1.ru/live/stream-30.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(546, 'Willow Tv Cricket', 'willow-tv-cricket', 'https://stitichsports.com/images/small_picture/small_pic206.jpg', 'https://stream.crichd.sc/update/willowcricket.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(547, 'Willow Xtra', 'willow-xtra', 'https://stitichsports.com/images/small_picture/small_pic432.jpg', 'https://daddylive1.ru/live/stream-598.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(548, 'Win Sports', 'win-sports', 'https://stitichsports.com/images/small_picture/small_pic795.jpg', 'https://daddylive1.ru/live/stream-392.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(549, 'Win Sports +', 'win-sports-', 'https://stitichsports.com/images/small_picture/small_pic756.jpg', 'https://daddylive1.ru/live/stream-392.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(550, 'WWE Network', 'wwe-network', 'https://stitichsports.com/images/small_picture/small_pic445.jpg', 'https://daddylive1.ru/live/stream-376.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(551, 'YES Network', 'yes-network', 'https://stitichsports.com/images/small_picture/small_pic689.jpg', 'https://antenasport.online/yes.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(552, 'ZDF Sport', 'zdf-sport', 'https://stitichsports.com/images/small_picture/small_pic436.jpg', 'https://daddylive1.ru/live/stream-163.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(553, 'Ziggo Sport', 'ziggo-sport', 'https://stitichsports.com/images/small_picture/small_pic460.jpg', 'https://daddylive1.ru/live/stream-398.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(554, 'Ziggo Sport Racing', 'ziggo-sport-racing', 'https://stitichsports.com/images/small_picture/small_pic764.jpg', 'https://daddylive1.ru/live/stream-396.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(555, 'Ziggo Sport Select', 'ziggo-sport-select', 'https://stitichsports.com/images/small_picture/small_pic763.jpg', 'https://daddylive1.ru/live/stream-393.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(556, 'Ziggo Sport Voetbal', 'ziggo-sport-voetbal', 'https://stitichsports.com/images/small_picture/small_pic766.jpg', 'https://daddylive1.ru/live/stream-398.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all'),
(557, 'Zona DAZN IT', 'zona-dazn-it', 'https://stitichsports.com/images/small_picture/small_pic900.jpg', 'https://daddylive1.ru/live/stream-877.php', NULL, 0, 12, NULL, '2024-12-25 10:59:42', 'active', NULL, NULL, NULL, 'all');

-- --------------------------------------------------------

--
-- Table structure for table `channel_comments`
--

CREATE TABLE `channel_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_content`
--

CREATE TABLE `channel_content` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_ratings`
--

CREATE TABLE `channel_ratings` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_views`
--

CREATE TABLE `channel_views` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `view_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `channel_id`) VALUES
(5, 12, 14),
(6, 12, 32),
(7, 12, 31),
(13, 7, 15),
(14, 7, 16),
(18, 6, 99),
(19, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `live_notifications`
--

CREATE TABLE `live_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `team1` varchar(255) NOT NULL,
  `team2` varchar(255) NOT NULL,
  `tournament_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` enum('upcoming','ongoing','finished') DEFAULT 'upcoming',
  `allow_comments` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `team1`, `team2`, `tournament_name`, `slug`, `link`, `banner`, `start_time`, `end_time`, `status`, `allow_comments`, `created_at`, `date`) VALUES
(9, 'Liverpool', 'Leicester City', 'Premier League', 'liverpool-vs-leicester-city', 'https://daddylive1.ru/live/stream-664.php', 'liverpool-vs-leicester-city.png', '2024-12-27 17:30:00', '2024-12-27 19:32:00', 'upcoming', 0, '2024-12-27 09:32:17', NULL),
(10, 'Lazio', 'Atalanta', 'Serie A', 'lazio-vs-atalanta', 'https://daddylive1.ru/live/stream-664.php', 'lazio-vs-atalanta.png', '2024-12-27 21:35:00', '2024-12-27 20:35:00', 'upcoming', 0, '2024-12-27 09:35:49', NULL),
(11, 'Arsenal', 'Ipswich', 'Premier League', 'arsenal-vs-ipswich', 'https://daddylive1.ru/live/stream-664.php', 'arsenal-vs-ipswich.png', '2024-12-30 13:36:00', '2024-12-30 14:02:00', 'upcoming', 0, '2024-12-27 09:37:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `match_comments`
--

CREATE TABLE `match_comments` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `created_at`, `is_read`) VALUES
(5, 12, 'A new channel has been added!', '2024-12-25 12:14:06', 1),
(8, 12, 'test test', '2024-12-25 12:19:35', 1),
(9, 6, 'test test test aris axali', '2024-12-27 13:08:40', 1),
(10, 9, 'test test test aris axali', '2024-12-27 13:08:40', 0),
(11, 11, 'test test test aris axali', '2024-12-27 13:08:40', 0),
(12, 12, 'test test test aris axali', '2024-12-27 13:08:40', 1),
(13, 5, 'test test test aris axali', '2024-12-27 13:08:40', 0),
(14, 1, 'test test test aris axali', '2024-12-27 13:08:40', 1),
(15, 8, 'test test test aris axali', '2024-12-27 13:08:40', 0),
(16, 7, 'test test test aris axali', '2024-12-27 13:08:40', 0),
(17, 6, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 1),
(18, 9, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 0),
(19, 11, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 0),
(20, 12, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 1),
(21, 5, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 0),
(22, 1, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 1),
(23, 8, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 0),
(24, 7, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:09:19', 0),
(25, 6, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:49', 1),
(26, 9, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:49', 0),
(27, 11, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:49', 0),
(28, 12, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:49', 1),
(29, 5, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:49', 0),
(30, 1, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:50', 1),
(31, 8, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:50', 0),
(32, 7, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:21:50', 0),
(33, 6, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 1),
(34, 9, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 0),
(35, 11, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 0),
(36, 12, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 1),
(37, 5, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 0),
(38, 1, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 1),
(39, 8, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 0),
(40, 7, 'Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!Notification sent to all users!', '2024-12-27 13:22:00', 0),
(41, 6, 'test test', '2025-01-30 14:02:54', 0),
(42, 15, 'test test', '2025-01-30 14:02:54', 0),
(43, 9, 'test test', '2025-01-30 14:02:54', 0),
(44, 11, 'test test', '2025-01-30 14:02:54', 0),
(45, 12, 'test test', '2025-01-30 14:02:54', 0),
(46, 5, 'test test', '2025-01-30 14:02:54', 0),
(47, 1, 'test test', '2025-01-30 14:02:54', 0),
(48, 8, 'test test', '2025-01-30 14:02:54', 0),
(49, 16, 'test test', '2025-01-30 14:02:54', 1),
(50, 14, 'test test', '2025-01-30 14:02:54', 0),
(51, 7, 'test test', '2025-01-30 14:02:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) NOT NULL,
  `en` text DEFAULT NULL,
  `ka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `key_name`, `en`, `ka`) VALUES
(9, 'home', 'Home', 'მთავარი'),
(10, 'channels', 'Channels', 'არხები'),
(11, 'login', 'Login', 'შესვლა'),
(12, 'logout', 'Logout', 'გასვლა'),
(13, 'register', 'Register', 'რეგისტრაცია'),
(14, 'notifications', 'Notifications', 'შეტყობინებები'),
(15, 'Categories', 'Categories', 'კატეგორები');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','premium','admin') DEFAULT 'user',
  `reset_token` varchar(255) DEFAULT NULL,
  `token_expires_at` datetime DEFAULT NULL,
  `subscription_type` enum('user','premium') DEFAULT 'user',
  `subscription_started_at` datetime DEFAULT NULL,
  `subscription_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `is_admin`, `created_at`, `role`, `reset_token`, `token_expires_at`, `subscription_type`, `subscription_started_at`, `subscription_expires_at`) VALUES
(1, 'Giorgi', 'Zaraspishvili', 'giorgi.zaraspishvili@gmail.com', '$2y$10$I4nShJ/N81Uaxw8b.6QS.uuaIkZOVMXEg2ChDUyXH7z/Sk6AQavom', 1, '2024-12-24 12:01:19', 'admin', '1fdec213d6c6dc955a180bd556ceed5d721b866a30d2326206e3ea8b24222dcd', '2024-12-25 09:58:55', 'premium', '2024-12-25 11:16:51', NULL),
(5, 'asd', 'asd', 'admin@example.com', '$2y$10$XerLiB1tEiyQdzInExqrc..gtyyJRbqtBfBbND7UwaNesdbSb8bim', 0, '2024-12-25 09:23:43', 'user', NULL, NULL, 'user', NULL, NULL),
(6, 'asd', 'asd', '1111@gmail.com', '$2y$10$6kDR0Cwnh7yTYznfkDJaNOENJCYK6SiiYisWAZbrPa9caQSw1HMTm', 0, '2024-12-25 09:23:51', 'user', NULL, NULL, 'user', NULL, NULL),
(7, 'test', 'test', 'zaraspishvili@gmail.com', '$2y$10$E70NKPBiVZwrvEq7d3BphePYuDNUWTJYn5Lj7Cta5ZT9NrYDMHBNy', 0, '2024-12-25 11:39:53', 'user', NULL, NULL, 'premium', '2024-12-25 16:59:46', '2025-01-25 16:59:46'),
(8, 'Giorgi', 'Zaraspishvili', 'test@gmail.com', '$2y$10$bXhobwEhhsI22KFhUUxAv.gdwtNZgsCSiQVFsiYRVoXmQXiFfsFTm', 0, '2024-12-25 11:50:01', 'user', NULL, NULL, 'user', NULL, NULL),
(9, 'Giorgi', 'Zaraspishvili', '12121@gmail.com', '$2y$10$sZhjtRXiO56JrEnE9CCyXeW6cRD5wp37K9KOenfpSCfxW1fBmtnky', 0, '2024-12-25 11:52:30', 'user', NULL, NULL, 'user', NULL, NULL),
(11, 'Giorgi', 'Zar', '333@gmail.com', '$2y$10$zaUMcBdDNeWwwDsKxy2SB.sA9VXDz5gmnQNj9IJVSsgpvX2xWrJkS', 0, '2024-12-25 11:55:02', 'user', NULL, NULL, 'user', NULL, NULL),
(12, 'as', 'as', 'admdsdsdin@gmail.com', '$2y$10$451B973OOWYCBnnsPog.W.pPkzuJU.m4ePoM27Yl4/QlC68N8btFm', 0, '2024-12-25 12:23:16', 'user', NULL, NULL, 'premium', '2024-12-25 16:50:48', '2025-01-25 16:50:48'),
(14, 'z', 'z', 'z@gmail.com', '$2y$10$cg0VzgzJgemQTFU4c3xzreV9zibWa87ww6rfNVuWtM/cWQDUi4JaO', 0, '2024-12-27 09:29:05', 'user', NULL, NULL, 'user', NULL, NULL),
(15, '111', '111', '111@gmail.com', '$2y$10$sACuW8vEgj6rSBqdswsqz.UyxYIVlUZZZAToulz3JFVSYjQftTTYq', 0, '2024-12-27 11:30:15', 'user', NULL, NULL, 'premium', '2024-12-27 15:30:28', '2025-01-27 15:30:28'),
(16, 'test', 'test', 'testzaraspishvili@gmail.com', '$2y$10$cfp9AlueBca3tmcdlL1kW.2PTmR4KFlfG2Wiq9Dm1Jy26EeVZ6dbC', 0, '2025-01-30 07:29:42', 'user', NULL, NULL, 'premium', '2025-01-30 12:37:52', '2025-02-28 12:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_visited` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_watched_channels`
--

CREATE TABLE `user_watched_channels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `watch_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `channel_comments`
--
ALTER TABLE `channel_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `channel_content`
--
ALTER TABLE `channel_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `channel_ratings`
--
ALTER TABLE `channel_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `channel_views`
--
ALTER TABLE `channel_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `live_notifications`
--
ALTER TABLE `live_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `match_comments`
--
ALTER TABLE `match_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_watched_channels`
--
ALTER TABLE `user_watched_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=558;

--
-- AUTO_INCREMENT for table `channel_comments`
--
ALTER TABLE `channel_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `channel_content`
--
ALTER TABLE `channel_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channel_ratings`
--
ALTER TABLE `channel_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channel_views`
--
ALTER TABLE `channel_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `live_notifications`
--
ALTER TABLE `live_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `match_comments`
--
ALTER TABLE `match_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_watched_channels`
--
ALTER TABLE `user_watched_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `channel_comments`
--
ALTER TABLE `channel_comments`
  ADD CONSTRAINT `channel_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channel_comments_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

--
-- Constraints for table `channel_content`
--
ALTER TABLE `channel_content`
  ADD CONSTRAINT `channel_content_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

--
-- Constraints for table `channel_ratings`
--
ALTER TABLE `channel_ratings`
  ADD CONSTRAINT `channel_ratings_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channel_ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_views`
--
ALTER TABLE `channel_views`
  ADD CONSTRAINT `channel_views_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `match_comments`
--
ALTER TABLE `match_comments`
  ADD CONSTRAINT `match_comments_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `match_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_watched_channels`
--
ALTER TABLE `user_watched_channels`
  ADD CONSTRAINT `user_watched_channels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_watched_channels_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
