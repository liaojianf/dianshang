/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : log

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-04-19 18:28:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `dates` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('20-4-2 下午10:23', '123', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午10:23', '124', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午10:28', '125', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午10:28', '126', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午10:48', '127', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午10:48', '128', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午10:48', '129', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午10:48', '130', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午10:50', '131', 'ABC');
INSERT INTO `log` VALUES ('20-4-2 下午10:50', '132', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午10:50', '133', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:03', '134', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:03', '135', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:08', '136', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:08', '137', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:12', '138', 'ABC');
INSERT INTO `log` VALUES ('20-4-2 下午11:12', '139', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:12', '140', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:20', '141', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:20', '142', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:25', '143', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:25', '144', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:30', '145', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:30', '146', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:37', '147', 'ABC');
INSERT INTO `log` VALUES ('20-4-2 下午11:38', '148', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:38', '149', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:49', '150', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:49', '151', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-2 下午11:52', '152', 'admin');
INSERT INTO `log` VALUES ('20-4-2 下午11:52', '153', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-3 上午12:02', '154', 'ABC');
INSERT INTO `log` VALUES ('20-4-3 上午12:03', '155', 'admin');
INSERT INTO `log` VALUES ('20-4-3 上午12:03', '156', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-3 上午12:04', '157', 'admin');
INSERT INTO `log` VALUES ('20-4-3 上午12:04', '158', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-3 上午12:12', '159', 'admin');
INSERT INTO `log` VALUES ('20-4-3 上午12:12', '160', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-18 下午6:37', '161', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午6:37', '162', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-18 下午7:44', '163', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午9:02', '164', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午9:02', '165', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-18 下午9:05', '166', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午9:05', '167', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午9:05', '168', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-18 下午9:50', '169', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午10:06', '170', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午10:06', '171', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-18 下午10:07', '172', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午11:52', '173', 'admin');
INSERT INTO `log` VALUES ('20-4-18 下午11:52', '174', 'MQ|ID:0 用户名:admin登陆了');
INSERT INTO `log` VALUES ('20-4-19 上午2:48', '175', 'admin');
