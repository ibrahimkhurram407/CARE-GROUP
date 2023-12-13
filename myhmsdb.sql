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
-- Database: `master`
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

-- Appointments for patient 1 (John Doe)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(1, 1, 'John', 'Doe', 'Male', 'john.doe@example.com', '1234567890', 'johnsmith', 100, '2023-12-15', 0, 1),
(1, 2, 'John', 'Doe', 'Male', 'john.doe@example.com', '1234567890', 'johnsmith', 120, '2023-12-20', 1, 0),
(1, 3, 'John', 'Doe', 'Male', 'john.doe@example.com', '1234567890', 'johnsmith', 150, '2023-12-25', 1, 1);

-- Appointments for patient 2 (Jane Doe)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(2, 4, 'Jane', 'Doe', 'Female', 'jane.doe@example.com', '9876543210', 'janedoe', 130, '2023-12-18', 0, 1),
(2, 5, 'Jane', 'Doe', 'Female', 'jane.doe@example.com', '9876543210', 'janedoe', 110, '2023-12-23', 1, 0),
(2, 6, 'Jane', 'Doe', 'Female', 'jane.doe@example.com', '9876543210', 'janedoe', 140, '2023-12-28', 1, 1);

-- Appointments for patient 3 (Michael Smith)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(3, 7, 'Michael', 'Smith', 'Male', 'michael.smith@example.com', '5556667777', 'michaelbrown', 160, '2023-12-17', 0, 1),
(3, 8, 'Michael', 'Smith', 'Male', 'michael.smith@example.com', '5556667777', 'michaelbrown', 180, '2023-12-22', 1, 0),
(3, 9, 'Michael', 'Smith', 'Male', 'michael.smith@example.com', '5556667777', 'michaelbrown', 200, '2023-12-27', 1, 1);

-- Appointments for patient 4 (Emily Johnson)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(4, 10, 'Emily', 'Johnson', 'Female', 'emily.johnson@example.com', '3332221111', 'emilyjohnson', 220, '2023-12-14', 0, 1),
(4, 11, 'Emily', 'Johnson', 'Female', 'emily.johnson@example.com', '3332221111', 'emilyjohnson', 240, '2023-12-19', 1, 0),
(4, 12, 'Emily', 'Johnson', 'Female', 'emily.johnson@example.com', '3332221111', 'emilyjohnson', 260, '2023-12-24', 1, 1);

-- Appointments for patient 5 (David Williams)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(5, 13, 'David', 'Williams', 'Male', 'david.williams@example.com', '9998887777', 'davidwilliams', 280, '2023-12-16', 0, 1),
(5, 14, 'David', 'Williams', 'Male', 'david.williams@example.com', '9998887777', 'davidwilliams', 300, '2023-12-21', 1, 0),
(5, 15, 'David', 'Williams', 'Male', 'david.williams@example.com', '9998887777', 'davidwilliams', 320, '2023-12-26', 1, 1);

-- Appointments for patient 6 (Sophia Brown)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(6, 16, 'Sophia', 'Brown', 'Female', 'sophia.brown@example.com', '6665554444', 'sophiagreen', 340, '2023-12-14', 0, 1),
(6, 17, 'Sophia', 'Brown', 'Female', 'sophia.brown@example.com', '6665554444', 'sophiagreen', 360, '2023-12-19', 1, 0),
(6, 18, 'Sophia', 'Brown', 'Female', 'sophia.brown@example.com', '6665554444', 'sophiagreen', 380, '2023-12-24', 1, 1);

-- Appointments for patient 7 (Daniel Miller)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(7, 19, 'Daniel', 'Miller', 'Male', 'daniel.miller@example.com', '1112223333', 'danielmiller', 400, '2023-12-16', 0, 1),
(7, 20, 'Daniel', 'Miller', 'Male', 'daniel.miller@example.com', '1112223333', 'danielmiller', 420, '2023-12-21', 1, 0),
(7, 21, 'Daniel', 'Miller', 'Male', 'daniel.miller@example.com', '1112223333', 'danielmiller', 440, '2023-12-26', 1, 1);

-- Appointments for patient 8 (Olivia Davis)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(8, 22, 'Olivia', 'Davis', 'Female', 'olivia.davis@example.com', '7778889999', 'oliviadavis', 460, '2023-12-14', 0, 1),
(8, 23, 'Olivia', 'Davis', 'Female', 'olivia.davis@example.com', '7778889999', 'oliviadavis', 480, '2023-12-19', 1, 0),
(8, 24, 'Olivia', 'Davis', 'Female', 'olivia.davis@example.com', '7778889999', 'oliviadavis', 500, '2023-12-24', 1, 1);

-- Appointments for patient 9 (Matthew Jones)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(9, 25, 'Matthew', 'Jones', 'Male', 'matthew.jones@example.com', '4445556666', 'matthewjones', 520, '2023-12-16', 0, 1),
(9, 26, 'Matthew', 'Jones', 'Male', 'matthew.jones@example.com', '4445556666', 'matthewjones', 540, '2023-12-21', 1, 0),
(9, 27, 'Matthew', 'Jones', 'Male', 'matthew.jones@example.com', '4445556666', 'matthewjones', 560, '2023-12-26', 1, 1);

-- Appointments for patient 10 (Emma Martinez)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(10, 28, 'Emma', 'Martinez', 'Female', 'emma.martinez@example.com', '2223334444', 'emilymartinez', 580, '2023-12-14', 0, 1),
(10, 29, 'Emma', 'Martinez', 'Female', 'emma.martinez@example.com', '2223334444', 'emilymartinez', 600, '2023-12-19', 1, 0),
(10, 30, 'Emma', 'Martinez', 'Female', 'emma.martinez@example.com', '2223334444', 'emilymartinez', 620, '2023-12-24', 1, 1);

-- Appointments for patient 11 (Aiden Taylor)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(11, 31, 'Aiden', 'Taylor', 'Male', 'aiden.taylor@example.com', '5554443333', 'aidentaylor', 640, '2023-12-16', 0, 1),
(11, 32, 'Aiden', 'Taylor', 'Male', 'aiden.taylor@example.com', '5554443333', 'aidentaylor', 660, '2023-12-21', 1, 0),
(11, 33, 'Aiden', 'Taylor', 'Male', 'aiden.taylor@example.com', '5554443333', 'aidentaylor', 680, '2023-12-26', 1, 1);

-- Appointments for patient 12 (Ava Bennett)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(12, 34, 'Ava', 'Bennett', 'Female', 'ava.bennett@example.com', '8887776666', 'avabennett', 700, '2023-12-14', 0, 1),
(12, 35, 'Ava', 'Bennett', 'Female', 'ava.bennett@example.com', '8887776666', 'avabennett', 720, '2023-12-19', 1, 0),
(12, 36, 'Ava', 'Bennett', 'Female', 'ava.bennett@example.com', '8887776666', 'avabennett', 740, '2023-12-24', 1, 1);

-- Appointments for patient 13 (Ethan Hernandez)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(13, 37, 'Ethan', 'Hernandez', 'Male', 'ethan.hernandez@example.com', '3332221111', 'ethanhernandez', 760, '2023-12-16', 0, 1),
(13, 38, 'Ethan', 'Hernandez', 'Male', 'ethan.hernandez@example.com', '3332221111', 'ethanhernandez', 780, '2023-12-21', 1, 0),
(13, 39, 'Ethan', 'Hernandez', 'Male', 'ethan.hernandez@example.com', '3332221111', 'ethanhernandez', 800, '2023-12-26', 1, 1);

-- Appointments for patient 14 (Isabella Walker)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(14, 40, 'Isabella', 'Walker', 'Female', 'isabella.walker@example.com', '9998887777', 'isabellawalker', 820, '2023-12-14', 0, 1),
(14, 41, 'Isabella', 'Walker', 'Female', 'isabella.walker@example.com', '9998887777', 'isabellawalker', 840, '2023-12-19', 1, 0),
(14, 42, 'Isabella', 'Walker', 'Female', 'isabella.walker@example.com', '9998887777', 'isabellawalker', 860, '2023-12-24', 1, 1);

-- Appointments for patient 15 (Mason Green)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(15, 43, 'Mason', 'Green', 'Male', 'mason.green@example.com', '6665554444', 'masongreen', 880, '2023-12-16', 0, 1),
(15, 44, 'Mason', 'Green', 'Male', 'mason.green@example.com', '6665554444', 'masongreen', 900, '2023-12-21', 1, 0),
(15, 45, 'Mason', 'Green', 'Male', 'mason.green@example.com', '6665554444', 'masongreen', 920, '2023-12-26', 1, 1);

-- Appointments for patient 16 (Abigail Evans)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(16, 46, 'Abigail', 'Evans', 'Female', 'abigail.evans@example.com', '1112223333', 'abigailevans', 940, '2023-12-14', 0, 1),
(16, 47, 'Abigail', 'Evans', 'Female', 'abigail.evans@example.com', '1112223333', 'abigailevans', 960, '2023-12-19', 1, 0),
(16, 48, 'Abigail', 'Evans', 'Female', 'abigail.evans@example.com', '1112223333', 'abigailevans', 980, '2023-12-24', 1, 1);

-- Appointments for patient 17 (Logan Morales)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(17, 49, 'Logan', 'Morales', 'Male', 'logan.morales@example.com', '7778889999', 'loganmorales', 1000, '2023-12-16', 0, 1),
(17, 50, 'Logan', 'Morales', 'Male', 'logan.morales@example.com', '7778889999', 'loganmorales', 1020, '2023-12-21', 1, 0),
(17, 51, 'Logan', 'Morales', 'Male', 'logan.morales@example.com', '7778889999', 'loganmorales', 1040, '2023-12-26', 1, 1);

-- Appointments for patient 18 (Ella Turner)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(18, 52, 'Ella', 'Turner', 'Female', 'ella.turner@example.com', '4445556666', 'ellaturner', 1060, '2023-12-14', 0, 1),
(18, 53, 'Ella', 'Turner', 'Female', 'ella.turner@example.com', '4445556666', 'ellaturner', 1080, '2023-12-19', 1, 0),
(18, 54, 'Ella', 'Turner', 'Female', 'ella.turner@example.com', '4445556666', 'ellaturner', 1100, '2023-12-24', 1, 1);

-- Appointments for patient 19 (Liam Perez)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(19, 55, 'Liam', 'Perez', 'Male', 'liam.perez@example.com', '2223334444', 'liamperez', 1120, '2023-12-16', 0, 1),
(19, 56, 'Liam', 'Perez', 'Male', 'liam.perez@example.com', '2223334444', 'liamperez', 1140, '2023-12-21', 1, 0),
(19, 57, 'Liam', 'Perez', 'Male', 'liam.perez@example.com', '2223334444', 'liamperez', 1160, '2023-12-26', 1, 1);

-- Appointments for patient 20 (Grace Nelson)
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `userStatus`, `doctorStatus`)
VALUES
(20, 58, 'Grace', 'Nelson', 'Female', 'grace.nelson@example.com', '5554443333', 'gracenelson', 1180, '2023-12-14', 0, 1),
(20, 59, 'Grace', 'Nelson', 'Female', 'grace.nelson@example.com', '5554443333', 'gracenelson', 1200, '2023-12-19', 1, 0),
(20, 60, 'Grace', 'Nelson', 'Female', 'grace.nelson@example.com', '5554443333', 'gracenelson', 1220, '2023-12-24', 1, 1);




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
('John Doe', 'john.doe@example.com', '1234567890', 'I have a question about your services. Can you please provide more information?'),
('Jane Smith', 'jane.smith@example.com', '9876543210', 'Hello! I love your products. Just wanted to send some positive feedback.'),
('Michael Brown', 'michael.brown@example.com', '5556667777', 'I encountered an issue with your website. Can you please look into it?'),
('Emily Johnson', 'emily.johnson@example.com', '3332221111', 'Im interested in scheduling an appointment. When is your next available slot?'),
('David Williams', 'david.williams@example.com', '9998887777', 'Great job on the recent updates to your app! Its much more user-friendly now.'),
('Sophia Green', 'sophia.green@example.com', '6665554444', 'I have a billing inquiry. Can someone from your team reach out to me?'),
('Daniel Miller', 'daniel.miller@example.com', '1112223333', 'Im a new customer and would like to know more about your loyalty program.'),
('Olivia Davis', 'olivia.davis@example.com', '7778889999', 'Do you have any promotions or discounts running currently?'),
('Matthew Jones', 'matthew.jones@example.com', '4445556666', 'I have a suggestion for an improvement. Are you open to feedback?'),
('Emma Martinez', 'emma.martinez@example.com', '2223334444', 'Just wanted to say your customer service team is fantastic! They were very helpful.');

-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

CREATE TABLE `doctb` (
  `id` int PRIMARY Key  AUTO_INCREMENT NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL
);

--
-- Dumping data for table `doctb`
--
INSERT INTO `doctb` (`username`, `password`, `email`, `city`, `spec`, `docFees`) VALUES
('johnsmith', 'password1', 'john.smith@example.com', 'New York', 'Cardiology', 100),
('janedoe', 'password2', 'jane.doe@example.com', 'Los Angeles', 'Dermatology', 120),
('michaelbrown', 'password3', 'michael.brown@example.com', 'Chicago', 'Pediatrics', 150),
('emilyjohnson', 'password4', 'emily.johnson@example.com', 'Houston', 'Orthopedics', 130),
('davidwilliams', 'password5', 'david.williams@example.com', 'Phoenix', 'Neurology', 110),
('sophiagreen', 'password6', 'sophia.green@example.com', 'Philadelphia', 'Oncology', 140),
('danielmiller', 'password7', 'daniel.miller@example.com', 'San Antonio', 'Cardiac Surgery', 160),
('oliviadavis', 'password8', 'olivia.davis@example.com', 'San Diego', 'Gastroenterology', 180),
('matthewjones', 'password9', 'matthew.jones@example.com', 'Dallas', 'Urology', 200),
('emilymartinez', 'password10', 'emma.martinez@example.com', 'San Jose', 'Internal Medicine', 170),
('aidentaylor', 'password11', 'aiden.taylor@example.com', 'Austin', 'Endocrinology', 190),
('avabennett', 'password12', 'ava.bennett@example.com', 'Jacksonville', 'Rheumatology', 210),
('ethanhernandez', 'password13', 'ethan.hernandez@example.com', 'San Francisco', 'Plastic Surgery', 230),
('isabellawalker', 'password14', 'isabella.walker@example.com', 'Indianapolis', 'Psychiatry', 250),
('masongreen', 'password15', 'mason.green@example.com', 'Columbus', 'Ophthalmology', 220),
('abigailevans', 'password16', 'abigail.evans@example.com', 'Fort Worth', 'Dentistry', 200),
('loganmorales', 'password17', 'logan.morales@example.com', 'Charlotte', 'Hematology', 180),
('ellaturner', 'password18', 'ella.turner@example.com', 'Seattle', 'Pulmonology', 160),
('liamperez', 'password19', 'liam.perez@example.com', 'Denver', 'Gynecology', 140),
('gracenelson', 'password20', 'grace.nelson@example.com', 'El Paso', 'Nephrology', 120);

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
-- Dumping data for table `availabilitytb`
--

INSERT INTO `availabilitytb` (`doctor_id`, `date`) VALUES
(1, '2024-01-01'),
(2, '2024-01-02'),
(3, '2024-01-03'),
(4, '2024-01-04'),
(5, '2024-01-05'),
(6, '2024-01-06'),
(7, '2024-01-07'),
(8, '2024-01-08'),
(9, '2024-01-09'),
(10, '2024-01-10'),
(11, '2024-01-11'),
(12, '2024-01-12'),
(13, '2024-01-13'),
(14, '2024-01-14'),
(15, '2024-01-15'),
(16, '2024-01-16'),
(17, '2024-01-17'),
(18, '2024-01-18'),
(19, '2024-01-19'),
(20, '2024-01-20');

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

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`)
VALUES
(1, 'John', 'Doe', 'Male', 'john.doe@example.com', '1234567890', 'password1', 'password1'),
(2, 'Jane', 'Doe', 'Female', 'jane.doe@example.com', '9876543210', 'password2', 'password2'),
(3, 'Michael', 'Smith', 'Male', 'michael.smith@example.com', '5556667777', 'password3', 'password3'),
(4, 'Emily', 'Johnson', 'Female', 'emily.johnson@example.com', '3332221111', 'password4', 'password4'),
(5, 'David', 'Williams', 'Male', 'david.williams@example.com', '9998887777', 'password5', 'password5'),
(6, 'Sophia', 'Brown', 'Female', 'sophia.brown@example.com', '6665554444', 'password6', 'password6'),
(7, 'Daniel', 'Miller', 'Male', 'daniel.miller@example.com', '1112223333', 'password7', 'password7'),
(8, 'Olivia', 'Davis', 'Female', 'olivia.davis@example.com', '7778889999', 'password8', 'password8'),
(9, 'Matthew', 'Jones', 'Male', 'matthew.jones@example.com', '4445556666', 'password9', 'password9'),
(10, 'Emma', 'Martinez', 'Female', 'emma.martinez@example.com', '2223334444', 'password10', 'password10'),
(11, 'Aiden', 'Taylor', 'Male', 'aiden.taylor@example.com', '5554443333', 'password11', 'password11'),
(12, 'Ava', 'Anderson', 'Female', 'ava.anderson@example.com', '8887776666', 'password12', 'password12'),
(13, 'Ethan', 'Hernandez', 'Male', 'ethan.hernandez@example.com', '3332221111', 'password13', 'password13'),
(14, 'Isabella', 'Walker', 'Female', 'isabella.walker@example.com', '9998887777', 'password14', 'password14'),
(15, 'Mason', 'Green', 'Male', 'mason.green@example.com', '6665554444', 'password15', 'password15'),
(16, 'Abigail', 'Evans', 'Female', 'abigail.evans@example.com', '1112223333', 'password16', 'password16'),
(17, 'Logan', 'Morales', 'Male', 'logan.morales@example.com', '7778889999', 'password17', 'password17'),
(18, 'Ella', 'Turner', 'Female', 'ella.turner@example.com', '4445556666', 'password18', 'password18'),
(19, 'Liam', 'Perez', 'Male', 'liam.perez@example.com', '2223334444', 'password19', 'password19'),
(20, 'Grace', 'Nelson', 'Female', 'grace.nelson@example.com', '5554443333', 'password20', 'password20');


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

-- Prescriptions for patient 1 (John Doe) with doctor 'johnsmith'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('johnsmith', 1, 1, 'John', 'Doe', '2023-12-27', 'Fever', 'None', 'Take Ibuprofen and get plenty of rest');

-- Prescriptions for patient 2 (Jane Doe) with doctor 'janedoe'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('janedoe', 2, 2, 'Jane', 'Doe', '2023-12-27', 'Headache', 'Aspirin allergy', 'Avoid aspirin, take Acetaminophen for headache');

-- Prescriptions for patient 3 (Michael Smith) with doctor 'michaelbrown'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('michaelbrown', 3, 3, 'Michael', 'Smith', '2023-12-27', 'Stomachache', 'None', 'Take antacids and avoid spicy food');

-- Prescriptions for patient 4 (Emily Johnson) with doctor 'emilyjohnson'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('emilyjohnson', 4, 4, 'Emily', 'Johnson', '2023-12-27', 'Sprained ankle', 'None', 'Rest, ice, compression, and elevation (RICE)');

-- Prescriptions for patient 5 (David Williams) with doctor 'davidwilliams'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('davidwilliams', 5, 5, 'David', 'Williams', '2023-12-27', 'Migraine', 'None', 'Prescribe Sumatriptan for migraine relief');

-- Prescriptions for patient 6 (Sophia Brown) with doctor 'sophiagreen'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('sophiagreen', 6, 6, 'Sophia', 'Brown', '2023-12-27', 'Allergies', 'Pollen', 'Prescribe Loratadine for allergy relief');

-- Prescriptions for patient 7 (Daniel Miller) with doctor 'danielmiller'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('danielmiller', 7, 7, 'Daniel', 'Miller', '2023-12-27', 'High Blood Pressure', 'None', 'Prescribe Lisinopril for blood pressure');

-- Prescriptions for patient 8 with doctor 'oliviadavis'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('oliviadavis', 8, 127, 'Olivia', 'Davis', '2023-12-27', 'Gastritis', 'None', 'Prescribe Omeprazole for gastritis relief');

-- Prescriptions for patient 9 with doctor 'matthewjones'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('matthewjones', 9, 128, 'Matthew', 'Jones', '2023-12-27', 'Kidney Stones', 'None', 'Recommend increased water intake and pain management');

-- Prescriptions for patient 10 with doctor 'emilymartinez'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('emilymartinez', 10, 129, 'Emma', 'Martinez', '2023-12-27', 'Diabetes', 'None', 'Prescribe Metformin for diabetes management');

-- Prescriptions for patient 11 with doctor 'aidentaylor'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('aidentaylor', 11, 130, 'Aiden', 'Taylor', '2023-12-27', 'Thyroid Disorder', 'None', 'Prescribe Levothyroxine for thyroid regulation');

-- Prescriptions for patient 12 with doctor 'avabennett'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('avabennett', 12, 131, 'Ava', 'Anderson', '2023-12-27', 'Arthritis', 'None', 'Recommend joint exercises and pain relief');

-- Prescriptions for patient 13 with doctor 'ethanhernandez'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('ethanhernandez', 13, 132, 'Ethan', 'Hernandez', '2023-12-27', 'Plastic Surgery Recovery', 'None', 'Follow post-op care instructions');

-- Prescriptions for patient 14 with doctor 'isabellawalker'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('isabellawalker', 14, 133, 'Isabella', 'Walker', '2023-12-27', 'Depression', 'None', 'Prescribe Fluoxetine for depression management');

-- Prescriptions for patient 15 with doctor 'masongreen'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('masongreen', 15, 134, 'Mason', 'Green', '2023-12-27', 'Eye Strain', 'None', 'Prescribe eye drops for eye strain relief');

-- Prescriptions for patient 16 with doctor 'abigailevans'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('abigailevans', 16, 135, 'Abigail', 'Evans', '2023-12-27', 'Dental Care', 'None', 'Recommend regular dental check-ups and oral hygiene');

-- Prescriptions for patient 17 with doctor 'loganmorales'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('loganmorales', 17, 136, 'Logan', 'Morales', '2023-12-27', 'Blood Disorder', 'None', 'Prescribe iron supplements for blood disorder');

-- Prescriptions for patient 18 with doctor 'ellaturner'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('ellaturner', 18, 137, 'Ella', 'Turner', '2023-12-27', 'Asthma', 'None', 'Prescribe albuterol inhaler for asthma');

-- Prescriptions for patient 19 with doctor 'gracenelson'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('gracenelson', 19, 138, 'Grace', 'Nelson', '2023-12-27', 'Gynecological Health', 'None', 'Recommend regular check-ups and screenings');

-- Prescriptions for patient 20 with doctor 'lucascollins'
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `disease`, `allergy`, `prescription`)
VALUES
('lucascollins', 20, 139, 'Lucas', 'Collins', '2023-12-27', 'Radiology Follow-up', 'None', 'Follow-up on imaging results and consult with radiologist');


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