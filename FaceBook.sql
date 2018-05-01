# --------------------------------------------------------
# Host:                         
# Database:                     facebook
# Server version:               5.0.22-community-nt
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2014-11-16 22:55:33
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for facebook
DROP DATABASE IF EXISTS `facebook`;
CREATE DATABASE IF NOT EXISTS `facebook` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `facebook`;


# Dumping structure for table facebook.friends
DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `friend_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL,
  `registration_id` int(10) unsigned NOT NULL,
  `profile_display` varchar(200) default 'public',
  PRIMARY KEY  (`friend_id`),
  KEY `FK_friends_profile` (`profile_id`),
  KEY `FK_friends_registration` (`registration_id`),
  CONSTRAINT `FK_friends_profile` FOREIGN KEY (`profile_id`) REFERENCES `registration` (`registration_id`),
  CONSTRAINT `FK_friends_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table facebook.friends: 2 rows
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` (`friend_id`, `profile_id`, `registration_id`, `profile_display`) VALUES (1, 5, 6, 'public'), (2, 5, 6, 'public');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;


# Dumping structure for table facebook.post
DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL,
  `reciver_id` int(10) unsigned NOT NULL,
  `description` varchar(500) default NULL,
  `image_path` varchar(100) default NULL,
  `post_display` varchar(45) NOT NULL default 'public',
  `po_date` datetime default NULL,
  PRIMARY KEY  (`post_id`),
  KEY `FK_post_registration` (`sender_id`),
  KEY `FK_post_registration_2` (`reciver_id`),
  CONSTRAINT `FK_post_registration` FOREIGN KEY (`sender_id`) REFERENCES `registration` (`registration_id`),
  CONSTRAINT `FK_post_registration_2` FOREIGN KEY (`reciver_id`) REFERENCES `registration` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table facebook.post: 29 rows
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`post_id`, `sender_id`, `reciver_id`, `description`, `image_path`, `post_display`, `po_date`) VALUES (1, 6, 5, 'pralhad testing', 'noimage', 'private', '2014-11-13 12:56:57'), (3, 5, 5, 'hello', 'noimage', 'public', '2014-11-16 10:23:59'), (5, 5, 5, 'testing wall for public', 'noimage', 'public', '2014-11-16 10:24:01'), (6, 5, 5, 'please update status', 'noimage', 'public', '2014-11-16 10:24:03'), (7, 6, 5, 'please update status2', 'noimage', 'public', '2014-11-16 10:24:04'), (9, 5, 5, 'please update status4', 'noimage', 'public', '2014-11-16 10:24:06'), (11, 6, 5, 'please update status4', 'noimage', 'public', '2014-11-16 10:24:07'), (12, 5, 5, 'please update status4', 'noimage', 'public', '2014-11-16 10:24:09'), (15, 5, 6, 'sandeep', 'noimage', 'private', '2014-11-16 10:24:14'), (16, 6, 5, 'sanddep', 'noimage', 'public', '2014-11-16 10:24:13'), (17, 6, 5, 'HI PRALHAD', 'noimage', 'private', '2014-11-16 10:24:12'), (19, 5, 6, 'hi', 'noimage', 'public', '2014-11-16 10:24:16'), (20, 5, 5, 'post', 'noimage', 'public', '2014-11-16 10:24:11'), (21, 5, 5, 'hi hell ', 'noimage', 'public', '2014-11-16 10:21:58'), (22, 6, 5, 'hi', 'noimage', 'public', NULL), (23, 5, 5, 'hi hjjghg gh gh hg', 'Post/', 'private', '2014-11-16 11:56:48'), (24, 5, 5, 'fdfghrtttttttttrtyrrt rtyrt', 'Post/', 'private', '2014-11-16 11:57:11'), (25, 5, 5, 'hdgjhf gd fhdsgfhgsdhgfsdhgfhjg', 'Post/', 'private', '2014-11-16 11:57:45'), (26, 5, 5, 'hg', 'Post/', 'public', '2014-11-16 12:00:34'), (27, 5, 5, 'hghh    h j', 'Post/', 'friend', '2014-11-16 12:01:17'), (28, 5, 5, 'uifik sdhfsjdhfj djfhsd djhsd  sd fdjsdfsdjhd shf df jsdfsdfsd fdsf d fd fdf sdhfjsdjsdhhdjhjkhfjhsjdhfjsdhfdf   dj hj dhfjhd hdh hf dhf fdhfjdhfdfhd f dhjdhjf hsdj hjfhj df hd hfhdfjh jdjdhjfhd fdh dfhdhjd dhjhjh djh dj', 'Post/', 'public', '2014-11-16 16:10:54'), (29, 5, 5, '   dh dh kjhfkjhkjghfkjh nghhdbjhd  n jkhkjhkjh kjhh jh j hhjhfdjhh jkhkdhjdhjhdjhdjhh jhdjhjhdjhhhkd', 'Post/', 'public', '2014-11-16 16:12:09'), (30, 5, 5, 'jhj g jhhhjghjghg h hghgh', 'Post/', 'private', '2014-11-16 16:28:50'), (31, 5, 5, 'hjgh hg hjgjhgjhgjhgg', 'Post/', 'public', '2014-11-16 16:30:22'), (32, 5, 5, 'hjhjhekjh berjhhjwegjg hgwhjeg jhg', 'Post/', 'private', '2014-11-16 16:35:18'), (33, 5, 5, 'g hgghfhgfhgfhgh  fgff fhhgfgh', 'post/', 'public', '2014-11-16 16:36:14'), (34, 5, 5, 'dhfjsd jjdhfjfdjf hjsh', 'post/Penguins.jpg', 'friend', '2014-11-16 16:49:40'), (35, 5, 5, 'drtdg        grg', 'post/Desert.jpg', 'private', '2014-11-16 16:51:04'), (36, 5, 5, 'kkhjk jhjkhkj hj hgh', 'post/Penguins.jpg', 'public', '2014-11-16 16:53:36');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


# Dumping structure for table facebook.profile
DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `registration_id` int(10) unsigned NOT NULL,
  `contact_no` varchar(45) default NULL,
  `address` varchar(100) default NULL,
  `profile_display` varchar(45) default 'public',
  `image_path` varchar(100) default 'images/placeholder-person.png',
  PRIMARY KEY  (`profile_id`),
  KEY `FK_profile_registration` (`registration_id`),
  CONSTRAINT `FK_profile_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table facebook.profile: 3 rows
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`profile_id`, `registration_id`, `contact_no`, `address`, `profile_display`, `image_path`) VALUES (6, 5, '', '', 'public', 'images/placeholder-person.png'), (7, 6, '9898989898', 'pune', 'public', 'profile/10413413_284936538369649_2587972099089471515_n.jpg'), (21, 13, NULL, NULL, 'public', 'images/placeholder-person.png');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


# Dumping structure for table facebook.registration
DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `registration_id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email_id` varchar(70) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` varchar(100) NOT NULL default 'deactive',
  PRIMARY KEY  (`registration_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table facebook.registration: 3 rows
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`registration_id`, `first_name`, `last_name`, `email_id`, `password`, `status`) VALUES (5, 'pralhad', 'ingole', 'pralhad@gmail.com', '898', 'deactive'), (6, 'Sandeep', 'Singh', 'sandeep@gmail.com', '9898', 'deactive'), (13, 'pralhad', 'ingole', 'pralhad.ingole@saiinfocorpsolution.com', '510488', 'deactive');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


# Dumping structure for table facebook.shared
DROP TABLE IF EXISTS `shared`;
CREATE TABLE IF NOT EXISTS `shared` (
  `share_id` int(10) unsigned NOT NULL auto_increment,
  `post_id` int(10) unsigned NOT NULL,
  `registartion_id` int(10) unsigned NOT NULL,
  `share_display` varchar(200) NOT NULL default 'public',
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`share_id`),
  KEY `FK_shared_post` (`post_id`),
  KEY `FK_shared_profile` (`registartion_id`),
  CONSTRAINT `FK_shared_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FK_shared_profile` FOREIGN KEY (`registartion_id`) REFERENCES `registration` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table facebook.shared: 6 rows
/*!40000 ALTER TABLE `shared` DISABLE KEYS */;
INSERT INTO `shared` (`share_id`, `post_id`, `registartion_id`, `share_display`, `description`) VALUES (1, 19, 6, 'public', 'fght tyhtreye tyety st yeyty'), (6, 19, 6, 'public', 'hi dednejhje efksje'), (7, 19, 6, 'public', 'hi dednejhje efksje'), (8, 19, 6, 'public', 'hi dednejhje efksje'), (9, 16, 5, 'public', 'hi shared post testing'), (10, 36, 5, 'public', 'dfjhsdkjhf jhdkjfhsjdkhfkhdsjhfhsdj');
/*!40000 ALTER TABLE `shared` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
