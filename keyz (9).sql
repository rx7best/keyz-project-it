-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2024 at 04:55 PM
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
-- Database: `keyz`
--

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE `box` (
  `box_id` int(11) NOT NULL,
  `username` char(10) NOT NULL,
  `apartment_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `box`
--

INSERT INTO `box` (`box_id`, `username`, `apartment_name`) VALUES
(87, 'test', 'Btest'),
(88, 'test', '1122661'),
(89, 'test', 'test apartment'),
(90, 'test', 'bjak'),
(91, 'test', 'test apartment'),
(92, 'test', 'bjak'),
(93, 'test', 'test apartment'),
(94, '3', 'test apartment'),
(95, 'admin', 'test apartment'),
(96, 'admin', 'test apartment');

-- --------------------------------------------------------

--
-- Table structure for table `cardstatus`
--

CREATE TABLE `cardstatus` (
  `card_status_id` int(11) NOT NULL,
  `status` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cardstatus`
--

INSERT INTO `cardstatus` (`card_status_id`, `status`) VALUES
(1, 'คืนแล้ว'),
(2, 'ยังไม่คืน');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `username` char(10) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `username`, `owner_name`, `address`, `password`) VALUES
(20, 'saran', 'saran', 'surat', 'b59c67bf196a4758191e42f76670ceba'),
(21, 'test', 'jakkarawut pimonsri', 'psu ', '81dc9bdb52d04dc20036dbd8313ed055'),
(22, '3', 'jakkarawut pimonsri', 'psu ', '81dc9bdb52d04dc20036dbd8313ed055'),
(23, 'admin', 'jakkarawut pimonsri', 'psu ', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `reserve_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `room_number` varchar(5) NOT NULL,
  `customer_name` text NOT NULL,
  `line_id` char(15) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `fee` float NOT NULL,
  `note` text NOT NULL,
  `Code_key` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`reserve_id`, `box_id`, `slot_id`, `room_number`, `customer_name`, `line_id`, `check_in`, `check_out`, `fee`, `note`, `Code_key`) VALUES
(51, 82, 4052, '105', 'aaaa', ' 0917926941', '2024-02-24', '2024-02-25', 0, 'test', 793038),
(52, 83, 4068, '101', 'aaaa', 'testttttttttttt', '2024-02-24', '2024-02-25', 0, 'testtttttttttttt', 630397),
(53, 82, 4051, '104', 'aaaa', '0917926941', '2024-02-24', '2024-02-26', 0, 'ดีจร้า', 821667),
(54, 88, 4172, '105', 'aaaa', '         091792', '2024-02-24', '2024-02-26', 0, '2000123', 325399),
(55, 88, 4171, '104', 'aaaa', ' 0917926941', '2024-02-24', '2024-02-26', 0, 'Bjakkkkkkkk', 318837),
(59, 88, 4168, '101', 'aaaa', '999999999', '2024-02-26', '2024-02-27', 0, 'tututututuutu', 300641),
(60, 88, 4168, '101', 'Bjak', 'test_line', '2024-02-28', '2024-02-29', 900, 'ทดสอบค้นหา', 133316),
(61, 87, 4149, '102', 'Bjak', 'test_line', '2024-02-28', '2024-02-29', 900, 'ทดสอบค้นหา', 661144),
(62, 95, 4308, 'asdas', 'adasd', 'asdasd', '2024-09-02', '2024-09-03', 0, 'dasdasdasda', 982019);

-- --------------------------------------------------------

--
-- Table structure for table `slot`
--

CREATE TABLE `slot` (
  `slot_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `room_number` char(20) NOT NULL,
  `slot_number` char(20) NOT NULL,
  `rfid_number` text NOT NULL,
  `card_status_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `slot`
--

INSERT INTO `slot` (`slot_id`, `box_id`, `room_number`, `slot_number`, `rfid_number`, `card_status_id`) VALUES
(4148, 87, '101', '', '1234', 2),
(4149, 87, '102', '', '', 1),
(4150, 87, '103', '666', '', 2),
(4151, 87, '104', '', '', 2),
(4152, 87, '105', '', '', 2),
(4153, 87, '', '', '', 2),
(4154, 87, '', '', '', 2),
(4155, 87, '', '', '', 2),
(4156, 87, '', '', '', 2),
(4157, 87, '', '', '', 2),
(4158, 87, '', '', '', 2),
(4159, 87, '', '', '', 2),
(4160, 87, '', '', '', 2),
(4161, 87, '', '', '', 2),
(4162, 87, '', '', '', 2),
(4163, 87, '', '', '', 2),
(4164, 87, '', '', '', 2),
(4165, 87, '', '', '', 2),
(4166, 87, '', '', '', 2),
(4167, 87, '', '', '', 2),
(4168, 88, '101', '', '1234', 2),
(4169, 88, '102', '', '', 2),
(4170, 88, '103', '', '', 2),
(4171, 88, '104', '', '1234', 2),
(4172, 88, '105', 'oiioiii', '', 2),
(4173, 88, '', '', '', 2),
(4174, 88, '', '', '', 2),
(4175, 88, '', '', '', 2),
(4176, 88, '', '', '', 2),
(4177, 88, '', '', '', 2),
(4178, 88, '', '', '', 2),
(4179, 88, '', '', '', 2),
(4180, 88, '', '', '', 2),
(4181, 88, '', '', '', 2),
(4182, 88, '', '', '', 2),
(4183, 88, '', '', '', 2),
(4184, 88, '', '', '', 2),
(4185, 88, '', '', '', 2),
(4186, 88, '', '', '', 2),
(4187, 88, '', '', '', 2),
(4188, 89, '', '', '', 2),
(4189, 89, '', '', '', 2),
(4190, 89, '', '', '', 2),
(4191, 89, '', '', '', 2),
(4192, 89, '', '', '', 2),
(4193, 89, '', '', '', 2),
(4194, 89, '', '', '', 2),
(4195, 89, '', '', '', 2),
(4196, 89, '', '', '', 2),
(4197, 89, '', '', '', 2),
(4198, 89, '', '', '', 2),
(4199, 89, '', '', '', 2),
(4200, 89, '', '', '', 2),
(4201, 89, '', '', '', 2),
(4202, 89, '', '', '', 2),
(4203, 89, '', '', '', 2),
(4204, 89, '', '', '', 2),
(4205, 89, '', '', '', 2),
(4206, 89, '', '', '', 2),
(4207, 89, '', '', '', 2),
(4208, 90, '', '', '', 2),
(4209, 90, '', '', '', 2),
(4210, 90, '', '', '', 2),
(4211, 90, '', '', '', 2),
(4212, 90, '', '', '', 2),
(4213, 90, '', '', '', 2),
(4214, 90, '', '', '', 2),
(4215, 90, '', '', '', 2),
(4216, 90, '', '', '', 2),
(4217, 90, '', '', '', 2),
(4218, 90, '', '', '', 2),
(4219, 90, '', '', '', 2),
(4220, 90, '', '', '', 2),
(4221, 90, '', '', '', 2),
(4222, 90, '', '', '', 2),
(4223, 90, '', '', '', 2),
(4224, 90, '', '', '', 2),
(4225, 90, '', '', '', 2),
(4226, 90, '', '', '', 2),
(4227, 90, '', '', '', 2),
(4228, 91, '', '', '', 2),
(4229, 91, '', '', '', 2),
(4230, 91, '', '', '', 2),
(4231, 91, '', '', '', 2),
(4232, 91, '', '', '', 2),
(4233, 91, '', '', '', 2),
(4234, 91, '', '', '', 2),
(4235, 91, '', '', '', 2),
(4236, 91, '', '', '', 2),
(4237, 91, '', '', '', 2),
(4238, 91, '', '', '', 2),
(4239, 91, '', '', '', 2),
(4240, 91, '', '', '', 2),
(4241, 91, '', '', '', 2),
(4242, 91, '', '', '', 2),
(4243, 91, '', '', '', 2),
(4244, 91, '', '', '', 2),
(4245, 91, '', '', '', 2),
(4246, 91, '', '', '', 2),
(4247, 91, '', '', '', 2),
(4248, 92, '', '', '', 2),
(4249, 92, '', '', '', 2),
(4250, 92, '', '', '', 2),
(4251, 92, '', '', '', 2),
(4252, 92, '', '', '', 2),
(4253, 92, '', '', '', 2),
(4254, 92, '', '', '', 2),
(4255, 92, '', '', '', 2),
(4256, 92, '', '', '', 2),
(4257, 92, '', '', '', 2),
(4258, 92, '', '', '', 2),
(4259, 92, '', '', '', 2),
(4260, 92, '', '', '', 2),
(4261, 92, '', '', '', 2),
(4262, 92, '', '', '', 2),
(4263, 92, '', '', '', 2),
(4264, 92, '', '', '', 2),
(4265, 92, '', '', '', 2),
(4266, 92, '', '', '', 2),
(4267, 92, '', '', '', 2),
(4268, 93, '', '', '', 2),
(4269, 93, '', '', '', 2),
(4270, 93, '', '', '', 2),
(4271, 93, '', '', '', 2),
(4272, 93, '', '', '', 2),
(4273, 93, '', '', '', 2),
(4274, 93, '', '', '', 2),
(4275, 93, '', '', '', 2),
(4276, 93, '', '', '', 2),
(4277, 93, '', '', '', 2),
(4278, 93, '', '', '', 2),
(4279, 93, '', '', '', 2),
(4280, 93, '', '', '', 2),
(4281, 93, '', '', '', 2),
(4282, 93, '', '', '', 2),
(4283, 93, '', '', '', 2),
(4284, 93, '', '', '', 2),
(4285, 93, '', '', '', 2),
(4286, 93, '', '', '', 2),
(4287, 93, '', '', '', 2),
(4288, 94, '101', '', '', 2),
(4289, 94, '', '', '', 2),
(4290, 94, '', '', '', 2),
(4291, 94, '', '', '', 2),
(4292, 94, '', '', '', 2),
(4293, 94, '', '', '', 2),
(4294, 94, '', '', '', 2),
(4295, 94, '', '', '', 2),
(4296, 94, '', '', '', 2),
(4297, 94, '', '', '', 2),
(4298, 94, '', '', '', 2),
(4299, 94, '', '', '', 2),
(4300, 94, '', '', '', 2),
(4301, 94, '', '', '', 2),
(4302, 94, '', '', '', 2),
(4303, 94, '', '', '', 2),
(4304, 94, '', '', '', 2),
(4305, 94, '', '', '', 2),
(4306, 94, '', '', '', 2),
(4307, 94, '', '', '', 2),
(4308, 95, 'asdasd', 'asdas', 'dasd', 2),
(4309, 95, '', '', '', 2),
(4310, 95, '', '', '', 2),
(4311, 95, '', '', '', 2),
(4312, 95, '', '', '', 2),
(4313, 95, '', '', '', 2),
(4314, 95, '', '', '', 2),
(4315, 95, '', '', '', 2),
(4316, 95, '', '', '', 2),
(4317, 95, '', '', '', 2),
(4318, 95, '', '', '', 2),
(4319, 95, '', '', '', 2),
(4320, 95, '', '', '', 2),
(4321, 95, '', '', '', 2),
(4322, 95, '', '', '', 2),
(4323, 95, '', '', '', 2),
(4324, 95, '', '', '', 2),
(4325, 95, '', '', '', 2),
(4326, 95, '', '', '', 2),
(4327, 95, '', '', '', 2),
(4328, 96, '', '', '', 2),
(4329, 96, '', '', '', 2),
(4330, 96, '', '', '', 2),
(4331, 96, '', '', '', 2),
(4332, 96, '', '', '', 2),
(4333, 96, '', '', '', 2),
(4334, 96, '', '', '', 2),
(4335, 96, '', '', '', 2),
(4336, 96, '', '', '', 2),
(4337, 96, '', '', '', 2),
(4338, 96, '', '', '', 2),
(4339, 96, '', '', '', 2),
(4340, 96, '', '', '', 2),
(4341, 96, '', '', '', 2),
(4342, 96, '', '', '', 2),
(4343, 96, '', '', '', 2),
(4344, 96, '', '', '', 2),
(4345, 96, '', '', '', 2),
(4346, 96, '', '', '', 2),
(4347, 96, '', '', '', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `cardstatus`
--
ALTER TABLE `cardstatus`
  ADD PRIMARY KEY (`card_status_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`reserve_id`);

--
-- Indexes for table `slot`
--
ALTER TABLE `slot`
  ADD PRIMARY KEY (`slot_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
  MODIFY `box_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `cardstatus`
--
ALTER TABLE `cardstatus`
  MODIFY `card_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `reserve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `slot`
--
ALTER TABLE `slot`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4348;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
