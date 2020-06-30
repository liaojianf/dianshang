/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : user

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-04-19 18:29:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_mall_address
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_address`;
CREATE TABLE `t_mall_address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_dz` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `dzzt` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '地址状态',
  `yh_id` int(100) DEFAULT NULL COMMENT '用户id',
  `shjr` varchar(100) DEFAULT NULL COMMENT '收件人',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of t_mall_address
-- ----------------------------
INSERT INTO `t_mall_address` VALUES ('1', '高老庄', '1', '1', '猪八戒', '12312312313');
INSERT INTO `t_mall_address` VALUES ('2', '流沙河', '1', '1', '沙悟净', '12312312313');
INSERT INTO `t_mall_address` VALUES ('3', '花果山水帘洞', '1', '1', '孙悟空', '12312312313');
INSERT INTO `t_mall_address` VALUES ('4', '东土大唐', '1', '1', '唐三藏', '123123123123');

-- ----------------------------
-- Table structure for t_mall_user_account
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_account`;
CREATE TABLE `t_mall_user_account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_mch` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `yh_nch` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `yh_mm` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `yh_xm` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `yh_shjh` varchar(100) DEFAULT NULL COMMENT '手机号',
  `yh_yx` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `yh_tx` varchar(100) DEFAULT NULL COMMENT '头像',
  `yh_jb` varchar(100) DEFAULT NULL COMMENT '用户级别',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_mall_user_account
-- ----------------------------
INSERT INTO `t_mall_user_account` VALUES ('6', 'admin', 'jerry', '123', '杰瑞', '12333333333', '33@22.com', null, null);
INSERT INTO `t_mall_user_account` VALUES ('7', '6', '齐天大圣', '124', '孙悟空', '123123131313', '11@11.com', null, null);
INSERT INTO `t_mall_user_account` VALUES ('8', 'test03', '测试3', '123', '测试3', '11111111', '111111', null, null);
INSERT INTO `t_mall_user_account` VALUES ('9', 'test05', '师傅', '123', '三藏', '123123123123', '111@a.com', null, null);
INSERT INTO `t_mall_user_account` VALUES ('10', '韩梅梅', '嫦娥', '123', '广寒仙子', '110', '110@a.com', null, null);

-- ----------------------------
-- Table structure for t_mall_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_info`;
CREATE TABLE `t_mall_user_info` (
  `id_card` int(50) NOT NULL COMMENT '身份证编号',
  `yh_id` int(50) DEFAULT NULL COMMENT '用户',
  `yh_shjh` varchar(100) DEFAULT NULL COMMENT '用户手机号',
  `yh_jg` varchar(100) DEFAULT '0' COMMENT '用户籍贯',
  `yh_zhzh` int(11) DEFAULT NULL COMMENT '用户住址',
  `yh_xb` int(1) DEFAULT NULL COMMENT '0女1男',
  `chjshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户帐户信息表';

-- ----------------------------
-- Records of t_mall_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_user_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_user_pay`;
CREATE TABLE `t_mall_user_pay` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `dd_id` int(11) DEFAULT NULL,
  `fkshj` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '付款时间',
  `dd_je` decimal(10,0) DEFAULT NULL COMMENT '订单金额',
  `zhf_fsh` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `yh` varchar(100) DEFAULT NULL COMMENT '支付银行',
  `yh_lsh` varchar(100) DEFAULT NULL COMMENT '银行流水',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户支付信息表';

-- ----------------------------
-- Records of t_mall_user_pay
-- ----------------------------
