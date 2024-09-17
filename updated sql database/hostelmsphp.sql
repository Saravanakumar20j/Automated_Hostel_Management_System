-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 09:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostelmsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'admin@mail.com', 'D00F5D5217896FB7FD601412CB890830', '2020-09-08 20:31:45', '2021-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `regno` int(250) NOT NULL,
  `department` varchar(250) NOT NULL,
  `block` varchar(250) NOT NULL,
  `blockid` int(100) NOT NULL,
  `termid` int(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`Id`, `firstName`, `lastName`, `regno`, `department`, `block`, `blockid`, `termid`, `status`, `dateTimeTaken`) VALUES
(163, 'HSKSDD', '', 0, '', '', 1, 1, '1', '2020-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `id` int(10) NOT NULL,
  `block` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`id`, `block`) VALUES
(1, 'A BLOCK'),
(2, 'B BLOCK'),
(3, 'C BLOCK'),
(4, 'D BLOCK');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_sn` varchar(255) NOT NULL,
  `course_fn` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(1, 'BTH123', 'B.Tech', 'Bachelor  Of Technology', '2020-09-23 00:45:13'),
(2, 'BCOM18', 'B.Com', 'Bachelor Of Commerce ', '2020-09-23 00:45:13'),
(3, 'BSC296', 'BSC', 'Bachelor  of Science', '2020-09-23 00:45:13'),
(4, 'BCOA55', 'BCA', 'Bachelor Of Computer Application', '2020-09-23 00:45:13'),
(5, 'MCA001', 'MCA', 'Master of Computer Application', '2020-09-23 00:47:13'),
(6, 'MBA777', 'MBA', 'Master In Business Administration', '2020-09-23 00:54:13'),
(7, 'BE069', 'BE', 'Bachelor of Engineering', '2020-09-23 00:59:13'),
(8, 'BIT353', 'BIT', 'Bachelors In Information Technology', '2021-03-07 06:59:05'),
(9, 'MIT005', 'MIT', 'Master of Information Technology', '2022-04-03 13:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(250) NOT NULL,
  `Department` varchar(250) NOT NULL,
  `Clg` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `Department`, `Clg`) VALUES
(1, 'CSE', 'MEC'),
(2, 'CSE', 'MIT'),
(3, 'CSE', 'MIET'),
(4, 'CYBER', 'MIT'),
(5, 'CYBER', 'MIET'),
(6, 'CYBER', 'MEC'),
(7, 'IT', 'MEC'),
(8, 'IT', 'MIT'),
(9, 'IT', 'MIET'),
(10, 'MECH', 'MEC'),
(11, 'MECH', 'MIT'),
(12, 'MECH', 'MIET');

-- --------------------------------------------------------

--
-- Table structure for table `mess`
--

CREATE TABLE `mess` (
  `rono` int(250) NOT NULL,
  `foodname` varchar(250) NOT NULL,
  `session` varchar(250) NOT NULL,
  `day` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mess`
--

INSERT INTO `mess` (`rono`, `foodname`, `session`, `day`) VALUES
(1, 'Briyani', 'morning', 'monday');

-- --------------------------------------------------------

--
-- Table structure for table `messmanager`
--

CREATE TABLE `messmanager` (
  `id` int(250) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactNo` bigint(25) NOT NULL,
  `econtact` bigint(25) NOT NULL,
  `block` varchar(250) NOT NULL,
  `blockid` int(25) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gname` varchar(250) NOT NULL,
  `grelation` varchar(250) NOT NULL,
  `gcontact` bigint(25) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `pincode` bigint(25) NOT NULL,
  `paddress` varchar(250) NOT NULL,
  `pcity` varchar(250) NOT NULL,
  `ppincode` bigint(25) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `block` varchar(250) NOT NULL,
  `blockid` int(25) NOT NULL,
  `feespm` int(11) NOT NULL,
  `foodstatus` varchar(250) NOT NULL,
  `stayfrom` date NOT NULL,
  `duration` int(11) NOT NULL,
  `course` varchar(500) NOT NULL,
  `department` varchar(250) NOT NULL,
  `regno` varchar(255) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `middleName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `emailid` varchar(500) NOT NULL,
  `egycontactno` bigint(11) NOT NULL,
  `guardianName` varchar(500) NOT NULL,
  `guardianRelation` varchar(500) NOT NULL,
  `guardianContactno` bigint(11) NOT NULL,
  `corresAddress` varchar(500) NOT NULL,
  `corresCIty` varchar(500) NOT NULL,
  `corresState` varchar(500) NOT NULL,
  `corresPincode` int(11) NOT NULL,
  `pmntAddress` varchar(500) NOT NULL,
  `pmntCity` varchar(500) NOT NULL,
  `pmnatetState` varchar(500) NOT NULL,
  `pmntPincode` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `block`, `blockid`, `feespm`, `foodstatus`, `stayfrom`, `duration`, `course`, `department`, `regno`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(23, 100, 5, 'A BLOCK', 1, 1990, 'South mess', '2023-09-01', 1, 'Bachelor  Of Technology', 'CSE', '20131103', 'SARAVANAKUMAR', 'KUMAR', 'M', 'male', 6383638065, 'saravanakumarm649284@gmail.com', 6383638065, 'murugesan', 'father', 9487255233, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', '', 637102, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', '', 637102, '2023-09-11 10:13:05', ''),
(24, 201, 4, 'B BLOCK', 2, 1650, 'South mess', '2023-09-01', 1, 'Bachelor  Of Technology', 'CSE', '1234', 'SARAVANAKUMAR', 'KUMAR', 'M', 'male', 1234567890, 'saravanakumarm649284@gmail.com', 1234567890, 'saro', 'saro', 987654321, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', '', 637102, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', '', 637102, '2023-09-11 13:37:11', ''),
(25, 132, 5, 'A BLOCK', 1, 1990, 'North mess', '2023-10-01', 1, 'Bachelor  Of Technology', 'CSE', '20131103', 'SARAVANAKUMARet', 'KUMAR', 'M', 'male', 1234567890, 'saravanakumarm649284@gmail.com', 9876543, 'saro', 'saro', 9487255233, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', '', 637102, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', '', 637102, '2023-10-18 09:46:17', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `block` varchar(250) NOT NULL,
  `blockid` int(250) NOT NULL,
  `fees` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `room_no`, `block`, `blockid`, `fees`, `posting_date`) VALUES
(1, 5, 100, '', 0, 1990, '2020-09-20 04:24:06'),
(2, 4, 201, '', 0, 1650, '2020-09-20 04:24:06'),
(3, 2, 200, '', 0, 910, '2020-09-20 04:33:06'),
(4, 3, 112, '', 0, 1300, '2020-09-20 04:33:30'),
(5, 5, 132, '', 0, 1990, '2020-09-20 04:28:52'),
(6, 4, 11, '', 0, 1650, '2021-03-07 05:01:02'),
(7, 2, 269, '', 0, 910, '2022-04-03 14:39:22'),
(8, 1, 310, '', 0, 750, '2022-04-03 14:41:36'),
(9, 1, 330, '', 0, 750, '2022-04-03 14:41:53'),
(10, 2, 21523, 'A BLOCK', 1, 353, '2023-09-10 07:56:12'),
(11, 1, 101, 'A BLOCK', 1, 1234, '2023-09-10 08:04:04'),
(12, 1, 101, 'B BLOCK', 0, 1234, '2023-09-10 08:04:16'),
(13, 1, 101, 'A BLOCK', 0, 12345, '2023-10-18 09:52:24'),
(14, 3, 21523, 'B BLOCK', 0, 123456, '2023-10-18 09:54:27'),
(15, 3, 21523, 'B BLOCK', 0, 123456, '2023-10-18 09:57:08'),
(16, 2, 100, 'B BLOCK', 2, 45, '2023-10-18 09:57:33'),
(17, 1, 101, 'A BLOCK', 1, 45, '2023-10-18 09:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessionterm`
--

CREATE TABLE `sessionterm` (
  `id` int(25) NOT NULL,
  `sessionname` varchar(250) NOT NULL,
  `termName` varchar(250) NOT NULL,
  `termid` int(20) NOT NULL,
  `isActive` int(20) NOT NULL,
  `dateCreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessionterm`
--

INSERT INTO `sessionterm` (`id`, `sessionname`, `termName`, `termid`, `isActive`, `dateCreated`) VALUES
(10, '2023/2024', 'Third', 3, 0, '2023-09-11'),
(11, '2023/2024', 'First', 1, 1, '2023-09-11'),
(13, '2023/2024', 'second', 2, 0, '2023-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Alabama'),
(2, 'Alaska'),
(3, 'Arizona'),
(4, 'Arkansas'),
(5, 'California'),
(6, 'Colorado'),
(7, 'Connecticut'),
(8, 'Delaware'),
(9, 'Florida'),
(10, 'Georgia'),
(11, 'Hawaii'),
(12, 'Idaho'),
(13, 'Illinois'),
(14, 'Iowa'),
(15, 'Kansas'),
(16, 'Kentucky'),
(17, 'Louisiana'),
(18, 'Maine'),
(19, 'Marryland'),
(20, 'Massachusetts'),
(21, 'Michigan'),
(22, 'Minnesota'),
(23, 'Mississippi'),
(24, 'Missouri'),
(25, 'Nevada'),
(26, 'New Jersey'),
(27, 'New York'),
(28, 'North Carolina'),
(29, 'North Dakota'),
(30, 'Ohio'),
(31, 'Oklahoma'),
(32, 'South Carolina'),
(33, 'South Dakota'),
(34, 'Texas'),
(35, 'Virginia'),
(36, 'Washington');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `blockid` int(11) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `blockid`, `complaintType`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 1, 1, 'Complaint', '', 'hi', NULL, '2023-11-06 10:06:25', NULL, '2023-11-06 10:06:25'),
(2, 1, 1, 'Complaint', '', 'hi', NULL, '2023-11-06 10:07:42', NULL, '2023-11-06 10:07:42'),
(3, 1, 1, 'Complaint', '', 'r3r32r32', NULL, '2023-11-06 10:08:30', NULL, '2023-11-06 10:08:30'),
(4, 1, 1, 'Complaint', '', 'r3r32r32', NULL, '2023-11-06 10:08:51', NULL, '2023-11-06 10:08:51'),
(5, 1, 1, 'Complaint', '', 'r3r32r32', NULL, '2023-11-06 10:10:22', NULL, '2023-11-06 10:10:22'),
(6, 1, 1, 'Complaint', '', 'r3r32r32', NULL, '2023-11-06 10:10:28', NULL, '2023-11-06 10:10:28'),
(7, 1, 1, 'Complaint', '', 'r3r32r32', NULL, '2023-11-06 10:10:42', NULL, '2023-11-06 10:10:42'),
(8, 1, 1, 'General Query', '', 'r3r32r32', NULL, '2023-11-06 10:11:12', NULL, '2023-11-06 10:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `id` int(25) NOT NULL,
  `termName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`id`, `termName`) VALUES
(1, 'First'),
(2, 'second'),
(3, 'Third');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userEmail`, `userIp`, `city`, `country`, `loginTime`) VALUES
(9, 10, 'terry@mail.com', 0x3a3a31, '', '', '2021-03-05 04:12:00'),
(10, 10, 'terry@mail.com', 0x3a3a31, '', '', '2021-03-05 04:14:44'),
(11, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-05 04:19:52'),
(12, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-05 08:53:33'),
(13, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-05 17:35:34'),
(14, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-06 02:43:01'),
(15, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-06 15:18:49'),
(16, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-07 09:35:23'),
(17, 21, 'ross@mail.com', 0x3a3a31, '', '', '2021-03-07 09:59:55'),
(18, 22, 'colin@gmail.com', 0x3a3a31, '', '', '2021-06-16 14:51:24'),
(19, 22, 'colin@gmail.com', 0x3a3a31, '', '', '2021-12-12 15:31:50'),
(20, 22, 'colin@gmail.com', 0x3a3a31, '', '', '2022-04-02 16:01:31'),
(21, 21, 'ross@mail.com', 0x3a3a31, '', '', '2022-04-02 16:52:47'),
(22, 20, 'richards@mail.com', 0x3a3a31, '', '', '2022-04-03 13:15:00'),
(23, 24, 'jennifer@mail.com', 0x3a3a31, '', '', '2022-04-03 14:32:09'),
(24, 24, 'jennifer@mail.com', 0x3a3a31, '', '', '2022-04-03 14:34:17'),
(25, 19, 'bruce@mail.com', 0x3a3a31, '', '', '2022-04-03 14:44:31'),
(26, 27, 'nancy@mail.com', 0x3a3a31, '', '', '2022-04-03 15:00:46'),
(27, 32, 'liamoore@mail.com', 0x3a3a31, '', '', '2022-04-03 15:48:35'),
(28, 32, 'liamoore@mail.com', 0x3a3a31, '', '', '2022-04-03 15:51:34'),
(29, 3, 'admin@mail.com', 0x3a3a31, '', '', '2023-09-10 11:20:24'),
(30, 3, 'admin@mail.com', 0x3a3a31, '', '', '2023-09-10 11:22:03'),
(31, 3, 'admin@mail.com', 0x3a3a31, '', '', '2023-09-10 11:22:54'),
(32, 3, 'admin@mail.com', 0x3a3a31, '', '', '2023-09-10 11:29:12'),
(33, 33, 'admin@mail.com', 0x3a3a31, '', '', '2023-09-10 11:46:59'),
(34, 5, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-09-10 12:19:00'),
(35, 5, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-09-10 14:54:09'),
(36, 6, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 08:51:53'),
(37, 6, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 09:56:15'),
(38, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:15:48'),
(39, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:37:06'),
(40, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:43:45'),
(41, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:44:29'),
(42, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:45:32'),
(43, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:46:15'),
(44, 7, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:48:04'),
(45, 5, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:53:08'),
(46, 9, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 10:55:40'),
(47, 9, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 13:38:30'),
(48, 9, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-09-11 14:21:57'),
(49, 33, 'admin@mail.com', 0x3a3a31, '', '', '2023-10-17 04:41:02'),
(50, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-18 03:01:37'),
(51, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-10-19 04:22:01'),
(52, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-10-19 05:29:05'),
(53, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-10-19 05:52:17'),
(54, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-11-06 07:18:06'),
(55, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-11-09 14:24:24'),
(56, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-11-10 05:00:54'),
(57, 34, 'saravanakumarm5152@gmail.com', 0x3a3a31, '', '', '2023-11-10 06:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `department` varchar(250) NOT NULL,
  `contactNo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) NOT NULL,
  `passUdateDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `regNo`, `firstName`, `middleName`, `lastName`, `gender`, `department`, `contactNo`, `email`, `password`, `regDate`, `updationDate`, `passUdateDate`) VALUES
(20, 'CA003', 'Richard', 'J.', 'Summers', 'Male', '', 1325658800, 'richards@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-05 04:54:33', '', ''),
(21, 'CA004', 'Ross', 'S.', 'Daniels', 'Male', '', 6958545850, 'ross@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-03-05 04:19:44', '06-03-2021 10:15:29', '06-03-2021 10:35:38'),
(22, 'CA005', 'Colin', 'B', 'Greenwood', 'Male', '', 7541112050, 'colin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-03-06 16:29:57', '', ''),
(24, 'CA006', 'Jennifer', 'J.', 'Frye', 'Female', '', 7895555544, 'jennifer@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:31:50', '', '03-04-2022 08:21:07'),
(25, 'CA007', 'Bonnie', 'J.', 'Lamar', 'Female', '', 4580001014, 'bonnie@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:51:00', '', ''),
(26, 'CA008', 'Adam', 'A.', 'Rios', 'Male', '', 4785690010, 'adam@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:52:28', '', ''),
(27, 'CA009', 'Nancy', 'W.', 'Vasquez', 'Female', '', 3547777770, 'nancy@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:53:19', '', ''),
(28, 'CA010', 'Jerry', 'A.', 'Burdine', 'Male', '', 8520001450, 'jerry@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:53:58', '', ''),
(29, 'CA011', 'James', 'K.', 'Fischer', 'Male', '', 4785470014, 'jamesf@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:54:44', '', ''),
(30, 'CA012', 'Darlene', 'D.', 'Kenyon', 'Female', '', 3547896580, 'darlene@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:57:04', '', ''),
(31, 'CA013', 'Joseph', 'H.', 'Peterson', 'Male', '', 4587450010, 'joseph@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-03 14:57:51', '', ''),
(32, 'CA014', 'Liam', 'K.', 'Moore', 'Male', '', 7854441014, 'liamoore@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2022-04-03 15:00:04', '', ''),
(33, '1234', 'SARAVANAKUMAR', 'KUMAR', 'M', 'Male', 'CSE', 1234567890, 'admin@mail.com', 'd00f5d5217896fb7fd601412cb890830', '2023-09-10 11:46:47', '', ''),
(34, '20131103', 'SARAVANAKUMAR', 'KUMAR', 'M', 'Male', 'MECH', 1234567890, 'saravanakumarm5152@gmail.com', '85ada82db6f50f49e8ca8ac2ed440e17', '2023-09-14 09:05:49', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `warden`
--

CREATE TABLE `warden` (
  `id` int(250) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactNo` bigint(25) NOT NULL,
  `econtact` bigint(25) NOT NULL,
  `block` varchar(250) NOT NULL,
  `blockid` int(25) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gname` varchar(250) NOT NULL,
  `grelation` varchar(250) NOT NULL,
  `gcontact` bigint(25) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `pincode` bigint(25) NOT NULL,
  `paddress` varchar(250) NOT NULL,
  `pcity` varchar(250) NOT NULL,
  `ppincode` bigint(25) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warden`
--

INSERT INTO `warden` (`id`, `firstName`, `lastName`, `gender`, `contactNo`, `econtact`, `block`, `blockid`, `email`, `username`, `password`, `gname`, `grelation`, `gcontact`, `address`, `city`, `pincode`, `paddress`, `pcity`, `ppincode`, `regDate`, `updation_date`) VALUES
(9, 'SARAVANAKUMAR', 'M', 'Male', 1234567890, 1234567890, 'A BLOCK', 1, 'brianmsyamboza@gmail.com', 'saro', '202cb962ac59075b964b07152d234b70', 'saro', 'father', 987654321, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', 637102, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', 637102, '2023-10-17 13:21:05', '0000-00-00'),
(12, 'SARAVANAKUMAR', 'R', 'Male', 1234567890, 1234567890, 'D BLOCK', 4, 'admin@hmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', 'murugesan', 'saro', 987654321, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', 637102, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', 637102, '2023-10-17 13:21:05', '0000-00-00'),
(13, 'raven', 'M', 'Female', 98765431313, 987654321, 'B BLOCK', 2, 'niyati649284@gmail.com', 'niyati', '85ada82db6f50f49e8ca8ac2ed440e17', 'saro', 'ff', 987654321, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', 637102, '9/19-1,ayyampalaiyam,Kachippalli(PO),Edappadi(TK)', 'Salem', 637102, '2023-10-18 14:21:27', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `wardenlog`
--

CREATE TABLE `wardenlog` (
  `id` int(25) NOT NULL,
  `userId` int(250) NOT NULL,
  `userEmail` varchar(250) NOT NULL,
  `userIp` varbinary(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wardenlog`
--

INSERT INTO `wardenlog` (`id`, `userId`, `userEmail`, `userIp`, `city`, `country`, `loginTime`) VALUES
(1, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-18 03:40:27'),
(2, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-18 10:52:10'),
(3, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-18 10:53:22'),
(4, 2, 'niyati649284@gmail.com', 0x3a3a31, '', '', '2023-10-18 14:22:12'),
(5, 2, 'niyati649284@gmail.com', 0x3a3a31, '', '', '2023-10-18 14:41:23'),
(6, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-18 14:41:48'),
(7, 2, 'niyati649284@gmail.com', 0x3a3a31, '', '', '2023-10-18 14:42:31'),
(8, 2, 'niyati649284@gmail.com', 0x3a3a31, '', '', '2023-10-18 15:00:12'),
(9, 2, 'niyati649284@gmail.com', 0x3a3a31, '', '', '2023-10-19 04:18:16'),
(10, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-19 04:22:49'),
(11, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-10-19 05:28:19'),
(12, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-06 11:18:14'),
(13, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-09 14:24:26'),
(14, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-10 04:22:41'),
(15, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-10 05:40:54'),
(16, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-10 06:20:14'),
(17, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-22 07:35:17'),
(18, 1, 'brianmsyamboza@gmail.com', 0x3a3a31, '', '', '2023-11-24 17:35:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mess`
--
ALTER TABLE `mess`
  ADD PRIMARY KEY (`rono`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessionterm`
--
ALTER TABLE `sessionterm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warden`
--
ALTER TABLE `warden`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wardenlog`
--
ALTER TABLE `wardenlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mess`
--
ALTER TABLE `mess`
  MODIFY `rono` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sessionterm`
--
ALTER TABLE `sessionterm`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `term`
--
ALTER TABLE `term`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `warden`
--
ALTER TABLE `warden`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wardenlog`
--
ALTER TABLE `wardenlog`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
