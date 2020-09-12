/*
 Navicat Premium Data Transfer

 Source Server         : Test
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : equipmentmgr

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 11/09/2020 08:00:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_area
-- ----------------------------
DROP TABLE IF EXISTS `d_area`;
CREATE TABLE `d_area`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUILD` int(11) NULL DEFAULT NULL,
  `FLOOR` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_area
-- ----------------------------
INSERT INTO `d_area` VALUES (4, 2, 1);
INSERT INTO `d_area` VALUES (5, 2, 2);
INSERT INTO `d_area` VALUES (6, 2, 3);
INSERT INTO `d_area` VALUES (7, 2, 4);
INSERT INTO `d_area` VALUES (8, 2, 5);
INSERT INTO `d_area` VALUES (9, 66, -2);
INSERT INTO `d_area` VALUES (10, 66, -1);
INSERT INTO `d_area` VALUES (12, 1, 1);

-- ----------------------------
-- Table structure for d_equipment
-- ----------------------------
DROP TABLE IF EXISTS `d_equipment`;
CREATE TABLE `d_equipment`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_equipment
-- ----------------------------
INSERT INTO `d_equipment` VALUES (1, '小米十', 0);
INSERT INTO `d_equipment` VALUES (2, '小米电脑', 1);
INSERT INTO `d_equipment` VALUES (3, '投影仪', 2);
INSERT INTO `d_equipment` VALUES (4, '会议室电视', 1);
INSERT INTO `d_equipment` VALUES (5, '小米显示器', 1);
INSERT INTO `d_equipment` VALUES (6, '谷歌眼镜', 0);
INSERT INTO `d_equipment` VALUES (11, '小米手环', 0);
INSERT INTO `d_equipment` VALUES (12, '教鞭', 0);

-- ----------------------------
-- Table structure for d_role
-- ----------------------------
DROP TABLE IF EXISTS `d_role`;
CREATE TABLE `d_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_role
-- ----------------------------
INSERT INTO `d_role` VALUES (1, '超级管理员', 0);
INSERT INTO `d_role` VALUES (2, '调度员组组长', 1);
INSERT INTO `d_role` VALUES (3, '调度员1', 1);
INSERT INTO `d_role` VALUES (4, '调度员2', 1);
INSERT INTO `d_role` VALUES (5, '维修班班长', 2);
INSERT INTO `d_role` VALUES (6, '维修人员1', 2);
INSERT INTO `d_role` VALUES (7, '维修人员2', 2);
INSERT INTO `d_role` VALUES (8, '维修人员3', 2);
INSERT INTO `d_role` VALUES (15, '报修人员1', 3);
INSERT INTO `d_role` VALUES (16, '维修巨佬', 2);

-- ----------------------------
-- Table structure for d_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `d_role_permission`;
CREATE TABLE `d_role_permission`  (
  `ROLE_ID` int(11) NOT NULL,
  `PERMISSION_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROLE_ID`, `PERMISSION_ID`) USING BTREE,
  INDEX `FKkcpwr7l30eu3g39ie75re2cya`(`PERMISSION_ID`) USING BTREE,
  CONSTRAINT `FK4uvtpeghyf23pfyubiu9d2fg7` FOREIGN KEY (`ROLE_ID`) REFERENCES `d_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkcpwr7l30eu3g39ie75re2cya` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_role_permission
-- ----------------------------
INSERT INTO `d_role_permission` VALUES (2, 1);
INSERT INTO `d_role_permission` VALUES (3, 1);
INSERT INTO `d_role_permission` VALUES (16, 1);
INSERT INTO `d_role_permission` VALUES (2, 4);
INSERT INTO `d_role_permission` VALUES (3, 4);
INSERT INTO `d_role_permission` VALUES (16, 4);
INSERT INTO `d_role_permission` VALUES (2, 9);
INSERT INTO `d_role_permission` VALUES (3, 9);
INSERT INTO `d_role_permission` VALUES (16, 9);
INSERT INTO `d_role_permission` VALUES (2, 10);
INSERT INTO `d_role_permission` VALUES (16, 10);

-- ----------------------------
-- Table structure for d_user
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NICKNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_ROLE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKckp39pnnr9njcedtayhm3b1b5`(`USER_ROLE`) USING BTREE,
  CONSTRAINT `FKckp39pnnr9njcedtayhm3b1b5` FOREIGN KEY (`USER_ROLE`) REFERENCES `d_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES (1, '我是超管', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);
INSERT INTO `d_user` VALUES (5, '张三', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', 2);
INSERT INTO `d_user` VALUES (6, '李四', 'lisi', 'dc3a8f1670d65bea69b7b65048a0ac40', 5);
INSERT INTO `d_user` VALUES (7, '王二', 'wanger', '2aa3f4ba3af7dbb6821c4f0e977610a1', 6);
INSERT INTO `d_user` VALUES (8, '麻子', 'mazi', '052e2abe3d91dc892fa537811f5ce0b5', 15);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'jsp/permission.jsp', '权限管理', 'A');
INSERT INTO `permission` VALUES (4, 'jsp/juese.jsp', '角色管理', 'A');
INSERT INTO `permission` VALUES (9, 'jsp/userM.jsp', '用户管理', 'A');
INSERT INTO `permission` VALUES (10, 'jsp/AreaManage.jsp', '区域管理', 'A');

-- ----------------------------
-- Table structure for repairorder
-- ----------------------------
DROP TABLE IF EXISTS `repairorder`;
CREATE TABLE `repairorder`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUIPMENT_TYPE` int(11) NULL DEFAULT NULL,
  `EQUIPMENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EQUIPMENT_BUILD` int(11) NULL DEFAULT NULL,
  `EQUIPMENT_FLOOR` int(11) NULL DEFAULT NULL,
  `EQUIPMENT_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMAGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RECORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `REPAIR_USER` int(11) NULL DEFAULT NULL,
  `SERVICE_USER` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK7q6yvwiw8ks4i97x6xnlrfbik`(`REPAIR_USER`) USING BTREE,
  INDEX `FKtfusyyhq4ex84h0fol8avkahl`(`SERVICE_USER`) USING BTREE,
  CONSTRAINT `FK7q6yvwiw8ks4i97x6xnlrfbik` FOREIGN KEY (`REPAIR_USER`) REFERENCES `d_user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtfusyyhq4ex84h0fol8avkahl` FOREIGN KEY (`SERVICE_USER`) REFERENCES `d_user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repairorder
-- ----------------------------
INSERT INTO `repairorder` VALUES (3, 1, '姚云飞的小米十', 1, 1, '郑州大学北校区学宿2楼', '/uploadImage/images6.jpg', '手机屏幕被小胖子干碎了。', '<img src=\"http://localhost:8080/EquipmentMgr/assets/images/face/15.gif\" alt=\"[生病]\">', 1, 1, 7);
INSERT INTO `repairorder` VALUES (4, 1, '付先生的iphone', 1, 3, '郑州大学北校区', '/uploadImage/images9.jpg', '手机屏幕被小胖子干碎了。', NULL, 0, 1, 6);
INSERT INTO `repairorder` VALUES (5, 1, '高老板的iPhone', 2, 4, '郑州大学北校区学宿2号楼', '/uploadImage/images21.jpg', '一拳轰碎了高老板的赛文眼镜。', NULL, 0, 8, NULL);
INSERT INTO `repairorder` VALUES (6, 1, '樊老板的小米', 2, 4, '郑州大学北校区', '/uploadImage/images10.jpg', '樊老板的小米被小胖子扔了。', NULL, 0, 8, 7);

SET FOREIGN_KEY_CHECKS = 1;
