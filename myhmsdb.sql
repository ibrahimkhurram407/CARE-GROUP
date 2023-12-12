-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 16, 2020 at 02:34 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myhmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `admintb` (
  `id` int(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttb`
--

CREATE TABLE `appointmenttb` (
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `doctor` varchar(30) NOT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL
);

--
-- Dumping data for table `appointmenttb`
--

INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`) VALUES
(1, 1, 'dum', 'dum', 'Male', 'dum@gmail.com', '8838489464', 'zain', 550, '2023-12-14', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('dum', 'dum@gmail.com', '7896677554', 'Hey Admin');
-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

CREATE TABLE `doctb` (
  `id` int PRIMARY Key  AUTO_INCREMENT NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL UNIQUE,
  `city` varchar(30) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL
);

--
-- Dumping data for table `doctb`
--


INSERT INTO `doctb` (`username`, `password`, `email`, `city`, `spec`, `docFees`) VALUES
('zain', 'zain123', 'zain@gmail.com', 'karachi', 'chiropractor', 500),
('john_doe', 'john123', 'john_doe@gmail.com', 'new_york', 'cardiologist', 600),
('emma_smith', 'emma123', 'emma_smith@gmail.com', 'london', 'dermatologist', 550),
('alex_wilson', 'alex123', 'alex_wilson@gmail.com', 'sydney', 'neurologist', 650),
('sophie_jones', 'sophie123', 'sophie_jones@gmail.com', 'paris', 'pediatrician', 500),
('ryan_brown', 'ryan123', 'ryan_brown@gmail.com', 'toronto', 'orthopedic_surgeon', 700),
('olivia_martin', 'olivia123', 'olivia_martin@gmail.com', 'los_angeles', 'gastroenterologist', 600),
('liam_miller', 'liam123', 'liam_miller@gmail.com', 'chicago', 'ophthalmologist', 550),
('ava_davis', 'ava123', 'ava_davis@gmail.com', 'berlin', 'psychiatrist', 600),
('noah_smith', 'noah123', 'noah_smith@gmail.com', 'tokyo', 'dentist', 500),
('isabella_taylor', 'isabella123', 'isabella_taylor@gmail.com', 'mumbai', 'urologist', 700),
('mason_anderson', 'mason123', 'mason_anderson@gmail.com', 'hong_kong', 'oncologist', 650),
('mia_clark', 'mia123', 'mia_clark@gmail.com', 'barcelona', 'radiologist', 600),
('ethan_hall', 'ethan123', 'ethan_hall@gmail.com', 'singapore', 'ophthalmologist', 550),
('ava_harris', 'ava123', 'ava_harris@gmail.com', 'new_delhi', 'dermatologist', 600),
('logan_martin', 'logan123', 'logan_martin@gmail.com', 'istanbul', 'orthopedic_surgeon', 700),
('harper_miller', 'harper123', 'harper_miller@gmail.com', 'rio_de_janeiro', 'gastroenterologist', 600),
('lucas_jackson', 'lucas123', 'lucas_jackson@gmail.com', 'amsterdam', 'neurologist', 650),
('amelia_wilson', 'amelia123', 'amelia_wilson@gmail.com', 'rome', 'cardiologist', 600),
('aiden_morris', 'aiden123', 'aiden_morris@gmail.com', 'bangkok', 'pediatrician', 500),
('zoey_clark', 'zoey123', 'zoey_clark@gmail.com', 'seoul', 'ophthalmologist', 550),
('leo_jones', 'leo123', 'leo_jones@gmail.com', 'moscow', 'psychiatrist', 600),
('olivia_smith', 'olivia123', 'olivia_smith@gmail.com', 'mexico_city', 'dermatologist', 550),
('jack_davis', 'jack123', 'jack_davis@gmail.com', 'madrid', 'orthopedic_surgeon', 700),
('sophia_anderson', 'sophia123', 'sophia_anderson@gmail.com', 'cairo', 'gastroenterologist', 600),
('liam_taylor', 'liam123', 'liam_taylor@gmail.com', 'lima', 'neurologist', 650),
('ava_jackson', 'ava123', 'ava_jackson@gmail.com', 'johannesburg', 'cardiologist', 600),
('noah_morris', 'noah123', 'noah_morris@gmail.com', 'istanbul', 'dentist', 500),
('isabella_martin', 'isabella123', 'isabella_martin@gmail.com', 'hong_kong', 'urologist', 700),
('mason_hall', 'mason123', 'mason_hall@gmail.com', 'rio_de_janeiro', 'oncologist', 650),
('mia_smith', 'mia123', 'mia_smith@gmail.com', 'amsterdam', 'radiologist', 600),
('ethan_clark', 'ethan123', 'ethan_clark@gmail.com', 'singapore', 'ophthalmologist', 550),
('ava_hall', 'ava123', 'ava_hall@gmail.com', 'new_delhi', 'dermatologist', 600),
('logan_miller', 'logan123', 'logan_miller@gmail.com', 'istanbul', 'orthopedic_surgeon', 700),
('harper_taylor', 'harper123', 'harper_taylor@gmail.com', 'rio_de_janeiro', 'gastroenterologist', 600),
('lucas_anderson', 'lucas123', 'lucas_anderson@gmail.com', 'amsterdam', 'neurologist', 650),
('amelia_wilson', 'amelia123', 'amelia_wilson@gmail.com', 'rome', 'cardiologist', 600),
('aiden_morris', 'aiden123', 'aiden_morris@gmail.com', 'bangkok', 'pediatrician', 500),
('zoey_clark', 'zoey123', 'zoey_clark@gmail.com', 'seoul', 'ophthalmologist', 550),
('leo_jones', 'leo123', 'leo_jones@gmail.com', 'moscow', 'psychiatrist', 600);


-- --------------------------------------------------------

--
-- Table structure for table `availabilitytb`
--

CREATE TABLE `availabilitytb` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `doctor_id` int NOT NULL,
  `date` DATE,
  FOREIGN KEY (`doctor_id`) REFERENCES `doctb` (`id`)
);

--
-- Table structure for table `patreg`
--

CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL UNIQUE, -- Add UNIQUE constraint for email
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL,
  UNIQUE KEY `unique_email` (`email`) -- Optional: Naming the unique constraint
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `patreg`
--

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(1, 'dum', 'dum', 'Male', 'dum@gmail.com', '9876543210', 'lol', 'lol');

-- --------------------------------------------------------

--
-- Table structure for table `prestb`
--

CREATE TABLE `prestb` (
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestb`
--

INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`) VALUES
('zain', 1, 1, 'dum', 'dum', '2023-03-27', 'Cough', 'Nothing', 'Just take a teaspoon of Benadryl every night');

--
-- Indexes for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patreg`
--
ALTER TABLE `patreg`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patreg`
--
ALTER TABLE `patreg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;