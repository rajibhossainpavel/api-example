-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table btc.blocks
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockIndex` int(11) NOT NULL,
  `previousHash` char(64) NOT NULL,
  `timestamp` datetime NOT NULL,
  `data` mediumtext NOT NULL,
  `hash` char(64) NOT NULL,
  `difficulty` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `target` char(64) NOT NULL DEFAULT '0',
  `chainWork` char(64) NOT NULL,
  `nonce` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.blocks: ~0 rows (approximately)
DELETE FROM `blocks`;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;

-- Dumping structure for table btc.blocktxins
DROP TABLE IF EXISTS `blocktxins`;
CREATE TABLE IF NOT EXISTS `blocktxins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` char(34) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `txId` char(64) NOT NULL,
  `blockHash` char(64) NOT NULL,
  `blockIndex` int(11) NOT NULL,
  `txOutId` char(64) NOT NULL,
  `txOutIndex` int(3) NOT NULL,
  `signature` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  KEY `txId` (`blockHash`,`txId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.blocktxins: ~0 rows (approximately)
DELETE FROM `blocktxins`;
/*!40000 ALTER TABLE `blocktxins` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocktxins` ENABLE KEYS */;

-- Dumping structure for table btc.blocktxouts
DROP TABLE IF EXISTS `blocktxouts`;
CREATE TABLE IF NOT EXISTS `blocktxouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txId` char(64) NOT NULL,
  `txOutIndex` int(3) NOT NULL DEFAULT 0,
  `blockHash` char(64) NOT NULL,
  `blockIndex` int(11) NOT NULL,
  `address` char(34) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `amount` decimal(17,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  KEY `txId` (`blockHash`,`txId`,`txOutIndex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.blocktxouts: ~0 rows (approximately)
DELETE FROM `blocktxouts`;
/*!40000 ALTER TABLE `blocktxouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocktxouts` ENABLE KEYS */;

-- Dumping structure for table btc.blocktxs
DROP TABLE IF EXISTS `blocktxs`;
CREATE TABLE IF NOT EXISTS `blocktxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txId` char(64) NOT NULL,
  `blockHash` char(64) NOT NULL,
  `blockIndex` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `txFees` decimal(17,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txId` (`txId`,`blockHash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.blocktxs: ~0 rows (approximately)
DELETE FROM `blocktxs`;
/*!40000 ALTER TABLE `blocktxs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocktxs` ENABLE KEYS */;

-- Dumping structure for table btc.fork
DROP TABLE IF EXISTS `fork`;
CREATE TABLE IF NOT EXISTS `fork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('valid-fork','valid-headers','active') NOT NULL DEFAULT 'valid-fork',
  `chainWork` char(64) NOT NULL,
  `lastFork` char(64) NOT NULL,
  `branchStartAt` char(64) NOT NULL,
  `lastBlockIndex` int(11) NOT NULL,
  `lastBlockHash` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`,`lastBlockHash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.fork: ~0 rows (approximately)
DELETE FROM `fork`;
/*!40000 ALTER TABLE `fork` DISABLE KEYS */;
/*!40000 ALTER TABLE `fork` ENABLE KEYS */;

-- Dumping structure for table btc.peers
DROP TABLE IF EXISTS `peers`;
CREATE TABLE IF NOT EXISTS `peers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(20) NOT NULL,
  `lastUpdateDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.peers: ~0 rows (approximately)
DELETE FROM `peers`;
/*!40000 ALTER TABLE `peers` DISABLE KEYS */;
/*!40000 ALTER TABLE `peers` ENABLE KEYS */;

-- Dumping structure for table btc.prices
DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table btc.prices: ~10 rows (approximately)
DELETE FROM `prices`;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` (`id`, `item`, `price`, `created_at`, `updated_at`) VALUES
	(1, 'BTC', 4727.57, '2022-03-16 03:06:36', '2022-03-16 06:09:15'),
	(2, 'BTC', 4396.67, '2022-03-10 03:14:20', '2022-03-16 06:09:15'),
	(3, 'BTC', 4703.29, '2022-03-09 17:19:40', '2022-03-16 06:09:15'),
	(4, 'BTC', 4093.17, '2022-03-19 03:53:51', '2022-03-16 06:09:15'),
	(5, 'BTC', 4601.22, '2022-03-13 19:01:36', '2022-03-16 06:09:15'),
	(6, 'BTC', 4551.53, '2022-03-23 03:12:39', '2022-03-16 06:09:15'),
	(7, 'BTC', 4887.21, '2022-03-18 06:13:39', '2022-03-16 06:09:15'),
	(8, 'BTC', 4195.86, '2022-03-17 06:08:41', '2022-03-16 06:09:15'),
	(9, 'BTC', 4932.88, '2022-03-12 00:31:06', '2022-03-16 06:09:15'),
	(10, 'BTC', 4318.25, '2022-03-12 04:01:24', '2022-03-16 06:09:15');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;

-- Dumping structure for table btc.transactionpool
DROP TABLE IF EXISTS `transactionpool`;
CREATE TABLE IF NOT EXISTS `transactionpool` (
  `txId` char(64) NOT NULL,
  `timestamp` datetime NOT NULL,
  `txFees` double(16,8) NOT NULL DEFAULT 0.00000000,
  `txIns` mediumtext NOT NULL,
  `txOuts` mediumtext NOT NULL,
  PRIMARY KEY (`txId`),
  FULLTEXT KEY `txIns` (`txIns`),
  FULLTEXT KEY `txOuts` (`txOuts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.transactionpool: ~0 rows (approximately)
DELETE FROM `transactionpool`;
/*!40000 ALTER TABLE `transactionpool` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionpool` ENABLE KEYS */;

-- Dumping structure for table btc.transactionpooltxins
DROP TABLE IF EXISTS `transactionpooltxins`;
CREATE TABLE IF NOT EXISTS `transactionpooltxins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txId` char(64) NOT NULL,
  `txOutId` char(64) NOT NULL,
  `txOutIndex` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txOutId_txOutIndex` (`txOutId`,`txOutIndex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.transactionpooltxins: ~0 rows (approximately)
DELETE FROM `transactionpooltxins`;
/*!40000 ALTER TABLE `transactionpooltxins` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionpooltxins` ENABLE KEYS */;

-- Dumping structure for table btc.unspenttxouts
DROP TABLE IF EXISTS `unspenttxouts`;
CREATE TABLE IF NOT EXISTS `unspenttxouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockHash` char(64) NOT NULL,
  `blockIndex` int(11) NOT NULL DEFAULT 0,
  `txOutId` char(64) NOT NULL,
  `txOutIndex` int(3) NOT NULL,
  `address` char(34) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `amount` decimal(17,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`id`),
  KEY `address_amount` (`address`,`amount`) USING BTREE,
  KEY `txoutindex_txoutid` (`txOutIndex`,`txOutId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table btc.unspenttxouts: ~0 rows (approximately)
DELETE FROM `unspenttxouts`;
/*!40000 ALTER TABLE `unspenttxouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `unspenttxouts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
