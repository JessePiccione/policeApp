-- phpMyAdmin SQL Dump
-- version 5.1.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2021 at 10:47 PM
-- Server version: 10.4.21-MariaDB-log
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_karambud`
--

-- --------------------------------------------------------

--
-- Table structure for table `Criminals`
--

CREATE TABLE `Criminals` (
  `CriminalID` int(11) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `DoB` date NOT NULL,
  `NumberOfCrimes` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Criminals`
--

INSERT INTO `Criminals` (`CriminalID`, `Fname`, `Lname`, `DoB`, `NumberOfCrimes`) VALUES
(1, 'Benny', 'Beaver', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Fines`
--

CREATE TABLE `Fines` (
  `FineID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Amounts` int(20) NOT NULL,
  `Points` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Fines`
--

INSERT INTO `Fines` (`FineID`, `Name`, `Amounts`, `Points`) VALUES
(1, 'Lorem Ipsum', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Officers`
--

CREATE TABLE `Officers` (
  `BadgeNumber` int(11) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `YearsOfService` int(3) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Officers`
--

INSERT INTO `Officers` (`BadgeNumber`, `Fname`, `Lname`, `YearsOfService`, `Email`, `Phone`) VALUES
(0, 'OSU', 'Police', 0, '@oregonstate.edu', '911');

-- --------------------------------------------------------

--
-- Table structure for table `ReportFines`
--

CREATE TABLE `ReportFines` (
  `ReportID` int(11) NOT NULL,
  `FineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Reports`
--

CREATE TABLE `Reports` (
  `ReportID` int(11) NOT NULL,
  `CriminalID` int(11) NOT NULL,
  `BadgeNumber` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reports`
--

INSERT INTO `Reports` (`ReportID`, `CriminalID`, `BadgeNumber`, `Date`, `Time`) VALUES
(0, 1, 0, '2021-10-11', '00:00:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Criminals`
--
ALTER TABLE `Criminals`
  ADD PRIMARY KEY (`CriminalID`),
  ADD UNIQUE KEY `CriminalID` (`CriminalID`);

--
-- Indexes for table `Fines`
--
ALTER TABLE `Fines`
  ADD PRIMARY KEY (`FineID`);

--
-- Indexes for table `Officers`
--
ALTER TABLE `Officers`
  ADD PRIMARY KEY (`BadgeNumber`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`);

--
-- Indexes for table `ReportFines`
--
ALTER TABLE `ReportFines`
  ADD KEY `ReportID` (`ReportID`),
  ADD KEY `FineID` (`FineID`);

--
-- Indexes for table `Reports`
--
ALTER TABLE `Reports`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `CriminalID` (`CriminalID`),
  ADD KEY `BadgeNumber` (`BadgeNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Criminals`
--
ALTER TABLE `Criminals`
  MODIFY `CriminalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Fines`
--
ALTER TABLE `Fines`
  MODIFY `FineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ReportFines`
--
ALTER TABLE `ReportFines`
  ADD CONSTRAINT `ReportFines_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `Reports` (`ReportID`),
  ADD CONSTRAINT `ReportFines_ibfk_2` FOREIGN KEY (`FineID`) REFERENCES `Fines` (`FineID`);

--
-- Constraints for table `Reports`
--
ALTER TABLE `Reports`
  ADD CONSTRAINT `Reports_ibfk_1` FOREIGN KEY (`CriminalID`) REFERENCES `Criminals` (`CriminalID`),
  ADD CONSTRAINT `Reports_ibfk_2` FOREIGN KEY (`BadgeNumber`) REFERENCES `Officers` (`BadgeNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
