-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2020 at 09:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_learner`
--
CREATE DATABASE IF NOT EXISTS `e_learner` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `e_learner`;

-- --------------------------------------------------------

--
-- Table structure for table `datatable`
--

DROP TABLE IF EXISTS `datatable`;
CREATE TABLE `datatable` (
  `data_id` int(11) NOT NULL,
  `grade` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_email` varchar(50) NOT NULL,
  `data_title` varchar(50) NOT NULL,
  `data_description` varchar(500) NOT NULL,
  `data_name` varchar(255) NOT NULL,
  `data_path` varchar(255) NOT NULL,
  `data_type` varchar(20) NOT NULL,
  `date_n_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `msg_name` varchar(70) NOT NULL,
  `msg_type` varchar(20) NOT NULL,
  `msg_email` varchar(50) NOT NULL,
  `msg_message` varchar(500) NOT NULL,
  `msg_datentime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tbl`
--

DROP TABLE IF EXISTS `sub_tbl`;
CREATE TABLE `sub_tbl` (
  `sub_id` int(11) NOT NULL,
  `sub_grade` varchar(20) NOT NULL,
  `sub_name` varchar(30) NOT NULL,
  `sub_teacher` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_tbl`
--

INSERT INTO `sub_tbl` (`sub_id`, `sub_grade`, `sub_name`, `sub_teacher`) VALUES
(1, 'Grade 6', 'Mathematics', 'Mr.Thilak gunawardhana'),
(2, 'Grade 6', 'Science', 'Mr.Thilak gunawardhana'),
(4, 'Grade 10', 'Sinhala', 'Mr.Thilak gunawardhana'),
(7, 'Grade 8', 'English', 'Mr.Thilak gunawardhana'),
(9, 'Grade 9', 'English', 'Miss kalpana');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_nic` varchar(30) NOT NULL,
  `user_username` varchar(30) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_pwd` varchar(200) NOT NULL,
  `user_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_nic`, `user_username`, `user_email`, `user_pwd`, `user_type`) VALUES
(73, '97322400v', 'kavindu tissera', 'frankastine43@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'student'),
(75, '894545454v', 'Mr.Thilak gunawardhana', 'thilakgunawardhana@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'teacher'),
(77, '96556230v', 'E learner Admin', 'elearneradmin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'admin'),
(78, '547512454v', 'Miss kalpana', 'misskalpana@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datatable`
--
ALTER TABLE `datatable`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `sub_tbl`
--
ALTER TABLE `sub_tbl`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datatable`
--
ALTER TABLE `datatable`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sub_tbl`
--
ALTER TABLE `sub_tbl`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
