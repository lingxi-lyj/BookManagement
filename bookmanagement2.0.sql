/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : bookmanagement

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-06-10 15:56:51
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('15', '1003', '数据库系统', '马云', '2019-06-07 08:59:49', '99.99', '5');
INSERT INTO `book` VALUES ('16', '1004', '王者之路', '单挑之王-凯', '2019-06-04 09:00:20', '88.88', '19');
INSERT INTO `book` VALUES ('17', '1005', '闪耀之星', '赵丽颖', '2019-06-14 09:00:51', '188.88', '8');
INSERT INTO `book` VALUES ('18', '1006', '科技', '远方', '2019-06-05 09:01:22', '96.63', '10');
INSERT INTO `book` VALUES ('19', '1007', '阿道夫', '法警队', '2019-06-08 09:01:51', '65.32', '10');
INSERT INTO `book` VALUES ('20', '1008', '国际化', '我认为', '2019-06-05 09:02:09', '98.23', '10');
INSERT INTO `book` VALUES ('21', '1009', '阿斯蒂芬', '好卡', '2019-06-03 09:02:32', '52.23', '10');
INSERT INTO `book` VALUES ('22', '1010', '法拉利', '张翰', '2019-06-05 09:03:06', '96.21', '10');
INSERT INTO `book` VALUES ('23', '1011', '玛莎拉蒂', '李玉杰', '2019-06-08 09:03:40', '63.56', '10');
INSERT INTO `book` VALUES ('24', '1012', '凯美瑞', '夏云傻逼', '2019-06-06 09:04:16', '10.01', '10');
INSERT INTO `book` VALUES ('32', '1013', '你看了', '牛逼', '2018-03-23 12:23:12', '63.23', '11');
INSERT INTO `book` VALUES ('33', '1013', '你看了', '牛逼', '2018-03-23 12:23:12', '63.23', '11');
INSERT INTO `book` VALUES ('37', '1014', '钟无艳', '你摆', null, null, null);
INSERT INTO `book` VALUES ('38', '1015', '123', '456', '2017-06-12 12:36:45', null, null);

-- ----------------------------
-- Table structure for book_borrow
-- ----------------------------
DROP TABLE IF EXISTS `book_borrow`;
CREATE TABLE `book_borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL COMMENT '图书编号',
  `book_name` varchar(255) NOT NULL COMMENT '图书名称',
  `read_name` varchar(255) NOT NULL COMMENT '读者姓名',
  `read_id` varchar(255) NOT NULL COMMENT '读者身份证号',
  `borrow_time` datetime NOT NULL COMMENT '借阅时间',
  `book_num` int(11) DEFAULT '0' COMMENT '本书数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_borrow
-- ----------------------------
INSERT INTO `book_borrow` VALUES ('27', '1003', '数据库系统', '苹果', '122345', '2019-05-08 12:45:36', '3');
INSERT INTO `book_borrow` VALUES ('28', '1003', '数据库系统', '小郭', '123456', '2019-05-08 12:45:36', '1');
INSERT INTO `book_borrow` VALUES ('29', '1004', '王者之路', '张俊杰', '412726199504124137', '2019-05-03 06:23:55', '1');
INSERT INTO `book_borrow` VALUES ('30', '1005', '闪耀之星', '夏云', '412726198503264178', '2019-06-09 13:45:25', '1');
INSERT INTO `book_borrow` VALUES ('31', '1005', '闪耀之星', '苹果', '122345', '2017-03-06 12:45:36', '1');

-- ----------------------------
-- Table structure for book_return
-- ----------------------------
DROP TABLE IF EXISTS `book_return`;
CREATE TABLE `book_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL COMMENT '图书编号',
  `read_id` varchar(255) NOT NULL COMMENT '读者身份证号',
  `read_name` varchar(255) NOT NULL COMMENT '读者姓名',
  `return_time` datetime NOT NULL COMMENT '归还时间',
  `book_num` int(11) DEFAULT '0' COMMENT '本书数量',
  PRIMARY KEY (`id`),
  KEY `read_id` (`read_id`),
  KEY `read_name` (`read_name`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_return_ibfk_1` FOREIGN KEY (`read_id`) REFERENCES `readers` (`read_id`),
  CONSTRAINT `book_return_ibfk_2` FOREIGN KEY (`read_name`) REFERENCES `readers` (`read_name`),
  CONSTRAINT `book_return_ibfk_3` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_return
-- ----------------------------
INSERT INTO `book_return` VALUES ('9', '1003', '122345', '苹果', '2019-06-10 12:45:36', '9');
INSERT INTO `book_return` VALUES ('10', '1007', '122345', '苹果', '2019-06-10 09:09:34', '1');

-- ----------------------------
-- Table structure for readers
-- ----------------------------
DROP TABLE IF EXISTS `readers`;
CREATE TABLE `readers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read_name` varchar(255) NOT NULL COMMENT '姓名',
  `read_id` varchar(255) DEFAULT NULL COMMENT '身份证',
  `read_phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `read_address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  KEY `name_id` (`read_id`),
  KEY `read_name` (`read_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readers
-- ----------------------------
INSERT INTO `readers` VALUES ('1', '张俊杰', '412726199504124137', '15826344578', '湖北武汉江夏');
INSERT INTO `readers` VALUES ('2', '乔丹', '413252185602325216', '13245627458', '湖北武汉武昌');
INSERT INTO `readers` VALUES ('3', '刘德华', '521362196503235214', '18564525896', '江夏武汉工程大学');
INSERT INTO `readers` VALUES ('4', '陈雪凝', '621535199906328532', '16589452356', '武汉工程大学教辅3栋');
INSERT INTO `readers` VALUES ('6', '夏云', '412726198503264178', '16954236589', '武汉工程大学泰塑631');
INSERT INTO `readers` VALUES ('7', '苹果', '122345', '45546431', '武汉工程大学教辅3栋654');
INSERT INTO `readers` VALUES ('9', '小郭', '123456', '4565', '台塑6');
INSERT INTO `readers` VALUES ('10', '黑科即', '1112222', '222', '地2');
INSERT INTO `readers` VALUES ('12', '模糊', '789456', '756465', '23');
INSERT INTO `readers` VALUES ('13', '模糊', '789456', '756465', '23');

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
