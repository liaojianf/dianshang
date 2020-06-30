/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : sale

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-04-19 18:29:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_mall_address
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_address`;
CREATE TABLE `t_mall_address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `yh_dz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户地址',
  `dzzt` varchar(11) DEFAULT NULL COMMENT '地址状态',
  `yh_id` int(100) DEFAULT NULL,
  `shjr` varchar(100) DEFAULT NULL COMMENT '收件人',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of t_mall_address
-- ----------------------------
INSERT INTO `t_mall_address` VALUES ('1', '高老庄', '1', '2', '猪八戒', '12312312313');
INSERT INTO `t_mall_address` VALUES ('2', '流沙河', '1', '1', '沙悟净', '12312312313');
INSERT INTO `t_mall_address` VALUES ('3', '花果山水帘洞', '1', '1', '孙悟空', '123123123123');
INSERT INTO `t_mall_address` VALUES ('4', '东土大唐', '1', '1', '唐三藏', '12312312313');

-- ----------------------------
-- Table structure for t_mall_attr
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_attr`;
CREATE TABLE `t_mall_attr` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxm_mch` varchar(100) DEFAULT NULL COMMENT '属性名称',
  `shfqy` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `flbh2` int(11) DEFAULT NULL COMMENT '分类编号2',
  `chjshj` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='属性名表';

-- ----------------------------
-- Records of t_mall_attr
-- ----------------------------
INSERT INTO `t_mall_attr` VALUES ('1', '屏幕', null, '17', '2020-01-04 19:07:21');
INSERT INTO `t_mall_attr` VALUES ('2', '重量', null, '17', '2020-01-04 19:07:21');
INSERT INTO `t_mall_attr` VALUES ('3', '电池', null, '17', '2020-01-04 19:07:21');
INSERT INTO `t_mall_attr` VALUES ('4', '键盘', null, '17', '2020-01-04 19:09:14');
INSERT INTO `t_mall_attr` VALUES ('6', '充电器·', null, '17', '2020-01-05 15:00:35');
INSERT INTO `t_mall_attr` VALUES ('7', '内存', null, '17', '2020-01-06 21:04:12');
INSERT INTO `t_mall_attr` VALUES ('8', '功耗', null, '17', '2020-01-08 16:46:33');
INSERT INTO `t_mall_attr` VALUES ('9', 'VR效果', null, '17', '2020-01-08 16:46:33');
INSERT INTO `t_mall_attr` VALUES ('10', '色差', null, '17', '2020-01-08 16:46:33');
INSERT INTO `t_mall_attr` VALUES ('11', '类型', null, '17', '2020-01-08 16:46:33');
INSERT INTO `t_mall_attr` VALUES ('12', '屏幕类型', null, '17', '2020-01-08 16:51:24');
INSERT INTO `t_mall_attr` VALUES ('13', '显高', null, '17', '2020-01-08 16:54:13');
INSERT INTO `t_mall_attr` VALUES ('14', '显宽', null, '17', '2020-01-08 22:37:53');
INSERT INTO `t_mall_attr` VALUES ('15', '内存', null, '25', '2020-01-17 01:17:46');
INSERT INTO `t_mall_attr` VALUES ('16', '颜色', null, '25', '2020-01-17 01:21:45');
INSERT INTO `t_mall_attr` VALUES ('25', '键盘', null, '17', '2020-03-31 23:26:26');

-- ----------------------------
-- Table structure for t_mall_class_1
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_class_1`;
CREATE TABLE `t_mall_class_1` (
  `Id` int(11) DEFAULT NULL COMMENT '编号',
  `flmch1` varchar(100) DEFAULT NULL COMMENT '分类名称1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类1表';

-- ----------------------------
-- Records of t_mall_class_1
-- ----------------------------
INSERT INTO `t_mall_class_1` VALUES ('6', '服装鞋帽');
INSERT INTO `t_mall_class_1` VALUES ('7', '家用电器');
INSERT INTO `t_mall_class_1` VALUES ('8', '电脑办公');
INSERT INTO `t_mall_class_1` VALUES ('9', '清洁用品');
INSERT INTO `t_mall_class_1` VALUES ('10', '母婴玩具');
INSERT INTO `t_mall_class_1` VALUES ('11', '手机数码');
INSERT INTO `t_mall_class_1` VALUES ('12', '图书音像');
INSERT INTO `t_mall_class_1` VALUES ('13', '鞋靴箱包');
INSERT INTO `t_mall_class_1` VALUES ('14', '户外钟表');
INSERT INTO `t_mall_class_1` VALUES ('15', '食品烟酒');

-- ----------------------------
-- Table structure for t_mall_class_2
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_class_2`;
CREATE TABLE `t_mall_class_2` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `flmch2` varchar(4000) DEFAULT NULL COMMENT '分类名称2',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类2表';

-- ----------------------------
-- Records of t_mall_class_2
-- ----------------------------
INSERT INTO `t_mall_class_2` VALUES ('11', '男装', '6');
INSERT INTO `t_mall_class_2` VALUES ('12', '女装', '6');
INSERT INTO `t_mall_class_2` VALUES ('13', '童装', '6');
INSERT INTO `t_mall_class_2` VALUES ('14', '冰箱', '7');
INSERT INTO `t_mall_class_2` VALUES ('15', '洗衣机', '7');
INSERT INTO `t_mall_class_2` VALUES ('16', '笔记本', '8');
INSERT INTO `t_mall_class_2` VALUES ('17', '游戏本', '8');
INSERT INTO `t_mall_class_2` VALUES ('18', '洗发', '9');
INSERT INTO `t_mall_class_2` VALUES ('19', '护肤', '9');
INSERT INTO `t_mall_class_2` VALUES ('20', '牙膏牙刷', '9');
INSERT INTO `t_mall_class_2` VALUES ('21', '内衣', '6');
INSERT INTO `t_mall_class_2` VALUES ('22', '配饰', '6');
INSERT INTO `t_mall_class_2` VALUES ('23', '电视', '7');
INSERT INTO `t_mall_class_2` VALUES ('24', '空调', '7');
INSERT INTO `t_mall_class_2` VALUES ('25', '手机', '11');
INSERT INTO `t_mall_class_2` VALUES ('26', '数码相机', '11');
INSERT INTO `t_mall_class_2` VALUES ('27', '耳机', '11');
INSERT INTO `t_mall_class_2` VALUES ('28', '显示器', '8');
INSERT INTO `t_mall_class_2` VALUES ('29', '鼠标', '8');
INSERT INTO `t_mall_class_2` VALUES ('30', '键盘', '8');
INSERT INTO `t_mall_class_2` VALUES ('31', '路由器', '8');
INSERT INTO `t_mall_class_2` VALUES ('32', '平板电脑', '8');
INSERT INTO `t_mall_class_2` VALUES ('33', '时尚女鞋', '13');
INSERT INTO `t_mall_class_2` VALUES ('34', '流行男鞋', '13');
INSERT INTO `t_mall_class_2` VALUES ('35', '箱包', '13');
INSERT INTO `t_mall_class_2` VALUES ('36', '音箱', '12');
INSERT INTO `t_mall_class_2` VALUES ('37', '教材', '12');
INSERT INTO `t_mall_class_2` VALUES ('38', '杂志', '12');
INSERT INTO `t_mall_class_2` VALUES ('39', '电子书', '12');
INSERT INTO `t_mall_class_2` VALUES ('40', '科学纪录片', '12');
INSERT INTO `t_mall_class_2` VALUES ('41', '游戏机', '11');
INSERT INTO `t_mall_class_2` VALUES ('42', '奶粉', '10');
INSERT INTO `t_mall_class_2` VALUES ('43', '玩具', '10');
INSERT INTO `t_mall_class_2` VALUES ('44', '婴儿车', '10');
INSERT INTO `t_mall_class_2` VALUES ('45', '乐器', '10');
INSERT INTO `t_mall_class_2` VALUES ('46', '跑步机', '14');
INSERT INTO `t_mall_class_2` VALUES ('47', '钟表', '14');
INSERT INTO `t_mall_class_2` VALUES ('48', '球类', '14');
INSERT INTO `t_mall_class_2` VALUES ('49', '乐器', '14');
INSERT INTO `t_mall_class_2` VALUES ('50', '钓鱼用品', '14');
INSERT INTO `t_mall_class_2` VALUES ('51', '水果', '15');
INSERT INTO `t_mall_class_2` VALUES ('52', '中外名酒', '15');
INSERT INTO `t_mall_class_2` VALUES ('53', '茶类', '15');

-- ----------------------------
-- Table structure for t_mall_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_flow`;
CREATE TABLE `t_mall_flow` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `psfsh` varchar(100) DEFAULT NULL COMMENT '配送方式',
  `psshj` datetime DEFAULT NULL,
  `psmsh` varchar(100) DEFAULT NULL COMMENT '配送描述',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chjshj` datetime DEFAULT NULL,
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  `mqdd` varchar(100) DEFAULT NULL COMMENT '目前地点',
  `mdd` varchar(100) DEFAULT NULL COMMENT '目的地',
  `ywy` varchar(100) DEFAULT NULL COMMENT '业务员',
  `lxfsh` varchar(100) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='物流表';

-- ----------------------------
-- Records of t_mall_flow
-- ----------------------------
INSERT INTO `t_mall_flow` VALUES ('42', '硅谷快递', '2020-03-01 20:50:47', '商品正在出库', '1', '2020-02-29 20:46:58', '42', '商品未出库', '花果山水帘洞', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('43', '硅谷快递', '2020-03-01 20:53:04', '商品正在出库', '1', '2020-02-29 20:52:07', '43', '商品未出库', '花果山水帘洞', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('44', '硅谷快递', '2020-03-01 20:55:41', '商品正在出库', '1', '2020-02-29 20:54:51', '44', '商品未出库', '花果山水帘洞', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('45', '硅谷快递', '2020-03-01 21:12:19', '商品正在出库', '1', '2020-02-29 21:11:56', '45', '商品未出库', '花果山水帘洞', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('46', '硅谷快递', null, null, '1', '2020-02-29 21:25:11', null, '商品未出库', '流沙河', null, null);
INSERT INTO `t_mall_flow` VALUES ('47', '硅谷快递', null, null, '1', '2020-02-29 21:39:43', null, '商品未出库', '流沙河', null, null);
INSERT INTO `t_mall_flow` VALUES ('48', '硅谷快递', null, null, '1', '2020-02-29 21:55:22', null, '商品未出库', '花果山水帘洞', null, null);
INSERT INTO `t_mall_flow` VALUES ('49', '硅谷快递', null, null, '1', '2020-03-01 14:41:10', null, '商品未出库', '花果山水帘洞', null, null);
INSERT INTO `t_mall_flow` VALUES ('50', '硅谷快递', null, null, '1', '2020-04-01 23:51:39', null, '商品未出库', '花果山水帘洞', null, null);
INSERT INTO `t_mall_flow` VALUES ('51', '硅谷快递', null, null, '1', '2020-04-01 23:51:39', null, '商品未出库', '花果山水帘洞', null, null);
INSERT INTO `t_mall_flow` VALUES ('52', '硅谷快递', '2020-04-03 21:13:41', '商品正在出库', '1', '2020-04-02 21:13:39', '51', '商品未出库', '流沙河', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('53', '硅谷快递', '2020-04-03 21:13:41', '商品正在出库', '1', '2020-04-02 21:13:39', '51', '商品未出库', '流沙河', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('54', '硅谷快递', '2020-04-03 21:17:09', '商品正在出库', '1', '2020-04-02 21:17:06', '52', '商品未出库', '花果山水帘洞', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('55', '硅谷快递', null, null, '1', '2020-04-02 21:21:34', null, '商品未出库', '流沙河', null, null);
INSERT INTO `t_mall_flow` VALUES ('56', '硅谷快递', null, null, '1', '2020-04-02 21:21:34', null, '商品未出库', '流沙河', null, null);
INSERT INTO `t_mall_flow` VALUES ('57', '硅谷快递', '2020-04-03 21:24:41', '商品正在出库', '1', '2020-04-02 21:24:39', '54', '商品未出库', '花果山水帘洞', '老廖', '13229852791');
INSERT INTO `t_mall_flow` VALUES ('58', '硅谷快递', '2020-04-19 19:47:37', '商品正在出库', '1', '2020-04-18 19:47:35', '55', '商品未出库', '高老庄', '老廖', '13229852791');

-- ----------------------------
-- Table structure for t_mall_flow_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_flow_info`;
CREATE TABLE `t_mall_flow_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流信息表';

-- ----------------------------
-- Records of t_mall_flow_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_order`;
CREATE TABLE `t_mall_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shhr` varchar(100) DEFAULT NULL COMMENT '收货人',
  `zje` decimal(65,0) DEFAULT NULL,
  `jdh` int(11) DEFAULT NULL COMMENT '进度号',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chjshj` datetime DEFAULT NULL,
  `yjsdshj` datetime DEFAULT NULL,
  `dzh_id` int(11) DEFAULT NULL COMMENT '地址id',
  `dzh_mch` varchar(255) DEFAULT NULL COMMENT '地址名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='订单表 订单表';

-- ----------------------------
-- Records of t_mall_order
-- ----------------------------
INSERT INTO `t_mall_order` VALUES ('42', '孙悟空', '4559', '2', '1', '2020-02-29 20:46:58', null, '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('43', '孙悟空', '4559', '2', '1', '2020-02-29 20:52:07', '2020-03-03 20:53:15', '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('44', '孙悟空', '4559', '2', '1', '2020-02-29 20:54:51', null, '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('45', '孙悟空', '4559', '1', '1', '2020-02-29 21:11:56', null, '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('46', '沙悟净', '4559', '1', '1', '2020-02-29 21:25:11', null, '2', '流沙河');
INSERT INTO `t_mall_order` VALUES ('47', '沙悟净', '4559', '5', '1', '2020-02-29 21:39:43', null, '2', '流沙河');
INSERT INTO `t_mall_order` VALUES ('48', '孙悟空', '4559', '6', '1', '2020-02-29 21:55:22', null, '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('49', '孙悟空', '4559', '1', '1', '2020-03-01 14:41:10', null, '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('50', '孙悟空', '18558', '1', '1', '2020-04-01 23:51:39', null, '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('51', '沙悟净', '23117', '2', '1', '2020-04-02 21:13:39', '2020-04-05 21:13:41', '2', '流沙河');
INSERT INTO `t_mall_order` VALUES ('52', '孙悟空', '4559', '2', '1', '2020-04-02 21:17:06', '2020-04-05 21:17:09', '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('53', '沙悟净', '17776', '1', '1', '2020-04-02 21:21:34', null, '2', '流沙河');
INSERT INTO `t_mall_order` VALUES ('54', '孙悟空', '13999', '2', '1', '2020-04-02 21:24:39', '2020-04-05 21:24:41', '3', '花果山水帘洞');
INSERT INTO `t_mall_order` VALUES ('55', '猪八戒', '4559', '2', '1', '2020-04-18 19:47:35', '2020-04-21 19:47:37', '1', '高老庄');

-- ----------------------------
-- Table structure for t_mall_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_order_info`;
CREATE TABLE `t_mall_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dd_id` int(11) DEFAULT NULL COMMENT '订单id',
  `flow_id` int(11) DEFAULT NULL COMMENT '物流id',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `chjshj` datetime DEFAULT NULL,
  `sku_mch` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `shp_tp` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `sku_jg` decimal(65,0) DEFAULT NULL,
  `sku_shl` int(11) DEFAULT NULL COMMENT 'sku数量',
  `sku_kcdz` varchar(255) DEFAULT NULL COMMENT 'sku库存地址',
  `gwch_id` int(11) DEFAULT NULL COMMENT '购物车id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
-- Records of t_mall_order_info
-- ----------------------------
INSERT INTO `t_mall_order_info` VALUES ('61', '3', '0', '1', '2020-02-29 20:46:58', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '64');
INSERT INTO `t_mall_order_info` VALUES ('62', '43', '43', '1', '2020-02-29 20:52:07', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '65');
INSERT INTO `t_mall_order_info` VALUES ('63', '3', '0', '1', '2020-02-29 20:54:51', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '66');
INSERT INTO `t_mall_order_info` VALUES ('64', '3', '0', '1', '2020-02-29 21:11:56', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '67');
INSERT INTO `t_mall_order_info` VALUES ('65', '2', '0', '1', '2020-02-29 21:25:11', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '68');
INSERT INTO `t_mall_order_info` VALUES ('66', '2', '0', '1', '2020-02-29 21:39:43', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '69');
INSERT INTO `t_mall_order_info` VALUES ('67', '3', '0', '1', '2020-02-29 21:55:22', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '70');
INSERT INTO `t_mall_order_info` VALUES ('68', '3', '0', '1', '2020-03-01 14:41:10', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '71');
INSERT INTO `t_mall_order_info` VALUES ('69', '3', '0', '1', '2020-04-01 23:51:39', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '72');
INSERT INTO `t_mall_order_info` VALUES ('70', '3', '0', '9', '2020-04-01 23:51:39', '华为荣耀版', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg', '13999', '1', '广东东莞', '73');
INSERT INTO `t_mall_order_info` VALUES ('71', '2', '0', '1', '2020-04-02 21:13:39', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '2', '广东珠海', '74');
INSERT INTO `t_mall_order_info` VALUES ('72', '2', '0', '9', '2020-04-02 21:13:39', '华为荣耀版', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg', '13999', '1', '广东东莞', '75');
INSERT INTO `t_mall_order_info` VALUES ('73', '3', '0', '1', '2020-04-02 21:17:06', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '76');
INSERT INTO `t_mall_order_info` VALUES ('74', '2', '0', '4', '2020-04-02 21:21:34', '外星人(曲面形+IOS显示屏)', '1578216387898aaa.jpg', '3777', '1', '广东深圳', '78');
INSERT INTO `t_mall_order_info` VALUES ('75', '2', '0', '9', '2020-04-02 21:21:34', '华为荣耀版', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg', '13999', '1', '广东东莞', '77');
INSERT INTO `t_mall_order_info` VALUES ('76', '3', '0', '9', '2020-04-02 21:24:39', '华为荣耀版', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg', '13999', '1', '广东东莞', '79');
INSERT INTO `t_mall_order_info` VALUES ('77', '1', '0', '1', '2020-04-18 19:47:35', '宏基(100*100寸1.5kg机械材料)', '1578554881092ccc.jpg', '4559', '1', '广东珠海', '80');

-- ----------------------------
-- Table structure for t_mall_order_phase
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_order_phase`;
CREATE TABLE `t_mall_order_phase` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `jdh` int(11) DEFAULT NULL COMMENT '进度号',
  `jdmsh` varchar(100) DEFAULT NULL COMMENT '进度描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单进度表';

-- ----------------------------
-- Records of t_mall_order_phase
-- ----------------------------
INSERT INTO `t_mall_order_phase` VALUES ('1', '1', '订单已提交');
INSERT INTO `t_mall_order_phase` VALUES ('2', '2', '订单已支付');
INSERT INTO `t_mall_order_phase` VALUES ('3', '3', '运输途中');
INSERT INTO `t_mall_order_phase` VALUES ('4', '4', '订单签收');
INSERT INTO `t_mall_order_phase` VALUES ('5', '5', '完成');

-- ----------------------------
-- Table structure for t_mall_product
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product`;
CREATE TABLE `t_mall_product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shp_mch` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `shp_tp` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图片',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  `flbh2` int(11) DEFAULT NULL COMMENT '分类编号2',
  `pp_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `chjshj` datetime DEFAULT NULL,
  `shp_msh` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of t_mall_product
-- ----------------------------
INSERT INTO `t_mall_product` VALUES ('1', '外星人1号', '1578216387898aaa.jpg', '8', '17', '20', '2020-01-05 17:26:28', '真的猛，吃鸡毫无压力！！');
INSERT INTO `t_mall_product` VALUES ('2', '外星人2号', '1578220923672u=680655970,999056049&fm=21&gp=0.jpg', '8', '17', '20', '2020-01-05 18:42:04', '便宜优惠，产品优美，童叟无欺，用过的都说好？！！！');
INSERT INTO `t_mall_product` VALUES ('3', '外星人3号', '1578220948427u=2376143440,295649722&fm=21&gp=0.jpg', '8', '17', '20', '2020-01-05 18:42:28', '便宜优惠，产品优美，童叟无欺，用过的都说好？！！！');
INSERT INTO `t_mall_product` VALUES ('4', '外星人4号', '1578223069495ccc.jpg', '8', '17', '20', '2020-01-05 19:17:50', '便宜优惠，产品优美，童叟无欺，用过的都说好？！！！');
INSERT INTO `t_mall_product` VALUES ('5', '宏基1号', '1578554881092ccc.jpg', '8', '17', '19', '2020-01-09 15:28:01', '贼好用');
INSERT INTO `t_mall_product` VALUES ('6', '宏基2号', '1578555407128u=3967837804,486790137&fm=21&gp=0.jpg', '8', '17', '19', '2020-01-09 15:36:47', '便宜实惠');
INSERT INTO `t_mall_product` VALUES ('7', '宏基3号', '1578558019702eee.jpg', '8', '17', '19', '2020-01-09 16:20:20', '玩游戏专用啊');
INSERT INTO `t_mall_product` VALUES ('8', '华为1号', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg', '11', '25', '18', '2020-01-17 01:07:10', '贼好玩');
INSERT INTO `t_mall_product` VALUES ('11', '小米5 Plus', '1585668945241index222.jpg', '8', '17', '2', '2020-03-31 23:35:45', '士大夫十');

-- ----------------------------
-- Table structure for t_mall_product_color
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_color`;
CREATE TABLE `t_mall_product_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `shp_ys` varchar(100) DEFAULT NULL COMMENT '商品颜色',
  `shfqy` int(11) DEFAULT NULL COMMENT '是否启用',
  `chjshj` datetime DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL COMMENT '款式图片链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mall_product_color
-- ----------------------------
INSERT INTO `t_mall_product_color` VALUES ('1', '7', '红色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('2', '7', '黑色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('3', '7', '白色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('4', '8', '绿色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('5', '8', '蓝色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('6', '9', '黑色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('7', '9', '白色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('8', '10', '黑色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('9', '10', '蓝色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('10', '11', '黑色', null, null, null);
INSERT INTO `t_mall_product_color` VALUES ('11', '11', '白色', null, null, null);

-- ----------------------------
-- Table structure for t_mall_product_image
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_image`;
CREATE TABLE `t_mall_product_image` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `zy` varchar(100) DEFAULT NULL COMMENT '作用',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of t_mall_product_image
-- ----------------------------
INSERT INTO `t_mall_product_image` VALUES ('3', null, '1', '1578216387907u=680655970');
INSERT INTO `t_mall_product_image` VALUES ('4', null, '2', '1578220923672u=680655970,999056049&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('7', null, '3', '1578220948427u=2376143440');
INSERT INTO `t_mall_product_image` VALUES ('10', null, '4', '1578223069496u=2788266912');
INSERT INTO `t_mall_product_image` VALUES ('12', null, '5', '1578295442027bbb.jpg');
INSERT INTO `t_mall_product_image` VALUES ('17', null, '6', '1578555407128u=3967837804');
INSERT INTO `t_mall_product_image` VALUES ('19', null, '7', '1578558019702eee.jpg');
INSERT INTO `t_mall_product_image` VALUES ('22', null, '5', '1578554881092ccc.jpg');
INSERT INTO `t_mall_product_image` VALUES ('23', null, '5', '1578558019706index2.jpg');
INSERT INTO `t_mall_product_image` VALUES ('24', null, '5', '1578554881092ccc.jpg');
INSERT INTO `t_mall_product_image` VALUES ('25', null, '1', '1578558019706index2.jpg');
INSERT INTO `t_mall_product_image` VALUES ('26', null, '1', '1578558019710aaa.jpg');
INSERT INTO `t_mall_product_image` VALUES ('27', null, '2', '486790137&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('28', null, '2', '486790137&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('29', null, '3', '295649722&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('30', null, '4', '1008059520&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('31', null, '8', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('32', null, '8', '1579194429940u=787077068,365624572&fm=11&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('33', null, '9', '1582974421687gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('34', null, '9', '1582974421688index222.jpg');
INSERT INTO `t_mall_product_image` VALUES ('35', null, '9', '1582974421688u=116694970,326259929&fm=21&gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('36', null, '10', '1582974650143gp=0.jpg');
INSERT INTO `t_mall_product_image` VALUES ('37', null, '10', '1582974650144index222.jpg');
INSERT INTO `t_mall_product_image` VALUES ('38', null, '11', '1585668945241index222.jpg');

-- ----------------------------
-- Table structure for t_mall_product_version
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_product_version`;
CREATE TABLE `t_mall_product_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `shp_bb` varchar(100) DEFAULT NULL COMMENT '商品版本',
  `shfqy` int(11) DEFAULT NULL COMMENT '是否启用',
  `chjshj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mall_product_version
-- ----------------------------
INSERT INTO `t_mall_product_version` VALUES ('1', '7', '独显+固态', null, null);
INSERT INTO `t_mall_product_version` VALUES ('2', '7', '集显+机械', null, null);
INSERT INTO `t_mall_product_version` VALUES ('3', '8', '8+64G', null, null);
INSERT INTO `t_mall_product_version` VALUES ('4', '8', '16+256G', null, null);
INSERT INTO `t_mall_product_version` VALUES ('5', '9', '8+64G', null, null);
INSERT INTO `t_mall_product_version` VALUES ('6', '9', '集显+机械', null, null);
INSERT INTO `t_mall_product_version` VALUES ('7', '10', '8+64G', null, null);
INSERT INTO `t_mall_product_version` VALUES ('8', '10', '集显+机械', null, null);
INSERT INTO `t_mall_product_version` VALUES ('9', '11', '8+64G', null, null);
INSERT INTO `t_mall_product_version` VALUES ('10', '11', '集显+机械', null, null);

-- ----------------------------
-- Table structure for t_mall_shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_shoppingcar`;
CREATE TABLE `t_mall_shoppingcar` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `sku_jg` decimal(65,0) DEFAULT NULL COMMENT 'sku价格',
  `tjshl` int(11) DEFAULT NULL COMMENT '添加数量',
  `hj` decimal(65,0) DEFAULT NULL COMMENT '合计',
  `yh_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shp_id` decimal(65,0) DEFAULT NULL COMMENT '商品id',
  `chjshj` datetime DEFAULT NULL COMMENT '创建时间',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `shp_tp` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `shfxz` varchar(1) DEFAULT NULL COMMENT '是否选中',
  `kcdz` varchar(500) DEFAULT NULL COMMENT '库存地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of t_mall_shoppingcar
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_sku`;
CREATE TABLE `t_mall_sku` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `kc` int(11) DEFAULT NULL COMMENT '库存',
  `jg` decimal(65,0) DEFAULT NULL,
  `chjshj` datetime DEFAULT NULL,
  `sku_mch` varchar(100) DEFAULT NULL COMMENT 'sku名称',
  `sku_xl` int(11) DEFAULT NULL COMMENT 'sku销量',
  `kcdz` varchar(500) DEFAULT NULL COMMENT '库存地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='sku库存表';

-- ----------------------------
-- Records of t_mall_sku
-- ----------------------------
INSERT INTO `t_mall_sku` VALUES ('1', '5', '98', '4559', '2020-02-29 19:15:04', '宏基(100*100寸1.5kg机械材料)', '7', '广东珠海');
INSERT INTO `t_mall_sku` VALUES ('2', '6', '99', '2999', '2020-02-29 19:17:00', '宏基(19.5V8+64GB)', '0', '广东珠海');
INSERT INTO `t_mall_sku` VALUES ('3', '7', '1599', '6999', '2020-02-29 19:17:30', '宏基(全景VR4色)', '0', '广东珠海');
INSERT INTO `t_mall_sku` VALUES ('4', '1', '9999', '3777', '2020-02-29 19:18:11', '外星人(曲面形+IOS显示屏)', '0', '广东深圳');
INSERT INTO `t_mall_sku` VALUES ('5', '2', '2099', '8999', '2020-02-29 19:24:07', '外星人(16+256GB+200瓦)', '0', '广东深圳');
INSERT INTO `t_mall_sku` VALUES ('6', '3', '9', '7999', '2020-02-29 19:24:52', '外星人(2.35A+LCD显示屏)', '0', '广东深圳');
INSERT INTO `t_mall_sku` VALUES ('7', '4', '99', '5999', '2020-02-29 19:25:21', '外星人(2.0kg+30000毫安)', '0', '广东深圳');
INSERT INTO `t_mall_sku` VALUES ('8', '8', '4099', '12999', '2020-02-29 19:27:02', '华为青春版', '0', '广东东莞');
INSERT INTO `t_mall_sku` VALUES ('9', '8', '98', '13999', '2020-02-29 19:27:35', '华为荣耀版', '2', '广东东莞');

-- ----------------------------
-- Table structure for t_mall_sku_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_sku_attr_value`;
CREATE TABLE `t_mall_sku_attr_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxm_id` int(11) DEFAULT NULL COMMENT '属性名id',
  `shxzh_id` int(11) DEFAULT NULL COMMENT '属性值id',
  `shp_id` int(11) DEFAULT NULL COMMENT '商品id',
  `is_sku` varchar(1) DEFAULT NULL COMMENT '是否sku',
  `chjshj` datetime DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='sku属性和属性值关联表';

-- ----------------------------
-- Records of t_mall_sku_attr_value
-- ----------------------------
INSERT INTO `t_mall_sku_attr_value` VALUES ('1', '1', '1', '1', null, '2020-01-14 15:39:17', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('2', '2', '3', '1', null, '2020-01-14 15:40:34', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('3', '3', '5', '1', null, '2020-01-14 15:40:37', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('4', '1', '2', '2', null, '2020-01-14 15:40:39', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('5', '2', '4', '2', null, '2020-01-14 15:40:41', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('6', '3', '6', '2', null, '2020-01-14 15:40:42', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('7', '4', '8', '2', null, '2020-01-14 15:40:45', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('8', '6', '10', '2', null, '2020-01-14 15:40:47', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('10', '2', '3', '3', null, '2020-01-14 15:40:51', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('13', '6', '10', '3', null, '2020-01-14 15:41:14', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('15', '2', '4', '4', null, '2020-01-14 15:41:17', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('18', '6', '9', '4', null, '2020-01-14 15:41:22', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('19', '1', '1', '5', null, '2020-01-14 15:39:12', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('20', '2', '3', '5', null, '2020-01-14 15:41:45', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('24', '4', '7', '6', null, '2020-01-09 16:18:18', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('25', '6', '9', '6', null, '2020-01-09 16:18:18', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('26', '1', '1', '7', null, '2020-01-09 16:21:05', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('27', '2', '3', '7', null, '2020-01-09 16:21:05', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('28', '1', '1', '5', null, '2020-01-09 16:21:50', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('29', '2', '4', '5', null, '2020-01-09 16:21:50', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('30', '1', '2', '1', null, '2020-01-14 15:44:42', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('31', '8', '13', '5', null, '2020-01-14 18:25:32', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('32', '4', '7', '5', null, '2020-01-14 18:25:38', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('33', '10', '17', '5', null, '2020-01-14 18:25:40', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('34', '7', '11', '5', null, '2020-01-14 18:25:42', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('35', '12', '21', '5', null, '2020-01-14 18:25:43', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('36', '15', '31', '8', null, '2020-01-17 01:19:36', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('37', '16', '32', '8', null, '2020-01-17 01:35:34', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('38', '16', '32', '8', null, '2020-01-17 01:35:34', '10');
INSERT INTO `t_mall_sku_attr_value` VALUES ('39', '1', '1', '5', null, '2020-02-29 19:15:04', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('40', '2', '3', '5', null, '2020-02-29 19:15:04', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('41', '0', '0', '5', null, '2020-02-29 19:15:04', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('42', '4', '7', '5', null, '2020-02-29 19:15:04', '1');
INSERT INTO `t_mall_sku_attr_value` VALUES ('43', '0', '0', '6', null, '2020-02-29 19:17:00', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('44', '0', '0', '6', null, '2020-02-29 19:17:00', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('45', '0', '0', '6', null, '2020-02-29 19:17:00', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('46', '0', '0', '6', null, '2020-02-29 19:17:00', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('47', '6', '9', '6', null, '2020-02-29 19:17:00', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('48', '7', '11', '6', null, '2020-02-29 19:17:00', '2');
INSERT INTO `t_mall_sku_attr_value` VALUES ('49', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('50', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('51', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('52', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('53', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('54', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('55', '0', '0', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('56', '9', '15', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('57', '10', '18', '7', null, '2020-02-29 19:17:30', '3');
INSERT INTO `t_mall_sku_attr_value` VALUES ('58', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('59', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('60', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('61', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('62', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('63', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('64', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('65', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('66', '0', '0', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('67', '11', '19', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('68', '12', '23', '1', null, '2020-02-29 19:18:11', '4');
INSERT INTO `t_mall_sku_attr_value` VALUES ('69', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('70', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('71', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('72', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('73', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('74', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('75', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('76', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('77', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('78', '0', '0', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('79', '12', '22', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('80', '13', '26', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('81', '14', '28', '2', null, '2020-02-29 19:18:53', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('82', '0', '0', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('83', '0', '0', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('84', '0', '0', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('85', '0', '0', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('86', '0', '0', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('87', '7', '12', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('88', '8', '14', '2', null, '2020-02-29 19:24:07', '5');
INSERT INTO `t_mall_sku_attr_value` VALUES ('89', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('90', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('91', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('92', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('93', '6', '10', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('94', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('95', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('96', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('97', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('98', '0', '0', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('99', '12', '22', '3', null, '2020-02-29 19:24:52', '6');
INSERT INTO `t_mall_sku_attr_value` VALUES ('100', '0', '0', '4', null, '2020-02-29 19:25:21', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('101', '2', '4', '4', null, '2020-02-29 19:25:21', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('102', '3', '6', '4', null, '2020-02-29 19:25:21', '7');
INSERT INTO `t_mall_sku_attr_value` VALUES ('103', '15', '31', '8', null, '2020-02-29 19:27:02', '8');
INSERT INTO `t_mall_sku_attr_value` VALUES ('104', '15', '31', '8', null, '2020-02-29 19:27:35', '9');
INSERT INTO `t_mall_sku_attr_value` VALUES ('105', '16', '33', '8', null, '2020-02-29 19:27:35', '9');

-- ----------------------------
-- Table structure for t_mall_tm_class
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_tm_class`;
CREATE TABLE `t_mall_tm_class` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `pp_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `flbh1` int(11) DEFAULT NULL COMMENT '分类编号1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商标分类对应表';

-- ----------------------------
-- Records of t_mall_tm_class
-- ----------------------------
INSERT INTO `t_mall_tm_class` VALUES ('1', '8', '7');
INSERT INTO `t_mall_tm_class` VALUES ('2', '1', '8');
INSERT INTO `t_mall_tm_class` VALUES ('3', '9', '9');
INSERT INTO `t_mall_tm_class` VALUES ('4', '3', '6');
INSERT INTO `t_mall_tm_class` VALUES ('5', '2', '7');
INSERT INTO `t_mall_tm_class` VALUES ('6', '2', '8');
INSERT INTO `t_mall_tm_class` VALUES ('7', '10', '9');
INSERT INTO `t_mall_tm_class` VALUES ('8', '4', '6');
INSERT INTO `t_mall_tm_class` VALUES ('9', '13', '6');
INSERT INTO `t_mall_tm_class` VALUES ('10', '14', '6');
INSERT INTO `t_mall_tm_class` VALUES ('11', '13', '13');
INSERT INTO `t_mall_tm_class` VALUES ('12', '13', '14');
INSERT INTO `t_mall_tm_class` VALUES ('13', '14', '13');
INSERT INTO `t_mall_tm_class` VALUES ('14', '14', '14');
INSERT INTO `t_mall_tm_class` VALUES ('15', '18', '7');
INSERT INTO `t_mall_tm_class` VALUES ('16', '18', '8');
INSERT INTO `t_mall_tm_class` VALUES ('17', '18', '11');
INSERT INTO `t_mall_tm_class` VALUES ('18', '19', '8');
INSERT INTO `t_mall_tm_class` VALUES ('19', '19', '11');
INSERT INTO `t_mall_tm_class` VALUES ('20', '20', '8');
INSERT INTO `t_mall_tm_class` VALUES ('21', '21', '9');
INSERT INTO `t_mall_tm_class` VALUES ('22', '22', '7');
INSERT INTO `t_mall_tm_class` VALUES ('23', '23', '14');
INSERT INTO `t_mall_tm_class` VALUES ('24', '24', '14');
INSERT INTO `t_mall_tm_class` VALUES ('25', '25', '14');
INSERT INTO `t_mall_tm_class` VALUES ('26', '26', '14');
INSERT INTO `t_mall_tm_class` VALUES ('27', '27', '13');
INSERT INTO `t_mall_tm_class` VALUES ('28', '28', '13');
INSERT INTO `t_mall_tm_class` VALUES ('29', '29', '11');
INSERT INTO `t_mall_tm_class` VALUES ('30', '30', '10');
INSERT INTO `t_mall_tm_class` VALUES ('31', '30', '15');
INSERT INTO `t_mall_tm_class` VALUES ('32', '31', '10');
INSERT INTO `t_mall_tm_class` VALUES ('33', '31', '15');
INSERT INTO `t_mall_tm_class` VALUES ('34', '32', '10');
INSERT INTO `t_mall_tm_class` VALUES ('35', '32', '15');

-- ----------------------------
-- Table structure for t_mall_trade_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_trade_mark`;
CREATE TABLE `t_mall_trade_mark` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `ppmch` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `url` varchar(100) DEFAULT NULL COMMENT '品牌图片',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商标表';

-- ----------------------------
-- Records of t_mall_trade_mark
-- ----------------------------
INSERT INTO `t_mall_trade_mark` VALUES ('1', 'apple', null);
INSERT INTO `t_mall_trade_mark` VALUES ('2', 'lenovo', null);
INSERT INTO `t_mall_trade_mark` VALUES ('3', '骆驼', null);
INSERT INTO `t_mall_trade_mark` VALUES ('4', '波司登', null);
INSERT INTO `t_mall_trade_mark` VALUES ('8', '华为', null);
INSERT INTO `t_mall_trade_mark` VALUES ('9', '欧莱雅', null);
INSERT INTO `t_mall_trade_mark` VALUES ('10', '沙宣', null);
INSERT INTO `t_mall_trade_mark` VALUES ('13', '阿迪达斯', null);
INSERT INTO `t_mall_trade_mark` VALUES ('14', '耐克', null);
INSERT INTO `t_mall_trade_mark` VALUES ('18', '华为', null);
INSERT INTO `t_mall_trade_mark` VALUES ('19', '宏基', null);
INSERT INTO `t_mall_trade_mark` VALUES ('20', '外星人', null);
INSERT INTO `t_mall_trade_mark` VALUES ('21', '欧莱雅', null);
INSERT INTO `t_mall_trade_mark` VALUES ('22', '美的Midea', null);
INSERT INTO `t_mall_trade_mark` VALUES ('23', '劳力士', null);
INSERT INTO `t_mall_trade_mark` VALUES ('24', '天梭', null);
INSERT INTO `t_mall_trade_mark` VALUES ('25', '卡地亚Carter', null);
INSERT INTO `t_mall_trade_mark` VALUES ('26', '江诗丹顿', null);
INSERT INTO `t_mall_trade_mark` VALUES ('27', '瑞士军刀', null);
INSERT INTO `t_mall_trade_mark` VALUES ('28', 'LV', null);
INSERT INTO `t_mall_trade_mark` VALUES ('29', '诺基亚', null);
INSERT INTO `t_mall_trade_mark` VALUES ('30', '三鹿', null);
INSERT INTO `t_mall_trade_mark` VALUES ('31', '蒙牛', null);
INSERT INTO `t_mall_trade_mark` VALUES ('32', '伊利', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户账户表';

-- ----------------------------
-- Records of t_mall_user_account
-- ----------------------------
INSERT INTO `t_mall_user_account` VALUES ('1', 'admin', 'tom', '123', '杰瑞', '2020-1-12', '943875378@qq.com', 'a', '1');

-- ----------------------------
-- Table structure for t_mall_value
-- ----------------------------
DROP TABLE IF EXISTS `t_mall_value`;
CREATE TABLE `t_mall_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shxzh` varchar(100) DEFAULT NULL COMMENT '属性值',
  `shfqy` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `shxm_id` int(11) DEFAULT NULL COMMENT '属性id',
  `shxzh_mch` varchar(100) DEFAULT NULL COMMENT '属性值名',
  `chjshj` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='属性值表';

-- ----------------------------
-- Records of t_mall_value
-- ----------------------------
INSERT INTO `t_mall_value` VALUES ('1', '100*100', null, '1', '寸', '2020-01-04 19:07:21');
INSERT INTO `t_mall_value` VALUES ('2', '200*200', null, '1', '寸', '2020-01-04 19:07:21');
INSERT INTO `t_mall_value` VALUES ('3', '1.5', null, '2', 'kg', '2020-01-04 19:07:21');
INSERT INTO `t_mall_value` VALUES ('4', '2.0', null, '2', 'kg', '2020-01-04 19:07:21');
INSERT INTO `t_mall_value` VALUES ('5', '20000', null, '3', '毫安', '2020-01-04 19:07:21');
INSERT INTO `t_mall_value` VALUES ('6', '30000', null, '3', '毫安', '2020-01-04 19:07:21');
INSERT INTO `t_mall_value` VALUES ('7', '机械', null, '4', '材质', '2020-01-04 19:09:14');
INSERT INTO `t_mall_value` VALUES ('8', '塑料', null, '4', '材质', '2020-01-04 19:09:14');
INSERT INTO `t_mall_value` VALUES ('9', '19.5', null, '6', 'V', '2020-01-05 15:00:35');
INSERT INTO `t_mall_value` VALUES ('10', '2.35', null, '6', 'A', '2020-01-05 15:00:35');
INSERT INTO `t_mall_value` VALUES ('11', '8+64', null, '7', 'GB', '2020-01-06 21:04:12');
INSERT INTO `t_mall_value` VALUES ('12', '16+256', null, '7', 'GB', '2020-01-06 21:04:12');
INSERT INTO `t_mall_value` VALUES ('13', '100', null, '8', '瓦', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('14', '200', null, '8', '瓦', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('15', '全景', null, '9', 'VR', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('16', '影院', null, '9', 'VR', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('17', '12', null, '10', '色', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('18', '24', null, '10', '色', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('19', '曲面', null, '11', '形', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('20', '非曲面', null, '11', '形', '2020-01-08 16:46:33');
INSERT INTO `t_mall_value` VALUES ('21', 'LED', null, '12', '显示屏', '2020-01-08 16:51:24');
INSERT INTO `t_mall_value` VALUES ('22', 'LCD', null, '12', '显示屏', '2020-01-08 16:51:24');
INSERT INTO `t_mall_value` VALUES ('23', 'IOS', null, '12', '显示屏', '2020-01-08 16:51:24');
INSERT INTO `t_mall_value` VALUES ('24', '1', null, '13', '厘米', '2020-01-08 16:54:13');
INSERT INTO `t_mall_value` VALUES ('25', '2', null, '13', '厘米', '2020-01-08 16:54:13');
INSERT INTO `t_mall_value` VALUES ('26', '3', null, '13', '厘米', '2020-01-08 16:54:13');
INSERT INTO `t_mall_value` VALUES ('27', '1', null, '14', '厘米', '2020-01-08 22:37:53');
INSERT INTO `t_mall_value` VALUES ('28', '2', null, '14', '厘米', '2020-01-08 22:37:53');
INSERT INTO `t_mall_value` VALUES ('29', '3', null, '14', '厘米', '2020-01-08 22:37:53');
INSERT INTO `t_mall_value` VALUES ('30', '8+64', null, '15', 'GB', '2020-01-17 01:17:47');
INSERT INTO `t_mall_value` VALUES ('31', '16+256', null, '15', 'GB', '2020-01-17 01:17:47');
INSERT INTO `t_mall_value` VALUES ('32', '红', null, '16', '色', '2020-01-17 01:21:45');
INSERT INTO `t_mall_value` VALUES ('33', '黑', null, '16', '色', '2020-01-17 01:21:45');
INSERT INTO `t_mall_value` VALUES ('50', '机械', null, '25', '色', '2020-03-31 23:26:26');
INSERT INTO `t_mall_value` VALUES ('51', '200*200', null, '25', '色', '2020-03-31 23:26:26');
