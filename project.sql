
create schema project;
use project;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 02:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `DrawingID` int(11) NOT NULL,
  `CommentText` text DEFAULT NULL,
  `CommentDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`CommentID`, `UserID`, `DrawingID`, `CommentText`, `CommentDate`) VALUES
(1, 1, 2, 'Nice drawing!', '2023-12-16 09:26:22'),
(2, 2, 1, 'Great work!', '2023-12-16 09:26:22'),
(3, 3, 3, 'I love this!', '2023-12-16 09:26:22'),
(4, 1, 5, 'cool', '2023-12-19 16:00:25'),
(5, NULL, 5, 'a', '2023-12-19 16:06:07'),
(6, 9, 5, 'a', '2023-12-19 16:06:25'),
(7, 9, 5, 'a', '2023-12-19 16:06:36'),
(8, 9, 13, 'wow', '2023-12-20 00:47:17'),
(9, 16, 2, 'Great picture', '2023-12-20 01:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `drawing`
--

CREATE TABLE `drawing` (
  `_id` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `UploadDate` date DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drawing`
--

INSERT INTO `drawing` (`_id`, `UserID`, `title`, `description`, `filePath`, `UploadDate`, `OwnerID`, `price`) VALUES
(1, 15, 'vango', 'art', '\\uploads\\file-1703035212017.jpg', NULL, 16, 10001.00),
(2, 16, 'The Great Wave off Kanagawa', 'Print by Hokusai', '\\uploads\\file-1703035795566.jpg', NULL, NULL, 1234.00);

-- --------------------------------------------------------

--
-- Table structure for table `renamed_drawing`
--

CREATE TABLE `renamed_drawing` (
  `_id` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `UploadDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `OwnerID` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `renamed_drawing`
--

INSERT INTO `renamed_drawing` (`_id`, `UserID`, `title`, `description`, `filePath`, `UploadDate`, `OwnerID`, `price`) VALUES
(1, 1, 'Drawing 1', 'Description for Drawing 1', 'https://example.com/drawing1.png', '2023-12-16 09:26:22', 9, NULL),
(2, 2, 'Drawing 2', 'Description for Drawing 2', 'https://example.com/drawing2.png', '2023-12-16 09:26:22', NULL, NULL),
(3, 3, 'Drawing 3', 'Description for Drawing 3', 'https://example.com/drawing3.png', '2023-12-16 09:26:22', NULL, NULL),
(4, 12, '', 'mano', '\\uploads\\file-1702927988027.jpg', '2023-12-18 19:33:08', NULL, NULL),
(5, 12, '', 'mano', '\\uploads\\file-1702928070216.jpg', '2023-12-18 19:34:30', 9, NULL),
(6, 12, '', '', '\\uploads\\file-1702946984591.jpg', '2023-12-19 00:49:44', 9, NULL),
(7, 12, '', '', '\\uploads\\file-1702948364717.png', '2023-12-19 01:12:44', 9, NULL),
(8, 12, '', 'manoyyy', '\\uploads\\file-1702959683808.png', '2023-12-19 04:21:23', 9, NULL),
(9, 12, '', 'terrara', '\\uploads\\file-1702960139445.png', '2023-12-19 04:28:59', 9, 10030.00),
(10, 12, 'manoandfriend', 'terrara', '\\uploads\\file-1702960497739.png', '2023-12-19 04:34:57', 9, 12088.00),
(13, 9, 'valorant', 'ni', '\\uploads\\file-1703033222099.png', '2023-12-20 00:47:02', 9, 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `buyyer` varchar(255) NOT NULL,
  `seller` varchar(255) NOT NULL,
  `DrawingID` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `buyyer`, `seller`, `DrawingID`, `price`, `CreateDate`) VALUES
(1, '9', '12', '9', 10030.00, '2023-12-19 06:50:37'),
(2, '9', '12', '10', 12088.00, '2023-12-19 08:30:31'),
(3, '9', '12', '10', 12088.00, '2023-12-19 08:32:35'),
(4, '9', '12', '10', 12088.00, '2023-12-19 08:34:55'),
(5, '9', '12', '10', 12088.00, '2023-12-19 08:37:34'),
(6, '9', '12', '10', 12088.00, '2023-12-19 08:39:14'),
(7, '9', '12', '10', 12088.00, '2023-12-19 08:52:15'),
(8, '9', '12', '10', 12088.00, '2023-12-19 08:53:54'),
(9, '9', '1', '1', NULL, '2023-12-19 12:08:13'),
(10, '9', '9', '13', 120.00, '2023-12-20 00:47:23'),
(11, '16', '15', '1', 10001.00, '2023-12-20 01:32:05'),
(12, '16', '15', '1', 10001.00, '2023-12-20 01:32:11'),
(13, '16', '15', '1', 10001.00, '2023-12-20 01:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `Password`) VALUES
(1, 'kevc', 'user1@example.com', 'password1'),
(2, 'user2', 'user2@example.com', 'password2'),
(3, 'user3', 'user3@example.com', 'password3'),
(4, 'user4', 'user4@example.com', 'password4'),
(6, 'manotham', 'manothamvva@gmail.com', '$2b$12$ii9tEXGMY.aUy4jdZpoGDOkNC44bwSVvwO8IIQ.YRpTru43vcS80C'),
(7, 'mano', 'rsa@gamil.com', '$2b$12$ZSUInwJdj8F63lvT9iVPvuNykBweVOWpArVxcekYodolpq7Pvlg.2'),
(8, 'manore', 'Hashtag12@Gmail.Com', '$2b$12$zYBLgebqaLHFmvKYiJbp1Ogr1JVRHZ2/K80EAQwv2/SDqIvKNdlLi'),
(9, 'uioi', 'xxy1234@Gamil.Com', '$2b$12$Ry9wc7YL4aO/pLkRXx0AXOcccabkb05SsHWHSVC1G3GxtH.ZYpvRS'),
(10, 'manothamvva@gmail.com', 'Hashtag12@Gmail.Com', '$2b$12$upb6Uk9nY4uq4kmaQqphPuQiSiAS9602q.dF6dQ2lNSmJrt/rJNni'),
(11, 'manothamvva@gmail.com', 'Hashtag12@Gmail.Com', '$2b$12$b5sJyA.0datdNlgDB4lbfuoHtQIWx1AjzIMd5lD4EulnfJGx566fC'),
(12, 'huiee', 'nigga123@gmail', '$2b$12$QmGONwtTQh.Or71nwn1zAuI.JS2.2Qp6AwB/rOK56pDAwSTY.WzAK'),
(13, 'kevinz', 'user1@example.com', 'password1'),
(14, 'rtyyyy', 'Nigga12345@Gmail', '$2b$12$gIDBgvm2geEETwgvvko8m.db85zqk2dLgK5/.kqHE.aWLTCz8waD.'),
(15, 'manotham', 'manotham1@gmail.com', '$2b$12$v5JaC3ShUnfpUlkufAeFOuQIhi1FltplWTB/Adr/XNsUM7db9w2gu'),
(16, 'kevin', 'kevin12@gmail.com', '$2b$12$zd0W0xIbClQFLA15hhxrMO22fR6e90lBjGzvDeoDDcwZTiw5kV./e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `DrawingID` (`DrawingID`);

--
-- Indexes for table `drawing`
--
ALTER TABLE `drawing`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `renamed_drawing`
--
ALTER TABLE `renamed_drawing`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `drawing`
--
ALTER TABLE `drawing`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `renamed_drawing`
--
ALTER TABLE `renamed_drawing`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`DrawingID`) REFERENCES `renamed_drawing` (`_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
