# ************************************************************
# Sequel Ace SQL dump
# Version 20058
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.23)
# Database: contentbox
# Generation Time: 2023-11-10 10:57:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cb_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_author`;

CREATE TABLE `cb_author` (
  `authorID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `firstName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `lastLogin` datetime DEFAULT NULL,
  `biography` longtext COLLATE utf8mb4_unicode_ci,
  `preferences` longtext COLLATE utf8mb4_unicode_ci,
  `isPasswordReset` tinyint(1) NOT NULL DEFAULT '0',
  `is2FactorAuth` tinyint(1) NOT NULL DEFAULT '0',
  `FK_roleID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`authorID`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_cb_author_FK_roleID` (`FK_roleID`),
  KEY `idx_email` (`email`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_activeAuthor` (`isActive`),
  KEY `idx_passwordReset` (`isPasswordReset`),
  KEY `idx_2factorauth` (`is2FactorAuth`),
  KEY `idx_login` (`username`,`password`,`isActive`),
  CONSTRAINT `fk_cb_author_FK_roleID` FOREIGN KEY (`FK_roleID`) REFERENCES `cb_role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_author` WRITE;
/*!40000 ALTER TABLE `cb_author` DISABLE KEYS */;

INSERT INTO `cb_author` (`authorID`, `createdDate`, `modifiedDate`, `isDeleted`, `firstName`, `lastName`, `email`, `username`, `password`, `isActive`, `lastLogin`, `biography`, `preferences`, `isPasswordReset`, `is2FactorAuth`, `FK_roleID`)
VALUES
	('2c9480838309dc9c018309dfb3be0092','2022-09-04 18:59:59','2023-11-10 10:48:01',0,'Esme','Acevedo','esme@ortussolutions.com','esme','$2a$12$i9q6kijCMV5yKMAF4BWAseRbAixCoQGXjPhCt2AX9bJ/nQw4EPDpS',1,'2023-11-10 10:48:01','','{\"editor\":\"simplemde\",\"sidebarstate\":\"true\",\"sidemenuCollapse\":\"no\"}',0,0,'2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('2c9480838309dc9c01830b56c6d20133','2022-09-05 01:49:39','2023-11-10 10:54:32',0,'API','User','esme+api@ortussolutions.com','apiuser','$2a$12$grfWZi6L5ZOfjDnBSrme2.8jxaR0eiUMKbRyETjliZyWwXD2GS6UK',1,'2023-10-31 07:50:49','','{}',0,0,'2c9480838bb8cfb2018bb8dd975900d1'),
	('2c9480838bb8cfb2018bb8d8e7b000cf','2023-11-10 10:48:24','2023-11-10 10:49:15',0,'Luis','Majano','lmajano@ortussolutions.com','lmajano','$2a$12$/34934.S7cg/JaFEFBw6Mexdh9sd8So6SLVGyzu86OoTGhbUd531G',1,'2023-11-10 10:49:15','','{}',0,0,'2D385E92-8555-49BC-ADA8C8ADAF15D250');

/*!40000 ALTER TABLE `cb_author` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_authorPermissionGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_authorPermissionGroups`;

CREATE TABLE `cb_authorPermissionGroups` (
  `FK_permissionGroupID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_authorPermissionGroups_FK_permissionGroupID` (`FK_permissionGroupID`),
  KEY `fk_cb_authorPermissionGroups_FK_authorID` (`FK_authorID`),
  CONSTRAINT `fk_cb_authorPermissionGroups_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_authorPermissionGroups_FK_permissionGroupID` FOREIGN KEY (`FK_permissionGroupID`) REFERENCES `cb_permissionGroup` (`permissionGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_authorPermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_authorPermissions`;

CREATE TABLE `cb_authorPermissions` (
  `FK_permissionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_authorPermissions_FK_permissionID` (`FK_permissionID`),
  KEY `fk_cb_authorPermissions_FK_authorID` (`FK_authorID`),
  CONSTRAINT `fk_cb_authorPermissions_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_authorPermissions_FK_permissionID` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_category`;

CREATE TABLE `cb_category` (
  `categoryID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  `FK_siteID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `fk_cb_category_FK_siteID` (`FK_siteID`),
  KEY `idx_isPublic` (`isPublic`),
  KEY `idx_categorySlug` (`slug`),
  KEY `idx_categoryName` (`category`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_category_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_category` WRITE;
/*!40000 ALTER TABLE `cb_category` DISABLE KEYS */;

INSERT INTO `cb_category` (`categoryID`, `createdDate`, `modifiedDate`, `isDeleted`, `slug`, `category`, `isPublic`, `FK_siteID`)
VALUES
	('2c9480838309dc9c018309dfc5b900e1','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'news','News',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfc5ba00e2','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'coldfusion',' ColdFusion',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfc5bc00e3','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'coldbox',' ColdBox',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfc5be00e4','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'contentbox',' ContentBox',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfcf190123','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'news','News',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838309dc9c018309dfcf1a0124','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'coldfusion',' ColdFusion',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838309dc9c018309dfcf1b0125','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'coldbox',' ColdBox',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838309dc9c018309dfcf1d0126','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'contentbox',' ContentBox',1,'2c9480838309dc9c018309dfcbbe0109');

/*!40000 ALTER TABLE `cb_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_comment`;

CREATE TABLE `cb_comment` (
  `commentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorIP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorEmail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_cb_comment_FK_contentID` (`FK_contentID`),
  KEY `idx_contentComment` (`isApproved`,`FK_contentID`),
  KEY `idx_approved` (`isApproved`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_comment_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_comment` WRITE;
/*!40000 ALTER TABLE `cb_comment` DISABLE KEYS */;

INSERT INTO `cb_comment` (`commentID`, `createdDate`, `modifiedDate`, `isDeleted`, `content`, `author`, `authorIP`, `authorEmail`, `authorURL`, `isApproved`, `FK_contentID`)
VALUES
	('2c9480838309dc9c018309dfc73500e6','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'What an amazing blog entry, congratulations!','Awesome Joe','172.20.0.1','awesomejoe@contentbox.org','www.ortussolutions.com',1,'2c9480838309dc9c018309dfc73400e5'),
	('2c9480838309dc9c018309dfcf8e0128','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'What an amazing blog entry, congratulations!','Awesome Joe','172.20.0.1','awesomejoe@contentbox.org','www.ortussolutions.com',1,'2c9480838309dc9c018309dfcf8d0127');

/*!40000 ALTER TABLE `cb_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_commentSubscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_commentSubscriptions`;

CREATE TABLE `cb_commentSubscriptions` (
  `subscriptionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_commentSubscriptions_subscriptionID` (`subscriptionID`),
  KEY `fk_cb_commentSubscriptions_FK_contentID` (`FK_contentID`),
  CONSTRAINT `fk_cb_commentSubscriptions_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_commentSubscriptions_subscriptionID` FOREIGN KEY (`subscriptionID`) REFERENCES `cb_subscriptions` (`subscriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_content`;

CREATE TABLE `cb_content` (
  `contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `contentType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publishedDate` datetime DEFAULT NULL,
  `expireDate` datetime DEFAULT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '1',
  `allowComments` tinyint(1) NOT NULL DEFAULT '1',
  `passwordProtection` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTMLKeywords` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTMLDescription` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTMLTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cache` tinyint(1) NOT NULL DEFAULT '1',
  `cacheTimeout` int NOT NULL DEFAULT '0',
  `cacheLastAccessTimeout` int NOT NULL DEFAULT '0',
  `markup` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HTML',
  `showInSearch` tinyint(1) NOT NULL DEFAULT '1',
  `featuredImage` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_siteID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_parentID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_contentTemplateID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_childContentTemplateID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  KEY `fk_cb_content_FK_siteID` (`FK_siteID`),
  KEY `fk_cb_content_FK_authorID` (`FK_authorID`),
  KEY `fk_cb_content_FK_parentID` (`FK_parentID`),
  KEY `idx_discriminator` (`contentType`),
  KEY `idx_published` (`isPublished`,`contentType`),
  KEY `idx_slug` (`slug`),
  KEY `idx_publishedSlug` (`slug`,`isPublished`),
  KEY `idx_publishedDate` (`publishedDate`),
  KEY `idx_expireDate` (`expireDate`),
  KEY `idx_search` (`title`,`isPublished`),
  KEY `idx_cache` (`cache`),
  KEY `idx_cachetimeout` (`cacheTimeout`),
  KEY `idx_cachelastaccesstimeout` (`cacheLastAccessTimeout`),
  KEY `idx_showInSearch` (`showInSearch`),
  CONSTRAINT `fk_cb_content_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_content_FK_parentID` FOREIGN KEY (`FK_parentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_content_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_content` WRITE;
/*!40000 ALTER TABLE `cb_content` DISABLE KEYS */;

INSERT INTO `cb_content` (`contentID`, `createdDate`, `modifiedDate`, `isDeleted`, `contentType`, `title`, `slug`, `publishedDate`, `expireDate`, `isPublished`, `allowComments`, `passwordProtection`, `HTMLKeywords`, `HTMLDescription`, `HTMLTitle`, `cache`, `cacheTimeout`, `cacheLastAccessTimeout`, `markup`, `showInSearch`, `featuredImage`, `FK_siteID`, `FK_authorID`, `FK_parentID`, `FK_contentTemplateID`, `FK_childContentTemplateID`)
VALUES
	('2c9480838309dc9c018309dfc73400e5','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'Entry','My first entry','my-first-entry','2022-09-04 19:00:04',NULL,1,1,'','cool,first entry, contentbox','The most amazing ContentBox blog entry in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfc80400e9','2022-09-04 19:00:04','2022-12-05 23:11:00',0,'Page','About','about','2022-09-04 19:00:00',NULL,1,0,'','about, contentbox,coldfusion,coldbox','The most amazing ContentBox page in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfc8c300eb','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'ContentStore','Contact Info','contentbox','2022-09-04 19:00:04',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfcf8d0127','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'Entry','My first entry','my-first-entry','2022-09-04 19:00:06',NULL,1,1,'','cool,first entry, contentbox','The most amazing ContentBox blog entry in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfcbbe0109','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfcfd6012b','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'Page','About','about','2022-09-04 19:00:06',NULL,1,0,'','about, contentbox,coldfusion,coldbox','The most amazing ContentBox page in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfcbbe0109','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfd024012d','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'ContentStore','Contact Info','contentbox','2022-09-04 19:00:06',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfcbbe0109','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01830b73c1330134','2022-09-05 02:21:19','2022-09-05 02:21:19',0,'Page','contact','contact','2022-09-05 02:20:00',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01830cc4b42f013b','2022-09-05 08:29:21','2022-09-05 08:29:21',0,'ContentStore','Headlesscb Slides','headlesscb-slides','2022-09-05 08:28:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01830cc8468c013d','2022-09-05 08:33:15','2022-09-08 04:03:50',0,'ContentStore','Cover','headlesscb-slides/cover','2022-09-05 08:29:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01830ccb4a9f0140','2022-09-05 08:36:33','2022-09-08 04:03:55',0,'ContentStore','Speaking','headlesscb-slides/speaking','2022-09-05 08:34:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01830cd4eeac0143','2022-09-05 08:47:05','2022-09-08 04:04:00',0,'ContentStore','What is a headless CMS?','headlesscb-slides/what-is-a-headless-cms','2022-09-05 08:37:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c0183137ea0ff017e','2022-09-06 15:50:09','2022-09-08 04:04:05',0,'ContentStore','Traditional vs Headless','headlesscb-slides/traditional-vs-headless','2022-09-06 06:59:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831413ac24018d','2022-09-06 18:32:57','2022-09-08 04:04:11',0,'ContentStore','Body','headlesscb-slides/body','2022-09-06 18:22:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831419faff0190','2022-09-06 18:39:50','2022-09-08 04:04:15',0,'ContentStore','The Head','headlesscb-slides/the-head','2022-09-06 18:33:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c0183147a2be70198','2022-09-06 20:24:54','2022-09-08 04:04:23',0,'ContentStore','ContentBox 5','headlesscb-slides/contentbox-5','2022-09-06 20:21:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831480f10e019b','2022-09-06 20:32:18','2022-09-08 04:04:26',0,'ContentStore','ContentStore','headlesscb-slides/contentstore','2022-09-06 20:28:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831485c3b2019e','2022-09-06 20:37:34','2022-09-08 04:04:29',0,'ContentStore','Headless CMS','headlesscb-slides/headless-cms','2022-09-06 20:33:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c018314df347401ab','2022-09-06 22:15:16','2022-09-08 04:04:36',0,'ContentStore','Sponsors','headlesscb-slides/sponsors','2022-09-06 22:11:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c018314edf62201b0','2022-09-06 22:31:22','2022-09-08 04:04:36',0,'ContentStore','Thanks','headlesscb-slides/thanks','2022-09-06 22:29:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831b144f3d01c9','2022-09-06 18:42:57','2022-09-08 08:11:53',0,'ContentStore','Advantages','headlesscb-slides/advantages','2022-09-06 18:43:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831d5f04b801d0','2022-09-08 13:51:50','2022-09-08 13:53:31',0,'ContentStore','Headlesscb Slides SP','headlesscb-slides-sp','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01831d5f0ebf01d2','2022-09-08 13:51:50','2022-12-04 02:19:49',0,'ContentStore','Cover','headlesscb-slides-sp/cover','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f0f4d01d6','2022-09-08 13:51:53','2022-12-04 02:20:42',0,'ContentStore','Speaking','headlesscb-slides-sp/speaking','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f0fd501d9','2022-09-08 13:51:53','2022-12-04 02:22:57',0,'ContentStore','What is a headless CMS?','headlesscb-slides-sp/what-is-a-headless-cms','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f109601dc','2022-09-08 13:51:53','2022-12-04 02:24:37',0,'ContentStore','Traditional vs Headless','headlesscb-slides-sp/traditional-vs-headless','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f112001e0','2022-09-08 13:51:53','2022-12-04 02:26:44',0,'ContentStore','Body','headlesscb-slides-sp/body','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f11b701e3','2022-09-08 13:51:53','2022-12-04 02:28:33',0,'ContentStore','The Head','headlesscb-slides-sp/the-head','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f124001e6','2022-09-08 13:51:53','2022-12-04 02:50:01',0,'ContentStore','Advantages','headlesscb-slides-sp/advantages','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f12c201e9','2022-09-08 13:51:53','2022-12-04 02:50:40',0,'ContentStore','ContentBox 5','headlesscb-slides-sp/contentbox-5','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f131901ec','2022-09-08 13:51:54','2022-12-04 02:58:51',0,'ContentStore','ContentStore','headlesscb-slides-sp/contentstore','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f137101ee','2022-09-08 13:51:54','2022-12-04 03:04:56',0,'ContentStore','Headless CMS','headlesscb-slides-sp/headless-cms','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f13fe01f0','2022-09-08 13:51:54','2022-12-04 03:21:29',0,'ContentStore','Sponsors','headlesscb-slides-sp/sponsors','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f14c101f3','2022-09-08 13:51:54','2022-12-04 03:05:22',0,'ContentStore','Thanks','headlesscb-slides-sp/thanks','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c94808384e113b20184e4856a790005','2022-12-05 23:00:59','2022-12-05 23:00:59',0,'Page','Home','home','2022-12-05 23:00:00',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c94808384e113b20184e48d35dd0007','2022-12-05 23:09:30','2022-12-05 23:09:30',0,'Page','Services','services','2022-12-05 23:09:00',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9580838811b6930188126d88e60003','2023-05-13 00:05:48','2023-05-13 00:05:48',0,'ContentStore','Headlesscb 100 mins slides','headlesscb-100-mins-slides','2023-05-13 00:04:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9580838811b6930188126f67210005','2023-05-13 00:07:51','2023-05-17 19:34:10',0,'ContentStore','Cover','headlesscb-100-mins-slides/cover','2023-05-13 00:07:00',NULL,1,1,'','','','',0,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301881271d1c60015','2023-05-13 00:10:29','2023-05-17 19:34:10',0,'ContentStore','Speaking','headlesscb-100-mins-slides/speaking','2023-05-13 00:10:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817c3db100062','2023-05-14 00:58:12','2023-05-17 19:34:28',0,'ContentStore','What is a headless CMS?','headlesscb-100-mins-slides/what-is-a-headless-cms','2023-05-14 00:58:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817c7f7f30069','2023-05-14 01:02:41','2023-05-17 19:34:28',0,'ContentStore','Traditional vs Headless','headlesscb-100-mins-slides/traditional-vs-headless','2023-05-14 01:02:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817eba4570079','2023-05-14 01:41:39','2023-05-17 19:34:12',0,'ContentStore','Body','headlesscb-100-mins-slides/body','2023-05-14 01:41:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817ec68280080','2023-05-14 01:42:29','2023-05-17 19:34:12',0,'ContentStore','The Head','headlesscb-100-mins-slides/the-head','2023-05-14 01:42:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817edd97b0087','2023-05-14 01:44:04','2023-05-17 19:34:16',0,'ContentStore','Advantages','headlesscb-100-mins-slides/advantages','2023-05-14 01:44:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817f25baa008e','2023-05-14 01:48:59','2023-05-17 19:34:16',0,'ContentStore','ContentBox 5','headlesscb-100-mins-slides/contentbox-5','2023-05-14 01:48:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301881835c08a0095','2023-05-14 03:02:36','2023-05-17 19:34:16',0,'ContentStore','Headless CMS','headlesscb-100-mins-slides/headless-cms','2023-05-14 03:02:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018827cd2ce0009b','2023-05-17 03:42:18','2023-05-17 21:00:56',0,'ContentStore','Thanks','headlesscb-100-mins-slides/thanks','2023-05-17 03:42:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301882b27c30800b7','2023-05-17 19:20:06','2023-05-17 19:20:06',0,'Entry','ColdBox 7.0.0 Released','coldbox-700-released','2023-05-17 19:04:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9580838811b69301882b34086b00ba','2023-05-17 19:33:30','2023-05-17 21:00:56',0,'ContentStore','Rate','headlesscb-100-mins-slides/rate','2023-05-17 19:31:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301882b83c5a800c8','2023-05-17 21:00:36','2023-05-17 21:00:56',0,'ContentStore','Files','headlesscb-100-mins-slides/files','2023-05-17 20:58:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL);

/*!40000 ALTER TABLE `cb_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_contentCategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentCategories`;

CREATE TABLE `cb_contentCategories` (
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_categoryID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_contentCategories_FK_contentID` (`FK_contentID`),
  KEY `fk_cb_contentCategories_FK_categoryID` (`FK_categoryID`),
  CONSTRAINT `fk_cb_contentCategories_FK_categoryID` FOREIGN KEY (`FK_categoryID`) REFERENCES `cb_category` (`categoryID`),
  CONSTRAINT `fk_cb_contentCategories_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_contentCategories` WRITE;
/*!40000 ALTER TABLE `cb_contentCategories` DISABLE KEYS */;

INSERT INTO `cb_contentCategories` (`FK_contentID`, `FK_categoryID`)
VALUES
	('2c9580838811b69301882b27c30800b7','2c9480838309dc9c018309dfc5bc00e3');

/*!40000 ALTER TABLE `cb_contentCategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_contentStore
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentStore`;

CREATE TABLE `cb_contentStore` (
  `contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT '0',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  CONSTRAINT `fk_cb_contentStore_contentID` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_contentStore` WRITE;
/*!40000 ALTER TABLE `cb_contentStore` DISABLE KEYS */;

INSERT INTO `cb_contentStore` (`contentID`, `order`, `description`)
VALUES
	('2c9480838309dc9c018309dfc8c300eb',0,'Our contact information'),
	('2c9480838309dc9c018309dfd024012d',0,'Our contact information'),
	('2c9480838309dc9c01830cc4b42f013b',0,''),
	('2c9480838309dc9c01830cc8468c013d',1,''),
	('2c9480838309dc9c01830ccb4a9f0140',2,''),
	('2c9480838309dc9c01830cd4eeac0143',3,''),
	('2c9480838309dc9c0183137ea0ff017e',4,''),
	('2c9480838309dc9c01831413ac24018d',5,''),
	('2c9480838309dc9c01831419faff0190',6,''),
	('2c9480838309dc9c0183147a2be70198',8,''),
	('2c9480838309dc9c01831480f10e019b',9,''),
	('2c9480838309dc9c01831485c3b2019e',10,''),
	('2c9480838309dc9c018314df347401ab',11,''),
	('2c9480838309dc9c018314edf62201b0',12,''),
	('2c9480838309dc9c01831b144f3d01c9',7,''),
	('2c9480838309dc9c01831d5f04b801d0',1,''),
	('2c9480838309dc9c01831d5f0ebf01d2',2,''),
	('2c9480838309dc9c01831d5f0f4d01d6',3,''),
	('2c9480838309dc9c01831d5f0fd501d9',4,''),
	('2c9480838309dc9c01831d5f109601dc',5,''),
	('2c9480838309dc9c01831d5f112001e0',6,''),
	('2c9480838309dc9c01831d5f11b701e3',7,''),
	('2c9480838309dc9c01831d5f124001e6',8,''),
	('2c9480838309dc9c01831d5f12c201e9',9,''),
	('2c9480838309dc9c01831d5f131901ec',10,''),
	('2c9480838309dc9c01831d5f137101ee',11,''),
	('2c9480838309dc9c01831d5f13fe01f0',12,''),
	('2c9480838309dc9c01831d5f14c101f3',13,''),
	('2c9580838811b6930188126d88e60003',0,''),
	('2c9580838811b6930188126f67210005',1,''),
	('2c9580838811b69301881271d1c60015',2,''),
	('2c9580838811b693018817c3db100062',3,''),
	('2c9580838811b693018817c7f7f30069',4,''),
	('2c9580838811b693018817eba4570079',5,''),
	('2c9580838811b693018817ec68280080',6,''),
	('2c9580838811b693018817edd97b0087',7,''),
	('2c9580838811b693018817f25baa008e',8,''),
	('2c9580838811b69301881835c08a0095',9,''),
	('2c9580838811b693018827cd2ce0009b',12,''),
	('2c9580838811b69301882b34086b00ba',11,''),
	('2c9580838811b69301882b83c5a800c8',10,'');

/*!40000 ALTER TABLE `cb_contentStore` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_contentTemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentTemplate`;

CREATE TABLE `cb_contentTemplate` (
  `templateID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `isGlobal` tinyint(1) NOT NULL DEFAULT '0',
  `contentType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `definition` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_siteID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`templateID`),
  KEY `fk_cb_contentTemplate_FK_authorID` (`FK_authorID`),
  KEY `fk_cb_contentTemplate_FK_siteID` (`FK_siteID`),
  KEY `idx_contentType` (`contentType`),
  CONSTRAINT `fk_cb_contentTemplate_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_contentTemplate_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_contentVersion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentVersion`;

CREATE TABLE `cb_contentVersion` (
  `contentVersionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelog` longtext COLLATE utf8mb4_unicode_ci,
  `version` int NOT NULL DEFAULT '1',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `FK_authorID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`contentVersionID`),
  KEY `fk_cb_contentVersion_FK_authorID` (`FK_authorID`),
  KEY `idx_version` (`version`),
  KEY `idx_activeContentVersion` (`isActive`),
  KEY `idx_contentVersions` (`FK_contentID`,`isActive`),
  KEY `idx_content_isActive` (`isActive`),
  CONSTRAINT `fk_cb_contentVersion_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_contentVersion_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_contentVersion` WRITE;
/*!40000 ALTER TABLE `cb_contentVersion` DISABLE KEYS */;

INSERT INTO `cb_contentVersion` (`contentVersionID`, `createdDate`, `modifiedDate`, `isDeleted`, `content`, `changelog`, `version`, `isActive`, `FK_authorID`, `FK_contentID`)
VALUES
	('2c9480838309dc9c018309dfc73600e8','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'Hey everybody, this is my first blog entry made from ContentBox.  Isn\'t this amazing!\'','Initial creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc73400e5'),
	('2c9480838309dc9c018309dfc80500ea','2022-09-04 19:00:04','2022-12-05 23:11:00',0,'<p>Hey welcome to my about page for ContentBox, isn\'t this great!</p><p>{{{ContentStore slug=\'contentbox\'}}}</p>','First creation',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c9480838309dc9c018309dfc8c400ec','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'<p style=\"text-align: center;\">\n	<a href=\"https://www.ortussolutions.com/products/contentbox\"><img alt=\"\" src=\"/index.cfm/__media/ContentBox_300.png\" /></a></p>\n<p style=\"text-align: center;\">\n	Created by <a href=\"https://www.ortussolutions.com\">Ortus Solutions, Corp</a> and powered by <a href=\"http://coldbox.org\">ColdBox Platform</a>.</p>','First creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc8c300eb'),
	('2c9480838309dc9c018309dfcf8f012a','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'Hey everybody, this is my first blog entry made from ContentBox.  Isn\'t this amazing!\'','Initial creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfcf8d0127'),
	('2c9480838309dc9c018309dfcfd7012c','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'<p>Hey welcome to my about page for ContentBox, isn\'t this great!</p><p>{{{ContentStore slug=\'contentbox\'}}}</p>','First creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfcfd6012b'),
	('2c9480838309dc9c018309dfd025012e','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'<p style=\"text-align: center;\">\n	<a href=\"https://www.ortussolutions.com/products/contentbox\"><img alt=\"\" src=\"/index.cfm/__media/ContentBox_300.png\" /></a></p>\n<p style=\"text-align: center;\">\n	Created by <a href=\"https://www.ortussolutions.com\">Ortus Solutions, Corp</a> and powered by <a href=\"http://coldbox.org\">ColdBox Platform</a>.</p>','First creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfd024012d'),
	('2c9480838309dc9c01830b73c1340135','2022-09-05 02:21:19','2022-09-05 02:21:19',0,'<p>contact page</p>\r\n','',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830b73c1330134'),
	('2c9480838309dc9c01830cc4b430013c','2022-09-05 08:29:21','2022-09-05 08:29:21',0,'<p>These are the presentation slides.</p>\r\n','',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b'),
	('2c9480838309dc9c01830cc8468d013e','2022-09-05 08:33:16','2022-09-05 08:33:48',0,'<p>&lt;h1&gt;Off with their heads &lt;span&gt;ContentBox 5 : Headless CMS&nbsp;&lt;/span&gt;&lt;/h1&gt;</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830cc8c4e5013f','2022-09-05 08:33:48','2022-09-05 15:50:18',0,'<p>&lt;h1&gt;Off with their heads &lt;span&gt;ContentBox 5 : Headless CMS&nbsp;&lt;/span&gt;&lt;/h1&gt;</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830ccb4aa00141','2022-09-05 08:36:33','2022-09-05 08:36:51',0,'<p>Esme and Javi</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c01830ccb90270142','2022-09-05 08:36:51','2022-09-05 23:40:35',0,'<p>Esme and Javi</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c01830cd4eead0144','2022-09-05 08:47:05','2022-09-05 08:47:23',0,'<p>&lt;h2&gt;What is a Headless CMS?&lt;/h2&gt;</p>\r\n\r\n<p>&lt;p&gt;lorem ipsum&lt;/p&gt;</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01830cd536fc0145','2022-09-05 08:47:23','2022-09-05 15:52:41',0,'<p>&lt;h2&gt;What is a Headless CMS?&lt;/h2&gt;</p>\r\n\r\n<p>&lt;p&gt;lorem ipsum&lt;/p&gt;</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01830e58660d0148','2022-09-05 15:50:18','2022-09-05 15:50:44',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS&nbsp;</span></h1>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e58cc2d0149','2022-09-05 15:50:44','2022-09-05 15:55:12',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e5a9601014a','2022-09-05 15:52:41','2022-09-06 04:38:47',0,'<h2>What is a Headless CMS</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01830e5ce38d014c','2022-09-05 15:55:12','2022-09-05 16:11:03',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e6b66dc014e','2022-09-05 16:11:03','2022-09-05 16:36:11',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e82673e0150','2022-09-05 16:36:10','2022-09-05 16:38:07',0,'<img src=\"/__media/sites/default/logo-ITB-2022.svg\" alt=\"\"ITB 2022 logo\"/>\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e842e490152','2022-09-05 16:38:07','2022-09-05 16:38:20',0,'<img src=\"/__media/sites/default/logo-ITB-2022.svg\" alt=\"\"ITB 2022 logo\"/>\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Editor Change Quick Save',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e8460b70154','2022-09-05 16:38:20','2022-09-05 16:38:38',0,'<p><img 2022=\"\" alt=\"\" itb=\"\" logo=\"\" src=\"/__media/sites/default/logo-ITB-2022.svg\" /></p>\r\n\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Editor Change Quick Save',9,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e84a7710156','2022-09-05 16:38:38','2022-09-05 16:40:32',0,'<img 2022=\"\" alt=\"\" itb=\"\" logo=\"\" src=\"/__media/sites/default/logo-ITB-2022.svg\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e8664d40158','2022-09-05 16:40:32','2022-09-05 16:48:50',0,'<img src=\"/__media/sites/default/logo-ITB-2022.svg\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',11,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e8dfc78015a','2022-09-05 16:48:49','2022-09-05 16:53:08',0,'<img src=\"http://127.0.0.1:61670/__media/sites/default/logo-ITB-2022.svg\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',12,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e91ecf3015c','2022-09-05 16:53:08','2022-09-05 16:54:17',0,'<img src=\"http://127.0.0.1:61670/__media/sites/default/cover-no-logo.png\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',13,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e92fbd7015e','2022-09-05 16:54:17','2022-09-05 16:56:00',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',14,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e948d250160','2022-09-05 16:56:00','2022-09-05 16:57:51',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',15,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e963cd80162','2022-09-05 16:57:50','2022-09-05 18:21:40',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',16,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830ee2fc900165','2022-09-05 18:21:40','2022-09-05 23:13:08',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',17,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830fedd1440169','2022-09-05 23:13:07','2022-09-05 23:13:07',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',18,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01831006f40c016a','2022-09-05 23:40:35','2022-09-05 23:46:00',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c0183100be858016c','2022-09-05 23:45:59','2022-09-05 23:50:12',0,'<div class=\"row\">\r\n	<div class=\"col\"></div>\r\n	<div class=\"col\"></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c0183100fc382016e','2022-09-05 23:50:12','2022-09-05 23:51:47',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/odules_app/contentbox-custom/_content/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/odules_app/contentbox-custom/_content/sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c0183101136040170','2022-09-05 23:51:47','2022-09-05 23:53:14',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/_media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/_media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018310128b210172','2022-09-05 23:53:14','2022-09-06 03:07:40',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018310c48cba0174','2022-09-06 03:07:40','2022-09-06 21:29:13',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c01831117f7960175','2022-09-06 04:38:47','2022-09-06 06:01:35',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831163c6cf0177','2022-09-06 06:01:35','2022-09-06 06:09:29',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c0183116b017d0179','2022-09-06 06:09:29','2022-09-06 06:38:59',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831186016e017b','2022-09-06 06:38:58','2022-09-06 06:57:08',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>Acontent management system that has been decoupled from its presentation layer.</p>\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831196a275017d','2022-09-06 06:57:08','2022-09-07 09:03:45',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that has been decoupled from its presentation layer.</p>\r\n','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c0183137ea0ff017f','2022-09-06 15:50:09','2022-09-06 15:50:43',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183137f25cc0180','2022-09-06 15:50:43','2022-09-06 15:54:16',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831382648d0181','2022-09-06 15:54:16','2022-09-06 15:59:56',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831387932e0183','2022-09-06 15:59:55','2022-09-06 16:06:31',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183138d9a6a0186','2022-09-06 16:06:31','2022-09-06 16:20:56',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183139ace0f0189','2022-09-06 16:20:55','2022-09-06 16:38:31',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c018313aae5f0018c','2022-09-06 16:38:30','2022-09-07 08:59:57',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831413ac24018e','2022-09-06 18:32:57','2022-09-06 18:33:29',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c0183141427c0018f','2022-09-06 18:33:29','2022-09-06 20:05:36',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c01831419fb000191','2022-09-06 18:39:50','2022-09-06 18:40:27',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183141a89030192','2022-09-06 18:40:27','2022-09-06 18:42:41',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183141c94390193','2022-09-06 18:42:41','2022-09-06 18:46:04',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183141fadae0194','2022-09-06 18:46:04','2022-09-06 18:57:21',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183142a01100196','2022-09-06 18:57:20','2022-09-06 18:57:20',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',5,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c018314687d9f0197','2022-09-06 20:05:36','2022-09-07 01:39:52',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c0183147a2be80199','2022-09-06 20:24:55','2022-09-06 20:25:12',0,'<img src=\"http://127.0.0.1:61670/__media/ContentBox_300.png\">','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c0183147a6ead019a','2022-09-06 20:25:12','2022-09-06 20:40:20',0,'<img src=\"http://127.0.0.1:61670/__media/ContentBox_300.png\">','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c01831480f10f019c','2022-09-06 20:32:18','2022-09-06 20:33:06',0,'<h2>Hierarchical Headless Content Store</h2>\r\n<ul>\r\n<li>More than pages and blogs</li>\r\n<li>Hierarchical content store</li>\r\n<li>Core for headless operations</li>\r\n<li>Multiple publishing techiniques</li>\r\n<li>Expressive API for consumption</li>\r\n<li>Power any web app</li>\r\n</ul','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831480f10e019b'),
	('2c9480838309dc9c01831481aab9019d','2022-09-06 20:33:06','2022-09-06 21:40:26',0,'<h2>Hierarchical Headless Content Store</h2>\r\n<ul>\r\n<li>More than pages and blogs</li>\r\n<li>Hierarchical content store</li>\r\n<li>Core for headless operations</li>\r\n<li>Multiple publishing techiniques</li>\r\n<li>Expressive API for consumption</li>\r\n<li>Power any web app</li>\r\n</ul','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831480f10e019b'),
	('2c9480838309dc9c01831485c3b2019f','2022-09-06 20:37:34','2022-09-06 20:37:53',0,'<h2>Headless CMS</h2>\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831485c3b2019e'),
	('2c9480838309dc9c018314860b8901a0','2022-09-06 20:37:53','2022-09-06 21:57:33',0,'<h2>Headless CMS</h2>\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831485c3b2019e'),
	('2c9480838309dc9c018314884b3101a1','2022-09-06 20:40:20','2022-09-06 21:22:48',0,'<h2><img src=\"http://127.0.0.1:61670/__media/ContentBox_300.png\"></h2>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314af2be601a2','2022-09-06 21:22:48','2022-09-06 21:30:29',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314b50a5201a4','2022-09-06 21:29:12','2022-09-06 21:29:12',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',9,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018314b6343501a6','2022-09-06 21:30:29','2022-09-06 21:30:29',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',5,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314bf524101a7','2022-09-06 21:40:26','2022-09-07 09:09:48',0,'<h2>Hierarchical Headless Content Store</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>More than pages and blogs</li>\r\n			<li>Hierarchical content store</li>\r\n			<li>Core for headless operations</li>\r\n			<li>Multiple publishing techiniques</li>\r\n			<li>Expressive API for consumption</li>\r\n			<li>Power any web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831480f10e019b'),
	('2c9480838309dc9c018314cefc0001a8','2022-09-06 21:57:33','2022-09-06 21:59:27',0,'<h2>Headless ContentBox</h2>\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831485c3b2019e'),
	('2c9480838309dc9c018314d0bbeb01a9','2022-09-06 21:59:27','2022-09-06 22:04:09',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/headless-cb.png\"/>\r\n</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831485c3b2019e'),
	('2c9480838309dc9c018314d506ff01aa','2022-09-06 22:04:09','2022-09-06 22:04:09',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',5,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831485c3b2019e'),
	('2c9480838309dc9c018314df347501ac','2022-09-06 22:15:16','2022-09-06 22:15:38',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsors.png\"/>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314df347401ab'),
	('2c9480838309dc9c018314df8b2c01ad','2022-09-06 22:15:38','2022-09-06 22:18:01',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsors.png\"/>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314df347401ab'),
	('2c9480838309dc9c018314e1b8ea01af','2022-09-06 22:18:01','2022-09-06 22:18:01',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsors.png\"/>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314df347401ab'),
	('2c9480838309dc9c018314edf62301b2','2022-09-06 22:31:23','2022-09-06 22:31:50',0,'<h2>Thanks</h2>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314edf62201b0'),
	('2c9480838309dc9c018314ee601801b4','2022-09-06 22:31:50','2022-09-06 22:31:50',0,'<h2>Thanks</h2>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314edf62201b0'),
	('2c9480838309dc9c0183159a848201b6','2022-09-07 01:39:51','2022-09-07 01:51:37',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018315a5472a01b8','2022-09-07 01:51:36','2022-09-07 06:59:55',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018316bf8b6a01ba','2022-09-07 06:59:55','2022-09-07 07:06:09',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsbody.svg\"/>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018316c5407c01bc','2022-09-07 07:06:09','2022-09-07 07:07:36',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018316c6940b01be','2022-09-07 07:07:36','2022-09-07 17:20:04',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/hless-body.svg\"/>','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c0183172d6ed601c1','2022-09-07 08:59:57','2022-09-07 08:59:57',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',8,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831730e98001c3','2022-09-07 09:03:45','2022-09-07 15:24:46',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that has is decoupled from the presentation layer.</p>\r\n','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831736746c01c4','2022-09-07 09:09:48','2022-09-07 09:09:48',0,'<h2>Hierarchical Headless Content Store</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>More than pages and blogs</li>\r\n			<li>Hierarchical content store</li>\r\n			<li>Core for headless operations</li>\r\n			<li>Multiple publishing techniques</li>\r\n			<li>Expressive API for consumption</li>\r\n			<li>Power any web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831480f10e019b'),
	('2c9480838309dc9c0183188dbcf601c6','2022-09-07 15:24:45','2022-09-07 15:24:45',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n','',10,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c018318f74ce401c8','2022-09-07 17:20:03','2022-09-07 17:20:03',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',9,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c01831b144f3e01ca','2022-09-06 03:10:59','2022-09-06 03:23:46',0,'<h2>Advantages</h2>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838309dc9c01831b20004c01cb','2022-09-06 18:43:57','2022-09-08 08:11:53',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838309dc9c01831c27c8e601cd','2022-09-08 08:11:53','2022-09-08 08:11:53',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838309dc9c01831d5f04b901d1','2022-09-08 13:51:50','2022-09-08 13:53:31',0,'<p>These are the presentation slides.</p>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0'),
	('2c9480838309dc9c01831d5f0ec001d5','2022-09-08 13:51:52','2022-12-04 02:19:49',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c9480838309dc9c01831d5f0f4e01d8','2022-09-08 13:51:53','2022-12-04 02:20:42',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0f4d01d6'),
	('2c9480838309dc9c01831d5f0fd601db','2022-09-08 13:51:53','2022-12-04 02:22:57',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0fd501d9'),
	('2c9480838309dc9c01831d5f109801df','2022-09-08 13:51:53','2022-12-04 02:24:37',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f109601dc'),
	('2c9480838309dc9c01831d5f112101e2','2022-09-08 13:51:53','2022-12-04 02:26:44',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f112001e0'),
	('2c9480838309dc9c01831d5f11b801e5','2022-09-08 13:51:53','2022-12-04 02:28:33',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f11b701e3'),
	('2c9480838309dc9c01831d5f124101e8','2022-09-08 13:51:53','2022-12-04 02:50:01',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c9480838309dc9c01831d5f12c301eb','2022-09-08 13:51:53','2022-12-04 02:50:40',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f12c201e9'),
	('2c9480838309dc9c01831d5f131901ed','2022-09-08 13:51:54','2022-12-04 02:58:51',0,'<h2>Hierarchical Headless Content Store</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>More than pages and blogs</li>\r\n			<li>Hierarchical content store</li>\r\n			<li>Core for headless operations</li>\r\n			<li>Multiple publishing techniques</li>\r\n			<li>Expressive API for consumption</li>\r\n			<li>Power any web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c9480838309dc9c01831d5f137201ef','2022-09-08 13:51:54','2022-12-04 03:04:56',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c9480838309dc9c01831d5f13ff01f2','2022-09-08 13:51:54','2022-12-04 03:21:29',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsors.png\"/>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c9480838309dc9c01831d5f14c201f5','2022-09-08 13:51:54','2022-12-04 03:05:22',0,'<h2>Thanks</h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f14c101f3'),
	('2c9480838309dc9c01831d60901301f6','2022-09-08 13:53:31','2022-09-08 13:53:31',0,'<p>These are the presentation slides.</p>\r\n','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0'),
	('2c94808384da81f00184daeeb8920004','2022-12-04 02:19:48','2022-12-04 03:07:12',0,'<h1>ContentBox: El CMS sin Cabeza</h1>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184daef871e0006','2022-12-04 02:20:42','2022-12-04 02:20:42',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0f4d01d6'),
	('2c94808384da81f00184daf197960008','2022-12-04 02:22:57','2022-12-06 00:26:42',0,'<h2>Qué es un CMS sin Cabeza ( Headless CMS)?</h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0fd501d9'),
	('2c94808384da81f00184daf31dbf000b','2022-12-04 02:24:37','2022-12-04 02:24:37',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Tradicional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f109601dc'),
	('2c94808384da81f00184daf50e8b000d','2022-12-04 02:26:44','2022-12-04 02:26:44',0,'<h2>El Cuerpo</h2>\r\n<p>Donde su contenido es creado y guardado:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f112001e0'),
	('2c94808384da81f00184daf6b93d000f','2022-12-04 02:28:33','2022-12-04 03:11:23',0,'<h2>La Cabeza</h2>\r\n<p>La representación visual del contenido en la cocalización digital  ( e.g. website, app mobil, canales de video, etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f11b701e3'),
	('2c94808384da81f00184db0a5f980011','2022-12-04 02:50:01','2022-12-04 03:12:31',0,'<h2>Ventajas de un Headless CMS</h2>\r\n<ul>\r\n		<li>El contenido es reusable</li>\r\n		<li>Da flexibilidad a los desarrolladores del front-end</li>\r\n		<li>Scalabilidad</li>\r\n		<li>Experiencia de omnichannel </li>\r\n		<li>Mejor securidad</li>\r\n		<li>Asegurado para el futuro</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c94808384da81f00184db0af9440013','2022-12-04 02:50:40','2022-12-04 02:50:40',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f12c201e9'),
	('2c94808384da81f00184db1273b90014','2022-12-04 02:58:50','2022-12-04 03:14:04',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Más de paginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Multiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184db1806220015','2022-12-04 03:04:56','2022-12-04 17:20:30',0,'<h2>ContentBox sin Cabeza</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Seguros JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completa Documentación</li>\r\n<li>Conecte a paginas, blog o Content Store</li>\r\n<li>Despleje como unico módulo</li>\r\n<li>Consume de cualquier lenguaje de programación</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c94808384da81f00184db186b0a0017','2022-12-04 03:05:21','2022-12-04 03:05:21',0,'<h2>Gracias</h2>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f14c101f3'),
	('2c94808384da81f00184db1a1c5f001a','2022-12-04 03:07:12','2022-12-04 03:07:12',0,'<h1>ContentBox: <span>El CMS sin Cabeza</span></h1>\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184db1df0a1001c','2022-12-04 03:11:23','2022-12-04 03:11:23',0,'<h2>La Cabeza</h2>\r\n<p>La representación visual del contenido en la localización digital  ( e.g. website, app mobil, canales de video, etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f11b701e3'),
	('2c94808384da81f00184db1ef7aa001e','2022-12-04 03:12:31','2022-12-07 00:06:58',0,'<h2>Ventajas de un Headless CMS</h2>\r\n<ul>\r\n		<li>El contenido es reusable</li>\r\n		<li>Da flexibilidad a los desarrolladores del front-end</li>\r\n		<li>Scalabilidad</li>\r\n		<li>Experiencia de omnichannel </li>\r\n		<li>Mejor seguridad</li>\r\n		<li>Asegurado para el futuro</li>\r\n</ul>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c94808384da81f00184db206304001f','2022-12-04 03:14:04','2022-12-04 06:55:32',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que paginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Multiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184db272d590021','2022-12-04 03:21:28','2022-12-06 00:15:04',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Digicel_business_white.svg\"/>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384da81f00184dbeb27eb0023','2022-12-04 06:55:32','2022-12-04 07:08:58',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Multiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184dbf773450024','2022-12-04 07:08:58','2022-12-04 17:21:02',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184de2756a60026','2022-12-04 17:20:30','2022-12-07 00:10:58',0,'<h2>ContentBox sin Cabeza</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Seguros JWT Clients</li>\r\n<li>Impulsado por ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completa Documentación</li>\r\n<li>Conecte a paginas, blog o Content Store</li>\r\n<li>Despleje como unico módulo</li>\r\n<li>Consume de cualquier lenguaje de programación</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c94808384da81f00184de27d4bb0027','2022-12-04 17:21:02','2022-12-07 00:08:26',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Impulsa cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384e113b20184e4856a7a0006','2022-12-05 23:01:00','2022-12-05 23:18:57',0,'This is my homepage','',1,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e48d35de0008','2022-12-05 23:09:30','2022-12-07 00:29:44',0,'Services page','',1,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e48d35dd0007'),
	('2c94808384e113b20184e48e92490009','2022-12-05 23:11:00','2022-12-05 23:25:59',0,'<p>Hey welcome to my about page for ContentBox, isn\'t this great!</p>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184e495d820000a','2022-12-05 23:18:57','2022-12-05 23:20:31',0,'Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.\r\n\r\nWe know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.','',2,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e49749a1000b','2022-12-05 23:20:31','2022-12-05 23:25:43',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e49c0c68000c','2022-12-05 23:25:43','2022-12-05 23:26:43',0,'<div class=\"row\"><div class=\"col-sm-10 col-sm-offset-1 margintop25\"><h4 class=\"margin10\">We\'re a <strong>product</strong> and <strong>services</strong> company that focuses on building <span class=\"bold-txt\">professional open source</span> tools and <span class=\"bold-txt\">web application solutions.</span></h4> <div></div> <div class=\"row\"><div class=\"col-sm-12\"><div class=\"row margintop30 glow-bg\"><div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/coldbox\" title=\"\" data-original-title=\"ColdBox HMVC\"><img src=\"/http://127.0.0.1:61670__media/products/coldbox-white.png\" alt=\"coldbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/commandbox\" title=\"\" data-original-title=\"CommandBox CLI\"><img src=\"http://127.0.0.1:61670/__media/products/commandbox-white.png\" alt=\"commandbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/contentbox\" title=\"\" data-original-title=\"ContentBox Modular CMS\"><img src=\"http://127.0.0.1:61670/__media/products/contentbox-white.png\" alt=\"contentbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/testbox\" title=\"\" data-original-title=\"TestBox Behavior Driven Development\"><img src=\"http://127.0.0.1:61670/__media/products/testbox-white.png\" alt=\"testbox\" class=\"img-fluid\"></a></div></div></div></div> <div><p class=\" margintop30\">We\'re the team behind <a href=\"/products/coldbox\"><span class=\"textOrtus\">ColdBox</span></a>, the de-facto enterprise ColdFusion MVC Framework, <a href=\"/products/testbox\"><span class=\"textOrtus\">TestBox</span></a>, a Testing and Behavior Driven Development (BDD) Framework, <a href=\"/products/contentbox\"><span class=\"textOrtus\">ContentBox Modular CMS</span></a>, a highly modular and scalable Content Management System, <a href=\"/products/commandbox\"><span class=\"textOrtus\">CommandBox</span></a>, the ColdFusion (CFML) CLI, package manager, etc, and many more.</p> <p>&nbsp;</p></div></div></div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e49c4b7f000d','2022-12-05 23:25:59','2022-12-07 03:38:28',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184e49cf730000e','2022-12-05 23:26:43','2022-12-07 00:24:27',0,'<div class=\"row\"><div class=\"col-sm-10 col-sm-offset-1 margintop25\"><h4 class=\"margin10\">We\'re a <strong>product</strong> and <strong>services</strong> company that focuses on building <span class=\"bold-txt\">professional open source</span> tools and <span class=\"bold-txt\">web application solutions.</span></h4> <div></div> <div class=\"row\"><div class=\"col-sm-12\"><div class=\"row margintop30 glow-bg\"><div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/coldbox\" title=\"\" data-original-title=\"ColdBox HMVC\"><img src=\"http://127.0.0.1:61670/__media/products/coldbox-white.png\" alt=\"coldbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/commandbox\" title=\"\" data-original-title=\"CommandBox CLI\"><img src=\"http://127.0.0.1:61670/__media/products/commandbox-white.png\" alt=\"commandbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/contentbox\" title=\"\" data-original-title=\"ContentBox Modular CMS\"><img src=\"http://127.0.0.1:61670/__media/products/contentbox-white.png\" alt=\"contentbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/testbox\" title=\"\" data-original-title=\"TestBox Behavior Driven Development\"><img src=\"http://127.0.0.1:61670/__media/products/testbox-white.png\" alt=\"testbox\" class=\"img-fluid\"></a></div></div></div></div> <div><p class=\" margintop30\">We\'re the team behind <a href=\"/products/coldbox\"><span class=\"textOrtus\">ColdBox</span></a>, the de-facto enterprise ColdFusion MVC Framework, <a href=\"/products/testbox\"><span class=\"textOrtus\">TestBox</span></a>, a Testing and Behavior Driven Development (BDD) Framework, <a href=\"/products/contentbox\"><span class=\"textOrtus\">ContentBox Modular CMS</span></a>, a highly modular and scalable Content Management System, <a href=\"/products/commandbox\"><span class=\"textOrtus\">CommandBox</span></a>, the ColdFusion (CFML) CLI, package manager, etc, and many more.</p> <p>&nbsp;</p></div></div></div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e4c9387b0011','2022-12-06 00:15:03','2022-12-06 00:25:01',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Digicel_business_white.svg\"/>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Sistema_Fedecredito.png\"/>\r\n\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384e113b20184e4d258bb0013','2022-12-06 00:25:01','2022-12-06 00:25:01',0,'<h2>Gracias a nuestros Patrocindores</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Digicel_business_white.svg\"/>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Sistema_Fedecredito.png\"/>\r\n\r\n','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384e113b20184e4d3dff00015','2022-12-06 00:26:41','2022-12-06 00:26:41',0,'<h2>Qué es un CMS sin Cabeza <span>( Headless CMS)?</span></h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0fd501d9'),
	('2c94808384e113b20184e9e82a0b0017','2022-12-07 00:06:57','2022-12-07 00:06:57',0,'<h2>Ventajas de un Headless CMS</h2>\r\n<ul>\r\n		<li>El contenido es reusable</li>\r\n		<li>Da flexibilidad a los desarrolladores del front-end</li>\r\n		<li>Escalabilidad</li>\r\n		<li>Experiencia de omnichannel </li>\r\n		<li>Mejor seguridad</li>\r\n		<li>Asegurado para el futuro</li>\r\n</ul>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c94808384e113b20184e9e984200018','2022-12-07 00:08:26','2022-12-07 00:09:07',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacén de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiples técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Impulsa cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384e113b20184e9ea24c90019','2022-12-07 00:09:07','2022-12-07 00:09:07',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacén de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiples técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Impulsa cualquier aplicación web</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',8,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384e113b20184e9ebd430001a','2022-12-07 00:10:58','2022-12-07 00:10:58',0,'<h2>ContentBox sin Cabeza</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Seguros JWT Clients</li>\r\n<li>Impulsado por ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completa documentación</li>\r\n<li>Conecta páginas, blog o Content Store</li>\r\n<li>Desplega como único módulo</li>\r\n<li>Consume cualquier lenguaje de programación</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c94808384e113b20184e9f82cc8001b','2022-12-07 00:24:27','2022-12-07 00:24:27',0,'<h2>Manage content easily and deliver it to any device.</h2>\r\n<p>CONTENTBOX is a powerful open-source headless CMS. 100% fully Customizable.</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox-5-dark.png\" alt=\"ContentBox\">','',6,1,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e9fd0269001c','2022-12-07 00:29:44','2022-12-07 00:53:32',0,'<div class=\"container serv-container tw-mx-auto tw-max-w-6xl\"><div class=\"serv-boxes-container tw-mt-12 sm:tw-grid md:tw-grid-cols-3 tw-gap-8 sm:tw-grid-cols-2 tw-flex tw-flex-wrap tw-justify-between\"><div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-support\"><a href=\"./services/support\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl tw-leading-none\">\r\nSupport &amp; Consulting\r\n</p> <div class=\"serv-box-desc serv-box-desc-short\">\r\nGet help when needed.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-web-development\"><a href=\"./services/web-development\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl tw-leading-none\">\r\nCustom Web Development\r\n</p> <div class=\"serv-box-desc serv-box-desc-short\">\r\nLet us help you with your next project.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-uxui\"><a href=\"./services/uxui\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">UX/UI Design</p> <div class=\"serv-box-desc\">\r\nImplement web design carefully crafted to meet your user needs.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-mobile-app\"><a href=\"./services/mobile-app\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">Mobile App</p> <div class=\"serv-box-desc\">\r\nCreate fully-responsive websites, progressive apps and hybrid mobile apps.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-legacy-migration\"><a href=\"./services/legacy-web-application-migration-strategy\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nLegacy Migration\r\n</p> <div class=\"serv-box-desc\">\r\nModernize your code, infrastructure and code deployment pipeline.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-quality-assurance\"><a href=\"./services/quality-assurance\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nQuality Assurance\r\n</p> <div class=\"serv-box-desc\">\r\nModernize your code, infrastructure and code deployment pipeline.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-BI\"><a href=\"./services/business-intelligence\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nBusiness Intelligence\r\n</p> <div class=\"serv-box-desc\">\r\nA real time business intelligence dashboard.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-infrastructure\"><a href=\"./services/servers\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nServer Infrastructure\r\n</p> <div class=\"serv-box-desc\">\r\nDesign scalable and secure infrastructure for the cloud or for on-premise.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-security\"><a href=\"./services/security-performance\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nPerformance &amp; Security\r\n</p> <div class=\"serv-box-desc\">\r\nOptimize performance for your web apps, detect and remediate security vulnerabilities.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-training\"><a href=\"./services/training\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nExpert Training\r\n</p> <div class=\"serv-box-desc\">\r\nAccelerate your learning process of new technologies and get trained by experts.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-government\"><a href=\"./services/government\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">Government</p> <div class=\"serv-box-desc\">\r\nWe are skilled, experienced and ready to Serve!\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div></div></div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e48d35dd0007'),
	('2c94808384e113b20184ea12cfc0001d','2022-12-07 00:53:32','2022-12-07 00:53:32',0,'<div class=\"services\">\r\n	<div class=\"card\">\r\n		<h2>Support &amp; Consulting</h2>\r\n		<p>Get help when needed.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	\r\n	<div class=\"card\">\r\n		<h2>Custom Web Development</h2>\r\n		<p>Let us help you with your next project.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	\r\n	<div class=\"card\">\r\n		<h2>UX/UI Design</h2>\r\n		<p>Implement web design carefully crafted to meet your user needs.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	\r\n	<div class=\"card\">\r\n		<h2>Mobile App</h2>\r\n		<p>Create fully-responsive websites, progressive apps and hybrid mobile apps.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	<div class=\"card\">\r\n		<h2>Legacy Migration</h2>\r\n		<p>Modernize your code, infrastructure and code deployment pipeline.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	<div class=\"card\">\r\n		<h2>Quality Assurance</h2>\r\n		<p>Modernize your code, infrastructure and code deployment pipeline.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n</div>\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e48d35dd0007'),
	('2c94808384e113b20184eaa9cc6b001f','2022-12-07 03:38:27','2022-12-07 03:39:25',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p>\r\n\r\n<h2>Revolutionaries needed!</h2>\r\n<p>We build open source projects for the ColdFusion (CFML) community such as ColdBox, CommandBox, ContentBox.</p>\r\n\r\n<p>Are you looking for freedom from the same boring 9-5 job? Freedom to work with inspiration, creativity, purpose and a team of very motivated and passionate individuals? If so, then we’re looking for you!</p>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184eaaaab3f0020','2022-12-07 03:39:24','2022-12-07 03:42:23',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p><br/><br/>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p><br/><br/>\r\n\r\n<h2>Revolutionaries needed!</h2>\r\n<p>We build open source projects for the ColdFusion (CFML) community such as ColdBox, CommandBox, ContentBox.</p>\r\n<br/><br/>\r\n<p>Are you looking for freedom from the same boring 9-5 job? Freedom to work with inspiration, creativity, purpose and a team of very motivated and passionate individuals? If so, then we’re looking for you!</p>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184eaad62b60021','2022-12-07 03:42:22','2022-12-07 03:42:22',0,'<h2>Get to know us</h2>\r\n\r\n<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p><br/><br/>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p><br/><br/>\r\n\r\n<h2>Revolutionaries needed!</h2>\r\n<p>We build open source projects for the ColdFusion (CFML) community such as ColdBox, CommandBox, ContentBox.</p>\r\n<br/><br/>\r\n<p>Are you looking for freedom from the same boring 9-5 job? Freedom to work with inspiration, creativity, purpose and a team of very motivated and passionate individuals? If so, then we’re looking for you!</p>','',6,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c9580838811b6930188126d88e70004','2023-05-13 00:05:48','2023-05-13 00:05:48',0,'Headless ContentBox in 100 Minutes','',1,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003'),
	('2c9580838811b6930188126f67220008','2023-05-13 00:07:51','2023-05-13 00:08:24',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188126fe82e000b','2023-05-13 00:08:24','2023-05-13 00:08:37',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018812701cad000e','2023-05-13 00:08:37','2023-05-13 00:08:51',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188127050b80011','2023-05-13 00:08:51','2023-05-13 00:10:16',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018812719d530014','2023-05-13 00:10:16','2023-05-13 18:58:26',0,'<h1>ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881271d1c70017','2023-05-13 00:10:29','2023-05-13 00:10:43',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015'),
	('2c9580838811b69301881272081b0019','2023-05-13 00:10:43','2023-05-14 00:57:06',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015'),
	('2c9580838811b6930188167a7c2c001e','2023-05-13 18:58:26','2023-05-13 20:04:28',0,'<h1>ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816b6f0570021','2023-05-13 20:04:28','2023-05-13 20:07:41',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	![](/_content/sites/default/sponsor-logos/sponsors-main.png)\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816b9e4380024','2023-05-13 20:07:41','2023-05-13 20:08:40',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src\"http://127.0.0.1:61670/__media/sites/default/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816baca350027','2023-05-13 20:08:40','2023-05-13 20:09:14',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816bb4c00002a','2023-05-13 20:09:13','2023-05-13 20:34:01',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816d1ff59002d','2023-05-13 20:34:01','2023-05-13 21:31:39',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',11,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881706c0d30030','2023-05-13 21:31:39','2023-05-13 21:33:43',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n</p>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',12,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881708a5980033','2023-05-13 21:33:43','2023-05-13 22:38:11',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',13,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881743ac6c0036','2023-05-13 22:38:11','2023-05-13 22:40:09',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',14,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817457a070039','2023-05-13 22:40:09','2023-05-13 22:55:02',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',15,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188175318c9003d','2023-05-13 22:55:02','2023-05-13 23:08:09',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',16,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188175f1a4c0041','2023-05-13 23:08:09','2023-05-13 23:08:27',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',17,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188175f60c30044','2023-05-13 23:08:27','2023-05-13 23:17:58',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',18,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881768191b0047','2023-05-13 23:17:58','2023-05-13 23:36:31',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',19,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188177915be004a','2023-05-13 23:36:31','2023-05-13 23:37:30',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',20,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881779fa8a004d','2023-05-13 23:37:30','2023-05-13 23:39:48',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',21,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188177c15b40050','2023-05-13 23:39:48','2023-05-13 23:41:09',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',22,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188177d50b00053','2023-05-13 23:41:09','2023-05-13 23:47:36',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',23,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188178338400056','2023-05-13 23:47:36','2023-05-13 23:48:54',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',24,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817846a080059','2023-05-13 23:48:54','2023-05-13 23:49:48',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',25,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817853f11005c','2023-05-13 23:49:48','2023-05-14 00:17:43',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',26,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188179ecdc7005f','2023-05-14 00:17:43','2023-05-14 00:17:43',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY</span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',27,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817c2dc5e0061','2023-05-14 00:57:06','2023-05-18 05:23:01',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015'),
	('2c9580838811b693018817c3db110064','2023-05-14 00:58:12','2023-05-14 00:58:31',0,'<h2>Qué es un CMS sin Cabeza <span>( Headless CMS)?</span></h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817c428420066','2023-05-14 00:58:31','2023-05-14 00:59:56',0,'<h2>Qué es un CMS sin Cabeza <span>( Headless CMS)?</span></h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817c572920068','2023-05-14 00:59:56','2023-05-14 00:59:56',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817c7f7f4006c','2023-05-14 01:02:41','2023-05-14 01:02:52',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817c8229a006f','2023-05-14 01:02:52','2023-05-14 01:03:14',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817c876920072','2023-05-14 01:03:14','2023-05-14 01:18:51',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817d6c23b0075','2023-05-14 01:18:51','2023-05-14 01:19:40',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817d783840078','2023-05-14 01:19:40','2023-05-14 01:19:40',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',5,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817eba458007b','2023-05-14 01:41:39','2023-05-14 01:41:52',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ebd463007d','2023-05-14 01:41:51','2023-05-14 01:42:16',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ec34b8007f','2023-05-14 01:42:16','2023-05-14 01:42:16',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ec68280082','2023-05-14 01:42:29','2023-05-14 01:43:14',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817ed18060084','2023-05-14 01:43:14','2023-05-14 01:43:41',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817ed7f2e0086','2023-05-14 01:43:41','2023-05-14 01:43:41',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817edd97c0089','2023-05-14 01:44:04','2023-05-14 01:44:18',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817ee0ece008b','2023-05-14 01:44:18','2023-05-14 01:44:39',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817ee62a0008d','2023-05-14 01:44:39','2023-05-14 01:44:39',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817f25baa0090','2023-05-14 01:48:59','2023-05-14 01:49:19',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817f25baa008e'),
	('2c9580838811b693018817f2a8ff0092','2023-05-14 01:49:19','2023-05-14 01:49:44',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817f25baa008e'),
	('2c9580838811b693018817f309700094','2023-05-14 01:49:44','2023-05-14 01:49:44',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817f25baa008e'),
	('2c9580838811b69301881835c08a0096','2023-05-14 03:02:36','2023-05-14 03:02:50',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b69301881835f6370097','2023-05-14 03:02:50','2023-05-14 03:03:57',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b69301881836fcda0098','2023-05-14 03:03:57','2023-05-14 18:39:53',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b69301881b8fddca009a','2023-05-14 18:39:53','2023-05-14 18:39:53',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b693018827cd2ce1009d','2023-05-17 03:42:18','2023-05-17 03:42:32',0,'<h2>Thanks</h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827cd631f009f','2023-05-17 03:42:32','2023-05-17 03:42:59',0,'<h2>Thanks</h2>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827cdcc8700a1','2023-05-17 03:42:59','2023-05-17 03:47:23',0,'<h2>Thanks</h2>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827d1d47000a3','2023-05-17 03:47:23','2023-05-17 03:54:40',0,'<h2>Thanks</h2>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827d87ff800a5','2023-05-17 03:54:40','2023-05-17 03:55:35',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\">\r\n</div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827d9576c00a7','2023-05-17 03:55:35','2023-05-17 04:02:46',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827dfebc400a9','2023-05-17 04:02:46','2023-05-17 04:04:04',0,'<h1>THANK YOU</h1>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e11ae900ab','2023-05-17 04:04:04','2023-05-17 04:05:25',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e2588900ae','2023-05-17 04:05:25','2023-05-17 04:06:11',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e30c6c00b0','2023-05-17 04:06:11','2023-05-17 04:07:39',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e4624900b2','2023-05-17 04:07:39','2023-05-17 04:10:06',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.png\" alt=\"Sponsors\"/>\r\n</div>','',11,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e6a18000b4','2023-05-17 04:10:06','2023-05-17 04:11:15',0,'<h2>THANK YOU</h2>\r\n<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.png\" alt=\"Sponsors\"/>\r\n</div>','',12,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e7ae8900b6','2023-05-17 04:11:15','2023-05-17 04:11:15',0,'<h2>THANK YOU</h2>\r\n</br>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.png\" alt=\"Sponsors\"/>\r\n</div>','',13,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b69301882b27c30900b8','2023-05-17 19:20:06','2023-05-17 19:31:58',0,'We are thrilled to announce the highly anticipated release of ColdBox 7, the latest version of the acclaimed web development HMVC framework for ColdFusion (CFML). ColdBox 7 introduces groundbreaking features and advancements, elevating the development experience to new heights and empowering developers to create exceptional web applications and APIs.','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b27c30800b7'),
	('2c9580838811b69301882b32a09200b9','2023-05-17 19:31:58','2023-05-17 19:31:58',0,'We are thrilled to announce the highly anticipated release of ColdBox 7, the latest version of the acclaimed web development HMVC framework for ColdFusion (CFML). ColdBox 7 introduces groundbreaking features and advancements, elevating the development experience to new heights and empowering developers to create exceptional web applications and APIs.','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b27c30800b7'),
	('2c9580838811b69301882b34086c00bb','2023-05-17 19:33:30','2023-05-17 19:34:04',0,'<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b348a8000bc','2023-05-17 19:34:04','2023-05-17 19:36:47',0,'<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b37083e00bd','2023-05-17 19:36:47','2023-05-17 19:37:23',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b37938f00bf','2023-05-17 19:37:23','2023-05-17 19:38:22',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b387c8c00c1','2023-05-17 19:38:22','2023-05-17 19:39:59',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/qrCode.png\" /></div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b39f57500c3','2023-05-17 19:39:59','2023-05-17 19:40:50',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/qrCode.png\" /></div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b3abe2900c5','2023-05-17 19:40:50','2023-05-17 19:41:38',0,'<h2>Review This Session</h2>\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b3b7ae200c7','2023-05-17 19:41:38','2023-05-17 19:41:38',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/qrCode.png\" style=\"width:200px\" /></div>','',8,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b83c5a900c9','2023-05-17 21:00:36','2023-05-17 21:00:46',0,'<h2>Session Resources</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882b83edd600ca','2023-05-17 21:00:46','2023-05-17 21:01:49',0,'<h2>Session Resources</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882b84e29100cb','2023-05-17 21:01:49','2023-05-17 21:02:18',0,'<h2>Session Files</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882b85546600cd','2023-05-17 21:02:18','2023-05-17 21:02:18',0,'<h2>Session Files</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882d4fbd5b00cf','2023-05-18 05:23:00','2023-05-18 05:23:00',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior  Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015');

/*!40000 ALTER TABLE `cb_contentVersion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_customfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_customfield`;

CREATE TABLE `cb_customfield` (
  `customFieldID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`customFieldID`),
  KEY `fk_cb_customfield_FK_contentID` (`FK_contentID`),
  CONSTRAINT `fk_cb_customfield_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_customfield` WRITE;
/*!40000 ALTER TABLE `cb_customfield` DISABLE KEYS */;

INSERT INTO `cb_customfield` (`customFieldID`, `createdDate`, `modifiedDate`, `isDeleted`, `key`, `value`, `FK_contentID`)
VALUES
	('2c9480838309dc9c01830fedd1440167','2022-09-05 23:13:08','2022-09-05 23:13:08',0,'bgImage','__media/sites/default/space-01.png','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830fedd1440168','2022-09-05 23:13:08','2022-09-05 23:13:08',0,'type','cover','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c0183142a01100195','2022-09-06 18:57:21','2022-09-06 18:57:21',0,'bgImage','/__media/sites/default/space-03.png','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c018314b50a5101a3','2022-09-06 21:29:12','2022-09-06 21:29:12',0,'type','video','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018314b6343401a5','2022-09-06 21:30:29','2022-09-06 21:30:29',0,'type','video','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314e1b8e901ae','2022-09-06 22:18:01','2022-09-06 22:18:01',0,'bgImage','/__media/sites/default/space-02.png','2c9480838309dc9c018314df347401ab'),
	('2c9480838309dc9c018314ee601801b3','2022-09-06 22:31:50','2022-09-06 22:31:50',0,'bgImage','/__media/sites/default/space-01.png','2c9480838309dc9c018314edf62201b0'),
	('2c9480838309dc9c0183172d6ed501bf','2022-09-07 08:59:57','2022-09-07 08:59:57',0,'type','sequence','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183172d6ed601c0','2022-09-07 08:59:57','2022-09-07 08:59:57',0,'bgImage','__media/sites/default/space-02.png','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183188dbcf601c5','2022-09-07 15:24:46','2022-09-07 15:24:46',0,'bgImage','/__media/sites/default/headlessBg.png','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c018318f74ce401c7','2022-09-07 17:20:04','2022-09-07 17:20:04',0,'bgImage','/__media/sites/default/space-05.png','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c01831c27c8e501cc','2022-09-08 08:11:53','2022-09-08 08:11:53',0,'bgImage','/__media/sites/default/advantages.png','2c9480838309dc9c01831b144f3d01c9'),
	('2c94808384da81f00184daef871d0005','2022-12-04 02:20:42','2022-12-04 02:20:42',0,'type','video','2c9480838309dc9c01831d5f0f4d01d6'),
	('2c94808384da81f00184daf31dbe0009','2022-12-04 02:24:37','2022-12-04 02:24:37',0,'type','sequence','2c9480838309dc9c01831d5f109601dc'),
	('2c94808384da81f00184daf31dbe000a','2022-12-04 02:24:37','2022-12-04 02:24:37',0,'bgImage','__media/sites/default/space-02.png','2c9480838309dc9c01831d5f109601dc'),
	('2c94808384da81f00184daf50e8a000c','2022-12-04 02:26:44','2022-12-04 02:26:44',0,'bgImage','/__media/sites/default/space-05.png','2c9480838309dc9c01831d5f112001e0'),
	('2c94808384da81f00184db0af9440012','2022-12-04 02:50:40','2022-12-04 02:50:40',0,'type','video','2c9480838309dc9c01831d5f12c201e9'),
	('2c94808384da81f00184db186b090016','2022-12-04 03:05:21','2022-12-04 03:05:21',0,'bgImage','/__media/sites/default/space-01.png','2c9480838309dc9c01831d5f14c101f3'),
	('2c94808384da81f00184db1a1c5e0018','2022-12-04 03:07:12','2022-12-04 03:07:12',0,'bgImage','__media/sites/default/space-01.png','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184db1a1c5e0019','2022-12-04 03:07:12','2022-12-04 03:07:12',0,'type','cover','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184db1df0a1001b','2022-12-04 03:11:23','2022-12-04 03:11:23',0,'bgImage','/__media/sites/default/space-03.png','2c9480838309dc9c01831d5f11b701e3'),
	('2c94808384e113b20184e4d258ba0012','2022-12-06 00:25:01','2022-12-06 00:25:01',0,'bgImage','/__media/sites/default/space-02.png','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384e113b20184e4d3dff00014','2022-12-06 00:26:41','2022-12-06 00:26:41',0,'bgImage','/__media/sites/default/headlessBg.png','2c9480838309dc9c01831d5f0fd501d9'),
	('2c94808384e113b20184e9e82a0a0016','2022-12-07 00:06:57','2022-12-07 00:06:57',0,'bgImage','/__media/sites/default/advantages.png','2c9480838309dc9c01831d5f124001e6'),
	('2c9580838811b6930188179ecdc7005d','2023-05-14 00:17:43','2023-05-14 00:17:43',0,'bgImage','__media/sites/default/itb-2023/bgcover.png','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188179ecdc7005e','2023-05-14 00:17:43','2023-05-14 00:17:43',0,'type','cover','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817c572920067','2023-05-14 00:59:56','2023-05-14 00:59:56',0,'bgImage','/__media/sites/default/headlessBg.png','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817d783840076','2023-05-14 01:19:40','2023-05-14 01:19:40',0,'type','sequence','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817d783840077','2023-05-14 01:19:40','2023-05-14 01:19:40',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817ec34b7007e','2023-05-14 01:42:16','2023-05-14 01:42:16',0,'bgImage','/__media/sites/default/space-05.png','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ed7f2e0085','2023-05-14 01:43:41','2023-05-14 01:43:41',0,'bgImage','/__media/sites/default/space-03.png','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817ee62a0008c','2023-05-14 01:44:39','2023-05-14 01:44:39',0,'bgImage','/__media/sites/default/advantages.png','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817f309700093','2023-05-14 01:49:44','2023-05-14 01:49:44',0,'type','video','2c9580838811b693018817f25baa008e'),
	('2c9580838811b69301881b8fddca0099','2023-05-14 18:39:53','2023-05-14 18:39:53',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b69301881835c08a0095'),
	('2c9580838811b693018827e7ae8800b5','2023-05-17 04:11:15','2023-05-17 04:11:15',0,'bgImage','/__media/sites/default/itb-2023/bg-astronauta.jpg','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b69301882b3b7ae200c6','2023-05-17 19:41:38','2023-05-17 19:41:38',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b85546600cc','2023-05-17 21:02:18','2023-05-17 21:02:18',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882d4fbd5b00ce','2023-05-18 05:23:01','2023-05-18 05:23:01',0,'type','video','2c9580838811b69301881271d1c60015');

/*!40000 ALTER TABLE `cb_customfield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_entry`;

CREATE TABLE `cb_entry` (
  `contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`contentID`),
  CONSTRAINT `fk_cb_entry_contentID` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_entry` WRITE;
/*!40000 ALTER TABLE `cb_entry` DISABLE KEYS */;

INSERT INTO `cb_entry` (`contentID`, `excerpt`)
VALUES
	('2c9480838309dc9c018309dfc73400e5',''),
	('2c9480838309dc9c018309dfcf8d0127',''),
	('2c9580838811b69301882b27c30800b7','Introducing ColdBox 7: Revolutionizing Web Development with Cutting-Edge Features and Unparalleled Performance');

/*!40000 ALTER TABLE `cb_entry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_groupPermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_groupPermissions`;

CREATE TABLE `cb_groupPermissions` (
  `FK_permissionGroupID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_permissionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_groupPermissions_FK_permissionGroupID` (`FK_permissionGroupID`),
  KEY `fk_cb_groupPermissions_FK_permissionID` (`FK_permissionID`),
  CONSTRAINT `fk_cb_groupPermissions_FK_permissionGroupID` FOREIGN KEY (`FK_permissionGroupID`) REFERENCES `cb_permissionGroup` (`permissionGroupID`),
  CONSTRAINT `fk_cb_groupPermissions_FK_permissionID` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_jwt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_jwt`;

CREATE TABLE `cb_jwt` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime NOT NULL,
  `issued` datetime NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cacheKey` (`cacheKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_loginAttempts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_loginAttempts`;

CREATE TABLE `cb_loginAttempts` (
  `loginAttemptsID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` bigint NOT NULL,
  `lastLoginSuccessIP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`loginAttemptsID`),
  KEY `idx_values` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_loginAttempts` WRITE;
/*!40000 ALTER TABLE `cb_loginAttempts` DISABLE KEYS */;

INSERT INTO `cb_loginAttempts` (`loginAttemptsID`, `createdDate`, `modifiedDate`, `isDeleted`, `value`, `attempts`, `lastLoginSuccessIP`)
VALUES
	('2c9480838bb8cfb2018bb8d889a700ce','2023-11-10 10:48:01','2023-11-10 10:48:00',0,'',0,'192.168.65.1'),
	('2c9480838bb8cfb2018bb8d9ad4900d0','2023-11-10 10:49:15','2023-11-10 10:49:15',0,'',0,'192.168.65.1');

/*!40000 ALTER TABLE `cb_loginAttempts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_menu`;

CREATE TABLE `cb_menu` (
  `menuID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuClass` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listClass` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listType` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_siteID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`menuID`),
  KEY `fk_cb_menu_FK_siteID` (`FK_siteID`),
  KEY `idx_menutitle` (`title`),
  KEY `idx_menuslug` (`slug`),
  CONSTRAINT `fk_cb_menu_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_menuItem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_menuItem`;

CREATE TABLE `cb_menuItem` (
  `menuItemID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemClass` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuSlug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentSlug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `js` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_menuID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_parentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`menuItemID`),
  KEY `fk_cb_menuItem_FK_menuID` (`FK_menuID`),
  KEY `fk_cb_menuItem_FK_parentID` (`FK_parentID`),
  KEY `idx_menuItemTitle` (`title`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_menuItem_FK_menuID` FOREIGN KEY (`FK_menuID`) REFERENCES `cb_menu` (`menuID`),
  CONSTRAINT `fk_cb_menuItem_FK_parentID` FOREIGN KEY (`FK_parentID`) REFERENCES `cb_menuItem` (`menuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_module`;

CREATE TABLE `cb_module` (
  `moduleID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryPoint` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webURL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgeBoxSlug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `moduleType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `idx_moduleName` (`name`),
  KEY `idx_entryPoint` (`entryPoint`),
  KEY `idx_activeModule` (`isActive`),
  KEY `idx_moduleType` (`moduleType`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_module` WRITE;
/*!40000 ALTER TABLE `cb_module` DISABLE KEYS */;

INSERT INTO `cb_module` (`moduleID`, `createdDate`, `modifiedDate`, `isDeleted`, `name`, `title`, `version`, `entryPoint`, `author`, `webURL`, `forgeBoxSlug`, `description`, `isActive`, `moduleType`)
VALUES
	('2c9480838bb8cfb2018bb8d03ad3009a','2023-11-10 10:38:56','2023-11-10 10:38:56',0,'Hello','HelloContentBox','','HelloContentBox','Ortus Solutions, Corp','https://www.ortussolutions.com','','This is an awesome hello world module',0,'core');

/*!40000 ALTER TABLE `cb_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_page`;

CREATE TABLE `cb_page` (
  `contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `showInMenu` tinyint(1) NOT NULL DEFAULT '1',
  `order` int DEFAULT '0',
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `layout` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  CONSTRAINT `fk_cb_page_contentID` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_page` WRITE;
/*!40000 ALTER TABLE `cb_page` DISABLE KEYS */;

INSERT INTO `cb_page` (`contentID`, `showInMenu`, `order`, `excerpt`, `layout`)
VALUES
	('2c9480838309dc9c018309dfc80400e9',1,0,'','pages'),
	('2c9480838309dc9c018309dfcfd6012b',1,0,'','pages'),
	('2c9480838309dc9c01830b73c1330134',1,0,'','pages'),
	('2c94808384e113b20184e4856a790005',1,0,'','pages'),
	('2c94808384e113b20184e48d35dd0007',1,0,'','pages');

/*!40000 ALTER TABLE `cb_page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_permission`;

CREATE TABLE `cb_permission` (
  `permissionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`permissionID`),
  UNIQUE KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_permission` WRITE;
/*!40000 ALTER TABLE `cb_permission` DISABLE KEYS */;

INSERT INTO `cb_permission` (`permissionID`, `createdDate`, `modifiedDate`, `isDeleted`, `permission`, `description`)
VALUES
	('019970DE-3AC3-4BF4-96923B73D6511922','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CONTENTSTORE_EDITOR','Ability to create, edit and publish content store elements'),
	('0D70D9F0-BF55-4445-9B5D92269062369E','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'WIDGET_ADMIN','Ability to manage widgets, default is view only'),
	('0F8A07DC-F5F0-4BE2-B63CE8DE2199E6BA','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'ROLES_ADMIN','Ability to manage roles, default is view only'),
	('1005FC1B-50AF-40CC-A65F51B053CEA59B','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CONTENTSTORE_ADMIN','Ability to manage the content store, default is view only'),
	('111B0F37-84D3-44E8-B4F19DC26C09B30D','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_CUSTOM_FIELDS','Ability to manage custom fields in any content editors'),
	('14013F22-472B-4CAA-9988AB93BDFBA8F8','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CONTENTBOX_ADMIN','Access to the enter the ContentBox administrator console'),
	('15034A0E-7520-4C98-BBA38A5132717FCA','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'TOOLS_EXPORT','Ability to export data from ContentBox'),
	('183D9D15-0C9C-4B90-98109B3835587DC4','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'THEME_ADMIN','Ability to manage layouts, default is view only'),
	('3E7FD8DE-B74C-4966-8B5E41C299B5B068','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_TAB','Access to the ContentBox System tools'),
	('45A2E08B-5678-49D3-AC814B772FE885E6','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'ENTRIES_ADMIN','Ability to manage blog entries, default is view only'),
	('463E7F3D-698D-47E0-9260163CDCECA29F','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_AUTH_LOGS','Access to the system auth logs'),
	('4A2AB9D4-5447-4A34-8AAD968F93CDB4BC','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_CACHING','Ability to view the content caching panel'),
	('4F8BF901-1005-48B2-837F44164A8F7DC8','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_FEATURED_IMAGE','Ability to view the featured image panel'),
	('5B4A3907-30AD-4CCF-BA3B634DD73BDAAC','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'VERSIONS_ROLLBACK','Ability to rollback content versions'),
	('5BAE1583-39B1-437A-8B8E4828402A0B81','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_LINKED_CONTENT','Ability to view the linked content panel'),
	('63914F72-5E6E-493C-B9482E5DB654F3A0','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_RAW_SETTINGS','Access to the ContentBox raw geek settings panel'),
	('6408968E-F2FD-4595-9413D7992F8FB61E','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'AUTHOR_ADMIN','Ability to manage authors, default is view only'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'ENTRIES_EDITOR','Ability to create, edit and publish blog entries'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_CATEGORIES','Ability to view the content categories panel'),
	('6AD47B8E-B1D3-4A86-B37E0310298E5E76','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_EDITOR_SELECTOR','Ability to change the editor to another registered online editor'),
	('6EAE7398-A04B-4D9F-B87D701A4E6DB804','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_UPDATES','Ability to view and apply ContentBox updates'),
	('786DE5B9-B9B3-41C3-B765845BC178EB46','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_RELATED_CONTENT','Ability to view the related content panel'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'PAGES_EDITOR','Ability to create, edit and publish pages'),
	('83D5A7EF-6884-4323-A48E115F8CDD13CE','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'RELOAD_MODULES','Ability to reload modules'),
	('89A7A9A9-583B-4B6E-88AC3E7F7765272C','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_MODIFIERS','Ability to view the content modifiers panel'),
	('8CE00003-7044-4439-85EEF0BDBE903338','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EMAIL_TEMPLATE_ADMIN','Ability to admin and preview email templates'),
	('9C5446DF-F069-4FC7-B9826EEE327F703F','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'GLOBALHTML_ADMIN','Ability to manage the system\'s global HTML content used on layouts'),
	('A0B48578-6CDF-47F2-B39830D977121E96','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_SAVE_CONFIGURATION','Ability to update global configuration data'),
	('AECA5EA3-4425-49A2-BCAA767B22A538E7','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SITES_ADMIN','Ability to manage sites'),
	('BCA9BD9C-21D8-472C-97F4F9367F1B6253','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CATEGORIES_ADMIN','Ability to manage categories, default is view only'),
	('BF06F9E3-6455-47FF-933E20A1A2B96526','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MEDIAMANAGER_ADMIN','Ability to manage the system\'s media manager'),
	('C335019F-0E59-41FB-A225E9DE930B90D3','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MODULES_ADMIN','Ability to manage ContentBox Modules'),
	('CB16CFBB-773F-40CA-8943D7378DF34077','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'VERSIONS_DELETE','Ability to delete past content versions'),
	('D0F6F981-67B9-42FB-A26E8575ADAA59E3','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MEDIAMANAGER_LIBRARY_SWITCHER','Ability to switch media manager libraries for management'),
	('D13B72F2-8E14-430A-B42014ADE2893E7B','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'FORGEBOX_ADMIN','Ability to manage ForgeBox installations and connectivity.'),
	('D5B7BF72-485C-4A67-B134FDDCE5CAB228','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MENUS_ADMIN','Ability to manage the menu builder'),
	('D932693F-94D5-46DC-86A50A209366ADC2','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_DISPLAY_OPTIONS','Ability to view the content display options panel'),
	('DE162397-F4B7-4E7D-B88EBEEB2BE1D738','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'GLOBAL_SEARCH','Ability to do global searches in the ContentBox Admin'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'COMMENTS_ADMIN','Ability to manage comments, default is view only'),
	('E5A8C2DB-51BC-4B54-9A764C1EACDF3D87','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'PAGES_ADMIN','Ability to manage content pages, default is view only'),
	('E71FB230-E10D-42BE-92BCC390E734E9D7','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'PERMISSIONS_ADMIN','Ability to manage permissions, default is view only'),
	('EA3CD59D-DBA8-4356-970712840D1F05D4','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_HTML_ATTRIBUTES','Ability to view the content HTML attributes panel'),
	('F0B2AD4D-85ED-4CF0-90F729ED0F58E117','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SECURITYRULES_ADMIN','Ability to manage the system\'s security rules, default is view only'),
	('FF62B28C-D446-4D92-B38248CEFAC7FEB3','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'TOOLS_IMPORT','Ability to import data into ContentBox');

/*!40000 ALTER TABLE `cb_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_permissionGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_permissionGroup`;

CREATE TABLE `cb_permissionGroup` (
  `permissionGroupID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`permissionGroupID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_relatedContent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_relatedContent`;

CREATE TABLE `cb_relatedContent` (
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_relatedContentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_relatedContent_FK_contentID` (`FK_contentID`),
  KEY `fk_cb_relatedContent_FK_relatedContentID` (`FK_relatedContentID`),
  CONSTRAINT `fk_cb_relatedContent_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_relatedContent_FK_relatedContentID` FOREIGN KEY (`FK_relatedContentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_relocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_relocations`;

CREATE TABLE `cb_relocations` (
  `relocationID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_siteID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`relocationID`),
  UNIQUE KEY `unq_cb_relocations_slug_FK_siteID` (`slug`,`FK_siteID`),
  KEY `fk_cb_relocations_FK_siteID` (`FK_siteID`),
  KEY `fk_cb_relocations_FK_contentID` (`FK_contentID`),
  CONSTRAINT `fk_cb_relocations_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_relocations_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_role`;

CREATE TABLE `cb_role` (
  `roleID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`roleID`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_role` WRITE;
/*!40000 ALTER TABLE `cb_role` DISABLE KEYS */;

INSERT INTO `cb_role` (`roleID`, `createdDate`, `modifiedDate`, `isDeleted`, `role`, `description`)
VALUES
	('2c9480838bb8cfb2018bb8dd975900d1','2023-11-10 10:53:32','2023-11-10 10:53:32',0,'API Content Viewer','API Content Viewer'),
	('2D385E92-8555-49BC-ADA8C8ADAF15D250','2023-11-10 11:29:24','2023-11-10 11:29:24',0,'Administrator','A ContentBox Administrator'),
	('439F57E4-877E-4104-A52E647E3B1F63A8','2023-11-10 11:29:24','2023-11-10 11:29:24',0,'Editor','A ContentBox Editor');

/*!40000 ALTER TABLE `cb_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_rolePermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_rolePermissions`;

CREATE TABLE `cb_rolePermissions` (
  `FK_permissionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_roleID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_rolePermissions_FK_permissionID` (`FK_permissionID`),
  KEY `fk_cb_rolePermissions_FK_roleID` (`FK_roleID`),
  CONSTRAINT `fk_cb_rolePermissions_FK_permissionID` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`),
  CONSTRAINT `fk_cb_rolePermissions_FK_roleID` FOREIGN KEY (`FK_roleID`) REFERENCES `cb_role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_rolePermissions` WRITE;
/*!40000 ALTER TABLE `cb_rolePermissions` DISABLE KEYS */;

INSERT INTO `cb_rolePermissions` (`FK_permissionID`, `FK_roleID`)
VALUES
	('019970DE-3AC3-4BF4-96923B73D6511922','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('0D70D9F0-BF55-4445-9B5D92269062369E','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('0F8A07DC-F5F0-4BE2-B63CE8DE2199E6BA','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('1005FC1B-50AF-40CC-A65F51B053CEA59B','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('111B0F37-84D3-44E8-B4F19DC26C09B30D','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('14013F22-472B-4CAA-9988AB93BDFBA8F8','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('15034A0E-7520-4C98-BBA38A5132717FCA','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('183D9D15-0C9C-4B90-98109B3835587DC4','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('3E7FD8DE-B74C-4966-8B5E41C299B5B068','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('45A2E08B-5678-49D3-AC814B772FE885E6','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('463E7F3D-698D-47E0-9260163CDCECA29F','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('4A2AB9D4-5447-4A34-8AAD968F93CDB4BC','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('4F8BF901-1005-48B2-837F44164A8F7DC8','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('5B4A3907-30AD-4CCF-BA3B634DD73BDAAC','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('5BAE1583-39B1-437A-8B8E4828402A0B81','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('63914F72-5E6E-493C-B9482E5DB654F3A0','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('6408968E-F2FD-4595-9413D7992F8FB61E','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('6AD47B8E-B1D3-4A86-B37E0310298E5E76','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('6EAE7398-A04B-4D9F-B87D701A4E6DB804','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('786DE5B9-B9B3-41C3-B765845BC178EB46','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('83D5A7EF-6884-4323-A48E115F8CDD13CE','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('89A7A9A9-583B-4B6E-88AC3E7F7765272C','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('8CE00003-7044-4439-85EEF0BDBE903338','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('9C5446DF-F069-4FC7-B9826EEE327F703F','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('A0B48578-6CDF-47F2-B39830D977121E96','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('AECA5EA3-4425-49A2-BCAA767B22A538E7','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('BCA9BD9C-21D8-472C-97F4F9367F1B6253','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('BF06F9E3-6455-47FF-933E20A1A2B96526','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('C335019F-0E59-41FB-A225E9DE930B90D3','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('CB16CFBB-773F-40CA-8943D7378DF34077','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D0F6F981-67B9-42FB-A26E8575ADAA59E3','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D13B72F2-8E14-430A-B42014ADE2893E7B','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D5B7BF72-485C-4A67-B134FDDCE5CAB228','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D932693F-94D5-46DC-86A50A209366ADC2','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('DE162397-F4B7-4E7D-B88EBEEB2BE1D738','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('E5A8C2DB-51BC-4B54-9A764C1EACDF3D87','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('E71FB230-E10D-42BE-92BCC390E734E9D7','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('EA3CD59D-DBA8-4356-970712840D1F05D4','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('F0B2AD4D-85ED-4CF0-90F729ED0F58E117','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('FF62B28C-D446-4D92-B38248CEFAC7FEB3','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('019970DE-3AC3-4BF4-96923B73D6511922','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('111B0F37-84D3-44E8-B4F19DC26C09B30D','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('14013F22-472B-4CAA-9988AB93BDFBA8F8','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('183D9D15-0C9C-4B90-98109B3835587DC4','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('4A2AB9D4-5447-4A34-8AAD968F93CDB4BC','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('4F8BF901-1005-48B2-837F44164A8F7DC8','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('5B4A3907-30AD-4CCF-BA3B634DD73BDAAC','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('5BAE1583-39B1-437A-8B8E4828402A0B81','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('6AD47B8E-B1D3-4A86-B37E0310298E5E76','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('786DE5B9-B9B3-41C3-B765845BC178EB46','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('89A7A9A9-583B-4B6E-88AC3E7F7765272C','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('8CE00003-7044-4439-85EEF0BDBE903338','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('9C5446DF-F069-4FC7-B9826EEE327F703F','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('BCA9BD9C-21D8-472C-97F4F9367F1B6253','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('BF06F9E3-6455-47FF-933E20A1A2B96526','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('D5B7BF72-485C-4A67-B134FDDCE5CAB228','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('D932693F-94D5-46DC-86A50A209366ADC2','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('DE162397-F4B7-4E7D-B88EBEEB2BE1D738','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('EA3CD59D-DBA8-4356-970712840D1F05D4','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','2c9480838bb8cfb2018bb8dd975900d1'),
	('019970DE-3AC3-4BF4-96923B73D6511922','2c9480838bb8cfb2018bb8dd975900d1'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','2c9480838bb8cfb2018bb8dd975900d1'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','2c9480838bb8cfb2018bb8dd975900d1'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','2c9480838bb8cfb2018bb8dd975900d1');

/*!40000 ALTER TABLE `cb_rolePermissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_securityRule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_securityRule`;

CREATE TABLE `cb_securityRule` (
  `ruleID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `whitelist` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `securelist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overrideEvent` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useSSL` tinyint(1) NOT NULL DEFAULT '0',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'redirect',
  `module` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `httpMethods` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `allowedIPs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `order` int NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messageType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'info',
  PRIMARY KEY (`ruleID`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_securityRule` WRITE;
/*!40000 ALTER TABLE `cb_securityRule` DISABLE KEYS */;

INSERT INTO `cb_securityRule` (`ruleID`, `createdDate`, `modifiedDate`, `isDeleted`, `whitelist`, `securelist`, `match`, `roles`, `permissions`, `redirect`, `overrideEvent`, `useSSL`, `action`, `module`, `httpMethods`, `allowedIPs`, `order`, `message`, `messageType`)
VALUES
	('2c9480838309dc9c018309dfc2dd00c9','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:modules\\..*','event','','MODULES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc2f100ca','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:mediamanager\\..*','event','','MEDIAMANAGER_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc30500cb','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:versions\\.(remove)','event','','VERSIONS_DELETE','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc31c00cc','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:versions\\.(rollback)','event','','VERSIONS_ROLLBACK','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc32e00cd','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:widgets\\.(remove|upload|edit|save|create|doCreate)$','event','','WIDGET_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',2,'','info'),
	('2c9480838309dc9c018309dfc34100ce','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:tools\\.(importer|doImport)','event','','TOOLS_IMPORT','cbadmin/security/login','',0,'redirect','contentbox','*','*',3,'','info'),
	('2c9480838309dc9c018309dfc35400cf','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:(settings|permissions|roles|securityRules)\\..*','event','','SYSTEM_TAB','cbadmin/security/login','',0,'redirect','contentbox','*','*',4,'','info'),
	('2c9480838309dc9c018309dfc36700d0','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:settings\\.save','event','','SYSTEM_SAVE_CONFIGURATION','cbadmin/security/login','',0,'redirect','contentbox','*','*',5,'','info'),
	('2c9480838309dc9c018309dfc37b00d1','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:settings\\.(raw|saveRaw|flushCache|flushSingletons|mappingDump|viewCached|remove)','event','','SYSTEM_RAW_SETTINGS','cbadmin/security/login','',0,'redirect','contentbox','*','*',6,'','info'),
	('2c9480838309dc9c018309dfc39000d2','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:securityRules\\.(remove|save|changeOrder|apply)','event','','SECURITYRULES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',7,'','info'),
	('2c9480838309dc9c018309dfc3a300d3','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:roles\\.(remove|removePermission|save|savePermission)','event','','ROLES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',8,'','info'),
	('2c9480838309dc9c018309dfc3b600d4','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:permissions\\.(remove|save)','event','','PERMISSIONS_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',9,'','info'),
	('2c9480838309dc9c018309dfc3ca00d5','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:dashboard\\.reload','event','','RELOAD_MODULES','cbadmin/security/login','',0,'redirect','contentbox','*','*',10,'','info'),
	('2c9480838309dc9c018309dfc3dd00d6','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:pages\\.(changeOrder|remove)','event','','PAGES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',11,'','info'),
	('2c9480838309dc9c018309dfc3f000d7','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:themes\\.(remove|upload|rebuildRegistry|activate)','event','','THEME_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',12,'','info'),
	('2c9480838309dc9c018309dfc40400d8','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:entries\\.(quickPost|remove)','event','','ENTRIES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',13,'','info'),
	('2c9480838309dc9c018309dfc41600d9','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:contentStore\\.(editor|remove|save)','event','','CONTENTSTORE_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',14,'','info'),
	('2c9480838309dc9c018309dfc42b00da','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:comments\\.(doStatusUpdate|editor|moderate|remove|save|saveSettings)','event','','COMMENTS_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',15,'','info'),
	('2c9480838309dc9c018309dfc43e00db','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:categories\\.(remove|save)','event','','CATEGORIES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',16,'','info'),
	('2c9480838309dc9c018309dfc45200dc','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:authors\\.(remove|removePermission|savePermission|doPasswordReset|new|doNew)','event','','AUTHOR_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',17,'','info'),
	('2c9480838309dc9c018309dfc46700dd','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'^contentbox-admin:security\\.','^contentbox-admin:.*','event','','CONTENTBOX_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',18,'','info'),
	('2c9480838309dc9c018309dfc47c00de','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-filebrowser:.*','event','','MEDIAMANAGER_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',19,'','info'),
	('2c9480838309dc9c018309dfc49200df','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:(authors|categories|permissions|roles|settings|pages|entries|contentStore|securityrules)\\.importAll$','event','','TOOLS_IMPORT','cbadmin/security/login','',0,'redirect','contentbox','*','*',20,'','info'),
	('2c9480838309dc9c018309dfc4a900e0','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:(authors|categories|permissions|roles|settings|pages|entries|contentStore|securityrules)\\.(export|exportAll)$','event','','TOOLS_EXPORT','cbadmin/security/login','',0,'redirect','contentbox','*','*',20,'','info');

/*!40000 ALTER TABLE `cb_securityRule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_setting`;

CREATE TABLE `cb_setting` (
  `settingID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCore` tinyint(1) NOT NULL DEFAULT '0',
  `FK_siteID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`settingID`),
  KEY `fk_cb_setting_FK_siteID` (`FK_siteID`),
  KEY `idx_core` (`isCore`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_setting_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_setting` WRITE;
/*!40000 ALTER TABLE `cb_setting` DISABLE KEYS */;

INSERT INTO `cb_setting` (`settingID`, `createdDate`, `modifiedDate`, `isDeleted`, `name`, `value`, `isCore`, `FK_siteID`)
VALUES
	('2c9480838309dc9c018309dfd04d012f','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'cb_active','true',0,NULL),
	('2c9480838bb8cfb2018bb8d0278a0000','2023-11-10 10:38:51','2023-11-10 10:38:51',0,'cb_security_login_blocker','true',1,NULL),
	('2c9480838bb8cfb2018bb8d027c20001','2023-11-10 10:38:51','2023-11-10 10:38:51',0,'cb_media_allowDelete','true',1,NULL),
	('2c9480838bb8cfb2018bb8d027d50002','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_login_signin_text','',1,NULL),
	('2c9480838bb8cfb2018bb8d027de0003','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_versions_max_history','',1,NULL),
	('2c9480838bb8cfb2018bb8d027e60004','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_duration','1',1,NULL),
	('2c9480838bb8cfb2018bb8d027f10005','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_description','ContentBox RSS Feed',1,NULL),
	('2c9480838bb8cfb2018bb8d027f80006','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_html5uploads_maxFiles','25',1,NULL),
	('2c9480838bb8cfb2018bb8d028030007','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_password','',1,NULL),
	('2c9480838bb8cfb2018bb8d0280d0008','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_cacheName','Template',1,NULL),
	('2c9480838bb8cfb2018bb8d028150009','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_editors_markup','HTML',1,NULL),
	('2c9480838bb8cfb2018bb8d02820000a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cacheName','Template',1,NULL),
	('2c9480838bb8cfb2018bb8d02832000b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_editors_ckeditor_toolbar','[\n		{ \"name\": \"document\",    \"items\" : [ \"Source\",\"-\",\"Maximize\",\"ShowBlocks\" ] },\n		{ \"name\": \"clipboard\",   \"items\" : [ \"Cut\",\"Copy\",\"Paste\",\"PasteText\",\"PasteFromWord\",\"-\",\"Undo\",\"Redo\" ] },\n		{ \"name\": \"editing\",     \"items\" : [ \"Find\",\"Replace\",\"SpellChecker\"] },\n		{ \"name\": \"forms\",       \"items\" : [ \"Form\", \"Checkbox\", \"Radio\", \"TextField\", \"Textarea\", \"Select\", \"Button\",\"HiddenField\" ] },\n		\"/\",\n		{ \"name\": \"basicstyles\", \"items\" : [ \"Bold\",\"Italic\",\"Underline\",\"Strike\",\"Subscript\",\"Superscript\",\"-\",\"RemoveFormat\" ] },\n		{ \"name\": \"paragraph\",   \"items\" : [ \"NumberedList\",\"BulletedList\",\"-\",\"Outdent\",\"Indent\",\"-\",\"Blockquote\",\"CreateDiv\",\"-\",\"JustifyLeft\",\"JustifyCenter\",\"JustifyRight\",\"JustifyBlock\",\"-\",\"BidiLtr\",\"BidiRtl\" ] },\n		{ \"name\": \"links\",       \"items\" : [ \"Link\",\"Unlink\",\"Anchor\" ] },\n		\"/\",\n		{ \"name\": \"styles\",      \"items\" : [ \"Styles\",\"Format\" ] },\n		{ \"name\": \"colors\",      \"items\" : [ \"TextColor\",\"BGColor\" ] },\n		{ \"name\": \"insert\",      \"items\" : [ \"Image\",\"Table\",\"HorizontalRule\",\"Smiley\",\"SpecialChar\",\"Iframe\",\"InsertPre\"] },\n		{ \"name\": \"contentbox\",  \"items\" : [ \"MediaEmbed\",\"cbIpsumLorem\",\"cbWidgets\",\"cbContentStore\",\"cbLinks\",\"cbEntryLinks\" ] }\n		]',1,NULL),
	('2c9480838bb8cfb2018bb8d0284f000c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_logging','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02862000d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_settings_cache','template',1,NULL),
	('2c9480838bb8cfb2018bb8d0286c000e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_versions_commit_mandatory','false',1,NULL),
	('2c9480838bb8cfb2018bb8d0287f000f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_notify_page','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028870010','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_username','',1,NULL),
	('2c9480838bb8cfb2018bb8d028920011','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_webmaster','',1,NULL),
	('2c9480838bb8cfb2018bb8d028ab0012','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_title','RSS Feed by ContentBox',1,NULL),
	('2c9480838bb8cfb2018bb8d028c10013','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_acceptMimeTypes','',1,NULL),
	('2c9480838bb8cfb2018bb8d028ca0014','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_notify_author','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028d50015','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_welcome_title','Dashboard',1,NULL),
	('2c9480838bb8cfb2018bb8d028de0016','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_page_excerpts','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028e70017','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_outgoingEmail','info@contentbox.org',1,NULL),
	('2c9480838bb8cfb2018bb8d028ee0018','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_newsfeed','https://www.ortussolutions.com/blog/rss',1,NULL),
	('2c9480838bb8cfb2018bb8d028f40019','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_createFolders','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028fc001a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_min_password_length','8',1,NULL),
	('2c9480838bb8cfb2018bb8d02904001b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_newsfeed_count','5',1,NULL),
	('2c9480838bb8cfb2018bb8d0290a001c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_cachingTimeout','60',1,NULL),
	('2c9480838bb8cfb2018bb8d02916001d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cachingTimeoutIdle','15',1,NULL),
	('2c9480838bb8cfb2018bb8d02925001e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_html5uploads_maxFileSize','100',1,NULL),
	('2c9480838bb8cfb2018bb8d02937001f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_salt','D124CB584B2B1FDC91F9246C37F60959C88E63FAF15AC736B2EE924ACF97D90C011F8F1E983D8B1B73CFE676938990D49ED12672FAADFB4F6DFE9D53E8E2DEB3',1,NULL),
	('2c9480838bb8cfb2018bb8d029450020','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_server','',1,NULL),
	('2c9480838bb8cfb2018bb8d029500021','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_quickViewWidth','400',1,NULL),
	('2c9480838bb8cfb2018bb8d029570022','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_2factorAuth_trusted_days','30',1,NULL),
	('2c9480838bb8cfb2018bb8d029630023','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_generator','ContentBox by Ortus Solutions',1,NULL),
	('2c9480838bb8cfb2018bb8d0296d0024','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_bot_regex','Google|msnbot|Rambler|Yahoo|AbachoBOT|accoona|AcioRobot|ASPSeek|CocoCrawler|Dumbot|FAST-WebCrawler|GeonaBot|Gigabot|Lycos|MSRBOT|Scooter|AltaVista|IDBot|eStyle|Scrubby',1,NULL),
	('2c9480838bb8cfb2018bb8d0298b0025','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_editors_ckeditor_excerpt_toolbar','[\n		{ \"name\": \"document\",    \"items\" : [ \"Source\",\"-\",\"Maximize\",\"ShowBlocks\" ] },\n		{ \"name\": \"basicstyles\", \"items\" : [ \"Bold\",\"Italic\",\"Underline\",\"Strike\",\"Subscript\",\"Superscript\"] },\n		{ \"name\": \"paragraph\",   \"items\" : [ \"NumberedList\",\"BulletedList\",\"-\",\"Outdent\",\"Indent\",\"CreateDiv\"] },\n		{ \"name\": \"links\",       \"items\" : [ \"Link\",\"Unlink\",\"Anchor\" ] },\n		{ \"name\": \"insert\",      \"items\" : [ \"Image\",\"Flash\",\"Table\",\"HorizontalRule\",\"Smiley\",\"SpecialChar\" ] },\n		{ \"name\": \"contentbox\",  \"items\" : [ \"MediaEmbed\",\"cbIpsumLorem\",\"cbWidgets\",\"cbContentStore\",\"cbLinks\",\"cbEntryLinks\" ] }\n		]',1,NULL),
	('2c9480838bb8cfb2018bb8d0299f0026','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_blocktime','5',1,NULL),
	('2c9480838bb8cfb2018bb8d029aa0027','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_contentstore_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d029b40028','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_gravatar_rating','PG',1,NULL),
	('2c9480838bb8cfb2018bb8d029c30029','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_maintenance_message','<h1>This site is down for maintenance.<br /> Please check back again soon.</h1>',1,NULL),
	('2c9480838bb8cfb2018bb8d029cb002a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_admin_theme','contentbox-default',1,NULL),
	('2c9480838bb8cfb2018bb8d029d4002b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_recentcontentstore','5',1,NULL),
	('2c9480838bb8cfb2018bb8d029de002c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cachingTimeout','60',1,NULL),
	('2c9480838bb8cfb2018bb8d029e7002d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_login_signout_url','',1,NULL),
	('2c9480838bb8cfb2018bb8d029f5002e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_ssl','false',1,NULL),
	('2c9480838bb8cfb2018bb8d029fc002f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_paging_bandgap','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02a0a0030','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_maxComments','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02a1e0031','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02a2e0032','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_allowDownloads','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02a440033','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02a630034','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_hit_ignore_bots','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02a7d0035','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_copyright','Ortus Solutions, Corp (www.ortussolutions.com)',1,NULL),
	('2c9480838bb8cfb2018bb8d02a980036','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_maintenance','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02a9b0037','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_cachingTimeoutIdle','15',1,NULL),
	('2c9480838bb8cfb2018bb8d02abf0038','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_admin_ssl','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02acf0039','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_paging_maxentries','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02ae4003a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_recentComments','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02aec003b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_latest_logins','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02b00003c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cachingHeader','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02b10003d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_search_adapter','contentbox.models.search.DBSearch',1,NULL),
	('2c9480838bb8cfb2018bb8d02b1f003e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_password_reset_expiration','60',1,NULL),
	('2c9480838bb8cfb2018bb8d02b5e003f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_notify_entry','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02b710040','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_smtp','25',1,NULL),
	('2c9480838bb8cfb2018bb8d02b7d0041','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_message','<p>You are making too many requests too fast, please slow down and wait {duration} seconds</p>',1,NULL),
	('2c9480838bb8cfb2018bb8d02b8b0042','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_2factorAuth_force','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02b940043','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_paging_maxrows','20',1,NULL),
	('2c9480838bb8cfb2018bb8d02b9c0044','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_count','4',1,NULL),
	('2c9480838bb8cfb2018bb8d02ba30045','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_max_attempts','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02ba70046','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_admin_quicksearch_max','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02bac0047','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_comments_whoisURL','http://whois.arin.net/ui/query.do?q',1,NULL),
	('2c9480838bb8cfb2018bb8d02bbf0048','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_2factorAuth_provider','email',1,NULL),
	('2c9480838bb8cfb2018bb8d02bca0049','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_max_auth_logs','500',1,NULL),
	('2c9480838bb8cfb2018bb8d02bd6004a','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_dashboard_recentPages','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02beb004b','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_editors_default','ckeditor',1,NULL),
	('2c9480838bb8cfb2018bb8d02bf6004c','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_site_mail_tls','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02c01004d','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_version','6.0.0-snapshot',1,NULL),
	('2c9480838bb8cfb2018bb8d02c08004e','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_provider','CFContentMediaProvider',1,NULL),
	('2c9480838bb8cfb2018bb8d02c0e004f','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_gravatar_display','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c190050','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_editors_ckeditor_extraplugins','cbKeyBinding,cbWidgets,cbLinks,cbEntryLinks,cbContentStore,cbIpsumLorem,wsc,mediaembed,insertpre,justify,colorbutton,showblocks,find,div,smiley,specialchar,iframe',1,NULL),
	('2c9480838bb8cfb2018bb8d02c270051','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_site_email','info@contentbox.org',1,NULL),
	('2c9480838bb8cfb2018bb8d02c2c0052','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_notify_contentstore','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c370053','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_paging_maxRSSComments','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02c3d0054','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_provider_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c400055','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_site_blog_entrypoint','blog',1,NULL),
	('2c9480838bb8cfb2018bb8d02c4d0056','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_allowUploads','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c5e0057','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_dashboard_welcome_body','',1,NULL),
	('2c9480838bb8cfb2018bb8d02c660058','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_directoryRoot','/contentbox-custom/_content',1,NULL),
	('2c9480838bb8cfb2018bb8d02c6e0059','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_search_maxResults','20',1,NULL),
	('2c9480838bb8cfb2018bb8d02c7a005a','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_rate_limiter_bots_only','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c88005b','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_content_uiexport','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c94005c','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_entry_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02ca4005d','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_content_hit_count','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02cd7005e','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_rss_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02cf5005f','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_rate_limiter_redirectURL','',1,NULL),
	('2c9480838bb8cfb2018bb8d02d090060','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_dashboard_recentEntries','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02d130061','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_rss_maxEntries','10',1,NULL),
	('2c9480838bb8cfb2018bb8d0309f0062','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blacklist','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030b20063','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preArchivesDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030be0064','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_enabled','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030d70065','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_prePageDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030ec0066','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postCommentForm','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030f80067','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterContent','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031010068','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postIndexDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0310b0069','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notify','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03119006a','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blockedlist','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03131006b','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeContent','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0313b006c','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postArchivesDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03150006d','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterBodyStart','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03168006e','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notifyemails','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03195006f','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preIndexDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031a50070','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterFooter','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031b20071','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeHeadEnd','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031c60072','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterSideBar','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032150073','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0322c0074','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preEntryDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032380075','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postPageDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032460076','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postEntryDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032520077','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_whitelist','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0325e0078','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_maxDisplayChars','500',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0326a0079','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeBodyEnd','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03276007a','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_expiration','30',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03280007b','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_notify','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03288007c','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeSideBar','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03291007d','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preCommentForm','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032b0007e','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blacklist','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032b9007f','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preArchivesDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032c10080','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_enabled','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032cb0081','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_prePageDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032d40082','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postCommentForm','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032e20083','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterContent','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032ee0084','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postIndexDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032f70085','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notify','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032fe0086','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blockedlist','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033050087','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeContent','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0330b0088','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postArchivesDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033330089','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterBodyStart','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d03341008a','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notifyemails','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d03352008b','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preIndexDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0337e008c','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterFooter','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0338b008d','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeHeadEnd','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0339e008e','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_afterSideBar','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033b6008f','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033c10090','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_preEntryDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033f00091','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_postPageDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034030092','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_postEntryDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034130093','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation_whitelist','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034210094','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_maxDisplayChars','500',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0343b0095','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_beforeBodyEnd','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034460096','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation_expiration','30',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034570097','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation_notify','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034620098','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_beforeSideBar','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0346e0099','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_preCommentForm','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04834009b','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cbBootswatchTheme','green',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0483b009c','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderColors','false',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0484b009d','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderBGColor','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0485d009e','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderTextColor','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d04871009f','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cssStyleOverrides','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0487500a0','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_headerLogo','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0488100a1','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showSiteSearch','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048a300a2','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_footerBox','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048ad00a3','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderTitle','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048b100a4','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderText','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048b700a5','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderLink','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048bc00a6','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBtnText','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048c400a7','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBtnStyle','primary',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048d100a8','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBg','green',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048d500a9','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderImgBg','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048db00aa','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBgPos','Top Center',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048e700ab','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBgPaddingTop','100px',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048ea00ac','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBgPaddingBottom','50px',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048ee00ad','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_rssDiscovery','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048f000ae','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showCategoriesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048f500af','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showRecentEntriesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048f900b0','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showSiteUpdatesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0490500b1','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showEntryCommentsBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0490f00b2','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showArchivesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0491800b3','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showEntriesSearchBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d04aba00b4','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cbBootswatchTheme','green',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ac500b5','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderColors','false',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ac800b6','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderBGColor','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ad300b7','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderTextColor','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04afc00b8','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cssStyleOverrides','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b1f00b9','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_headerLogo','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b2900ba','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showSiteSearch','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b4200bb','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_footerBox','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b5000bc','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderTitle','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b6000bd','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderText','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b6c00be','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderLink','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b7200bf','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBtnText','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b7a00c0','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBtnStyle','primary',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b7d00c1','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBg','green',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b8a00c2','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderImgBg','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b9700c3','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBgPos','Top Center',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b9c00c4','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBgPaddingTop','100px',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b9f00c5','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBgPaddingBottom','50px',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ba800c6','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_rssDiscovery','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04bb100c7','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showCategoriesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04bce00c8','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showRecentEntriesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c2900c9','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showSiteUpdatesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c3100ca','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showEntryCommentsBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c3500cb','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showArchivesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c3c00cc','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showEntriesSearchBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d156d600cd','2023-11-10 10:40:09','2023-11-10 10:40:09',0,'cb_enc_key','nFWVC5ljC6hk4YekQl8Wcw==',0,NULL);

/*!40000 ALTER TABLE `cb_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_site`;

CREATE TABLE `cb_site` (
  `siteID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `domainRegex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isBlogEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `isSitemapEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `poweredByHeader` tinyint(1) NOT NULL DEFAULT '1',
  `adminBar` tinyint(1) NOT NULL DEFAULT '1',
  `isSSL` tinyint(1) NOT NULL DEFAULT '0',
  `activeTheme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notificationEmails` longtext COLLATE utf8mb4_unicode_ci,
  `notifyOnEntries` tinyint(1) NOT NULL DEFAULT '1',
  `notifyOnPages` tinyint(1) NOT NULL DEFAULT '1',
  `notifyOnContentStore` tinyint(1) NOT NULL DEFAULT '1',
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `mediaDisk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domainAliases` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`siteID`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_siteSlug` (`slug`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_site` WRITE;
/*!40000 ALTER TABLE `cb_site` DISABLE KEYS */;

INSERT INTO `cb_site` (`siteID`, `createdDate`, `modifiedDate`, `isDeleted`, `name`, `slug`, `description`, `domainRegex`, `keywords`, `tagline`, `homepage`, `isBlogEnabled`, `isSitemapEnabled`, `poweredByHeader`, `adminBar`, `isSSL`, `activeTheme`, `notificationEmails`, `notifyOnEntries`, `notifyOnPages`, `notifyOnContentStore`, `domain`, `isActive`, `mediaDisk`, `domainAliases`)
VALUES
	('2c9480838309dc9c018309dfb74e00af','2022-09-04 18:59:59','2023-11-10 10:50:06',0,'Headless ContentBox','default','This manages all of our headless content','127\\.0\\.0\\.1','','A Magical Headless CMS ','cbBlog',1,1,1,1,0,'default','esme@ortussolutions.com',1,1,1,'127.0.0.1',1,'contentbox','[]'),
	('2c9480838309dc9c018309dfcbbe0109','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'Development Site','development','A development site','localhost','','','cbBlog',1,1,1,1,0,'default','esme@ortussolutions.com',1,1,1,'localhost',1,NULL,'[]');

/*!40000 ALTER TABLE `cb_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_stats`;

CREATE TABLE `cb_stats` (
  `statsID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `hits` bigint NOT NULL DEFAULT '0',
  `FK_contentID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`statsID`),
  KEY `fk_cb_stats_FK_contentID` (`FK_contentID`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_stats_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_subscribers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_subscribers`;

CREATE TABLE `cb_subscribers` (
  `subscriberID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `subscriberEmail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriberToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subscriberID`),
  KEY `idx_subscriberEmail` (`subscriberEmail`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_subscriptions`;

CREATE TABLE `cb_subscriptions` (
  `subscriptionID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriberToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_subscriberID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subscriptionID`),
  KEY `fk_cb_subscriptions_FK_subscriberID` (`FK_subscriberID`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_subscriptions_FK_subscriberID` FOREIGN KEY (`FK_subscriberID`) REFERENCES `cb_subscribers` (`subscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cbsecurity_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cbsecurity_logs`;

CREATE TABLE `cbsecurity_logs` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `securityRule` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpMethod` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queryString` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cbsecurity` (`logDate`,`action`,`blockType`),
  KEY `idx_cbsecurity_userId` (`userId`),
  KEY `idx_cbsecurity_userAgent` (`userAgent`),
  KEY `idx_cbsecurity_ip` (`ip`),
  KEY `idx_cbsecurity_host` (`host`),
  KEY `idx_cbsecurity_httpMethod` (`httpMethod`),
  KEY `idx_cbsecurity_path` (`path`),
  KEY `idx_cbsecurity_referer` (`referer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cbsecurity_logs` WRITE;
/*!40000 ALTER TABLE `cbsecurity_logs` DISABLE KEYS */;

INSERT INTO `cbsecurity_logs` (`id`, `logDate`, `securityRule`, `action`, `blockType`, `ip`, `host`, `httpMethod`, `path`, `queryString`, `referer`, `userAgent`, `userId`)
VALUES
	('95c2fbdd-aea7-48c9-b22b-f1234c0ec20e','2023-11-10 10:40:09','{\"httpMethods\":\"*\",\"message\":\"\",\"isDeleted\":false,\"messageType\":\"info\",\"match\":\"event\",\"permissions\":\"CONTENTBOX_ADMIN\",\"ruleID\":\"2c9480838309dc9c018309dfc46700dd\",\"module\":\"contentbox\",\"order\":18,\"createdDate\":\"September, 04 2022 19:00:03 +0000\",\"whitelist\":\"^contentbox-admin:security\\\\.\",\"overrideEvent\":\"\",\"securelist\":\"^contentbox-admin:.*\",\"allowedIPs\":\"*\",\"useSSL\":false,\"modifiedDate\":\"September, 04 2022 19:00:03 +0000\",\"action\":\"redirect\",\"roles\":\"\",\"redirect\":\"cbadmin/security/login\"}','redirect','authentication','192.168.65.1','localhost:61670','GET','/cbadmin','','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','');

/*!40000 ALTER TABLE `cbsecurity_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cfmigrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cfmigrations`;

CREATE TABLE `cfmigrations` (
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration_ran` datetime NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cfmigrations` WRITE;
/*!40000 ALTER TABLE `cfmigrations` DISABLE KEYS */;

INSERT INTO `cfmigrations` (`name`, `migration_ran`)
VALUES
	('2020_01_01_150933_init','2023-11-10 11:29:25'),
	('2020_08_24_150933_v5Upgrade','2023-11-10 11:29:25'),
	('2022_03_07_155812_v5_1_0_page_sslonly_removals','2023-11-10 11:29:25'),
	('2022_04_20_143337_v5_3_0_deprecateMobileLayout','2023-11-10 11:29:25'),
	('2022_05_27_133613_v_5_3_0_CONTENTBOX-1437-Drop-cacheLayout-Column','2023-11-10 11:29:25'),
	('2022_08_05_153052_v_5_3_0_EditorsCanPublishNow','2023-11-10 11:29:25'),
	('2022_10_13_133204_v_6_0_0_Unique-Site-Slug-Relocation','2023-11-10 11:29:26'),
	('2022_10_14_173737_v_6_0_0_Slow-Admin-Search','2023-11-10 11:29:26'),
	('2022_11_17_234941_v_6_0_0_SecurityRules-cbsecurity3','2023-11-10 11:29:26'),
	('2022_11_23_142439_v_6_0_0_Convert-Featured-cbfs','2023-11-10 11:29:26'),
	('2022_11_23_144748_v_6_0_0_Add-Site-Disk','2023-11-10 11:29:26'),
	('2023_07_13_092814_v_6_0_0_ContentTemplates','2023-11-10 11:29:26'),
	('2023_10_18_173527_v_6_0_0_SiteDomainAliases','2023-11-10 11:29:26');

/*!40000 ALTER TABLE `cfmigrations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
