-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.13 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for finegallians
DROP DATABASE IF EXISTS `finegallians`;
CREATE DATABASE IF NOT EXISTS `finegallians` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `finegallians`;

-- Dumping structure for table finegallians.booking
DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingdate` date DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `pitchid` int(11) DEFAULT NULL,
  `fee` decimal(18,3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`memberid`),
  KEY `pitchid` (`pitchid`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`pitchid`) REFERENCES `pitch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.booking: ~17 rows (approximately)
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`id`, `bookingdate`, `starttime`, `endtime`, `memberid`, `pitchid`, `fee`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '2017-01-07', '09:00:00', '11:00:00', 2, 3, 10.000, NULL, NULL, NULL),
	(2, '2017-02-11', '16:00:00', '17:00:00', 5, 3, 10.000, NULL, NULL, NULL),
	(3, '2016-11-16', '10:00:00', '12:00:00', 4, 2, 20.000, NULL, NULL, NULL),
	(4, '2017-04-06', '14:00:00', '16:00:00', 2, 5, 10.000, NULL, NULL, NULL),
	(5, '2017-01-17', '17:00:00', '18:00:00', 5, 6, 10.000, NULL, NULL, NULL),
	(6, '2017-05-06', '15:00:00', '17:00:00', 3, 6, 15.000, NULL, NULL, NULL),
	(7, '2017-04-27', '09:00:00', '11:00:00', 2, 3, 10.000, NULL, NULL, NULL),
	(8, '2016-05-05', '16:00:00', '17:00:00', 5, 3, 10.000, NULL, NULL, NULL),
	(9, '2017-03-23', '10:00:00', '12:00:00', 4, 2, 20.000, NULL, NULL, NULL),
	(10, '2020-04-11', '00:00:02', '00:00:04', 4, 5, 6.000, '2020-04-30 13:51:27', '2020-04-30 13:51:27', NULL),
	(11, '2020-01-01', '00:00:06', '00:00:04', 5, 3, 20.000, '2020-04-30 14:58:52', '2020-04-30 14:58:52', NULL),
	(12, '2020-04-17', '00:00:06', '00:00:08', 6, 4, 10.000, '2020-04-30 18:39:45', '2020-04-30 18:39:45', NULL),
	(13, '2020-05-12', '00:00:03', '00:00:05', 10, 1, 10.000, '2020-05-02 15:19:47', '2020-05-02 15:19:47', NULL),
	(14, '2020-05-22', '00:00:05', '00:00:07', 11, 3, 10.000, '2020-05-03 11:39:40', '2020-05-03 11:39:40', NULL),
	(15, '2020-05-06', '00:00:07', '00:00:08', 12, 4, 20.000, '2020-05-05 09:51:17', '2020-05-05 09:51:17', NULL),
	(16, '2020-05-07', '00:00:07', '00:00:09', 14, 3, 10.000, '2020-05-05 13:13:07', '2020-05-05 13:13:07', NULL),
	(17, '2020-08-27', '00:00:04', '00:00:09', 15, 6, 200.000, '2020-05-05 16:47:13', '2020-05-05 16:47:13', NULL);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumping structure for table finegallians.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.customer: ~1 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`, `firstname`, `surname`) VALUES
	(1, 'eoin', 'cliff');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for view finegallians.event
DROP VIEW IF EXISTS `event`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `event` (
	`title` VARCHAR(61) NULL COLLATE 'latin1_swedish_ci',
	`start` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`end` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`venue` VARCHAR(18) NOT NULL COLLATE 'utf8mb4_general_ci',
	`id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table finegallians.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finegallians.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table finegallians.member
DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `membertype` varchar(6) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_member_user_unique` (`userid`),
  CONSTRAINT `FK_member_user` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.member: ~15 rows (approximately)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `firstname`, `surname`, `membertype`, `dateofbirth`, `created_at`, `updated_at`, `deleted_at`, `userid`) VALUES
	(1, 'john', 'kerr', 'senior', '2000-01-31', NULL, NULL, NULL, NULL),
	(2, 'morgan', 'moors', 'senior', '1985-10-28', NULL, NULL, NULL, NULL),
	(3, 'rebecca', 'leash', 'senior', '1993-08-01', NULL, NULL, NULL, NULL),
	(4, 'leslie', 'hammond', 'senior', '1999-03-03', NULL, NULL, NULL, NULL),
	(5, 'axel', 'gibson', 'senior', '2007-09-29', NULL, NULL, NULL, NULL),
	(6, 'bo', 'bradshaw', 'senior', '1979-12-19', NULL, NULL, NULL, NULL),
	(7, 'Eoin', 'Clifford', 'Senior', '1997-08-28', '2020-04-26 14:55:16', '2020-04-26 14:55:16', NULL, NULL),
	(8, 'John', 'Paul', 'Senior', '9999-09-27', '2020-04-29 19:05:04', '2020-04-29 19:05:04', NULL, NULL),
	(9, 'sean', 'Paul', 'Senior', '2000-08-06', '2020-05-01 12:45:31', '2020-05-01 12:45:31', NULL, NULL),
	(10, 'Sarah', 'Silver', 'Junior', '2020-05-02', '2020-05-02 15:17:42', '2020-05-02 15:17:42', NULL, NULL),
	(11, 'Stephen', 'Kells', 'Junior', '2018-07-12', '2020-05-03 11:38:47', '2020-05-03 11:38:47', NULL, NULL),
	(12, 'Sarah', 'Sull', 'Senior', '2018-04-06', '2020-05-05 09:50:40', '2020-05-05 09:50:40', NULL, NULL),
	(13, 'John', 'Smith', 'Senior', '1988-09-08', '2020-05-05 13:06:32', '2020-05-05 13:06:32', NULL, NULL),
	(14, 'sean', 'Paul', 'Junior', '2019-08-07', '2020-05-05 13:12:37', '2020-05-05 13:12:37', NULL, NULL),
	(15, 'sophie', 'nolan', 'Junior', '1997-07-14', '2020-05-05 16:45:57', '2020-05-05 16:45:57', NULL, NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- Dumping structure for table finegallians.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finegallians.migrations: ~3 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table finegallians.orderdetail
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(18,3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `scorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.orderdetail: ~17 rows (approximately)
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` (`id`, `productid`, `orderid`, `quantity`, `subtotal`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 2, 2, NULL, NULL, NULL, NULL),
	(2, 1, 2, 2, NULL, NULL, NULL, NULL),
	(3, 2, 4, 1, NULL, '2020-04-29 19:01:29', '2020-04-29 19:01:29', NULL),
	(4, 2, 5, 2, NULL, '2020-04-30 10:49:31', '2020-04-30 10:49:31', NULL),
	(5, 3, 5, 1, NULL, '2020-04-30 10:49:31', '2020-04-30 10:49:31', NULL),
	(6, 2, 6, 2, NULL, '2020-04-30 15:08:32', '2020-04-30 15:08:32', NULL),
	(7, 2, 7, 1, NULL, '2020-05-02 15:20:25', '2020-05-02 15:20:25', NULL),
	(8, 3, 7, 1, NULL, '2020-05-02 15:20:25', '2020-05-02 15:20:25', NULL),
	(9, 2, 8, 1, NULL, '2020-05-03 11:41:05', '2020-05-03 11:41:05', NULL),
	(10, 3, 8, 1, NULL, '2020-05-03 11:41:05', '2020-05-03 11:41:05', NULL),
	(11, 2, 9, 1, NULL, '2020-05-03 11:41:45', '2020-05-03 11:41:45', NULL),
	(12, 3, 9, 1, NULL, '2020-05-03 11:41:45', '2020-05-03 11:41:45', NULL),
	(13, 2, 10, 1, NULL, '2020-05-05 09:52:08', '2020-05-05 09:52:08', NULL),
	(14, 3, 10, 1, NULL, '2020-05-05 09:52:08', '2020-05-05 09:52:08', NULL),
	(15, 2, 11, 1, NULL, '2020-05-05 13:13:54', '2020-05-05 13:13:54', NULL),
	(16, 1, 11, 1, NULL, '2020-05-05 13:13:54', '2020-05-05 13:13:54', NULL),
	(17, 3, 12, 1, NULL, '2020-05-05 16:48:06', '2020-05-05 16:48:06', NULL);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;

-- Dumping structure for table finegallians.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finegallians.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table finegallians.pitch
DROP TABLE IF EXISTS `pitch`;
CREATE TABLE IF NOT EXISTS `pitch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surface` varchar(30) DEFAULT NULL,
  `floodlights` tinyint(1) DEFAULT NULL,
  `indoor` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.pitch: ~6 rows (approximately)
/*!40000 ALTER TABLE `pitch` DISABLE KEYS */;
INSERT INTO `pitch` (`id`, `surface`, `floodlights`, `indoor`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'astro', 1, 1, NULL, NULL, NULL),
	(2, 'grass', 1, 0, NULL, NULL, NULL),
	(3, 'grass', 1, 1, NULL, NULL, NULL),
	(4, 'astro', 1, 1, NULL, NULL, NULL),
	(5, 'astro', 0, 0, NULL, NULL, NULL),
	(6, 'grass', 0, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `pitch` ENABLE KEYS */;

-- Dumping structure for table finegallians.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `colour` varchar(30) DEFAULT NULL,
  `price` decimal(18,3) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.product: ~5 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `description`, `colour`, `price`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Top', 'Crew Neck', 'red', 20.000, 'top.jpg', NULL, NULL, NULL),
	(2, 'Sweatshirt', 'Water proof', 'Blue', 25.000, 'jumper.jpg', NULL, NULL, NULL),
	(3, 'Gloves', 'Weather resistant', 'black', 10.000, 'gloves.jpg', NULL, NULL, NULL),
	(4, 'Hurl', 'Jordon', 'brown', 18.000, 'hurl.jpg', NULL, NULL, NULL),
	(5, 'Cultec', 'Carbon fiber', 'white', 25.000, 'cultec.jpg', NULL, NULL, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table finegallians.scorder
DROP TABLE IF EXISTS `scorder`;
CREATE TABLE IF NOT EXISTS `scorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` datetime DEFAULT NULL,
  `deliverystreet` varchar(30) DEFAULT NULL,
  `deliverycity` varchar(30) DEFAULT NULL,
  `deliverycounty` varchar(30) DEFAULT NULL,
  `ordertotal` decimal(18,3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table finegallians.scorder: ~12 rows (approximately)
/*!40000 ALTER TABLE `scorder` DISABLE KEYS */;
INSERT INTO `scorder` (`id`, `orderdate`, `deliverystreet`, `deliverycity`, `deliverycounty`, `ordertotal`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '2018-01-05 10:05:00', '1 Main Street', 'Blanchardstown', 'Dublin', NULL, NULL, NULL, NULL),
	(2, '2018-01-07 17:15:00', '25 High Street', 'Lucan', 'Dublin', NULL, NULL, NULL, NULL),
	(3, '2018-01-05 10:05:00', '19 New Road', 'Finglas', 'Dublin', NULL, NULL, NULL, NULL),
	(4, '2020-04-29 19:01:29', NULL, NULL, NULL, NULL, '2020-04-29 19:01:29', '2020-04-29 19:01:29', NULL),
	(5, '2020-04-30 10:49:31', NULL, NULL, NULL, NULL, '2020-04-30 10:49:31', '2020-04-30 10:49:31', NULL),
	(6, '2020-04-30 15:08:32', NULL, NULL, NULL, NULL, '2020-04-30 15:08:32', '2020-04-30 15:08:32', NULL),
	(7, '2020-05-02 15:20:25', NULL, NULL, NULL, NULL, '2020-05-02 15:20:25', '2020-05-02 15:20:25', NULL),
	(8, '2020-05-03 11:41:05', NULL, NULL, NULL, NULL, '2020-05-03 11:41:05', '2020-05-03 11:41:05', NULL),
	(9, '2020-05-03 11:41:45', NULL, NULL, NULL, NULL, '2020-05-03 11:41:45', '2020-05-03 11:41:45', NULL),
	(10, '2020-05-05 09:52:08', NULL, NULL, NULL, NULL, '2020-05-05 09:52:08', '2020-05-05 09:52:08', NULL),
	(11, '2020-05-05 13:13:54', NULL, NULL, NULL, NULL, '2020-05-05 13:13:54', '2020-05-05 13:13:54', NULL),
	(12, '2020-05-05 16:48:06', NULL, NULL, NULL, NULL, '2020-05-05 16:48:06', '2020-05-05 16:48:06', NULL);
/*!40000 ALTER TABLE `scorder` ENABLE KEYS */;

-- Dumping structure for table finegallians.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finegallians.users: ~6 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'eoin', 'b00089024@mytudublin.ie', NULL, '$2y$10$Kd0fFwmheasFzAzqvGnVS.PLf2rR86DxSfsFp.8MlBXDPIrabvakS', '556OSWpmtoc6vZIpdK1W5g1emi7kXHR9Dfwa68VbUOV3DRsrhfgkBd5oiNAx', '2020-04-27 13:34:47', '2020-04-27 13:34:47'),
	(2, 'sean cliffors', 'Sophie@123.com', NULL, '$2y$10$zujEImRaqBa2qa1ZCS1N3Ohfd.WAaQB4R2/7sV5kkNiHW/0sKiIZ6', NULL, '2020-04-27 14:05:04', '2020-04-27 14:05:04'),
	(3, 'Morgan Bartlett', 'MG@gmail.com', NULL, '$2y$10$be.9ItRqz1kn2F.P7cTGE.Ra7giHV6LwDWTMomVpK063KLLkmFegy', NULL, '2020-04-27 14:19:31', '2020-04-27 14:19:31'),
	(4, 'John Paul', 'JP@gmail.com', NULL, '$2y$10$Gj5GAkNKKvF6E.kWGP0IR.ksIOqzhswoMzjhcF3idDzP5fuxsNQa2', NULL, '2020-05-02 11:44:13', '2020-05-02 11:44:13'),
	(5, 'Sophie Nolan', 'sophienolan14@gmail.com', NULL, '$2y$10$P9AqnbWJh90AQu9DLFItcuVJWp4xetGx08zomFofS2uvwqOF3p1Gi', NULL, '2020-05-05 09:52:41', '2020-05-05 09:52:41'),
	(6, 'Sophie Nolan', 'sophie@gmail.com', NULL, '$2y$10$Nz8rKJuLdq6zc23wLC.gdOaqbi4S54xS24wBdAR1Ng6r.FmJfQ1Oy', NULL, '2020-05-05 13:14:46', '2020-05-05 13:14:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for view finegallians.event
DROP VIEW IF EXISTS `event`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `event`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event` AS select concat(member.firstname, " ", member.surname) as title, 
Concat(DATE_FORMAT(BookingDate,'%Y-%m-%d'), "T", StartTime) as start, 
Concat(DATE_FORMAT(BookingDate,'%Y-%m-%d'), "T", EndTime) as end, 
concat("Pitch: " ,pitch.id) as venue,booking.id as id
from member, pitch, booking
where member.ID = booking.MemberID and pitch.id=booking.PitchID ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
