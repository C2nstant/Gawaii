-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2026 at 08:13 AM
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
-- Database: `gawaii`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(254) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(24) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `navigation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `file` varchar(254) DEFAULT NULL,
  `alt` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `forename` varchar(254) DEFAULT NULL,
  `surname` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `joined` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `picture` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


--
-- Database: gawaii
--

-- 'article' table structure

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(254) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 'article' dumping data

INSERT INTO 'article' ('article_id', 'title', 'summary', 'content', 'created', `category_id`, `member_id`, `image_id`, `published`) VALUES
(1, 'PAiD Brochure', 'Brochure design for P2P Aid in Digital Currency', '', '', 1, 2, 1, 1),
(2, 'The Sum Of All Things Book Cover', 'Book cover design for The Sum of All Things', '', '', 1, 2, 2, 1),
(3, 'Neon Soul Album Cover', 'Album cover design for Neol Sould', '', '', 1, 1, 3, 1),
(4, 'Efley Group Business Card', 'Business card design for Efley Company', '', '', 1, 2, 4, 1),
(5, 'Childrens Drawing Festival Poster', 'Poster design for Childrens Drawing Festival', '', '', 1, 1, 5, 1),
(6, 'Venice Travel Guide', 'Travel guide design for Venice Grand Tourist', '', '', 1, 1, 6, 1),

(7, 'NoticeSound Website', 'Website for system tracks managing', '', '', 2, 1, 7, 1),
(8, 'Attendy App', 'App for keeping track of attendance', '', '', 2, 2, 8, 1),
(9, 'FlavorFit Website and App', 'Website and app design for personalized fitness planning', '', '', 2, 3, 9, 1),
(10, 'Advlife Booking Website', 'Website for real estate booking', '', '', 2, 2, 10, 1),
(11, 'Comfort Shift Website', 'Website for moving and relocation', '', '', 2, 1, 11, 1),
(12, 'Eduwerks Website', 'Website for E-learning platform', '', '', 2, 1, 12, 1),

(13, 'Boston Bag 105', 'Boston Bag illustration for inspiration', '', '', 3, 2, 13, 1),
(14, 'Chromakopia', 'Artwork for Tyler the Creator album', '', '', 3, 3, 14, 1),
(15, 'Epoch Times', 'Editorial graphics for NYC article', '', '', 3, 3, 15, 1),
(16, 'Bedroom Mural', 'Mural peacock illustration for bedroom design', '', '', 3, 1, 16, 1),
(17, 'Character Monster Design', 'Character design drafts for a video game', '', '', 3, 3, 17, 1),
(18, 'Landscape Design', 'Landscape design for Space Rock Games', '', '', 3, 3, 18, 1),

(19, '', '', '', '', 4, 3, 18, 1),
(20, '', '', '', '', 4, 3, 18, 1),
(21, '', '', '', '', 4, 3, 18, 1),
(22, '', '', '', '', 4, 3, 18, 1),
(23, '', '', '', '', 4, 3, 18, 1),
(24, '', '', '', '', 4, 3, 18, 1),