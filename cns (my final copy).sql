-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 25, 2020 at 03:51 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add airport', 7, 'add_airport'),
(26, 'Can change airport', 7, 'change_airport'),
(27, 'Can delete airport', 7, 'delete_airport'),
(28, 'Can view airport', 7, 'view_airport'),
(29, 'Can add cdvordaily', 8, 'add_cdvordaily'),
(30, 'Can change cdvordaily', 8, 'change_cdvordaily'),
(31, 'Can delete cdvordaily', 8, 'delete_cdvordaily'),
(32, 'Can view cdvordaily', 8, 'view_cdvordaily'),
(33, 'Can add cdvormonthly', 9, 'add_cdvormonthly'),
(34, 'Can change cdvormonthly', 9, 'change_cdvormonthly'),
(35, 'Can delete cdvormonthly', 9, 'delete_cdvormonthly'),
(36, 'Can view cdvormonthly', 9, 'view_cdvormonthly'),
(37, 'Can add cdvorweekly', 10, 'add_cdvorweekly'),
(38, 'Can change cdvorweekly', 10, 'change_cdvorweekly'),
(39, 'Can delete cdvorweekly', 10, 'delete_cdvorweekly'),
(40, 'Can view cdvorweekly', 10, 'view_cdvorweekly'),
(41, 'Can add communication', 11, 'add_communication'),
(42, 'Can change communication', 11, 'change_communication'),
(43, 'Can delete communication', 11, 'delete_communication'),
(44, 'Can view communication', 11, 'view_communication'),
(45, 'Can add datisdaily', 12, 'add_datisdaily'),
(46, 'Can change datisdaily', 12, 'change_datisdaily'),
(47, 'Can delete datisdaily', 12, 'delete_datisdaily'),
(48, 'Can view datisdaily', 12, 'view_datisdaily'),
(49, 'Can add datisweekly', 13, 'add_datisweekly'),
(50, 'Can change datisweekly', 13, 'change_datisweekly'),
(51, 'Can delete datisweekly', 13, 'delete_datisweekly'),
(52, 'Can view datisweekly', 13, 'view_datisweekly'),
(53, 'Can add dgm', 14, 'add_dgm'),
(54, 'Can change dgm', 14, 'change_dgm'),
(55, 'Can delete dgm', 14, 'delete_dgm'),
(56, 'Can view dgm', 14, 'view_dgm'),
(57, 'Can add dmedaily', 15, 'add_dmedaily'),
(58, 'Can change dmedaily', 15, 'change_dmedaily'),
(59, 'Can delete dmedaily', 15, 'delete_dmedaily'),
(60, 'Can view dmedaily', 15, 'view_dmedaily'),
(61, 'Can add dmemonthly', 16, 'add_dmemonthly'),
(62, 'Can change dmemonthly', 16, 'change_dmemonthly'),
(63, 'Can delete dmemonthly', 16, 'delete_dmemonthly'),
(64, 'Can view dmemonthly', 16, 'view_dmemonthly'),
(65, 'Can add dmeweekly', 17, 'add_dmeweekly'),
(66, 'Can change dmeweekly', 17, 'change_dmeweekly'),
(67, 'Can delete dmeweekly', 17, 'delete_dmeweekly'),
(68, 'Can view dmeweekly', 17, 'view_dmeweekly'),
(69, 'Can add dscndaily', 18, 'add_dscndaily'),
(70, 'Can change dscndaily', 18, 'change_dscndaily'),
(71, 'Can delete dscndaily', 18, 'delete_dscndaily'),
(72, 'Can view dscndaily', 18, 'view_dscndaily'),
(73, 'Can add dscnmonthly', 19, 'add_dscnmonthly'),
(74, 'Can change dscnmonthly', 19, 'change_dscnmonthly'),
(75, 'Can delete dscnmonthly', 19, 'delete_dscnmonthly'),
(76, 'Can view dscnmonthly', 19, 'view_dscnmonthly'),
(77, 'Can add dscnweekly', 20, 'add_dscnweekly'),
(78, 'Can change dscnweekly', 20, 'change_dscnweekly'),
(79, 'Can delete dscnweekly', 20, 'delete_dscnweekly'),
(80, 'Can view dscnweekly', 20, 'view_dscnweekly'),
(81, 'Can add engineer', 21, 'add_engineer'),
(82, 'Can change engineer', 21, 'change_engineer'),
(83, 'Can delete engineer', 21, 'delete_engineer'),
(84, 'Can view engineer', 21, 'view_engineer'),
(85, 'Can add head', 22, 'add_head'),
(86, 'Can change head', 22, 'change_head'),
(87, 'Can delete head', 22, 'delete_head'),
(88, 'Can view head', 22, 'view_head'),
(89, 'Can add issues', 23, 'add_issues'),
(90, 'Can change issues', 23, 'change_issues'),
(91, 'Can delete issues', 23, 'delete_issues'),
(92, 'Can view issues', 23, 'view_issues'),
(93, 'Can add navigation', 24, 'add_navigation'),
(94, 'Can change navigation', 24, 'change_navigation'),
(95, 'Can delete navigation', 24, 'delete_navigation'),
(96, 'Can view navigation', 24, 'view_navigation'),
(97, 'Can add ndbdaily', 25, 'add_ndbdaily'),
(98, 'Can change ndbdaily', 25, 'change_ndbdaily'),
(99, 'Can delete ndbdaily', 25, 'delete_ndbdaily'),
(100, 'Can view ndbdaily', 25, 'view_ndbdaily'),
(101, 'Can add ndbmonthly', 26, 'add_ndbmonthly'),
(102, 'Can change ndbmonthly', 26, 'change_ndbmonthly'),
(103, 'Can delete ndbmonthly', 26, 'delete_ndbmonthly'),
(104, 'Can view ndbmonthly', 26, 'view_ndbmonthly'),
(105, 'Can add ndbweekly', 27, 'add_ndbweekly'),
(106, 'Can change ndbweekly', 27, 'change_ndbweekly'),
(107, 'Can delete ndbweekly', 27, 'delete_ndbweekly'),
(108, 'Can view ndbweekly', 27, 'view_ndbweekly'),
(109, 'Can add scctvdaily', 28, 'add_scctvdaily'),
(110, 'Can change scctvdaily', 28, 'change_scctvdaily'),
(111, 'Can delete scctvdaily', 28, 'delete_scctvdaily'),
(112, 'Can view scctvdaily', 28, 'view_scctvdaily'),
(113, 'Can add scctvmonthly', 29, 'add_scctvmonthly'),
(114, 'Can change scctvmonthly', 29, 'change_scctvmonthly'),
(115, 'Can delete scctvmonthly', 29, 'delete_scctvmonthly'),
(116, 'Can view scctvmonthly', 29, 'view_scctvmonthly'),
(117, 'Can add scctvweekly', 30, 'add_scctvweekly'),
(118, 'Can change scctvweekly', 30, 'change_scctvweekly'),
(119, 'Can delete scctvweekly', 30, 'delete_scctvweekly'),
(120, 'Can view scctvweekly', 30, 'view_scctvweekly'),
(121, 'Can add supervisor', 31, 'add_supervisor'),
(122, 'Can change supervisor', 31, 'change_supervisor'),
(123, 'Can delete supervisor', 31, 'delete_supervisor'),
(124, 'Can view supervisor', 31, 'view_supervisor'),
(125, 'Can add surveillance', 32, 'add_surveillance'),
(126, 'Can change surveillance', 32, 'change_surveillance'),
(127, 'Can delete surveillance', 32, 'delete_surveillance'),
(128, 'Can view surveillance', 32, 'view_surveillance'),
(129, 'Can add vhfdaily', 33, 'add_vhfdaily'),
(130, 'Can change vhfdaily', 33, 'change_vhfdaily'),
(131, 'Can delete vhfdaily', 33, 'delete_vhfdaily'),
(132, 'Can view vhfdaily', 33, 'view_vhfdaily'),
(133, 'Can add vhfmonthly', 34, 'add_vhfmonthly'),
(134, 'Can change vhfmonthly', 34, 'change_vhfmonthly'),
(135, 'Can delete vhfmonthly', 34, 'delete_vhfmonthly'),
(136, 'Can view vhfmonthly', 34, 'view_vhfmonthly'),
(137, 'Can add vhfyearly', 35, 'add_vhfyearly'),
(138, 'Can change vhfyearly', 35, 'change_vhfyearly'),
(139, 'Can delete vhfyearly', 35, 'delete_vhfyearly'),
(140, 'Can view vhfyearly', 35, 'view_vhfyearly'),
(141, 'Can add auth group', 36, 'add_authgroup'),
(142, 'Can change auth group', 36, 'change_authgroup'),
(143, 'Can delete auth group', 36, 'delete_authgroup'),
(144, 'Can view auth group', 36, 'view_authgroup'),
(145, 'Can add auth group permissions', 37, 'add_authgrouppermissions'),
(146, 'Can change auth group permissions', 37, 'change_authgrouppermissions'),
(147, 'Can delete auth group permissions', 37, 'delete_authgrouppermissions'),
(148, 'Can view auth group permissions', 37, 'view_authgrouppermissions'),
(149, 'Can add auth permission', 38, 'add_authpermission'),
(150, 'Can change auth permission', 38, 'change_authpermission'),
(151, 'Can delete auth permission', 38, 'delete_authpermission'),
(152, 'Can view auth permission', 38, 'view_authpermission'),
(153, 'Can add auth user', 39, 'add_authuser'),
(154, 'Can change auth user', 39, 'change_authuser'),
(155, 'Can delete auth user', 39, 'delete_authuser'),
(156, 'Can view auth user', 39, 'view_authuser'),
(157, 'Can add auth user groups', 40, 'add_authusergroups'),
(158, 'Can change auth user groups', 40, 'change_authusergroups'),
(159, 'Can delete auth user groups', 40, 'delete_authusergroups'),
(160, 'Can view auth user groups', 40, 'view_authusergroups'),
(161, 'Can add auth user user permissions', 41, 'add_authuseruserpermissions'),
(162, 'Can change auth user user permissions', 41, 'change_authuseruserpermissions'),
(163, 'Can delete auth user user permissions', 41, 'delete_authuseruserpermissions'),
(164, 'Can view auth user user permissions', 41, 'view_authuseruserpermissions'),
(165, 'Can add django admin log', 42, 'add_djangoadminlog'),
(166, 'Can change django admin log', 42, 'change_djangoadminlog'),
(167, 'Can delete django admin log', 42, 'delete_djangoadminlog'),
(168, 'Can view django admin log', 42, 'view_djangoadminlog'),
(169, 'Can add django content type', 43, 'add_djangocontenttype'),
(170, 'Can change django content type', 43, 'change_djangocontenttype'),
(171, 'Can delete django content type', 43, 'delete_djangocontenttype'),
(172, 'Can view django content type', 43, 'view_djangocontenttype'),
(173, 'Can add django migrations', 44, 'add_djangomigrations'),
(174, 'Can change django migrations', 44, 'change_djangomigrations'),
(175, 'Can delete django migrations', 44, 'delete_djangomigrations'),
(176, 'Can view django migrations', 44, 'view_djangomigrations'),
(177, 'Can add django session', 45, 'add_djangosession'),
(178, 'Can change django session', 45, 'change_djangosession'),
(179, 'Can delete django session', 45, 'delete_djangosession'),
(180, 'Can view django session', 45, 'view_djangosession');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `f_id` (`f_id`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `communication`
--

INSERT INTO `communication` (`f_id`, `a_id`, `facility`, `make`, `model`, `power`, `DOI`, `DOC`, `location`, `emp_id`) VALUES
(1, 1, 'VHF TX/RX', 'PAE', 'T6T', 50, '2009-06-15', '2009-06-20', 'E/ROOM', 4144),
(2, 1, 'DATIS', 'TERMA', '50209', NULL, '2008-11-01', '2009-01-01', 'E/ROOM', 4156),
(3, 1, 'DSCN', 'MEMOTEC', 'CX 800', NULL, '2020-01-07', '2020-02-29', 'COM CENTRE', 4069);

-- --------------------------------------------------------

--
-- Table structure for table `datisdaily`
--

DROP TABLE IF EXISTS `datisdaily`;
CREATE TABLE IF NOT EXISTS `datisdaily` (
  `datisdaily_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
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
  `test` varchar(30) DEFAULT NULL,
  `f_id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`datisdaily_id`),
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`),
  KEY `f_id` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datisdaily`
--

INSERT INTO `datisdaily` (`datisdaily_id`, `date`, `time`, `a_id`, `emp_id`, `room_temp`, `status_of_AC`, `status_of_UPS`, `status_of_serverA`, `status_of_serverB`, `datetime_of_servers_wrt_GPS_CLK`, `status_of_Disk_array`, `VHFTX_ATIS_status`, `VHFRX_ATIS_status`, `DATIS_update`, `Audio_quality`, `REMARKS`, `Unit_incharge_approval`, `test`, `f_id`) VALUES
(1, '2020-03-20', '15:14:07', 1, 4156, 24, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', 'CORRECT', 'OK', 'ON LINE', 'ON LINE', 'OK', 'GOOD', NULL, 'YES', 'PASS', 2),
(2, '2020-03-21', '15:08:08', 1, 4156, 23, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(3, '2020-03-22', '14:05:02', 1, 4156, 24, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(4, '2020-03-23', '16:28:16', 1, 4156, 24, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(5, '2020-03-24', '14:01:01', 1, 4156, 24, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `datisdlogs`
--

DROP TABLE IF EXISTS `datisdlogs`;
CREATE TABLE IF NOT EXISTS `datisdlogs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `Remarks` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datisdlogs`
--

INSERT INTO `datisdlogs` (`log_id`, `emp_id`, `Remarks`, `Date`, `time`) VALUES
(1, 4156, 'Temperature exceeds 24 degrees', '2020-03-22', '14:06:07'),
(2, 4156, 'Temperature exceeds 24 degrees', '2020-03-23', '16:28:16'),
(3, 4156, 'Status of ups not NORMAL', '2020-03-23', '16:28:16'),
(4, 4156, 'Status of ServerB is not MAINS', '2020-03-23', '16:28:16'),
(5, 4156, 'Temperature not normal(update)', '2020-03-23', '16:28:24'),
(6, 4156, 'Status of ups not NORMAL(update)', '2020-03-23', '16:28:24'),
(7, 4156, 'Status of ServerB is not MAINS(update)', '2020-03-23', '16:28:24'),
(8, 4156, 'Temperature not normal(update)', '2020-03-23', '16:28:30'),
(9, 4156, 'Status of ups not NORMAL(update)', '2020-03-23', '16:28:30'),
(10, 4156, 'Temperature not normal(update)', '2020-03-23', '16:28:38'),
(11, 4156, 'Parameter/s fixed', '2020-03-23', '16:28:38'),
(12, 4156, 'Temperature exceeds 24 degrees', '2020-03-24', '14:01:01'),
(13, 4156, 'Status of ups not NORMAL', '2020-03-24', '14:01:01'),
(14, 4156, 'Status of ServerB is not MAINS', '2020-03-24', '14:01:01'),
(15, 4156, 'Temperature not normal(update)', '2020-03-24', '14:01:11'),
(16, 4156, 'Parameter/s fixed', '2020-03-24', '14:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `datisweekly`
--

DROP TABLE IF EXISTS `datisweekly`;
CREATE TABLE IF NOT EXISTS `datisweekly` (
  `datisweekly_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
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
  PRIMARY KEY (`datisweekly_id`),
  UNIQUE KEY `date` (`date`,`a_id`) USING BTREE,
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datisweekly`
--

INSERT INTO `datisweekly` (`datisweekly_id`, `date`, `time`, `a_id`, `emp_id`, `serverAorB`, `UPS_ip`, `UPS_op`, `Dust_free`, `LAN_status`, `time_sync`, `Audio_quality`, `ptt_off_interval_seconds`, `main_to_standby_changeover`, `status_of_ROP`, `REMARKS`, `Unit_incharge_approval`) VALUES
(1, '2020-03-09', '11:08:08', 1, 4156, 'B', 210, 230, 'OK', 'OK', 'OK', 'GOOD', 15, 'OK', 'OK', 'Residual dust was found on the system. Cleaning was performed.', 'YES'),
(2, '2020-03-16', '10:05:05', 1, 4156, 'A', 230, 230, 'OK', 'OK', 'OK', 'GOOD', 15, 'OK', 'OK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `datiswlogs`
--

DROP TABLE IF EXISTS `datiswlogs`;
CREATE TABLE IF NOT EXISTS `datiswlogs` (
  `logs_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `Remarks` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`logs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'login', 'airport'),
(8, 'login', 'cdvordaily'),
(9, 'login', 'cdvormonthly'),
(10, 'login', 'cdvorweekly'),
(11, 'login', 'communication'),
(12, 'login', 'datisdaily'),
(13, 'login', 'datisweekly'),
(14, 'login', 'dgm'),
(15, 'login', 'dmedaily'),
(16, 'login', 'dmemonthly'),
(17, 'login', 'dmeweekly'),
(18, 'login', 'dscndaily'),
(19, 'login', 'dscnmonthly'),
(20, 'login', 'dscnweekly'),
(21, 'login', 'engineer'),
(22, 'login', 'head'),
(23, 'login', 'issues'),
(24, 'login', 'navigation'),
(25, 'login', 'ndbdaily'),
(26, 'login', 'ndbmonthly'),
(27, 'login', 'ndbweekly'),
(28, 'login', 'scctvdaily'),
(29, 'login', 'scctvmonthly'),
(30, 'login', 'scctvweekly'),
(31, 'login', 'supervisor'),
(32, 'login', 'surveillance'),
(33, 'login', 'vhfdaily'),
(34, 'login', 'vhfmonthly'),
(35, 'login', 'vhfyearly'),
(36, 'login', 'authgroup'),
(37, 'login', 'authgrouppermissions'),
(38, 'login', 'authpermission'),
(39, 'login', 'authuser'),
(40, 'login', 'authusergroups'),
(41, 'login', 'authuseruserpermissions'),
(42, 'login', 'djangoadminlog'),
(43, 'login', 'djangocontenttype'),
(44, 'login', 'djangomigrations'),
(45, 'login', 'djangosession');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-22 15:28:48.581167'),
(2, 'auth', '0001_initial', '2020-03-22 15:28:49.597827'),
(3, 'admin', '0001_initial', '2020-03-22 15:28:51.916483'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-22 15:28:52.448386'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-22 15:28:52.476400'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-22 15:28:52.706563'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-22 15:28:52.924939'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-22 15:28:53.112013'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-22 15:28:53.168037'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-22 15:28:53.346699'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-22 15:28:53.370675'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-22 15:28:53.430678'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-22 15:28:53.639158'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-22 15:28:53.812434'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-03-22 15:28:53.994867'),
(16, 'auth', '0011_update_proxy_permissions', '2020-03-22 15:28:54.046859'),
(17, 'sessions', '0001_initial', '2020-03-22 15:28:54.246377'),
(18, 'login', '0001_initial', '2020-03-25 06:21:57.845475'),
(19, 'login', '0002_delete_manors', '2020-03-25 06:21:57.925450'),
(20, 'login', '0003_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_django', '2020-03-25 06:21:58.021445');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
('2020-03-20 18:13:26', 1, 4069, 'STEADY ON', 'STEADY ON', 'STEADY ON', 'OFF', 'STEADY ON', 'RX/TX BLINKING', 230, 220, 210, 'OK', NULL, 'YES'),
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
('2020-03-20 18:21:20', 1, 4069, 'Cleaning performed.', '15hrs ', 'Can withstand load ', 'All antennas and cables properly connected.', 'All connections are maintained.', 25, 'GOOD', NULL, 'YES');

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
('2020-03-20 18:21:51', 1, 4069, 'ALL installed AC\'s working.', 'ALL DSCN related equipments were cleaned.', 'UPS1 & UPS2 battery backup maintained.', 'Can withstand load', 'All cables and Antenna properly connected', NULL, 'YES');

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
('2020-03-20 18:09:52', 4144, 1, 1, 119, 'PASS', 'READY', 'RXN NORMAL', 'C/O NORMAL', -82, NULL, 'YES');

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
('2020-03-20 18:18:14', 4144, 1, 'AM-Voice', 12, 'OFF', -107, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES'),
('2020-03-20 18:18:34', 4144, 1, 'AM-Voice', 11, 'ON', -103, 'OFF', 'OFF', 'ON', 'NO', 'STD', 'STD', 'STD', 'STD', 'PASS', 'Issue no. 504. Squelch defeat observed to be ON. Ready Signal being NON-STD. Referred to AGM-CE', 'NO'),
('2020-03-20 18:18:58', 4144, 1, 'FM-Voice', 12, 'OFF', -105, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES'),
('2020-03-20 18:19:20', 4144, 1, 'PM-Voice', 10, 'OFF', -107, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES');

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
('2020-03-20 18:20:31', 4144, 1, 1, 119, 20.95, 43, 'FAIL', 'Abnormal(DC)', 'Bit test failure and abnormal AC to DC changeover observed. Referred to AGM-CE.\r\nIssue no. 517', 'NO');

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
