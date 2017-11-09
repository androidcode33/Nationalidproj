-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2017 at 12:17 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nationalid`
--

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `district_ID` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parish`
--

CREATE TABLE `parish` (
  `parish_ID` varchar(15) NOT NULL,
  `subcountyID` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcounty`
--

CREATE TABLE `subcounty` (
  `subcounty_ID` varchar(15) NOT NULL,
  `districtID` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(400) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `role`) VALUES
('me', '123', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `village`
--

CREATE TABLE `village` (
  `village_ID` varchar(15) NOT NULL,
  `parishID` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`district_ID`),
  ADD UNIQUE KEY `districtID` (`district_ID`);

--
-- Indexes for table `parish`
--
ALTER TABLE `parish`
  ADD PRIMARY KEY (`parish_ID`),
  ADD UNIQUE KEY `parish_ID` (`parish_ID`),
  ADD KEY `subcountyID` (`subcountyID`);

--
-- Indexes for table `subcounty`
--
ALTER TABLE `subcounty`
  ADD PRIMARY KEY (`subcounty_ID`),
  ADD KEY `districtID` (`districtID`);

--
-- Indexes for table `village`
--
ALTER TABLE `village`
  ADD PRIMARY KEY (`village_ID`),
  ADD UNIQUE KEY `village_ID` (`village_ID`),
  ADD KEY `parishID` (`parishID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parish`
--
ALTER TABLE `parish`
  ADD CONSTRAINT `parish_ibfk_1` FOREIGN KEY (`subcountyID`) REFERENCES `subcounty` (`subcounty_ID`);

--
-- Constraints for table `subcounty`
--
ALTER TABLE `subcounty`
  ADD CONSTRAINT `subcounty_ibfk_1` FOREIGN KEY (`districtID`) REFERENCES `district` (`district_ID`);

--
-- Constraints for table `village`
--
ALTER TABLE `village`
  ADD CONSTRAINT `village_ibfk_1` FOREIGN KEY (`parishID`) REFERENCES `parish` (`parish_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
