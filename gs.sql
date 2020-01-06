/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 100410
 Source Host           : localhost:3306
 Source Schema         : gs

 Target Server Type    : MySQL
 Target Server Version : 100410
 File Encoding         : 65001

 Date: 06/01/2020 18:53:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for g_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_brand`;
CREATE TABLE `g_goods_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_brand
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_brand` VALUES (1, 'Apple');
INSERT INTO `g_goods_brand` VALUES (2, 'Vivo');
INSERT INTO `g_goods_brand` VALUES (3, '华为');
INSERT INTO `g_goods_brand` VALUES (4, '三星');
INSERT INTO `g_goods_brand` VALUES (5, '耐克');
COMMIT;

-- ----------------------------
-- Table structure for g_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_category`;
CREATE TABLE `g_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_category
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_category` VALUES (1, '手机', 0);
INSERT INTO `g_goods_category` VALUES (2, '服装', 0);
COMMIT;

-- ----------------------------
-- Table structure for g_goods_express
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_express`;
CREATE TABLE `g_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(255) DEFAULT NULL,
  `express_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_express
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_express` VALUES (1, '顺丰', 10.00);
INSERT INTO `g_goods_express` VALUES (2, '免运费', 0.00);
COMMIT;

-- ----------------------------
-- Table structure for g_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_sku`;
CREATE TABLE `g_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spu_id` int(11) DEFAULT NULL,
  `sku_no` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `stock` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_sku
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_sku` VALUES (1, 1, '201912261231312', 9999.00, 12999.00, 99);
INSERT INTO `g_goods_sku` VALUES (3, 99, '23132323', 9999.00, 12999.00, 99);
COMMIT;

-- ----------------------------
-- Table structure for g_goods_sku_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_sku_spec_value`;
CREATE TABLE `g_goods_sku_spec_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL,
  `spec_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_sku_spec_value
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_sku_spec_value` VALUES (1, 1, 1);
INSERT INTO `g_goods_sku_spec_value` VALUES (2, 1, 4);
INSERT INTO `g_goods_sku_spec_value` VALUES (3, 4, 1);
COMMIT;

-- ----------------------------
-- Table structure for g_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_spec`;
CREATE TABLE `g_goods_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_spec
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_spec` VALUES (1, '内存容量');
INSERT INTO `g_goods_spec` VALUES (2, '机身颜色');
COMMIT;

-- ----------------------------
-- Table structure for g_goods_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_spec_value`;
CREATE TABLE `g_goods_spec_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) DEFAULT NULL,
  `spec_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_spec_value
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_spec_value` VALUES (1, 1, '64G');
INSERT INTO `g_goods_spec_value` VALUES (2, 1, '128G');
INSERT INTO `g_goods_spec_value` VALUES (3, 1, '256G');
INSERT INTO `g_goods_spec_value` VALUES (4, 2, '红色');
COMMIT;

-- ----------------------------
-- Table structure for g_goods_spu
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_spu`;
CREATE TABLE `g_goods_spu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `express_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `banners` varchar(255) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `sale_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_goods_spu
-- ----------------------------
BEGIN;
INSERT INTO `g_goods_spu` VALUES (1, 1, 2, 1, '1,333', 'Apple/苹果 13 英寸 Macbook Pro 1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 128GB 存储容量 触控栏和触控 ID', '9999.00', 9999.00, 0);
INSERT INTO `g_goods_spu` VALUES (2, 2, 1, 5, 'Banner 内容', 'Nike 耐克官方NIKE ESSENTIAL 男子跑步连帽夹克BV4871', 'Nike 耐克官方NIKE ESSENTIAL 男子跑步连帽夹克BV4871', 499.00, 0);
COMMIT;

-- ----------------------------
-- Table structure for g_user
-- ----------------------------
DROP TABLE IF EXISTS `g_user`;
CREATE TABLE `g_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of g_user
-- ----------------------------
BEGIN;
INSERT INTO `g_user` VALUES (4, '', '123699', '3ce5026e5ab706f4bbd7bc6b06798663', '6Q3KVT00IW', '2019-12-25 10:43:37', '2019-12-25 10:43:37', NULL);
INSERT INTO `g_user` VALUES (11, '', 'stranger', 'b5242aec17acd3ede6b05b55ea2efb2d', 'LP3TAP4VDZ', '2019-12-25 10:53:09', '2019-12-25 10:53:09', NULL);
INSERT INTO `g_user` VALUES (13, '', 'stranger1', '7b99d55dc7708c1134c5d41bf4151408', 'WQWCCSC6JW', '2019-12-25 10:53:52', '2019-12-25 10:53:52', NULL);
INSERT INTO `g_user` VALUES (14, '', 'stranger2', '0922c37589d7e0a23bf70117f7028a41', '1UQVLXD5HV', '2019-12-25 14:49:20', '2019-12-25 14:49:20', NULL);
INSERT INTO `g_user` VALUES (15, '', 'stranger3', '316412bb80baebddef6d21e51216487e', 'C99N38DCQC', '2019-12-25 14:55:06', '2019-12-25 14:55:06', NULL);
INSERT INTO `g_user` VALUES (16, '', 'stranger4', 'b7715aaf2a0b5f3735e6c657149ef0a0', 'XFTUNMF8JD', '2019-12-25 14:56:00', '2019-12-25 14:56:00', NULL);
INSERT INTO `g_user` VALUES (17, '', 'stranger5', 'c07234d6483014087ed451c31ff95554', 'SWLIW5AKKF', '2019-12-25 14:59:05', '2019-12-25 14:59:05', NULL);
INSERT INTO `g_user` VALUES (18, '', 'stranger6', 'e6ec75e6aec4dee81ae21336df9403c9', 'MNDB5EVBWH', '2019-12-25 15:13:59', '2019-12-25 15:13:59', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
