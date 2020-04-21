-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 19, 2020 at 02:44 PM
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
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `dgm_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `xyz` (`dgm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`a_id`, `name`, `altitude`, `area`, `longitude`, `latitude`, `code`, `dgm_id`) VALUES
(1, 'Vadodara', 129, 149, '22.3325', '73.2171', 'BDQ', 22102),
(2, 'Dabolim', 132, 121, '15.3803', '73.8350', 'GOI', 22102),
(3, 'Sahar', 142, 125, '19.0896', '72.8656', 'BOM', 22102),
(4, 'Delhi', 151, 120, '28.5562', '77.1000', 'DEL', 22102);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `Azimuth_angle` int(11) NOT NULL,
  `30Hz_modulation` int(11) DEFAULT NULL,
  `9960Hz_modulation` int(11) DEFAULT NULL,
  `9960Hz_deviation` int(11) DEFAULT NULL,
  `field_intensity` int(11) DEFAULT NULL,
  `ident_modulation` int(11) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  KEY `emp_id_2` (`emp_id`),
  KEY `cdfk` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdvordaily`
--

INSERT INTO `cdvordaily` (`date`, `a_id`, `emp_id`, `Azimuth_angle`, `30Hz_modulation`, `9960Hz_modulation`, `9960Hz_deviation`, `field_intensity`, `ident_modulation`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:36:33', 1, 11144, 23, 28, 32, 17, 1, 11, NULL, 'YES'),
('2020-03-18 16:36:33', 1, 11131, 24, 30, 30, 16, 0, 10, NULL, 'YES');

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
  `bearing_deviation_2` float NOT NULL,
  `measured_bearing_3` float DEFAULT NULL,
  `bearing_deviation_3` float DEFAULT NULL,
  `measured_deviation_4` float DEFAULT NULL,
  `bearing_deviation_4` float DEFAULT NULL,
  `measured_deviation_5` float DEFAULT NULL,
  `bearing_deviation_5` float DEFAULT NULL,
  `error_spread` float DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  KEY `a_id` (`a_id`,`emp_id`),
  KEY `cdmfk2` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdvormonthly`
--

INSERT INTO `cdvormonthly` (`date`, `a_id`, `emp_id`, `measured_bearing_1`, `bearing_deviation_1`, `measured_bearing_2`, `bearing_deviation_2`, `measured_bearing_3`, `bearing_deviation_3`, `measured_deviation_4`, `bearing_deviation_4`, `measured_deviation_5`, `bearing_deviation_5`, `error_spread`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:36:00', 1, 11123, 0, 0, 7.5, 0, 15, 0, 22.5, 0, 37.5, 0, 0, NULL, 'YES'),
('2020-03-18 16:36:00', 1, 11133, 0, 0, 8, 0.5, 16, 1, 22.5, 0, 37.8, 0.3, 1.8, 'Error spread found of 1.8, which is nominal.', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `cdvorweekly`
--

DROP TABLE IF EXISTS `cdvorweekly`;
CREATE TABLE IF NOT EXISTS `cdvorweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `PS_5V` int(11) NOT NULL,
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
  KEY `week1` (`a_id`),
  KEY `rty` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdvorweekly`
--

INSERT INTO `cdvorweekly` (`date`, `a_id`, `emp_id`, `PS_5V`, `PS_12V`, `PS_negative_12V`, `PS_28V`, `PS_48V`, `outside_temp`, `TX1_temp`, `TX2_temp`, `Out_temp_enabled`, `AM`, `FM`, `sideband_frequency`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:35:04', 1, 11112, 4, 10, -13, 29, 41, 79, 44, 49, 'FALSE', 30, 30, 10001, 'PS 5V,PS 12V,PS -12V, reading deviating too much. Issue no 519', 'NO');

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
  KEY `comfk1` (`a_id`),
  KEY `comfk2` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `communication`
--

INSERT INTO `communication` (`f_id`, `a_id`, `facility`, `make`, `model`, `power`, `DOI`, `DOC`, `location`, `emp_id`) VALUES
(1, 1, 'VHF TX/RX', 'PAE', 'T6T', 50, '2009-06-15', '2009-06-20', 'E/ROOM', 11144),
(2, 1, 'DATIS', 'TERMA', '50209', NULL, '2008-11-01', '2009-01-01', 'E/ROOM', 11123),
(3, 1, 'DSCN', 'MEMOTEC', 'CX 800', NULL, '2020-01-07', '2020-02-29', 'COM CENTRE', 11156);

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
  `DATIS_update` varchar(10) NOT NULL,
  `Audio_quality` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  KEY `datis1` (`a_id`),
  KEY `datis2` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datisdaily`
--

INSERT INTO `datisdaily` (`date`, `a_id`, `emp_id`, `room_temp`, `status_of_AC`, `status_of_UPS`, `status_of_serverA`, `status_of_serverB`, `datetime_of_servers_wrt_GPS_CLK`, `status_of_Disk_array`, `VHFTX_ATIS_status`, `VHFRX_ATIS_status`, `DATIS_update`, `Audio_quality`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:34:10', 1, 11121, 24, 'SVCBL', 'NORMAL', 'MAINS', 'MAINS', 'CORRECT', 'OK', 'ON LINE', 'ON LINE', 'OK', 'GOOD', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `datisweekly`
--

DROP TABLE IF EXISTS `datisweekly`;
CREATE TABLE IF NOT EXISTS `datisweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `serverAorB` varchar(1) NOT NULL,
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
  KEY `dwe1` (`a_id`),
  KEY `dwe2` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datisweekly`
--

INSERT INTO `datisweekly` (`date`, `a_id`, `emp_id`, `serverAorB`, `UPS_ip`, `UPS_op`, `Dust_free`, `LAN_status`, `time_sync`, `Audio_quality`, `ptt_off_interval_seconds`, `main_to_standby_changeover`, `status_of_ROP`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:33:22', 1, 11121, 'B', 210, 230, 'NO', 'OK', 'OK', 'GOOD', 15, 'OK', 'OK', 'Residual dust was found on the system. Cleaning was performed.', 'YES'),
('2020-03-18 16:33:22', 1, 11133, 'A', 230, 230, 'YES', 'OK', 'OK', 'GOOD', 15, 'OK', 'OK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dgm`
--

DROP TABLE IF EXISTS `dgm`;
CREATE TABLE IF NOT EXISTS `dgm` (
  `emp_id` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `dept` varchar(1) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `a_id` (`a_id`),
  KEY `supervisor_id` (`supervisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dgm`
--

INSERT INTO `dgm` (`emp_id`, `password`, `name`, `designation`, `contact`, `dept`, `a_id`, `supervisor_id`) VALUES
(22102, '3455', 'Linus Torvaldos', 'DGM', 9511138, '', 1, 33101);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-17 17:17:24.415610'),
(2, 'auth', '0001_initial', '2020-03-17 17:17:24.907607'),
(3, 'admin', '0001_initial', '2020-03-17 17:17:26.467365'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-17 17:17:26.898007'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-17 17:17:26.908977'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-17 17:17:27.155177'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-17 17:17:27.261604'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-17 17:17:27.343667'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-17 17:17:27.352544'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-17 17:17:27.447484'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-17 17:17:27.459634'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-17 17:17:27.481172'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-17 17:17:27.568005'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-17 17:17:27.629170'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-03-17 17:17:27.690618'),
(16, 'auth', '0011_update_proxy_permissions', '2020-03-17 17:17:27.716975');

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
  `stabiliser_output` int(11) NOT NULL,
  `batterybank_voltage` int(11) DEFAULT NULL,
  `status_of_monitor` varchar(10) DEFAULT NULL,
  `unusual_noise` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  KEY `dme1` (`a_id`),
  KEY `fk223` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dmedaily`
--

INSERT INTO `dmedaily` (`date`, `a_id`, `emp_id`, `eqpt_shelter_cleanliness`, `Battery_room_cleanliness`, `AC_status`, `eqpt_shelter_temperature`, `mains_power_supply`, `stabiliser_output`, `batterybank_voltage`, `status_of_monitor`, `unusual_noise`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:32:19', 1, 11144, 'DUST FREE', 'DUST FREE', 'SERVICABLE', 22, 221, 219, 24, 'OK', 'NO', NULL, 'YES'),
('2020-03-18 16:32:19', 1, 11156, 'DUST FREE', 'NOT CLEAN', 'SERVICABLE', 24, 215, 221, 24, 'OK', 'YES', 'Battery room found not clean. Noise was audible from the DME.Issue no. 520', 'NO');

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
  PRIMARY KEY (`date`),
  KEY `fk14345` (`a_id`),
  KEY `fk1434543` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dmemonthly`
--

INSERT INTO `dmemonthly` (`date`, `a_id`, `emp_id`, `SGDNF_pulse_width`, `SGDNF_amplitude`, `Squitter_rate_of_inhibit_interrogation`, `max_reply_rate_KHz`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:31:32', 1, 11121, 6, 12, 0.94, 2.7, NULL, 'YES');

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
  PRIMARY KEY (`date`),
  KEY `dmwke` (`a_id`),
  KEY `dmwke2` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dmeweekly`
--

INSERT INTO `dmeweekly` (`date`, `a_id`, `emp_id`, `test_interrogation_module`, `RX_video_module`, `100W_module`, `Monitor_module`, `AC_regulator_ip`, `AC_regulator_op`, `system_delay`, `pulse_pair_spacing_SEPN`, `reply_efficiency_percent`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:31:09', 1, 11123, 15, 15, 15, 15, 240, 230, 50.8, 12.25, 89, NULL, 'YES'),
('2020-03-18 16:31:13', 1, 11133, 16, 15, 15, 15, 248, 230, 50, 12, 74, NULL, 'YES');

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
  PRIMARY KEY (`date`),
  KEY `ery1` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dscndaily`
--

INSERT INTO `dscndaily` (`date`, `a_id`, `emp_id`, `SAT_LED`, `ODU_LED`, `IO_LED`, `Alarm_LED`, `Power_LED`, `V35_LED`, `IP_Voltage`, `OP_voltage`, `Battery_Voltage`, `CorO_function`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:30:27', 1, 11121, 'STEADY ON', 'STEADY ON', 'STEADY ON', 'OFF', 'STEADY ON', 'RX/TX BLINKING', 230, 220, 210, 'OK', NULL, 'YES'),
('2020-03-18 16:30:33', 1, 11123, 'STEADY ON', 'STEADY ON', 'STEADY ON', 'ON', 'STEADY ON', 'RX/TX BLINKING', 230, 200, 170, 'OK', 'Alarm LED found ON.\r\nLess voltage generated at the output side of the UPS. This giving rise to even lesser and insufficient battery voltage of 170V.\r\nIssue no 518. Referred to AGM-CE', 'NO');

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
  UNIQUE KEY `emp_id` (`emp_id`) USING BTREE,
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dscnmonthly`
--

INSERT INTO `dscnmonthly` (`date`, `a_id`, `emp_id`, `Cleaning_DSCN_associated_eqpt`, `Battery_backup_time_of_UPS1nUPS2`, `UPS_battery_voltage_on_load`, `Antenna_n_cable_check`, `Earth_resistance`, `EorN_voltage`, `eqpt_status_after_check`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:30:05', 1, 11123, 'Cleaning performed.', '15hrs ', 'Can withstand load ', 'All antennas and cables properly connected.', 'All connections are maintained.', 25, 'GOOD', NULL, 'YES');

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
  PRIMARY KEY (`date`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dscnweekly`
--

INSERT INTO `dscnweekly` (`date`, `a_id`, `emp_id`, `Air_conditioning_check`, `Cleaning_DSCN_associated_eqpt`, `UPS1_UPS2_battery_backup`, `UPS_battery_voltage_on_load`, `Antenna_n_Cable_check`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:29:13', 1, 11121, 'ALL installed AC\'s working.', 'ALL DSCN related equipments were cleaned.', 'UPS1 & UPS2 battery backup maintained.', 'Can withstand load', 'All cables and Antenna properly connected', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
CREATE TABLE IF NOT EXISTS `engineer` (
  `emp_id` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `dept` varchar(1) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `a_id` (`a_id`),
  KEY `supervisor_id` (`supervisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `engineer`
--

INSERT INTO `engineer` (`emp_id`, `password`, `name`, `designation`, `contact`, `dept`, `a_id`, `supervisor_id`) VALUES
(11112, '788', 'BP Singh', 'AGM CT', 1122121, 'N', 1, NULL),
(11121, '345', 'Umesh Backzop', 'MGR CT', 129862, 'N', 1, NULL),
(11123, '657', 'Ketan Hackerman', 'AM', 168723, 'N', 1, NULL),
(11129, '769', 'Ramesh Sharma', 'JET', 965433, 'N', 1, NULL),
(11131, '7809', 'Chandresh Reddy', 'MGR SR', 7655221, 'S', 1, NULL),
(11132, '7895', 'Suresh Kelkar', 'AM', 197541, 'S', 1, NULL),
(11133, '45656', 'Thon Thangal', 'JET', 186431, 'S', 1, NULL),
(11144, '222', 'Hudson Odoi', 'AM', 114132, 'C', 1, NULL),
(11156, '79', 'Mason Mount', 'JET', 1132123, 'C', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `head`
--

DROP TABLE IF EXISTS `head`;
CREATE TABLE IF NOT EXISTS `head` (
  `emp_id` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `head`
--

INSERT INTO `head` (`emp_id`, `password`, `name`, `designation`, `contact`) VALUES
(33101, '345', 'Nisarg', 'ED-CNS', 95187238);

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
  KEY `fk1` (`emp_id`),
  KEY `fk2` (`approved_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_no`, `date`, `a_id`, `emp_id`, `desgn`, `dept`, `facility_affected`, `observations`, `actions_taken`, `approved_by`) VALUES
(503, '2020-03-18 16:26:54', 1, 11144, 'AM', 'C', 'VHF RX (PAE)', 'Bit test failure was observed. This lead to non availability of the instrument.', 'Switched to standby receiver from VCS operator position for tower main frequency i.e. 118.65 MHz.', NULL),
(504, '2020-03-18 16:26:54', 1, 11156, 'JET', 'C', 'VHF RX (PAE)', 'Ready signal not found to be Standard. Squelch defeat was observed to be ON. Squelch threshold varying more than usual. ', 'ATCO switched to alternate frequency', NULL),
(517, '2020-03-18 16:26:54', 1, 11129, 'MGR CE', 'C', 'VHF RX (PAE)', 'Bit test failure and abnormal AC to DC changeover observed. Referred to AGM-CE.\r\n', 'Emergency frequency utilised as per standard operating procedure from standard transmitter at EMERGENCY frequency of 121.5 MHz.', NULL),
(518, '2020-03-18 16:26:54', 1, 11131, 'MGR CE', 'C', 'DSCN', 'Less voltage generated at the output side of the UPS. This giving rise to even lesser and insufficient battery voltage of 170V.\r\n', 'Class B surge diverter was found producing anomalies. Standby replacement was used on MGR CE\'s recommendation.', NULL),
(519, '2020-03-18 16:26:54', 1, 11123, 'JET', 'N', 'DVOR', 'PS 5V,PS 12V,PS -12V, reading deviating too much. This caused temperature to rise beyond the threshold of 70 degrees, recording 79 degrees.\r\nClass C surge diverter found faulty.', 'Class C surge diverter sent for repairing. Facility suspended till further notice.', NULL),
(520, '2020-03-18 16:26:54', 1, 11123, 'AM', 'N', 'DME (HP)', 'Battery room not clean. This led to less voltage generation as per recommendation. This further lead to the sound produced by the DME due to low power supply.', 'Room was cleaned and the connections were thoroughly checked.', NULL),
(521, '2020-03-18 16:26:54', 1, 11144, 'JET', 'N', 'NDB', 'Forward power observed to be very less (80W) as compared to (100W). This has led to decrease in reflected power.\r\n', 'Fault in UPS 1(Master) power supply. No spares available. This particular NDB is suspended until further notice. Spare NDB from Udaipur station has been called out. ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
CREATE TABLE IF NOT EXISTS `navigation` (
  `f_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
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
  PRIMARY KEY (`f_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`f_id`, `a_id`, `facility`, `frequency`, `power`, `IDNT`, `coordinateN`, `coordinateE`, `eqpt`, `DOI`, `DOC`, `emp_id`) VALUES
(1, 1, 'DVOR', 117, 100, 'QQZ', '22 19\'58.2', '73 13\'30.5', 'AMS 1150', '2001-09-11', '2001-09-18', 11144),
(2, 1, 'DME (HP)', 1144, 1000, 'QQZ', '22 19\'58.2', '73 13\'30.5', 'GCEL 753', '2001-10-19', '2001-10-28', 11156),
(3, 1, 'NDB', 0, 100, 'QZ', '22 20\'5.2', '73 12\'33.6', 'SAC-100', '2019-07-22', '2019-11-07', 11129);

-- --------------------------------------------------------

--
-- Table structure for table `ndbdaily`
--

DROP TABLE IF EXISTS `ndbdaily`;
CREATE TABLE IF NOT EXISTS `ndbdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
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
  PRIMARY KEY (`date`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ndbdaily`
--

INSERT INTO `ndbdaily` (`date`, `a_id`, `emp_id`, `room_temp`, `ac_mains_voltage_50Hz`, `battery_voltage`, `reflected_power`, `forward_power`, `modulation`, `system_status_LED`, `Primary_TX_LED`, `TX_power_ON_LED`, `remote_ctrl_link_LED`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:25:57', 1, 11129, 20, 225, 24, 18, 100, 87, 'ON', 'ON', 'ON', 'BLINKING', NULL, 'YES'),
('2020-03-18 16:26:00', 1, 11129, 20, 230, 21, 18, 100, 90, 'ON', 'ON', 'ON', 'BLINKING', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `ndbmonthly`
--

DROP TABLE IF EXISTS `ndbmonthly`;
CREATE TABLE IF NOT EXISTS `ndbmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `frwd_power_modulation_OFF` int(11) DEFAULT NULL,
  `reflected_power` int(11) DEFAULT NULL,
  `modulation_depth_check` int(11) DEFAULT NULL,
  `ident_code_check` varchar(10) DEFAULT NULL,
  `antenna_n_ACU_check` varchar(20) DEFAULT NULL,
  `NDB_eqpt_n_ACU_cleaning` varchar(10) DEFAULT NULL,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`date`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ndbmonthly`
--

INSERT INTO `ndbmonthly` (`date`, `a_id`, `emp_id`, `frwd_power_modulation_OFF`, `reflected_power`, `modulation_depth_check`, `ident_code_check`, `antenna_n_ACU_check`, `NDB_eqpt_n_ACU_cleaning`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:25:40', 1, 11144, 100, 15, 92, 'VALID', 'GOOD', 'DONE', NULL, 'YES'),
('2020-03-18 16:25:43', 1, 11132, 80, 10, 82, 'VALID', 'GOOD', 'DONE', 'Forward power observed to be very less (80W) as compared to (100W). This has led to decrease in reflected power.\r\nReferred to AGM-CT. Issue no. 521.', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `ndbweekly`
--

DROP TABLE IF EXISTS `ndbweekly`;
CREATE TABLE IF NOT EXISTS `ndbweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `mains_pwr_supply_check` tinytext,
  `battery_terminals_check` tinytext,
  `battery_sealed` varchar(3) DEFAULT NULL,
  `specific_gravity` float DEFAULT NULL,
  `antenna_site_condition` tinytext,
  `REMARKS` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`date`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ndbweekly`
--

INSERT INTO `ndbweekly` (`date`, `a_id`, `emp_id`, `mains_pwr_supply_check`, `battery_terminals_check`, `battery_sealed`, `specific_gravity`, `antenna_site_condition`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:25:18', 1, 11121, 'OK', 'OK', 'YES', 12.3, 'OK', NULL, 'YES'),
('2020-03-18 16:25:22', 1, 11133, 'OK', 'OK', 'NO', 12, 'OK', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `scctvdaily`
--

DROP TABLE IF EXISTS `scctvdaily`;
CREATE TABLE IF NOT EXISTS `scctvdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
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
  PRIMARY KEY (`date`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scctvdaily`
--

INSERT INTO `scctvdaily` (`date`, `a_id`, `emp_id`, `UPS_battery_indication`, `Servers_ON_condition`, `NAS_status_in_VMSorVRM`, `recording_active_status_VRS_server`, `recording_active_status_RRS_server`, `database_status_VMS`, `cameras_IVMS`, `eqpt_cleaning`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:24:52', 1, 11121, 'FULL', 'OK', 'OK', 32, 'PAUSE', 'OK', 'OK', 'OK', NULL, 'YES'),
('2020-03-18 16:24:54', 1, 11132, 'FULL', 'OK', 'OK', 32, 'PAUSE', 'OK', 'OK', 'CARRIED OUT', NULL, 'YES'),
('2020-03-18 16:25:00', 1, 11156, 'FULL', 'OK', 'OK', 32, 'PAUSE', 'OK', 'OK', 'OK', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `scctvmonthly`
--

DROP TABLE IF EXISTS `scctvmonthly`;
CREATE TABLE IF NOT EXISTS `scctvmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
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
  PRIMARY KEY (`date`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scctvmonthly`
--

INSERT INTO `scctvmonthly` (`date`, `a_id`, `emp_id`, `ups_ip_voltage`, `ups_op_voltage`, `ups_battery_op_voltage_ACpwrON`, `ups_battery_op_voltage_ACpwrOFF`, `ups_battery_op_voltage_after15min_ACpwrOFF`, `server_status`, `cameras_in_VRS_server`, `NAS_free_capacity`, `OFClinkto_L2L3_switches`, `cleaning_camera_eqpt`, `user_rights_check`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:24:28', 1, 11123, 235, 225, 203, 191, 176, 'ON', 'ACCESSIBLE', 1.24, 'BLINKING GREEN', 'CARRIED OUT', 'OK', NULL, 'YES'),
('2020-03-18 16:24:33', 1, 11133, 230, 225, 208, 186, 176, 'ON', 'OK', 9.2, 'BLINKING GREEN', 'CARRIED OUT', 'OK', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `scctvweekly`
--

DROP TABLE IF EXISTS `scctvweekly`;
CREATE TABLE IF NOT EXISTS `scctvweekly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id` int(11) NOT NULL,
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
  PRIMARY KEY (`date`,`a_id`),
  KEY `a_id` (`a_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scctvweekly`
--

INSERT INTO `scctvweekly` (`date`, `a_id`, `emp_id`, `ups_ip_voltage`, `ups_op_voltage`, `ups_battery_status`, `server_status`, `camera_NAS_status_in_VRS`, `workstns_n_client_softw_check`, `cameras_client_IVMS_softw`, `NAS_free_capacity`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:22:03', 1, 11144, 230, 225, 'FULL', 'OK', 'OK', 'OK', 'OK', 1.23, 'NAS_free_capacity not to be equal to 0.', 'YES'),
('2020-03-18 16:22:05', 1, 11132, 225, 220, 'FULL', 'OK', 'OK', 'OK', 'OK', 1.34, NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE IF NOT EXISTS `supervisor` (
  `emp_id` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `dept` varchar(1) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`emp_id`, `password`, `name`, `designation`, `contact`, `dept`, `a_id`) VALUES
(12181, '567', 'Mahesh Gotawandi', 'AGM SR', 3211122, 'S', 1),
(12193, '568', 'Corey Schrafer', 'AGM CE', 121212, 'C', 1),
(12690, '123', 'Varun Naik', 'MGR CE', 866651, 'C', 1);

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
  PRIMARY KEY (`f_id`),
  KEY `emp_id` (`emp_id`),
  KEY `surv_ibfk_1` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surveillance`
--

INSERT INTO `surveillance` (`f_id`, `a_id`, `facility`, `eqpt`, `DOI`, `DOC`, `emp_id`) VALUES
(1, 1, 'X-BIS', 'H.S.6040i', '2007-12-10', '2008-01-19', 11156),
(2, 1, 'ETD', '500 T', '2000-08-09', '0200-08-18', 11156),
(3, 1, 'SCCTV', 'INFINOVA', '1999-09-08', '1999-10-11', 11144);

-- --------------------------------------------------------

--
-- Table structure for table `vhfdaily`
--

DROP TABLE IF EXISTS `vhfdaily`;
CREATE TABLE IF NOT EXISTS `vhfdaily` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) DEFAULT NULL,
  `a_id` int(11) NOT NULL,
  `RX_no` int(11) DEFAULT NULL,
  `frequency_MHz` int(11) DEFAULT NULL,
  `bit_test` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `RXN_check` varchar(10) DEFAULT NULL,
  `ACorDC_CorO` varchar(10) DEFAULT NULL,
  `SQ_threshold` int(11) DEFAULT NULL,
  `Remarks` tinytext,
  `Unit_Incharge_Approval` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`date`,`a_id`),
  KEY `emp_id` (`emp_id`),
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vhfdaily`
--

INSERT INTO `vhfdaily` (`date`, `emp_id`, `a_id`, `RX_no`, `frequency_MHz`, `bit_test`, `status`, `RXN_check`, `ACorDC_CorO`, `SQ_threshold`, `Remarks`, `Unit_Incharge_Approval`) VALUES
('2020-03-18 16:20:48', 11144, 1, 1, 120, 'PASS', 'READY', 'NORMAL', 'C/O NORMAL', -85, 'SQ threshold < -80 DBm as expected.\r\nMaintenance carried out for VHF RX for model type of PAE.', 'YES'),
('2020-03-18 16:20:52', 11112, 1, 1, 119, 'PASS', 'READY', 'RXN NORMAL', 'C/O NORMAL', -82, NULL, 'YES'),
('2020-03-18 16:20:56', 11133, 1, 1, 122, 'FAIL', 'NOT READY', 'RXN NORMAL', 'C/O NORMAL', -79, 'Referred to AGM_CE.Issue no 503', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `vhfmonthly`
--

DROP TABLE IF EXISTS `vhfmonthly`;
CREATE TABLE IF NOT EXISTS `vhfmonthly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) DEFAULT NULL,
  `a_id` int(11) NOT NULL,
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
  KEY `emp_id` (`emp_id`),
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vhfmonthly`
--

INSERT INTO `vhfmonthly` (`date`, `emp_id`, `a_id`, `modulation_mode`, `line_op`, `squelch_defeat`, `squelch_threshold`, `squelch_carrier_override`, `RF_pre_ATTN`, `AGC`, `Ready_signal`, `Squelch_op_marc`, `Squelch_op_facilities`, `Squelch_op_phantom`, `Squelch_defeat_ip`, `bit_test`, `REMARKS`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:19:20', 11144, 1, 'AM-Voice', 12, 'OFF', -107, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES'),
('2020-03-18 16:19:23', 11129, 1, 'AM-Voice', 11, 'ON', -103, 'OFF', 'OFF', 'ON', 'NO', 'STD', 'STD', 'STD', 'STD', 'PASS', 'Issue no. 504. Squelch defeat observed to be ON. Ready Signal being NON-STD. Referred to AGM-CE', 'NO'),
('2020-03-18 16:19:30', 11133, 1, 'FM-Voice', 12, 'OFF', -105, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES'),
('2020-03-18 16:20:07', 11144, 1, 'PM-Voice', 10, 'OFF', -107, 'OFF', 'OFF', 'ON', 'STD', 'STD', 'STD', 'STD', 'STD', 'PASS', NULL, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `vhfyearly`
--

DROP TABLE IF EXISTS `vhfyearly`;
CREATE TABLE IF NOT EXISTS `vhfyearly` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) DEFAULT NULL,
  `a_id` int(11) NOT NULL,
  `RX_no` int(11) DEFAULT NULL,
  `frequency_MHz` float DEFAULT NULL,
  `reference_freq` float DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `bit_test` varchar(5) DEFAULT NULL,
  `AC_DC_changeover` varchar(20) DEFAULT NULL,
  `Remarks` tinytext,
  `Unit_incharge_approval` varchar(3) DEFAULT NULL,
  KEY `emp_id` (`emp_id`),
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vhfyearly`
--

INSERT INTO `vhfyearly` (`date`, `emp_id`, `a_id`, `RX_no`, `frequency_MHz`, `reference_freq`, `power`, `bit_test`, `AC_DC_changeover`, `Remarks`, `Unit_incharge_approval`) VALUES
('2020-03-18 16:16:09', 11156, 1, 1, 120, 20.95, 26, 'PASS', 'NORMAL(DC)', NULL, 'YES'),
('2020-03-18 16:16:14', 11144, 1, 1, 119, 20.95, 43, 'FAIL', 'Abnormal(DC)', 'Bit test failure and abnormal AC to DC changeover observed. Referred to AGM-CE.\r\nIssue no. 517', 'NO');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `xyz` FOREIGN KEY (`dgm_id`) REFERENCES `dgm` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cdvordaily`
--
ALTER TABLE `cdvordaily`
  ADD CONSTRAINT `cdfk` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cdfk2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cdvormonthly`
--
ALTER TABLE `cdvormonthly`
  ADD CONSTRAINT `cdmfk` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cdmfk2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cdvorweekly`
--
ALTER TABLE `cdvorweekly`
  ADD CONSTRAINT `rty` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `week1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `communication`
--
ALTER TABLE `communication`
  ADD CONSTRAINT `comfk1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `comfk2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `datisdaily`
--
ALTER TABLE `datisdaily`
  ADD CONSTRAINT `datis1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `datis2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `datisweekly`
--
ALTER TABLE `datisweekly`
  ADD CONSTRAINT `dwe1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `dwe2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `dgm`
--
ALTER TABLE `dgm`
  ADD CONSTRAINT `abc` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dmedaily`
--
ALTER TABLE `dmedaily`
  ADD CONSTRAINT `dme1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk223` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`);

--
-- Constraints for table `dmemonthly`
--
ALTER TABLE `dmemonthly`
  ADD CONSTRAINT `fk14345` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk1434543` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `dmeweekly`
--
ALTER TABLE `dmeweekly`
  ADD CONSTRAINT `dmwke` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `dmwke2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `dscndaily`
--
ALTER TABLE `dscndaily`
  ADD CONSTRAINT `dscndaily_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `ery1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `dscnmonthly`
--
ALTER TABLE `dscnmonthly`
  ADD CONSTRAINT `dscnmonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `dscnmonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `dscnweekly`
--
ALTER TABLE `dscnweekly`
  ADD CONSTRAINT `dscnweekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `dscnweekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `eng_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisor` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`approved_by`) REFERENCES `dgm` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `navigation`
--
ALTER TABLE `navigation`
  ADD CONSTRAINT `navigation_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `navigation_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ndbdaily`
--
ALTER TABLE `ndbdaily`
  ADD CONSTRAINT `NDBDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NDBDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ndbmonthly`
--
ALTER TABLE `ndbmonthly`
  ADD CONSTRAINT `NDBMonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NDBMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ndbweekly`
--
ALTER TABLE `ndbweekly`
  ADD CONSTRAINT `NDBWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NDBWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scctvdaily`
--
ALTER TABLE `scctvdaily`
  ADD CONSTRAINT `SCCTVDaily_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SCCTVDaily_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scctvmonthly`
--
ALTER TABLE `scctvmonthly`
  ADD CONSTRAINT `SCCTVMonthly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`),
  ADD CONSTRAINT `SCCTVMonthly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scctvweekly`
--
ALTER TABLE `scctvweekly`
  ADD CONSTRAINT `SCCTVWeekly_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SCCTVWeekly_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `surveillance`
--
ALTER TABLE `surveillance`
  ADD CONSTRAINT `surv_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `surv_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vhfdaily`
--
ALTER TABLE `vhfdaily`
  ADD CONSTRAINT `VHFDaily_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `VHFDaily_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vhfmonthly`
--
ALTER TABLE `vhfmonthly`
  ADD CONSTRAINT `VHFM_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `VHFM_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vhfyearly`
--
ALTER TABLE `vhfyearly`
  ADD CONSTRAINT `qwe` FOREIGN KEY (`emp_id`) REFERENCES `engineer` (`emp_id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
