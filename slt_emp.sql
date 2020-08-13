-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2020 at 07:55 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slt_emp`
--

-- --------------------------------------------------------

--
-- Table structure for table `sltemp_event`
--

CREATE TABLE `sltemp_event` (
  `eid` int(11) NOT NULL,
  `eName` varchar(20) NOT NULL,
  `eType` varchar(20) NOT NULL,
  `eDesc` varchar(255) NOT NULL,
  `eVenue` varchar(255) NOT NULL,
  `capacity` int(255) NOT NULL,
  `eDate` date NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sltemp_event`
--

INSERT INTO `sltemp_event` (`eid`, `eName`, `eType`, `eDesc`, `eVenue`, `capacity`, `eDate`, `startTime`, `endTime`) VALUES
(1, 'Slt GO', 'Innovation', 'qwertyqwertyqwertyqwertyqwerty', 'BMICH', 500, '2020-06-01', '10.00', '16.00'),
(2, 'Zero 1', 'Award Ceremony', 'qwertyqwertyqwertyqwertyqwerty', 'Shangri La', 1000, '2020-10-01', '10.00', '22.00'),
(3, 'Manudam', 'Charity', 'qwertyqwertyqwertyqwertyqwerty', 'Auditorium', 200, '2020-08-09', '10.00', '15.00'),
(5, 'Mobi Go', 'Launching Event', 'kldfnhkajenhakjenhkaen', 'BMICH', 500, '2020-09-01', '8.00', '16.00');

-- --------------------------------------------------------

--
-- Table structure for table `sltemp_seat`
--

CREATE TABLE `sltemp_seat` (
  `sNo` int(11) NOT NULL,
  `sType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sltemp_user`
--

CREATE TABLE `sltemp_user` (
  `uid` int(255) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nic` varchar(10) NOT NULL,
  `mobile` int(10) NOT NULL,
  `userType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sltemp_user`
--

INSERT INTO `sltemp_user` (`uid`, `fname`, `lname`, `username`, `password`, `email`, `nic`, `mobile`, `userType`) VALUES
(1, 'Mihiri', 'Sam', 'null', 'null', 'mihisam@gmail.com', '988856742V', 999854700, 'invitee'),
(2, 'Nimz', 'Jay', 'nimzjay', '123123', 'nimzjay@gmail.com', '988875698V', 123456789, 'invitee'),
(3, 'admin', 'admin', 'admin', '123123', 'admin@sltemp.com', '988856749V', 598789456, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sltemp_event`
--
ALTER TABLE `sltemp_event`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `sltemp_user`
--
ALTER TABLE `sltemp_user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sltemp_event`
--
ALTER TABLE `sltemp_event`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sltemp_user`
--
ALTER TABLE `sltemp_user`
  MODIFY `uid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
