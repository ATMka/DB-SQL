﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 22.08.2019 0:27:00
-- Server version: 8.0.17
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE db2;

--
-- Drop table `bids`
--
DROP TABLE IF EXISTS bids;

--
-- Drop table `items`
--
DROP TABLE IF EXISTS items;

--
-- Drop table `users`
--
DROP TABLE IF EXISTS users;

--
-- Set default database
--
USE db2;

--
-- Create table `users`
--
CREATE TABLE users (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(45) DEFAULT NULL,
  billing_address VARCHAR(100) DEFAULT NULL,
  login VARCHAR(20) DEFAULT NULL,
  password VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (user_id),
  UNIQUE INDEX UK_users_user_id(user_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create table `items`
--
CREATE TABLE items (
  item_id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) DEFAULT NULL,
  description VARCHAR(100) DEFAULT NULL,
  start_price DOUBLE DEFAULT NULL,
  bid_increment DOUBLE DEFAULT NULL,
  start_date DATE DEFAULT NULL,
  stop_date DATE DEFAULT NULL,
  by_it_now BINARY(20) DEFAULT NULL,
  users_user_id INT(11) DEFAULT NULL,
  PRIMARY KEY (item_id),
  UNIQUE INDEX UK_items_item_id(item_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 23,
AVG_ROW_LENGTH = 744,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `IDX_items_users_user_id` on table `items`
--
ALTER TABLE items 
  ADD INDEX IDX_items_users_user_id(users_user_id);

--
-- Create foreign key
--
ALTER TABLE items 
  ADD CONSTRAINT FK_items_users_user_id FOREIGN KEY (users_user_id)
    REFERENCES users(user_id);

--
-- Create table `bids`
--
CREATE TABLE bids (
  bid_id INT(11) NOT NULL AUTO_INCREMENT,
  bid_date DATE DEFAULT NULL,
  bid_value DOUBLE DEFAULT NULL,
  items_item_id INT(11) DEFAULT NULL,
  users_user_id INT(11) DEFAULT NULL,
  PRIMARY KEY (bid_id),
  UNIQUE INDEX UK_bids_bid_id(bid_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 62,
AVG_ROW_LENGTH = 268,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `IDX_bids` on table `bids`
--
ALTER TABLE bids 
  ADD INDEX IDX_bids(items_item_id, users_user_id);

--
-- Create foreign key
--
ALTER TABLE bids 
  ADD CONSTRAINT FK_bids_items_item_id FOREIGN KEY (items_item_id)
    REFERENCES items(item_id) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE bids 
  ADD CONSTRAINT FK_bids_users_user_id FOREIGN KEY (users_user_id)
    REFERENCES users(user_id) ON DELETE CASCADE;

-- 
-- Dumping data for table users
--
INSERT INTO users VALUES
(1, 'Alexey', 'JILIEYECVY', 'CSFYZCNIBG', 'DUOJGAKWDD'),
(2, 'Mikhail', 'FODYJYOZGH', 'OBMGSXHUZO', 'XSVZMKONWV'),
(3, 'Петров', 'OGQISNMWWQ', 'RJUWXZFZHN', 'PNRWFOCVWV'),
(4, 'Алина', 'KOQMKNMTGC', 'QWKLYLHBLB', 'WDBVYHNTDK'),
(5, 'Антон', 'OPIWHXNXWT', 'ZSQAFWS[VE', 'GSXGOBNMUO'),
(6, 'Сергей', 'JBFXWRPBKX', 'FLLWZIPAJQ', 'EYDWXVMXCQ'),
(7, 'Тимур', 'ZXQJZVBUUM', 'DDGXTAWEJD', 'RYPDWWUHCP'),
(8, 'Елизавета', 'SUR[BDNGRQ', 'CPSSJQBIOT', 'CFUIEXXWQO'),
(9, 'Алукард', 'TEQNTBDNDA', 'TTIMKNKMDD', 'JJSLAVZMII'),
(10, 'Женщина-кошка', 'MN[OSVZMJK', 'XFLNI[[BDO', 'JESYQHNQSQ'),
(11, 'Харли Квинн', '[CNGQJAYPF', 'GPFHUZPXVK', 'LBVBTONVRT'),
(17, 'Alexey Biyanov', 'Izhevsk', '1', '1');

-- 
-- Dumping data for table items
--
INSERT INTO items VALUES
(1, 'Shoes — туфли', 'На', 965.4932301170129, 565, NULL, NULL, NULL, 7),
(2, 'high-heeled shoes — туфли на высоком каблуке', 'первый', 566.7059780719745, 564, NULL, NULL, NULL, 8),
(3, 'trainers/sneakers — кроссовки', 'взгляд', 937.0502307424789, 123, NULL, NULL, NULL, 7),
(4, 'boots — ботинки', 'все', 985.1332502301161, 925, NULL, NULL, NULL, 7),
(5, 'high shoes -сапоги', 'логично', 114.51558965678848, 254, NULL, NULL, NULL, 4),
(6, 'sandals — босоножки, сандалии', 'да', 617.1782283272391, 496, NULL, NULL, NULL, 4),
(7, 'slippers — тапочки', 'и', 742.3444033994753, 719, NULL, NULL, NULL, 10),
(8, 'Beret — берет', 'работает', 860.187362749304, 106, NULL, NULL, NULL, 7),
(9, 'Cap — кепка; шапка; фуражка; шапочка', 'правильно.', 73.90363428173926, 373, NULL, NULL, NULL, 11),
(10, 'cowboy hat, stetson — ковбойская шляпа, стетсон', 'Выбираются', 788.9561138944292, 546, NULL, NULL, NULL, 7),
(11, 'hat — шляпа, шляпка; шапка', '10', 723.0696973605731, 610, NULL, NULL, NULL, 1),
(12, 'helmet — шапка-шлем', 'произвольных', 248.48017585322276, 413, NULL, NULL, NULL, 9),
(13, 'straw hat — соломенная шляпа', 'записей.', 73.19181791803969, 236, NULL, NULL, NULL, 7),
(14, 'veil — вуаль, фата', 'Но', 620.5185927641751, 941, NULL, NULL, NULL, 10),
(15, 'playsuit -детский комбинезон', 'если', 883.0175408004015, 995, NULL, NULL, NULL, 4),
(16, 'pram suit — костюмчик для малыша («грудничка»)', 'взглянуть', 553.5319564431272, 151, NULL, NULL, NULL, 9),
(17, 'sun hat — панамка', 'на', 118.60719054807647, 772, NULL, NULL, NULL, 3),
(18, 'booties — пинетки', 'план', 932.4401141446458, 409, NULL, NULL, NULL, 4),
(19, 'rompers [''rɔmpəz] = romper suit — детский комбинезон', 'выполнения', 306.37902981264426, 726, NULL, NULL, NULL, 10),
(20, 'mittens = mitts — варежки', 'этого', 734.5748373629291, 405, NULL, NULL, NULL, 1),
(21, 'bib — слюнявчик', 'запроса,', 753.7371281103576, 847, NULL, NULL, NULL, 8),
(22, 'Комп', 'Рабочий', 100, 50, '2001-01-20', '2031-12-20', x'4E4F210000000000000000000000000000000000', 5);

-- 
-- Dumping data for table bids
--
INSERT INTO bids VALUES
(1, NULL, 1385, 12, 9),
(2, NULL, 1628, 18, 4),
(3, NULL, 5203, 6, 4),
(4, NULL, 3557, 17, 3),
(5, NULL, 2017, 13, 7),
(6, NULL, 2048, 6, 4),
(7, NULL, 5546, 7, 10),
(8, NULL, 1297, 4, 7),
(9, NULL, 4045, 19, 10),
(10, NULL, 1246, 3, 7),
(11, NULL, 961, 8, 7),
(12, NULL, 7092, 14, 10),
(13, NULL, 1397, 20, 1),
(14, NULL, 1794, 13, 7),
(15, NULL, 4163, 7, 10),
(16, NULL, 651, 5, 4),
(17, NULL, 3639, 10, 7),
(18, NULL, 6349, 21, 8),
(19, NULL, 1741, 2, 8),
(20, NULL, 3639, 20, 1),
(21, NULL, 616, 9, 11),
(22, NULL, 486, 13, 7),
(23, NULL, 1558, 3, 7),
(24, NULL, 2441, 10, 7),
(25, NULL, 784, 12, 9),
(26, NULL, 2547, 11, 1),
(27, NULL, 7357, 4, 7),
(28, NULL, 777, 19, 10),
(29, NULL, 3432, 7, 10),
(30, NULL, 5890, 1, 7),
(31, NULL, 5961, 19, 10),
(32, NULL, 1118, 20, 1),
(33, NULL, 3654, 2, 8),
(34, NULL, 5960, 10, 7),
(35, NULL, 1884, 3, 7),
(36, NULL, 3527, 21, 8),
(37, NULL, 1719, 9, 11),
(38, NULL, 1198, 2, 8),
(39, NULL, 2942, 9, 11),
(40, NULL, 5741, 2, 8),
(41, NULL, 9213, 14, 10),
(42, NULL, 3931, 7, 10),
(43, NULL, 6304, 21, 8),
(44, NULL, 5388, 19, 10),
(45, NULL, 788, 11, 1),
(46, NULL, 5346, 14, 10),
(47, NULL, 8562, 15, 4),
(48, NULL, 4157, 4, 7),
(49, NULL, 1349, 3, 7),
(50, NULL, 1388, 3, 7),
(51, NULL, 4386, 15, 4),
(52, NULL, 6979, 4, 7),
(53, NULL, 398, 5, 4),
(54, NULL, 1954, 3, 7),
(55, NULL, 5310, 10, 7),
(56, NULL, 2038, 20, 1),
(57, NULL, 2052, 20, 1),
(58, NULL, 1675, 11, 1),
(59, NULL, 3243, 21, 8),
(60, NULL, 5290, 11, 1),
(61, NULL, 1895, 1, 7);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;