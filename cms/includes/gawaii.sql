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

--
-- Dumping data for table `article`
--

-- print (1)
-- digital (2)
-- photography (3)
-- illustration (4)

INSERT INTO `article` (`article_id`, `title`, `summary`, `content`, `created`, `category_id`, `member_id`, `image_id`, `published`) VALUES
(1, 'PAiD Brochure', 'Brochure design for P2P Aid in Digital Currency', 'A comprehensive brochure design showcasing peer-to-peer aid solutions in the digital currency space which  highlights the innovative approach to financial empowerment through decentralized digital currency initiatives.', '2025-02-25 23:29:00', 1, 2, 1, 1),
(2, 'The Sum Of All Things Book Cover', 'Book cover design for The Sum of All Things', 'An striking book cover design for The Sum of All Things that captures the essence of the literary work.', '2026-02-23 23:29:45', 1, 2, 2, 1),
(3, 'Neon Soul Album Cover', 'Album cover design for Neol Sould', 'A vibrant album cover for Neon Soul featuring contemporary design aesthetics. The cover employs bold colors and modern graphic elements to create an impression that matches the musical genre and artistic vision.', '2026-02-23 23:31:02', 1, 1, 3, 1),
(4, 'Efley Group Business Card', 'Business card design for Efley Company', 'Professional business card design for Efley Group that conveys corporate identity and brand values. The layout includes essential contact information presented in a clean, modern format.', '2026-02-23 23:31:55', 1, 2, 4, 1),
(5, 'Childrens Drawing Festival Poster', 'Poster design for Childrens Drawing Festival', 'Colorful and engaging poster design for the Childrens Drawing Festival. The design appeals to young audiences while maintaining professional quality.', '2026-02-23 23:32:24', 1, 1, 5, 1),
(6, 'Venice Travel Guide', 'Travel guide design for Venice Grand Tourist', 'An informative travel guide design for Venice featuring beautiful visual elements and practical tourism information. The layout guides visitors through the citys iconic locations, cultural landmarks, and travel essentials in an accessible format.', '2026-02-23 23:32:38', 1, 1, 6, 1),


(7, 'Blasphemous', 'Game cover for Blasphemous by The Game Kitchen', 'A dark and striking game cover for Blasphemous by The Game Kitchen. Despite the heavy religious imagery and brutality, the cover is richly detailed and atmospheric, conveying a sense of solemn devotion and penitence.', '2026-02-23 23:38:05', 2, 2, 7, 1),
(8, 'Return of the Obra Dinn', 'Game cover for Return of the Obra Dinn by Lucas Pope', 'A unique and visually striking game cover for Return of the Obra Dinn by Lucas Pope. The artwork showcases the game''s distinctive 1-bit monochrome art style and mystery atmosphere through highly detailed, stark black-and-white illustration.', '2026-02-23 23:39:41', 2, 1, 8, 1),
(9, 'ENA: Dream BBQ', 'Game cover for ENA: Dream BBQ by Joel Guerra', 'A surreal and visually eclectic game cover for ENA: Dream BBQ by Joel Guerra capturing the series'' avant-garde storytelling and dreamlike visual identity. The design uses vibrant, dissonant colors and abstract imagery to convey the bizarre and emotional world of ENA.', '2026-02-23 23:40:18', 2, 1, 9, 1),
(10, 'Disco Elysium', 'Game cover for Disco Elysium by ZA/UM', 'A striking game cover for Disco Elysium. The artwork captures the game''s noir detective atmosphere and political intrigue through a painterly, expressionist aesthetic with muted, melancholic tones.', '2026-02-23 23:35:21', 2, 1, 10, 1),
(11, 'Hollow Knight', 'Game cover for Hollow Knight by Team Cherry', 'A compelling game cover for Hollow Knight by Team Cherry showcasing the atmospheric metroidvania and exploration themes. The design effectively conveys the mysterious underground kingdom with dark, hand-drawn visuals.', '2026-02-23 23:35:59', 2, 2, 11, 1),
(12, 'Far Cry 3', 'Game cover for Far Cry 3 by Ubisoft', 'An intense and atmospheric game cover for Far Cry 3 by Ubisoft. The artwork captures the tropical open-world chaos and psychological descent that defines one of the series'' most acclaimed entries.', '2026-02-23 23:37:21', 2, 3, 12, 1),


(13, 'Gantz', 'Manga cover for Gantz series by Hiroya Oku', 'A striking manga cover design for the Gantz series by renowned manga artist Hiroya Oku. The artwork captures the series intense action and supernatural elements through unique, high-contrast, and hyper-detailed aesthetic.', '2026-02-23 23:42:12', 3, 2, 13, 1),
(14, 'I Am A Hero', 'Manga cover for I Am A Hero series by Kengo Hanazawa', 'A compelling manga cover for I Am A Hero by Kengo Hanazawa showcasing the psychological thriller and survival themes. The design effectively conveys the transformation of the protagonist with a nod from the first volume cover.', '2026-02-23 23:46:22', 3, 3, 14, 1),
(15, 'Berserk', 'Manga cover for Berserk series by Kentaro Miura', 'An intense and atmospheric manga cover for the legendary Berserk series by Kentaro Miura. The artwork captures the dark fantasy essence and epic scale that defines one of mangas most acclaimed series.', '2026-02-23 23:49:06', 3, 3, 15, 1),
(16, 'Full Metal Alchemist', 'Manga cover for Full Metal Alchemist series by Hiromu Arakawa', 'An imaginative manga cover for Full Metal Alchemist by Hiromu Arakawa . Despite the visible injuries, the cover is brightly colored and lit, conveying a sense of relief, peace, and accomplishment rather than despair.', '2026-02-23 23:49:59', 3, 1, 16, 1),
(17, 'Dorohedoro', 'Manga cover for Dorohedoro series by Q Hayashida', 'A unique and visually striking manga cover for Doroherdoro by Q Hayashida. The artwork showcases the series distinctive art style and surreal atmosphere with dirty, grimy, and chaotic aesthetic through highly detailed, hand-drawn art.', '2026-02-23 23:51:54', 3, 3, 17, 1),
(18, 'Fire Punch', 'Manga cover for Fire Punch series by Tatsuki Fujimoto', 'A powerful manga cover for Fire Punch by Tatsuki Fujimoto capturing the series intense action and high-concept storytelling. The design uses dramatic visual elements to convey the supernatural and destructive themes of fire and agony.', '2026-02-23 23:52:22', 3, 3, 18, 1),


(19, 'Winston Churchill', 'Photograph of Winston Churchill by Yousuf Karsh', 'An iconic portrait photograph of Winston Churchill, the renowned British Prime Minister, captured by legendary photographer Yousuf Karsh. This powerful image exemplifies Karsh ability to capture the strength and determination of historical figures.', '2026-02-23 23:52:59', 4, 1, 19, 1),
(20, 'Walt Disney', 'Photograph of Walt Disney by Yousuf Karsh', 'A distinguished portrait of Walt Disney, the visionary animator and entrepreneur, photographed by Yousuf Karsh. The image captures Disneys creative spirit and determination that revolutionized the entertainment industry.', '2026-02-23 23:54:02', 4, 1, 20, 1),
(21, 'Robert Oppenheimer', 'Photograph of Robert Oppenheimer by Yousuf Karsh', 'A profound portrait of Robert Oppenheimer, the theoretical physicist and Manhattan Project director, by Yousuf Karsh. The photograph captures the contemplative nature of one of sciences most influential and complex figures.', '2026-02-23 23:55:09', 4, 1, 21, 1),
(22, 'Nelson Mandela', 'Photograph of Nelson Mandela by Yousuf Karsh', 'An inspiring portrait of Nelson Mandela, South African anti-apartheid revolutionary and statesman, captured by acclaimed photographer Yousuf Karsh. The image reflects Mandelas dignified legacy and transformative impact on world history.', '2026-02-23 23:56:10', 4, 2, 22, 1),
(23, 'Jascha Heifetz', 'Photograph of Jascha Heifetz by Yousuf Karsh', 'A refined portrait photograph of Jascha Heifetz, the legendary violinist known for his extraordinary technical mastery and artistry, by Yousuf Karsh. The image captures the intensity of one of classical musics greatest performers.', '2026-02-23 23:56:03', 4, 2, 23, 1),
(24, 'Harland Sanders', 'Photograph of Harland Sanders by Yousuf Karsh', 'A memorable portrait of Harland Sanders, founder of Kentucky Fried Chicken and American entrepreneur, photographed by Yousuf Karsh. The photograph captures the determination and vision of the man behind one of the worlds most recognizable brands.', '2026-02-23 23:57:50', 4, 3, 24, 1);

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

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`, `navigation`) VALUES
(1, 'Print', 'Inspiring graphic design', 1),
(2, 'Game Covers', 'Enchanting game covers', 1),
(3, 'Manga Covers', 'Digital manga covers', 1),
(4, 'Photography', 'Capturing the moment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `file` varchar(254) DEFAULT NULL,
  `alt` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `file`, `alt`) VALUES
(1, 'PAiD Brochure.png', 'Brochure design for P2P Aid in Digital Currency'),
(2, 'The Sum Of All Things Book Cover.png', 'Book cover design for The Sum of All Things'),
(3, 'Neon Soul Album Cover.png', 'Album cover design for Neol Sould'),
(4, 'Efley Group Business Card.png', 'Business card design for Efley Company'),
(5, 'Childrens Drawing Festival Poster.png', 'Poster design for Childrens Drawing Festival'),
(6, 'Venice Travel Guide.png', 'Travel guide design for Venice Grand Tourist'),

(7, 'Game Cover Blasphemous.png', 'Game cover of Blasphemous by The Game Kitchen'),
(8, 'Game Cover Return of the Obra Dinn.png', 'Game cover of Return of the Obra Dinn by Lucas Pope'),
(9, 'Game Cover Dream BBQ.png', 'Game cover of ENA Dream BBQ by Joel Guerra'),
(10, 'Game Cover Disco Elysium.png', 'Game cover of Disco Elysium by ZA/UM'),
(11, 'Game Cover Hollow Knight.png', 'Game cover of Hollow Knight by Team Cherry'),
(12, 'Game Cover Far Cry 3.png', 'Game cover of Far Cry 3 by Ubisoft'),

(13, 'Manga Cover Gantz.png', 'Manga cover for Gantz series by Hiroya Oku'),
(14, 'Manga Cover I Am A Hero.png', 'Manga cover for I Am A Hero series by Kengo Hanazawa'),
(15, 'Manga Cover Berserk.png', 'Manga cover for Berserk series by Kentaro Miura'),
(16, 'Manga Cover Full Metal Alchemist.png', 'Manga cover for Full Metal Alchemist series by Hiromu Arakawa'),
(17, 'Manga Cover Dorohedoro.png', 'Manga cover for Dorohedoro series by Q Hayashida'),
(18, 'Manga Cover Fire Punch.png', 'Manga cover for Fire Punch series by Tatsuki Fujimoto'),

(19, 'Photograph Winston Churchill.png', 'Photograph of Winston Churchill by Yousuf Karsh'),
(20, 'Photograph Walt Disney.png', 'Photograph of Walt Disney by Yousuf Karsh'),
(21, 'Photograph Robert Oppenheimer.png', 'Photograph of Robert Oppenheimer by Yousuf Karsh'),
(22, 'Photograph Nelson Mandela.png', 'Photograph of Nelson Mandela by Yousuf Karsh'),
(23, 'Photograph Jascha Heifetz.png', 'Photograph of Jascha Heifetz by Yousuf Karsh'),
(24, 'Photograph Harland Sanders.png', 'Photograph of Harland Sanders by Yousuf Karsh');


-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `forename` varchar(254) DEFAULT NULL,
  `surname` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL,
  `joined` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `picture` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'Frodo', 'Baggins', 'frodo@eg.link', 'frodo123', '2026-02-25 22:41:12', 'frodo.png'),
(2, 'Samwise', 'Gamgee', 'samwise@eg.link', 'samwise123', '2026-02-25 22:44:30', 'samwise.png'),
(3, 'Gandalf', 'The Grey', 'gandalf@eg.link', 'gandalf123', '2026-02-25 22:45:55', 'gandalf.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`member_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

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
-- Constraints for table `article`
--

ALTER TABLE `article`
  ADD CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `image_exists` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
  ADD CONSTRAINT `member_exists` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);