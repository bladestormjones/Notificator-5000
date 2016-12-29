-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for notes
CREATE DATABASE IF NOT EXISTS `notes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `notes`;

-- Dumping structure for table notes.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` char(144) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `done` bit(1) DEFAULT NULL,
  `timestamp` char(26) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserNotes` (`author`),
  CONSTRAINT `UserNotes` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table notes.reminders
CREATE TABLE IF NOT EXISTS `reminders` (
  `reminder_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `sendtime` datetime NOT NULL,
  `sent` bit(1) NOT NULL DEFAULT b'0',
  `sentnote` varchar(144) DEFAULT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `UserReminders` (`author`),
  KEY `NoteReminders` (`note_id`),
  CONSTRAINT `NoteReminders` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`),
  CONSTRAINT `UserReminders` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table notes.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(25) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `Roles` char(25) DEFAULT NULL,
  `email` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
