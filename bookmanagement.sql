/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : bookmanagement

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-06-08 09:04:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL COMMENT '图书编号',
  `book_name` varchar(255) NOT NULL COMMENT '图书名称',
  `author` varchar(255) NOT NULL COMMENT '图书作者',
  `published_date` datetime DEFAULT NULL COMMENT '图书作者',
  `price` double(10,2) DEFAULT NULL COMMENT '图书价钱',
  `book_num` int(11) DEFAULT NULL COMMENT '图书数量',
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `book_name` (`book_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('14', '1002', '擦偶组', '地方', '2019-06-08 08:57:21', '5.12', '20');
INSERT INTO `book` VALUES ('15', '1003', '数据库系统', '马云', '2019-06-07 08:59:49', '99.99', '10');
INSERT INTO `book` VALUES ('16', '1004', '王者之路', '单挑之王-凯', '2019-06-04 09:00:20', '88.88', '20');
INSERT INTO `book` VALUES ('17', '1005', '闪耀之星', '赵丽颖', '2019-06-14 09:00:51', '188.88', '10');
INSERT INTO `book` VALUES ('18', '1006', '科技', '远方', '2019-06-05 09:01:22', '96.63', '10');
INSERT INTO `book` VALUES ('19', '1007', '阿道夫', '法警队', '2019-06-08 09:01:51', '65.32', '10');
INSERT INTO `book` VALUES ('20', '1008', '国际化', '我认为', '2019-06-05 09:02:09', '98.23', '10');
INSERT INTO `book` VALUES ('21', '1009', '阿斯蒂芬', '好卡', '2019-06-03 09:02:32', '52.23', '10');
INSERT INTO `book` VALUES ('22', '1010', '法拉利', '张翰', '2019-06-05 09:03:06', '96.21', '10');
INSERT INTO `book` VALUES ('23', '1011', '玛莎拉蒂', '李玉杰', '2019-06-08 09:03:40', '63.56', '10');
INSERT INTO `book` VALUES ('24', '1012', '宾利', '夏云傻逼', '2019-06-06 09:04:16', '10.01', '10');

-- ----------------------------
-- Table structure for book_borrow
-- ----------------------------
DROP TABLE IF EXISTS `book_borrow`;
CREATE TABLE `book_borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL COMMENT '图书编号',
  `name_id` varchar(11) NOT NULL COMMENT '读者身份证号',
  `book_name` varchar(255) NOT NULL,
  `quantity` int(255) DEFAULT NULL COMMENT '图书数量',
  PRIMARY KEY (`id`),
  KEY `fk_bookid` (`book_id`),
  KEY `fk_bookname` (`book_name`),
  KEY `fk_nameid` (`name_id`),
  CONSTRAINT `fk_bookid` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `fk_bookname` FOREIGN KEY (`book_name`) REFERENCES `book` (`book_name`),
  CONSTRAINT `fk_nameid` FOREIGN KEY (`name_id`) REFERENCES `reads` (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_borrow
-- ----------------------------

-- ----------------------------
-- Table structure for reads
-- ----------------------------
DROP TABLE IF EXISTS `reads`;
CREATE TABLE `reads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `name_id` varchar(255) DEFAULT NULL COMMENT '身份证',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  KEY `name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reads
-- ----------------------------
INSERT INTO `reads` VALUES ('1', '张俊杰', '412726199504124137', '15826344578', '湖北武汉江夏');
INSERT INTO `reads` VALUES ('2', '乔丹', '413252185602325216', '13245627458', '湖北武汉武昌');
INSERT INTO `reads` VALUES ('3', '刘德华', '521362196503235214', '18564525896', '江夏武汉工程大学');
INSERT INTO `reads` VALUES ('4', '陈雪凝', '621535199906328532', '16589452356', '武汉工程大学教辅3栋');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('user01', '123456');
INSERT INTO `user` VALUES ('user02', '123456789');
