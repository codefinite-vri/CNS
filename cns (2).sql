-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 20, 2020 at 11:50 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cns`
--

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
CREATE TABLE IF NOT EXISTS `airport` (
  `a_id` int(6) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `altitude` int(6) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `dgm_id` int(5) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `dm_id` (`dgm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`a_id`, `name`, `altitude`, `area`, `dgm_id`, `longitude`, `latitude`, `code`) VALUES
(1, 'Vadodara', 129, 149, 2102, '22.3325', '73.2171', 'BDQ'),
(2, 'Dabolim', 132, 121, NULL, '15.3803', '73.8350', 'GOI'),
(3, 'Sahar', 142, 125, NULL, '19.0896', '72.8656', 'BOM'),
(4, 'Delhi', 151, 120, NULL, '28.5562', '77.1000', 'DEL');

-- --------------------------------------------------------

--
-- Table structure for table `cdvordaily`
--

DROP TABLE IF EXISTS `cdvordaily`;
CREATE TABLE IF NOT EXISTS `cdvordaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `Azimuth_angle` int(11) DEFAULT NULL,
  `30Hz_modulation` int(11) DEFAULT NULL,
  `9960Hz_modulation` int(11) DEFAULT NULL,
  `9960Hz_deviation` int(11) DEFAULT NULL,
  `field_intensity` int(11) DEFAULT NULL,
  `ident_modulation` int(11) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`date`) USING BTREE,
  KEY `emp_id` (`emp_id`),
  KEY `CDVORDaily_ibfk_1` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdvordaily`
--

INSERT INTO `cdvordaily` (`date`, `a_id`, `emp_id`, `Azimuth_angle`, `30Hz_modulation`, `9960Hz_modulation`, `9960Hz_deviation`, `field_intensity`, `ident_modulation`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 10:48:27', 1, 4121, 24, 30, 30, 16, 0, 10, NULL, 'YES'),
('2020-03-20 10:48:32', 1, 4123, 23, 28, 32, 17, 1, 11, NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `cdvormonthly`
--

DROP TABLE IF EXISTS `cdvormonthly`;
CREATE TABLE IF NOT EXISTS `cdvormonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `measured_bearing_1` float DEFAULT NULL,
  `bearing_deviation_1` float DEFAULT NULL,
  `measured_bearing_2` float DEFAULT NULL,
  `bearing_deviation_2` float DEFAULT NULL,
  `measured_bearing_3` float DEFAULT NULL,
  `bearing_deviation_3` float DEFAULT NULL,
  `measured_deviation_4` float DEFAULT NULL,
  `bearing_deviation_4` float DEFAULT NULL,
  `measured_deviation_5` float DEFAULT NULL,
  `bearing_deviation_5` float DEFAULT NULL,
  `error_spread` float DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`date`) USING BTREE,
  KEY `emp_id` (`emp_id`),
  KEY `VHFMaily_ibfk_1` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdvormonthly`
--

INSERT INTO `cdvormonthly` (`date`, `a_id`, `emp_id`, `measured_bearing_1`, `bearing_deviation_1`, `measured_bearing_2`, `bearing_deviation_2`, `measured_bearing_3`, `bearing_deviation_3`, `measured_deviation_4`, `bearing_deviation_4`, `measured_deviation_5`, `bearing_deviation_5`, `error_spread`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-02-20 07:58:39', 1, 4123, 0, 0, 7.5, 0, 15, 0, 22.5, 0, 37.5, 0, 0, NULL, 'YES'),
('2020-03-20 07:58:43', 1, 4121, 0, 0, 8, 0.5, 16, 1, 22.5, 0, 37.8, 0.3, 1.8, 'Error spread found of 1.8, which is nominal.', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `cdvorweekly`
--

DROP TABLE IF EXISTS `cdvorweekly`;
CREATE TABLE IF NOT EXISTS `cdvorweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `PS_5V` int(11) DEFAULT NULL,
  `PS_12V` int(11) DEFAULT NULL,
  `PS_negative_12V` int(11) DEFAULT NULL,
  `PS_28V` int(11) DEFAULT NULL,
  `PS_48V` int(11) DEFAULT NULL,
  `outside_temp` int(11) DEFAULT NULL,
  `TX1_temp` int(11) DEFAULT NULL,
  `TX2_temp` int(11) DEFAULT NULL,
  `Out_temp_enabled` varchar(10) DEFAULT NULL,
  `AM` int(11) DEFAULT NULL,
  `FM` int(11) DEFAULT NULL,
  `sideband_frequency` int(11) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`),
  KEY `date` (`date`,`a_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdvorweekly`
--

INSERT INTO `cdvorweekly` (`date`, `a_id`, `emp_id`, `PS_5V`, `PS_12V`, `PS_negative_12V`, `PS_28V`, `PS_48V`, `outside_temp`, `TX1_temp`, `TX2_temp`, `Out_temp_enabled`, `AM`, `FM`, `sideband_frequency`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-02-09 08:00:36', 1, 4129, 4, 10, -13, 29, 41, 79, 44, 49, 'FALSE', 30, 30, 10001, 'PS 5V,PS 12V,PS -12V, reading deviating too much. Issue no 519', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `communication`
--

DROP TABLE IF EXISTS `communication`;
CREATE TABLE IF NOT EXISTS `communication` (
  `f_id` int(11) NOT NULL,
  `a_id` int(11) DEFAULT NULL,
  `facility` varchar(20) DEFAULT NULL,
  `make` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `DOI` date DEFAULT NULL,
  `DOC` date DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  UNIQUE KEY `f_id` (`f_id`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `communication`
--

INSERT INTO `communication` (`f_id`, `a_id`, `facility`, `make`, `model`, `power`, `DOI`, `DOC`, `location`, `emp_id`) VALUES
(1, 1, 'VHF TX/RX', 'PAE', 'T6T', 50, '2009-06-15', '2009-06-20', 'E/ROOM', 4069),
(2, 1, 'DATIS', 'TERMA', '50209', NULL, '2008-11-01', '2009-01-01', 'E/ROOM', 4069),
(3, 1, 'DSCN', 'MEMOTEC', 'CX 800', NULL, '2020-01-07', '2020-02-29', 'COM CENTRE', 4156);

-- --------------------------------------------------------

--
-- Table structure for table `datisdaily`
--

DROP TABLE IF EXISTS `datisdaily`;
CREATE TABLE IF NOT EXISTS `datisdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `room_temp` int(11) DEFAULT NULL,
  `status_of_AC` varchar(10) DEFAULT NULL,
  `status_of_UPS` varchar(10) DEFAULT NULL,
  `status_of_serverA` varchar(10) DEFAULT NULL,
  `status_of_serverB` varchar(10) DEFAULT NULL,
  `datetime_of_servers_wrt_GPS_CLK` varchar(10) DEFAULT NULL,
  `status_of_Disk_array` varchar(10) DEFAULT NULL,
  `VHFTX_ATIS_status` varchar(10) DEFAULT NULL,
  `VHFRX_ATIS_status` varchar(10) DEFAULT NULL,
  `DATIS_update` varchar(10) DEFAULT NULL,
  `Audio_quality` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datisdaily`
--

INSERT INTO `datisdaily` (`date`, `a_id`, `emp_id`, `room_temp`, `status_of_AC`, `status_of_UPS`, `status_of_serverA`, `status_of_serverB`, `datetime_of_servers_wrt_GPS_CLK`, `status_of_Disk_array`, `VHFTX_ATIS_status`, `VHFRX_ATIS_status`, `DATIS_update`, `Audio_quality`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:05:54', 1, 4144, 24, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', 'CORRECT', 'OK', 'ON LINE', 'ON LINE', 'OK', 'GOOD', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `datisweekly`
--

DROP TABLE IF EXISTS `datisweekly`;
CREATE TABLE IF NOT EXISTS `datisweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `serverAorB` varchar(1) DEFAULT NULL,
  `UPS_ip` int(11) DEFAULT NULL,
  `UPS_op` int(11) DEFAULT NULL,
  `Dust_free` varchar(5) NOT NULL,
  `LAN_status` varchar(5) DEFAULT NULL,
  `time_sync` varchar(5) DEFAULT NULL,
  `Audio_quality` varchar(5) DEFAULT NULL,
  `ptt_off_interval_seconds` int(11) DEFAULT NULL,
  `main_to_standby_changeover` varchar(5) DEFAULT NULL,
  `status_of_ROP` varchar(5) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datisweekly`
--

INSERT INTO `datisweekly` (`date`, `a_id`, `emp_id`, `serverAorB`, `UPS_ip`, `UPS_op`, `Dust_free`, `LAN_status`, `time_sync`, `Audio_quality`, `ptt_off_interval_seconds`, `main_to_standby_changeover`, `status_of_ROP`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:18:23', 1, 4156, 'B', 210, 230, 'NO', 'OK', 'OK', 'GOOD', 15, 'OK', 'OK', 'Residual dust was found on the system. Cleaning was performed.', 'YES'),
('2020-03-27 08:18:32', 1, 4069, 'A', 230, 230, 'YES', 'OK', 'OK', 'GOOD', 15, 'OK', 'OK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dgm`
--

DROP TABLE IF EXISTS `dgm`;
CREATE TABLE IF NOT EXISTS `dgm` (
  `dgm_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `head_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dgm_id`),
  KEY `a_id` (`a_id`),
  KEY `head_id` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dgm`
--

INSERT INTO `dgm` (`dgm_id`, `name`, `designation`, `a_id`, `contact`, `password`, `head_id`) VALUES
(2102, 'Linus Torvaldas', 'DGM', 1, 904471123, 'cdjs211', 1101);

-- --------------------------------------------------------

--
-- Table structure for table `dmedaily`
--

DROP TABLE IF EXISTS `dmedaily`;
CREATE TABLE IF NOT EXISTS `dmedaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `eqpt_shelter_cleanliness` varchar(10) DEFAULT NULL,
  `Battery_room_cleanliness` varchar(10) DEFAULT NULL,
  `AC_status` varchar(20) DEFAULT NULL,
  `eqpt_shelter_temperature` float DEFAULT NULL,
  `mains_power_supply` int(11) DEFAULT NULL,
  `stabiliser_output` int(11) DEFAULT NULL,
  `batterybank_voltage` int(11) DEFAULT NULL,
  `status_of_monitor` varchar(10) DEFAULT NULL,
  `unusual_noise` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dmedaily`
--

INSERT INTO `dmedaily` (`date`, `a_id`, `emp_id`, `eqpt_shelter_cleanliness`, `Battery_room_cleanliness`, `AC_status`, `eqpt_shelter_temperature`, `mains_power_supply`, `stabiliser_output`, `batterybank_voltage`, `status_of_monitor`, `unusual_noise`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-19 08:21:51', 1, 4129, 'DUST FREE', 'DUST FREE', 'SERVICABLE', 22, 221, 219, 24, 'OK', 'NO', NULL, 'YES'),
('2020-03-20 08:21:55', 1, 4123, 'DUST FREE', 'NOT CLEAN', 'SERVICABLE', 24, 215, 221, 24, 'OK', 'YES', 'Battery room found not clean. Noise was audible from the DME.Issue no. 520', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `dmemonthly`
--

DROP TABLE IF EXISTS `dmemonthly`;
CREATE TABLE IF NOT EXISTS `dmemonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `SGDNF_pulse_width` float DEFAULT NULL,
  `SGDNF_amplitude` float DEFAULT NULL,
  `Squitter_rate_of_inhibit_interrogation` float DEFAULT NULL,
  `max_reply_rate_KHz` float DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dmemonthly`
--

INSERT INTO `dmemonthly` (`date`, `a_id`, `emp_id`, `SGDNF_pulse_width`, `SGDNF_amplitude`, `Squitter_rate_of_inhibit_interrogation`, `max_reply_rate_KHz`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-01-20 08:25:12', 1, 4123, 6, 12, 0.94, 2.7, NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `dmeweekly`
--

DROP TABLE IF EXISTS `dmeweekly`;
CREATE TABLE IF NOT EXISTS `dmeweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `test_interrogation_module` int(11) DEFAULT NULL,
  `RX_video_module` int(11) DEFAULT NULL,
  `100W_module` int(11) DEFAULT NULL,
  `Monitor_module` int(11) DEFAULT NULL,
  `AC_regulator_ip` int(11) DEFAULT NULL,
  `AC_regulator_op` int(11) DEFAULT NULL,
  `system_delay` float DEFAULT NULL,
  `pulse_pair_spacing_SEPN` float DEFAULT NULL,
  `reply_efficiency_percent` float DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dmeweekly`
--

INSERT INTO `dmeweekly` (`date`, `a_id`, `emp_id`, `test_interrogation_module`, `RX_video_module`, `100W_module`, `Monitor_module`, `AC_regulator_ip`, `AC_regulator_op`, `system_delay`, `pulse_pair_spacing_SEPN`, `reply_efficiency_percent`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:27:08', 1, 4121, 15, 15, 15, 15, 240, 230, 50.8, 12.25, 89, NULL, 'YES'),
('2020-03-27 08:27:12', 1, 4129, 16, 15, 15, 15, 248, 230, 50, 12, 74, NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `dscndaily`
--

DROP TABLE IF EXISTS `dscndaily`;
CREATE TABLE IF NOT EXISTS `dscndaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `SAT_LED` varchar(10) DEFAULT NULL,
  `ODU_LED` varchar(10) DEFAULT NULL,
  `IO_LED` varchar(10) DEFAULT NULL,
  `Alarm_LED` varchar(10) DEFAULT NULL,
  `Power_LED` varchar(10) DEFAULT NULL,
  `V35_LED` varchar(20) DEFAULT NULL,
  `IP_Voltage` int(11) DEFAULT NULL,
  `OP_voltage` int(11) DEFAULT NULL,
  `Battery_Voltage` int(11) DEFAULT NULL,
  `CorO_function` varchar(5) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dscndaily`
--

INSERT INTO `dscndaily` (`date`, `a_id`, `emp_id`, `SAT_LED`, `ODU_LED`, `IO_LED`, `Alarm_LED`, `Power_LED`, `V35_LED`, `IP_Voltage`, `OP_voltage`, `Battery_Voltage`, `CorO_function`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:28:36', 1, 4144, 'STEADY ON', 'STEADY ON', 'STEADY ON', 'OFF', 'STEADY ON', 'RX/TX BLINKING', 230, 220, 210, 'OK', NULL, 'YES'),
('2020-03-21 08:28:40', 1, 4069, 'STEADY ON', 'STEADY ON', 'STEADY ON', 'ON', 'STEADY ON', 'RX/TX BLINKING', 230, 200, 170, 'OK', 'Alarm LED found ON.\r\nLess voltage generated at the output side of the UPS. This giving rise to even lesser and insufficient battery voltage of 170V.\r\nIssue no 518. Referred to AGM-CE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `dscnmonthly`
--

DROP TABLE IF EXISTS `dscnmonthly`;
CREATE TABLE IF NOT EXISTS `dscnmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `Cleaning_DSCN_associated_eqpt` tinytext,
  `Battery_backup_time_of_UPS1nUPS2` tinytext,
  `UPS_battery_voltage_on_load` tinytext,
  `Antenna_n_cable_check` tinytext,
  `Earth_resistance` tinytext,
  `EorN_voltage` int(11) DEFAULT NULL,
  `eqpt_status_after_check` varchar(5) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dscnmonthly`
--

INSERT INTO `dscnmonthly` (`date`, `a_id`, `emp_id`, `Cleaning_DSCN_associated_eqpt`, `Battery_backup_time_of_UPS1nUPS2`, `UPS_battery_voltage_on_load`, `Antenna_n_cable_check`, `Earth_resistance`, `EorN_voltage`, `eqpt_status_after_check`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-02 08:30:46', 1, 4156, 'Cleaning performed.', '15hrs ', 'Can withstand load ', 'All antennas and cables properly connected.', 'All connections are maintained.', 25, 'GOOD', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `dscnweekly`
--

DROP TABLE IF EXISTS `dscnweekly`;
CREATE TABLE IF NOT EXISTS `dscnweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `Air_conditioning_check` tinytext,
  `Cleaning_DSCN_associated_eqpt` tinytext,
  `UPS1_UPS2_battery_backup` tinytext,
  `UPS_battery_voltage_on_load` tinytext,
  `Antenna_n_Cable_check` tinytext,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dscnweekly`
--

INSERT INTO `dscnweekly` (`date`, `a_id`, `emp_id`, `Air_conditioning_check`, `Cleaning_DSCN_associated_eqpt`, `UPS1_UPS2_battery_backup`, `UPS_battery_voltage_on_load`, `Antenna_n_Cable_check`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:36:06', 1, 4156, 'ALL installed AC\'s working.', 'ALL DSCN related equipments were cleaned.', 'UPS1 & UPS2 battery backup maintained.', 'Can withstand load', 'All cables and Antenna properly connected', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
CREATE TABLE IF NOT EXISTS `engineer` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `dept` varchar(1) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `a_id` (`a_id`),
  KEY `supervisor_id` (`supervisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `engineer`
--

INSERT INTO `engineer` (`emp_id`, `name`, `designation`, `a_id`, `dept`, `contact`, `password`, `supervisor_id`) VALUES
(4069, 'Varun Naik', 'MGR CE', 1, 'C', 866651, 'dw2121w', 3193),
(4121, 'Umesh Yadav', 'MGR CT', 1, 'N', 213112, '12wqqw1', 3112),
(4123, 'Ketan Hackerman', 'AM', 1, 'N', 21343, 'sdf213', 3112),
(4129, 'Ramesh Sharma', 'JET', 1, 'N', 32412, 'e211', 3112),
(4131, 'Chandresh Reddy', 'MGR SR', 1, 'S', 21315, 'df3432', 3181),
(4132, 'Suresh Kelkar', 'AM', 1, 'S', 12312, 'lkk321', 3181),
(4133, 'Thon Thangal', 'JET', 1, 'S', 2111, 'd212', 3181),
(4144, 'Hudson Odoi', 'AM', 1, 'C', 23231, 'sda112', 3193),
(4156, 'Mason Mount', 'JET', 1, 'C', 231123, 'qwe2112', 3193);

-- --------------------------------------------------------

--
-- Table structure for table `head`
--

DROP TABLE IF EXISTS `head`;
CREATE TABLE IF NOT EXISTS `head` (
  `head_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `head`
--

INSERT INTO `head` (`head_id`, `name`, `designation`, `contact`, `password`) VALUES
(1101, 'Hannibal Lecter', 'ED CNS', 95187238, '1112q11');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE IF NOT EXISTS `issues` (
  `issue_no` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `desgn` varchar(10) DEFAULT NULL,
  `dept` varchar(1) DEFAULT NULL,
  `facility_affected` varchar(20) DEFAULT NULL,
  `observations` tinytext,
  `actions_taken` tinytext,
  `approved_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_no`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`),
  KEY `approved_by` (`approved_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_no`, `date`, `a_id`, `emp_id`, `desgn`, `dept`, `facility_affected`, `observations`, `actions_taken`, `approved_by`) VALUES
(503, '2020-03-22 09:47:19', 1, 4144, 'AM', 'C', 'VHF RX (PAE)', 'Bit test failure was observed. This lead to non availability of the instrument.', 'Switched to standby receiver from VCS operator position for tower main frequency i.e. 118.65 MHz.', 3193),
(504, '2019-12-06 07:45:06', 1, 4156, 'JET', 'C', 'VHF RX (PAE)', 'Ready signal not found to be Standard. Squelch defeat was observed to be ON. Squelch threshold varying more than usual. ', 'ATCO switched to alternate frequency', 3193),
(517, '2020-03-22 09:43:01', 1, 4069, 'MGR CE', 'C', 'VHF RX (PAE)', 'Bit test failure and abnormal AC to DC changeover observed. Referred to AGM-CE.\r\n', 'Emergency frequency utilised as per standard operating procedure from standard transmitter at EMERGENCY frequency of 121.5 MHz.', 3193),
(518, '2020-03-21 09:44:06', 1, 4069, 'MGR CE', 'C', 'DSCN', 'Less voltage generated at the output side of the UPS. This giving rise to even lesser and insufficient battery voltage of 170V.\r\n', 'Class B surge diverter was found producing anomalies. Standby replacement was used on MGR CE\'s recommendation.', 3193),
(519, '2020-03-20 13:44:36', 1, 4129, 'JET', 'N', 'DVOR', 'PS 5V,PS 12V,PS -12V, reading deviating too much. This caused temperature to rise beyond the threshold of 70 degrees, recording 79 degrees.\r\nClass C surge diverter found faulty.', 'Class C surge diverter sent for repairing. Facility suspended till further notice.', 3112),
(520, '2020-03-20 11:44:50', 1, 4123, 'AM', 'N', 'DME (HP)', 'Battery room not clean. This led to less voltage generation as per recommendation. This further lead to the sound produced by the DME due to low power supply.', 'Room was cleaned and the connections were thoroughly checked.', 3112),
(521, '2020-04-21 09:40:44', 1, 4129, 'JET', 'N', 'NDB', 'Forward power observed to be very less (80W) as compared to (100W). This has led to decrease in reflected power.\r\n', 'Fault in UPS 1(Master) power supply. No spares available. This particular NDB is suspended until further notice. Spare NDB from Udaipur station has been called out. ', 3112);

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
CREATE TABLE IF NOT EXISTS `navigation` (
  `f_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `facility` varchar(20) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `IDNT` varchar(10) DEFAULT NULL,
  `coordinateN` varchar(11) DEFAULT NULL,
  `coordinateE` varchar(11) DEFAULT NULL,
  `eqpt` varchar(20) DEFAULT NULL,
  `DOI` date DEFAULT NULL,
  `DOC` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  UNIQUE KEY `f_id` (`f_id`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`f_id`, `a_id`, `facility`, `frequency`, `power`, `IDNT`, `coordinateN`, `coordinateE`, `eqpt`, `DOI`, `DOC`, `emp_id`) VALUES
(1, 1, 'DVOR', 117, 100, 'QQZ', '22 19\'58.2', '73 13\'30.5', 'AMS 1150', '2001-09-11', '2001-09-18', 4129),
(2, 1, 'DME (HP)', 1144, 1000, 'QQZ', '22 19\'58.2', '73 13\'30.5', 'GCEL 753', '2001-10-19', '2001-10-28', 4121),
(3, 1, 'NDB', 0, 100, 'QZ', '22 20\'5.2', '73 12\'33.6', 'SAC-100', '2019-07-22', '2019-11-07', 4123);

-- --------------------------------------------------------

--
-- Table structure for table `ndbdaily`
--

DROP TABLE IF EXISTS `ndbdaily`;
CREATE TABLE IF NOT EXISTS `ndbdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `room_temp` int(11) DEFAULT NULL,
  `ac_mains_voltage_50Hz` int(11) DEFAULT NULL,
  `battery_voltage` int(11) DEFAULT NULL,
  `reflected_power` int(11) DEFAULT NULL,
  `forward_power` int(11) DEFAULT NULL,
  `modulation` int(11) DEFAULT NULL,
  `system_status_LED` varchar(3) DEFAULT NULL,
  `Primary_TX_LED` varchar(3) DEFAULT NULL,
  `TX_power_ON_LED` varchar(3) DEFAULT NULL,
  `remote_ctrl_link_LED` varchar(20) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ndbdaily`
--

INSERT INTO `ndbdaily` (`date`, `a_id`, `emp_id`, `room_temp`, `ac_mains_voltage_50Hz`, `battery_voltage`, `reflected_power`, `forward_power`, `modulation`, `system_status_LED`, `Primary_TX_LED`, `TX_power_ON_LED`, `remote_ctrl_link_LED`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:57:21', 1, 4121, 20, 225, 24, 18, 100, 87, 'ON', 'ON', 'ON', 'BLINKING', NULL, 'YES'),
('2020-03-21 08:57:25', 1, 4121, 20, 230, 21, 18, 100, 90, 'ON', 'ON', 'ON', 'BLINKING', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `ndbmonthly`
--

DROP TABLE IF EXISTS `ndbmonthly`;
CREATE TABLE IF NOT EXISTS `ndbmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `frwd_power_modulation_OFF` int(11) DEFAULT NULL,
  `reflected_power` int(11) DEFAULT NULL,
  `modulation_depth_check` int(11) DEFAULT NULL,
  `ident_code_check` varchar(10) DEFAULT NULL,
  `antenna_n_ACU_check` varchar(20) DEFAULT NULL,
  `NDB_eqpt_n_ACU_cleaning` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ndbmonthly`
--

INSERT INTO `ndbmonthly` (`date`, `a_id`, `emp_id`, `frwd_power_modulation_OFF`, `reflected_power`, `modulation_depth_check`, `ident_code_check`, `antenna_n_ACU_check`, `NDB_eqpt_n_ACU_cleaning`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 08:59:59', 1, 4121, 100, 15, 92, 'VALID', 'GOOD', 'DONE', NULL, 'YES'),
('2020-04-20 09:00:02', 1, 4129, 80, 10, 82, 'VALID', 'GOOD', 'DONE', 'Forward power observed to be very less (80W) as compared to (100W). This has led to decrease in reflected power.\r\nReferred to AGM-CT. Issue no. 521.', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `ndbweekly`
--

DROP TABLE IF EXISTS `ndbweekly`;
CREATE TABLE IF NOT EXISTS `ndbweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `mains_pwr_supply_check` tinytext,
  `battery_terminals_check` tinytext,
  `battery_sealed` varchar(3) DEFAULT NULL,
  `specific_gravity` float DEFAULT NULL,
  `antenna_site_condition` tinytext,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ndbweekly`
--

INSERT INTO `ndbweekly` (`date`, `a_id`, `emp_id`, `mains_pwr_supply_check`, `battery_terminals_check`, `battery_sealed`, `specific_gravity`, `antenna_site_condition`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 09:01:15', 1, 4123, 'OK', 'OK', 'YES', 12.3, 'OK', NULL, 'YES'),
('2020-03-27 09:01:18', 1, 4129, 'OK', 'OK', 'NO', 12, 'OK', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `scctvdaily`
--

DROP TABLE IF EXISTS `scctvdaily`;
CREATE TABLE IF NOT EXISTS `scctvdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `UPS_battery_indication` varchar(20) DEFAULT NULL,
  `Servers_ON_condition` varchar(10) DEFAULT NULL,
  `NAS_status_in_VMSorVRM` varchar(10) DEFAULT NULL,
  `recording_active_status_VRS_server` int(11) DEFAULT NULL,
  `recording_active_status_RRS_server` varchar(20) DEFAULT NULL,
  `database_status_VMS` varchar(10) DEFAULT NULL,
  `cameras_IVMS` varchar(10) DEFAULT NULL,
  `eqpt_cleaning` varchar(20) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scctvdaily`
--

INSERT INTO `scctvdaily` (`date`, `a_id`, `emp_id`, `UPS_battery_indication`, `Servers_ON_condition`, `NAS_status_in_VMSorVRM`, `recording_active_status_VRS_server`, `recording_active_status_RRS_server`, `database_status_VMS`, `cameras_IVMS`, `eqpt_cleaning`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 09:02:59', 1, 4132, 'FULL', 'OK', 'OK', 32, 'PAUSE', 'OK', 'OK', 'OK', NULL, 'YES'),
('2020-03-21 09:03:03', 1, 4133, 'FULL', 'OK', 'OK', 32, 'PAUSE', 'OK', 'OK', 'CARRIED OUT', NULL, 'YES'),
('2020-03-22 09:03:07', 1, 4131, 'FULL', 'OK', 'OK', 32, 'PAUSE', 'OK', 'OK', 'OK', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `scctvmonthly`
--

DROP TABLE IF EXISTS `scctvmonthly`;
CREATE TABLE IF NOT EXISTS `scctvmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `ups_ip_voltage` int(11) DEFAULT NULL,
  `ups_op_voltage` int(11) DEFAULT NULL,
  `ups_battery_op_voltage_ACpwrON` int(11) DEFAULT NULL,
  `ups_battery_op_voltage_ACpwrOFF` int(11) DEFAULT NULL,
  `ups_battery_op_voltage_after15min_ACpwrOFF` int(11) DEFAULT NULL,
  `server_status` varchar(5) DEFAULT NULL,
  `cameras_in_VRS_server` varchar(20) DEFAULT NULL,
  `NAS_free_capacity` float DEFAULT NULL,
  `OFClinkto_L2L3_switches` varchar(20) DEFAULT NULL,
  `cleaning_camera_eqpt` varchar(20) DEFAULT NULL,
  `user_rights_check` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scctvmonthly`
--

INSERT INTO `scctvmonthly` (`date`, `a_id`, `emp_id`, `ups_ip_voltage`, `ups_op_voltage`, `ups_battery_op_voltage_ACpwrON`, `ups_battery_op_voltage_ACpwrOFF`, `ups_battery_op_voltage_after15min_ACpwrOFF`, `server_status`, `cameras_in_VRS_server`, `NAS_free_capacity`, `OFClinkto_L2L3_switches`, `cleaning_camera_eqpt`, `user_rights_check`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 09:04:53', 1, 4133, 235, 225, 203, 191, 176, 'ON', 'ACCESSIBLE', 1.24, 'BLINKING GREEN', 'CARRIED OUT', 'OK', NULL, 'YES'),
('2020-04-20 09:04:57', 1, 4132, 230, 225, 208, 186, 176, 'ON', 'OK', 9.2, 'BLINKING GREEN', 'CARRIED OUT', 'OK', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `scctvweekly`
--

DROP TABLE IF EXISTS `scctvweekly`;
CREATE TABLE IF NOT EXISTS `scctvweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `ups_ip_voltage` int(11) DEFAULT NULL,
  `ups_op_voltage` int(11) DEFAULT NULL,
  `ups_battery_status` varchar(10) DEFAULT NULL,
  `server_status` varchar(5) DEFAULT NULL,
  `camera_NAS_status_in_VRS` varchar(10) DEFAULT NULL,
  `workstns_n_client_softw_check` varchar(10) DEFAULT NULL,
  `cameras_client_IVMS_softw` varchar(10) DEFAULT NULL,
  `NAS_free_capacity` float DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scctvweekly`
--

INSERT INTO `scctvweekly` (`date`, `a_id`, `emp_id`, `ups_ip_voltage`, `ups_op_voltage`, `ups_battery_status`, `server_status`, `camera_NAS_status_in_VRS`, `workstns_n_client_softw_check`, `cameras_client_IVMS_softw`, `NAS_free_capacity`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-20 09:06:20', 1, 4131, 230, 225, 'FULL', 'OK', 'OK', 'OK', 'OK', 1.23, 'NAS_free_capacity not to be equal to 0.', 'YES'),
('2020-03-27 09:06:24', 1, 4132, 225, 220, 'FULL', 'OK', 'OK', 'OK', 'OK', 1.34, NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE IF NOT EXISTS `supervisor` (
  `supervisor_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `dept` varchar(1) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `dgm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`supervisor_id`),
  KEY `a_id` (`a_id`),
  KEY `dgm_id` (`dgm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`supervisor_id`, `name`, `designation`, `a_id`, `dept`, `contact`, `password`, `dgm_id`) VALUES
(3112, 'BP Singh', 'AGM CT', 1, 'N', 1122121, 'wq1212', 2102),
(3181, 'Mahesh Gotawandi', 'AGM SR', 1, 'S', 3211122, 'wqe121', 2102),
(3193, 'Corey Schrafer', 'AGM CE', 1, 'C', 121212, 'qw2112', 2102);

-- --------------------------------------------------------

--
-- Table structure for table `surveillance`
--

DROP TABLE IF EXISTS `surveillance`;
CREATE TABLE IF NOT EXISTS `surveillance` (
  `f_id` int(11) NOT NULL,
  `a_id` int(11) DEFAULT NULL,
  `facility` varchar(20) DEFAULT NULL,
  `eqpt` varchar(20) DEFAULT NULL,
  `DOI` date DEFAULT NULL,
  `DOC` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  UNIQUE KEY `f_id` (`f_id`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surveillance`
--

INSERT INTO `surveillance` (`f_id`, `a_id`, `facility`, `eqpt`, `DOI`, `DOC`, `emp_id`) VALUES
(1, 1, 'X-BIS', 'H.S.6040i', '2007-12-10', '2008-01-19', 4131),
(2, 1, 'ETD', '500 T', '2000-08-09', '0200-08-18', 4131),
(3, 1, 'SCCTV', 'INFINOVA', '1999-09-08', '1999-10-11', 4133);

-- --------------------------------------------------------

--
-- Table structure for table `vhfdaily`
--

DROP TABLE IF EXISTS `vhfdaily`;
CREATE TABLE IF NOT EXISTS `vhfdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `RX_no` int(11) DEFAULT NULL,
  `frequency_MHz` int(11) DEFAULT NULL,
  `bit_test` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `RXN_check` varchar(10) DEFAULT NULL,
  `ACorDC_CorO` varchar(10) DEFAULT NULL,
  `SQ_threshold` int(11) DEFAULT NULL,
  `Remarks` tinytext,
  `Unit_Incharge_Approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vhfdaily`
--

INSERT INTO `vhfdaily` (`date`, `emp_id`, `a_id`, `RX_no`, `frequency_MHz`, `bit_test`, `status`, `RXN_check`, `ACorDC_CorO`, `SQ_threshold`, `Remarks`, `Unit_Incharge_Approval`) VALUES
('2020-03-20 09:12:32', 4144, 1, 1, 120, 'PASS', 'READY', 'NORMAL', 'C/O NORMAL', -85, 'SQ threshold < -80 DBm as expected.\r\nMaintenance carried out for VHF RX for model type of PAE.', 'YES'),
('2020-03-21 09:12:36', 4144, 1, 1, 122, 'FAIL', 'NOT READY', 'RXN NORMAL', 'C/O NORMAL', -79, 'Referred to AGM_CE.Issue no 503', 'NO'),
('2020-03-22 09:12:40', 4156, 1, 1, 119, 'PASS', 'READY', 'RXN NORMAL', 'C/O NORMAL', -82, NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `vhfmonthly`
--

DROP TABLE IF EXISTS `vhfmonthly`;
CREATE TABLE IF NOT EXISTS `vhfmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `modulation_mode` varchar(10) DEFAULT NULL,
  `line_op` int(11) DEFAULT NULL,
  `squelch_defeat` varchar(3) DEFAULT NULL,
  `squelch_threshold` int(11) DEFAULT NULL,
  `squelch_carrier_override` varchar(3) DEFAULT NULL,
  `RF_pre_ATTN` varchar(3) DEFAULT NULL,
  `AGC` varchar(3) DEFAULT NULL,
  `Ready_signal` varchar(5) DEFAULT NULL,
  `Squelch_op_marc` varchar(5) DEFAULT NULL,
  `Squelch_op_facilities` varchar(5) DEFAULT NULL,
  `Squelch_op_phantom` varchar(5) DEFAULT NULL,
  `Squelch_defeat_ip` varchar(5) DEFAULT NULL,
  `bit_test` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vhfmonthly`
--

INSERT INTO `vhfmonthly` (`date`, `emp_id`, `a_id`, `modulation_mode`, `line_op`, `squelch_defeat`, `squelch_threshold`, `squelch_carrier_override`, `RF_pre_ATTN`, `AGC`, `Ready_signal`, `Squelch_op_marc`, `Squelch_op_facilities`, `Squelch_op_phantom`, `Squelch_defeat_ip`, `bit_test`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2019-11-05 09:14:37', 4069, 1, 'AM-Voice', 12, 'OFF', -107, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES'),
('2019-12-05 09:14:40', 4156, 1, 'AM-Voice', 11, 'ON', -103, 'OFF', 'OFF', 'ON', 'NO', 'STD', 'STD', 'STD', 'STD', 'PASS', 'Issue no. 504. Squelch defeat observed to be ON. Ready Signal being NON-STD. Referred to AGM-CE', 'NO'),
('2020-01-05 09:14:46', 4156, 1, 'FM-Voice', 12, 'OFF', -105, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES'),
('2020-02-05 09:14:50', 4069, 1, 'PM-Voice', 10, 'OFF', -107, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `vhfyearly`
--

DROP TABLE IF EXISTS `vhfyearly`;
CREATE TABLE IF NOT EXISTS `vhfyearly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `RX_no` int(11) DEFAULT NULL,
  `frequency_MHz` float DEFAULT NULL,
  `reference_freq` float DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `bit_test` varchar(5) DEFAULT NULL,
  `AC_DC_changeover` varchar(20) DEFAULT NULL,
  `Remarks` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vhfyearly`
--

INSERT INTO `vhfyearly` (`date`, `emp_id`, `a_id`, `RX_no`, `frequency_MHz`, `reference_freq`, `power`, `bit_test`, `AC_DC_changeover`, `Remarks`, `Unit_incharge_approval`) VALUES
('2019-03-20 09:17:25', 4144, 1, 1, 120, 20.95, 26, 'PASS', 'NORMAL(DC)', NULL, 'YES'),
('2020-03-20 09:17:29', 4069, 1, 1, 119, 20.95, 43, 'FAIL', 'Abnormal(DC)', 'Bit test failure and abnormal AC to DC changeover observed. Referred to AGM-CE.\r\nIssue no. 517', 'NO');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`dgm_id`) REFERENCES `dgm` (`dgm_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cdvordaily`
--
ALTER TABLE `cdvordaily`
  ADD CONSTRAINT `CDVORDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `CDVORDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cdvormonthly`
--
ALTER TABLE `cdvormonthly`
  ADD CONSTRAINT `CDVORMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `VHFMaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cdvorweekly`
--
ALTER TABLE `cdvorweekly`
  ADD CONSTRAINT `CDVORWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `CDVORWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `communication`
--
ALTER TABLE `communication`
  ADD CONSTRAINT `communication_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `communication_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `datisdaily`
--
ALTER TABLE `datisdaily`
  ADD CONSTRAINT `DATISDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DATISDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `datisweekly`
--
ALTER TABLE `datisweekly`
  ADD CONSTRAINT `DATISWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DATISWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dgm`
--
ALTER TABLE `dgm`
  ADD CONSTRAINT `dgm_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `dgm_ibfk_2` FOREIGN KEY (`head_id`) REFERENCES `head` (`head_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dmedaily`
--
ALTER TABLE `dmedaily`
  ADD CONSTRAINT `DMEDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DMEDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dmemonthly`
--
ALTER TABLE `dmemonthly`
  ADD CONSTRAINT `DMEMonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DMEMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dmeweekly`
--
ALTER TABLE `dmeweekly`
  ADD CONSTRAINT `DMEWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DMEWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dscndaily`
--
ALTER TABLE `dscndaily`
  ADD CONSTRAINT `DSCNDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DSCNDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dscnmonthly`
--
ALTER TABLE `dscnmonthly`
  ADD CONSTRAINT `DSCNMonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DSCNMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dscnweekly`
--
ALTER TABLE `dscnweekly`
  ADD CONSTRAINT `DSCNWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DSCNWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DSCNWeekly_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `engineer_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisor` (`supervisor_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `Issues_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`),
  ADD CONSTRAINT `Issues_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`),
  ADD CONSTRAINT `Issues_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `supervisor` (`supervisor_id`);

--
-- Constraints for table `navigation`
--
ALTER TABLE `navigation`
  ADD CONSTRAINT `navigation_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `navigation_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ndbdaily`
--
ALTER TABLE `ndbdaily`
  ADD CONSTRAINT `NDBDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `NDBDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ndbmonthly`
--
ALTER TABLE `ndbmonthly`
  ADD CONSTRAINT `NDBMonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `NDBMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ndbweekly`
--
ALTER TABLE `ndbweekly`
  ADD CONSTRAINT `NDBWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `NDBWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `scctvdaily`
--
ALTER TABLE `scctvdaily`
  ADD CONSTRAINT `SCCTVDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SCCTVDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `scctvmonthly`
--
ALTER TABLE `scctvmonthly`
  ADD CONSTRAINT `SCCTVMonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SCCTVMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `scctvweekly`
--
ALTER TABLE `scctvweekly`
  ADD CONSTRAINT `SCCTVWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SCCTVWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `supervisor_ibfk_2` FOREIGN KEY (`dgm_id`) REFERENCES `dgm` (`dgm_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `surveillance`
--
ALTER TABLE `surveillance`
  ADD CONSTRAINT `surveillance_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `surveillance_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vhfdaily`
--
ALTER TABLE `vhfdaily`
  ADD CONSTRAINT `VHFDaily_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `VHFDaily_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vhfmonthly`
--
ALTER TABLE `vhfmonthly`
  ADD CONSTRAINT `VHFMonthly_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `VHFMonthly_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vhfyearly`
--
ALTER TABLE `vhfyearly`
  ADD CONSTRAINT `VHFYearly_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `VHFYearly_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
