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

-- 'article' dumping data

INSERT INTO `article` (`article_id`, `title`, `summary`, `content`, `created`, `category_id`, `member_id`, `image_id`, `published`) VALUES
(1, 'PAiD Brochure', 'Brochure design for P2P Aid in Digital Currency', 'A comprehensive brochure design showcasing peer-to-peer aid solutions in the digital currency space which  highlights the innovative approach to financial empowerment through decentralized digital currency initiatives.', '', 1, 2, 1, 1),
(2, 'The Sum Of All Things Book Cover', 'Book cover design for The Sum of All Things', 'An striking book cover design for The Sum of All Things that captures the essence of the literary work.', '', 1, 2, 2, 1),
(3, 'Neon Soul Album Cover', 'Album cover design for Neol Sould', 'A vibrant album cover for Neon Soul featuring contemporary design aesthetics. The cover employs bold colors and modern graphic elements to create an impression that matches the musical genre and artistic vision.', '', 1, 1, 3, 1),
(4, 'Efley Group Business Card', 'Business card design for Efley Company', 'Professional business card design for Efley Group that conveys corporate identity and brand values. The layout includes essential contact information presented in a clean, modern format.', '', 1, 2, 4, 1),
(5, 'Childrens Drawing Festival Poster', 'Poster design for Childrens Drawing Festival', 'Colorful and engaging poster design for the Childrens Drawing Festival. The design appeals to young audiences while maintaining professional quality.', '', 1, 1, 5, 1),
(6, 'Venice Travel Guide', 'Travel guide design for Venice Grand Tourist', 'An informative travel guide design for Venice featuring beautiful visual elements and practical tourism information. The layout guides visitors through the citys iconic locations, cultural landmarks, and travel essentials in an accessible format.', '', 1, 1, 6, 1),

(7, 'NoticeSound Website', 'Website for system tracks managing', 'A comprehensive web platform for managing and tracking system notifications and alerts. NoticeSound provides an intuitive interface for organizing, categorizing, and monitoring various system-generated sounds.', '', 2, 1, 7, 1),
(8, 'Attendy App', 'App for keeping track of attendance', 'A user-friendly mobile and web application designed to simplify attendance tracking. Attendy streamlines the process of recording presence, generating reports, and analyzing attendance patterns for schools, businesses, and organizations.', '', 2, 2, 8, 1),
(9, 'FlavorFit Website and App', 'Website and app design for personalized fitness planning', 'A comprehensive digital platform combining web and mobile applications for personalized fitness and nutrition planning. FlavorFit uses advanced algorithms to create customized workout routines and meal plans based on individual health goals and dietary preferences.', '', 2, 3, 9, 1),
(10, 'Advlife Booking Website', 'Website for real estate booking', 'A sophisticated real estate booking platform providing seamless property search, viewing scheduling, and transaction management. Advlife connects buyers, sellers, and agents in a secure digital environment optimized for residential and commercial properties.', '', 2, 2, 10, 1),
(11, 'Comfort Shift Website', 'Website for moving and relocation', 'A dedicated platform specializing in moving and relocation services coordination. Comfort Shift connects customers with reliable moving companies, handles booking, tracking, and customer support to ensure smooth and stress-free relocation experiences.', '', 2, 1, 11, 1),
(12, 'Eduwerks Website', 'Website for E-learning platform', 'A comprehensive e-learning platform offering interactive courses, resources, and educational content. Eduwerks provides students and professionals with flexible learning opportunities, course completion tracking, and certification upon successful completion.', '', 2, 1, 12, 1),

(13, 'Manga Cover Gantz', 'Manga cover for Gantz series by Hiroya Oku', 'A striking manga cover design for the Gantz series by renowned manga artist Hiroya Oku. The artwork captures the series intense action and supernatural elements through unique, high-contrast, and hyper-detailed aesthetic.', '', 3, 2, 13, 1),
(14, 'Manga Cover I Am A Hero', 'Manga cover for I Am A Hero series by Kengo Hanazawa', 'A compelling manga cover for I Am A Hero by Kengo Hanazawa showcasing the psychological thriller and survival themes. The design effectively conveys the transformation of the protagonist with a nod from the first volume cover.', '', 3, 3, 14, 1),
(15, 'Manga Cover Berserk', 'Manga cover for Berserk series by Kentaro Miura', 'An intense and atmospheric manga cover for the legendary Berserk series by Kentaro Miura. The artwork captures the dark fantasy essence and epic scale that defines one of mangas most acclaimed series.', '', 3, 3, 15, 1),
(16, 'Manga Cover Full Metal Alchemist', 'Manga cover for Full Metal Alchemist series by Hiromu Arakawa', 'An imaginative manga cover for Full Metal Alchemist by Hiromu Arakawa . Despite the visible injuries, the cover is brightly colored and lit, conveying a sense of relief, peace, and accomplishment rather than despair.', '', 3, 1, 16, 1),
(17, 'Manga Cover Dorohedoro', 'Manga cover for Dorohedoro series by Q Hayashida', 'A unique and visually striking manga cover for Doroherdoro by Q Hayashida. The artwork showcases the series distinctive art style and surreal atmosphere with dirty, grimy, and chaotic aesthetic through highly detailed, hand-drawn art.', '', 3, 3, 17, 1),
(18, 'Manga Cover Fire Punch', 'Manga cover for Fire Punch series by Tatsuki Fujimoto', 'A powerful manga cover for Fire Punch by Tatsuki Fujimoto capturing the series intense action and high-concept storytelling. The design uses dramatic visual elements to convey the supernatural and destructive themes of fire and agony.', '', 3, 3, 18, 1),

(19, 'Photograph Winston Churchill', 'Photograph of Winston Churchill by Yousuf Karsh', 'An iconic portrait photograph of Winston Churchill, the renowned British Prime Minister, captured by legendary photographer Yousuf Karsh. This powerful image exemplifies Karsh ability to capture the strength and determination of historical figures.', '', 4, 1, 19, 1),
(20, 'Photograph Walt Disney', 'Photograph of Walt Disney by Yousuf Karsh', 'A distinguished portrait of Walt Disney, the visionary animator and entrepreneur, photographed by Yousuf Karsh. The image captures Disneys creative spirit and determination that revolutionized the entertainment industry.', '', 4, 1, 20, 1),
(21, 'Photograph Robert Oppenheimer', 'Photograph of Robert Oppenheimer by Yousuf Karsh', 'A profound portrait of Robert Oppenheimer, the theoretical physicist and Manhattan Project director, by Yousuf Karsh. The photograph captures the contemplative nature of one of sciences most influential and complex figures.', '', 4, 1, 21, 1),
(22, 'Photograph Nelson Mandela', 'Photograph of Nelson Mandela by Yousuf Karsh', 'An inspiring portrait of Nelson Mandela, South African anti-apartheid revolutionary and statesman, captured by acclaimed photographer Yousuf Karsh. The image reflects Mandelas dignified legacy and transformative impact on world history.', '', 4, 2, 22, 1),
(23, 'Photograph Jascha Heifetz', 'Photograph of Jascha Heifetz by Yousuf Karsh', 'A refined portrait photograph of Jascha Heifetz, the legendary violinist known for his extraordinary technical mastery and artistry, by Yousuf Karsh. The image captures the intensity of one of classical musics greatest performers.', '', 4, 2, 23, 1),
(24, 'Photograph Harland Sanders', 'Photograph of Harland Sanders by Yousuf Karsh', 'A memorable portrait of Harland Sanders, founder of Kentucky Fried Chicken and American entrepreneur, photographed by Yousuf Karsh. The photograph captures the determination and vision of the man behind one of the worlds most recognizable brands.', '', 4, 3, 24, 1),