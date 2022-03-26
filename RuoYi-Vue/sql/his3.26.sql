/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50561
 Source Host           : localhost:3306
 Source Schema         : his

 Target Server Type    : MySQL
 Target Server Version : 50561
 File Encoding         : 65001

 Date: 26/03/2022 17:27:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for condition_alarm
-- ----------------------------
DROP TABLE IF EXISTS `condition_alarm`;
CREATE TABLE `condition_alarm`  (
  `alarm_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '警报Id',
  `user_equipment_relation` bigint(20) NULL DEFAULT NULL COMMENT '设备与老人关联表Id',
  `is_notice` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通知诊所',
  `notice_clinic_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知的诊所位置',
  `help_equipment_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助的老人设备位置',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`alarm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备警报管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of condition_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for condition_equipment
-- ----------------------------
DROP TABLE IF EXISTS `condition_equipment`;
CREATE TABLE `condition_equipment`  (
  `equipment_id` bigint(20) NOT NULL,
  `equipment_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equipment_heart_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '心率',
  `equipment_ox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血氧饱和度',
  `equipment_alarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警信息',
  `equipment_temperature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体温',
  `coordinate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度坐标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`equipment_id`) USING BTREE,
  INDEX `equipment_id`(`equipment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of condition_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for condition_seat
-- ----------------------------
DROP TABLE IF EXISTS `condition_seat`;
CREATE TABLE `condition_seat`  (
  `seat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '位置信息Id',
  `clinic_Id` bigint(20) NULL DEFAULT NULL COMMENT '诊所外键Id',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备外键Id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '位置信息管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of condition_seat
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'his_user', 'His用户信息表', NULL, NULL, 'HisUser', 'crud', 'com.ruoyi.his', 'user', 'user', 'His用户信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_clinic', '门诊信息表', NULL, NULL, 'SysClinic', 'crud', 'com.ruoyi.system', 'sys_clinic`', 'clinic', '门诊管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (2, '1', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (3, '1', 'phonenumber', '手机号码（登录身份）', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (4, '1', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (5, '1', 'user_level', '级别', 'varchar(30)', 'String', 'userLevel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (6, '1', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 6, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (7, '1', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (8, '1', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (9, '1', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (10, '1', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 10, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (11, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (12, '1', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (13, '1', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (14, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (15, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (16, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (17, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (18, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 18, 'admin', '2022-03-24 17:10:01', '', '2022-03-24 17:12:03');
INSERT INTO `gen_table_column` VALUES (19, '2', 'clinic_id', '诊所ID', 'bigint(20)', 'Long', 'clinicId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (20, '2', 'clinic_name', '诊所名称', 'varchar(50)', 'String', 'clinicName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (21, '2', 'clinic_location', '诊所位置', 'varchar(500)', 'String', 'clinicLocation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (22, '2', 'clinicleader', '负责人', 'varchar(64)', 'String', 'clinicleader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (23, '2', 'clinic_phone', '手机号码', 'varchar(11)', 'String', 'clinicPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (24, '2', 'status', '状态（0正常;1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_yes_no', 6, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (25, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (26, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (27, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (28, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (29, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');
INSERT INTO `gen_table_column` VALUES (30, '2', 'coordinate', '经纬度坐标', 'varchar(255)', 'String', 'coordinate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-03-25 20:53:30', '', '2022-03-25 20:59:57');

-- ----------------------------
-- Table structure for green_case_ban_blood
-- ----------------------------
DROP TABLE IF EXISTS `green_case_ban_blood`;
CREATE TABLE `green_case_ban_blood`  (
  `blood_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药物ID',
  `medicine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药物名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `case_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`blood_id`) USING BTREE,
  INDEX `关联病例`(`case_id`) USING BTREE,
  CONSTRAINT `高血压关联病例` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '高血压禁忌药物' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_case_ban_blood
-- ----------------------------

-- ----------------------------
-- Table structure for green_case_ban_diabetes
-- ----------------------------
DROP TABLE IF EXISTS `green_case_ban_diabetes`;
CREATE TABLE `green_case_ban_diabetes`  (
  `diabetes_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药物ID',
  `medicine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药物名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `case_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`diabetes_id`) USING BTREE,
  INDEX `糖尿病关联病例`(`case_id`) USING BTREE,
  CONSTRAINT `糖尿病关联病例` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '糖尿病禁忌药物' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_case_ban_diabetes
-- ----------------------------

-- ----------------------------
-- Table structure for green_case_ban_heart
-- ----------------------------
DROP TABLE IF EXISTS `green_case_ban_heart`;
CREATE TABLE `green_case_ban_heart`  (
  `heart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药物ID',
  `medicine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药物名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `case_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`heart_id`) USING BTREE,
  INDEX `关联病例`(`case_id`) USING BTREE,
  CONSTRAINT `心脏病关联病例` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '心脏病禁忌药物' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_case_ban_heart
-- ----------------------------

-- ----------------------------
-- Table structure for green_old_case
-- ----------------------------
DROP TABLE IF EXISTS `green_old_case`;
CREATE TABLE `green_old_case`  (
  `case_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'caseid',
  `diabetes` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '糖尿病;1代表有，0代表无',
  `heart_disease` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '心脏病;1代表有，0代表无',
  `high_blood_pressure` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高血压;1代表有，0代表无',
  `genetic_disease` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '遗传病;1代表有，0代表无',
  `cancer` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '癌症;1代表有，0代表无',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`case_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人病例（参考）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_old_case
-- ----------------------------

-- ----------------------------
-- Table structure for green_user
-- ----------------------------
DROP TABLE IF EXISTS `green_user`;
CREATE TABLE `green_user`  (
  `old_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '老年人Id',
  `old_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老年人姓名',
  `old_describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述;老年人近期门诊反馈信息',
  `old_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `linkman` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人;用于联系老人的看护人或者家属',
  `link_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '紧急联系人电话;用于联系老人的看护人或者家属',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`old_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人绿色通道' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_user
-- ----------------------------
INSERT INTO `green_user` VALUES (1, '张三', '无', '371121200009090431', '张四', '18612345678', '0', 'admin', '2022-03-24 21:27:29', 'admin', '2022-03-24 21:27:33', NULL);
INSERT INTO `green_user` VALUES (2, '李四啊', '没啥', '371112456', '李三', '17861918900', '0', '', '2022-03-25 17:31:45', 'admin', '2022-03-25 17:38:10', '我');

-- ----------------------------
-- Table structure for green_user_case
-- ----------------------------
DROP TABLE IF EXISTS `green_user_case`;
CREATE TABLE `green_user_case`  (
  `old_id` bigint(20) NOT NULL COMMENT '老年人ID',
  `case_id` bigint(20) NOT NULL COMMENT '病例ID',
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联Id',
  PRIMARY KEY (`relation_id`) USING BTREE,
  INDEX `老年人关联病例`(`old_id`) USING BTREE,
  INDEX `病例关联老年人`(`case_id`) USING BTREE,
  CONSTRAINT `老年人关联病例` FOREIGN KEY (`old_id`) REFERENCES `green_user` (`old_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `病例关联老年人` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人和病例关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_user_case
-- ----------------------------

-- ----------------------------
-- Table structure for green_user_equipment
-- ----------------------------
DROP TABLE IF EXISTS `green_user_equipment`;
CREATE TABLE `green_user_equipment`  (
  `old_id` bigint(20) NULL DEFAULT NULL COMMENT '老年人ID',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备ID',
  `user_equipment_relation` bigint(20) NOT NULL COMMENT '设备与老人关联表Id',
  PRIMARY KEY (`user_equipment_relation`) USING BTREE,
  INDEX `老人关联设备`(`old_id`) USING BTREE,
  INDEX `设备关联老人`(`equipment_id`) USING BTREE,
  CONSTRAINT `老人关联设备` FOREIGN KEY (`old_id`) REFERENCES `green_user` (`old_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `设备关联老人` FOREIGN KEY (`equipment_id`) REFERENCES `condition_equipment` (`equipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人和检测设备关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_user_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for his_dept
-- ----------------------------
DROP TABLE IF EXISTS `his_dept`;
CREATE TABLE `his_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名称',
  `dept_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室编码',
  `dept_num` bigint(20) NULL DEFAULT 0 COMMENT '当前挂号量',
  `dept_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '负责人',
  `dept_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_sort` int(5) NULL DEFAULT NULL COMMENT '推荐码',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科室表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of his_dept
-- ----------------------------
INSERT INTO `his_dept` VALUES (1, '内科', 'HIS-NK', 1, '枣庄学院', '18612345678', '1', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-25 22:32:38', '', NULL);
INSERT INTO `his_dept` VALUES (2, '外科', 'HIS-WK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (3, '骨科', 'HIS-GK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (4, '儿科', 'HIS-EK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (6, '泌尿外科', 'HIS-NK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (7, '心内科', 'HIS-XK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (8, '血液科', 'HIS-XYK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (9, '放射科', 'HIS-FSK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (10, '化验科', 'HIS-HSK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-22 19:33:51', '', NULL);
INSERT INTO `his_dept` VALUES (11, '精神科aaa', 'HIS-JSK', 1, '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:33:51', 'admin', '2022-03-23 21:48:54', '', NULL);
INSERT INTO `his_dept` VALUES (12, '测试课', '156', 0, '测试', '', '0', '', '2022-03-23 15:55:28', '', NULL, NULL, NULL);
INSERT INTO `his_dept` VALUES (13, '测试课2', '156', 0, '历史', '', '0', '', '2022-03-23 15:56:15', '', NULL, NULL, NULL);
INSERT INTO `his_dept` VALUES (14, '测试3', '15546', 0, '测试31', '154', '0', '', '2022-03-23 15:59:58', '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for his_user
-- ----------------------------
DROP TABLE IF EXISTS `his_user`;
CREATE TABLE `his_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码（登录身份）',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_level` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '级别',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'His用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of his_user
-- ----------------------------
INSERT INTO `his_user` VALUES (1, 103, '17861918900', '人工', '诊所医生', '0', '00', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 'admin', '0', '0', '127.0.0.1', '2022-03-23 23:29:14', 'admin', '2022-03-23 23:29:14', '', NULL, '测试人员');
INSERT INTO `his_user` VALUES (2, 133, '17861918900', '人工', '主任医生', '0', '00', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 'admin', '0', '0', '127.0.0.1', '2022-03-23 23:30:53', 'admin', '2022-03-23 23:30:53', '', NULL, '测试人员');
INSERT INTO `his_user` VALUES (3, 143, '17861918900', '人工', '副主任医生', '0', '00', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 'admin', '0', '0', '127.0.0.1', '2022-03-23 23:30:53', 'admin', '2022-03-23 23:30:53', '', NULL, '测试人员');
INSERT INTO `his_user` VALUES (4, 103, '17861918900', '人工', '护士', '0', '00', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 'admin', '0', '0', '127.0.0.1', '2022-03-23 23:30:53', 'admin', '2022-03-23 23:30:53', '', NULL, '测试人员');
INSERT INTO `his_user` VALUES (5, 103, '17861918900', '人工', '诊所医生', '0', '00', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 'admin', '0', '0', '127.0.0.1', '2022-03-23 23:30:53', 'admin', '2022-03-23 23:30:53', '', NULL, '测试人员');
INSERT INTO `his_user` VALUES (6, 123, '17861918900', '人工', '诊所医生', '0', '00', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 'admin', '0', '0', '127.0.0.1', '2022-03-23 23:30:53', 'admin', '2022-03-23 23:30:53', '', NULL, '测试人员');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_clinic
-- ----------------------------
DROP TABLE IF EXISTS `sys_clinic`;
CREATE TABLE `sys_clinic`  (
  `clinic_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '诊所ID',
  `clinic_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '诊所名称',
  `clinic_location` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '诊所位置',
  `clinic_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `clinic_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常;1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `coordinate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度坐标',
  PRIMARY KEY (`clinic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门诊信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_clinic
-- ----------------------------
INSERT INTO `sys_clinic` VALUES (1, '老中医1', 'HIS-N', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (2, '老中医2', 'HIS-W', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (3, '老中医3', 'HIS-G', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (4, '老中医4', 'HIS-E', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (5, '老中医5', 'HIS-F', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (6, '新地区5', 'HIS-N', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (7, '新地区6', 'HIS-X', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (8, '新地区7', 'HIS-ss', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');
INSERT INTO `sys_clinic` VALUES (9, '新地区8', 'HIS-Fss', '枣庄学院', '18612345678', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-22 18:45:42', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-22 18:45:42', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-22 18:45:42', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-22 18:45:42', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-03-22 18:45:42', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (10, 0, '0', '开发科', 0, '哭了笑了', '17861918900', '2272244163@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (11, 0, '0', '测试科', 2, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (12, 0, '0', '中心医院', 0, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-24 20:37:35', '', NULL);
INSERT INTO `sys_dept` VALUES (13, 0, '0', '乡村诊所', 0, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-24 20:37:38', '', NULL);
INSERT INTO `sys_dept` VALUES (100, 12, '12', '内科', 0, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-24 20:22:10', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 12, '0,12', '外科', 1, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 101, '0,12,101', '骨科', 2, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 12, '0,12', '儿科', 1, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 100, '0,12,100', '泌尿外科', 2, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 100, '0,12,100', '心内科', 3, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 100, '0,12,100', '血液科', 4, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 12, '12', '放射科', 5, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 12, '12', '化验科', 1, '枣庄学院', '15888888888', '22722@qq.com', '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-22 18:45:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 19:56:57');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 23:29:07');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 14:19:11');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 15:45:32');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 17:00:06');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 18:55:57');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 19:39:57');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 23:36:26');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 17:09:19');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 19:12:32');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:13:56');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 17:22:35');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 18:42:05');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 20:05:43');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 21:23:44');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 22:17:16');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 07:47:32');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 16:01:21');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-26 16:02:54');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-26 16:02:58');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 16:03:01');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:14:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 'HIS系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-24 23:44:32', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-03-22 18:45:42', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-03-22 18:45:42', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '测试地址', 2016, 15, 'https://www.csdn.net/', NULL, '', 0, 0, 'C', '0', '0', '', 'guide', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-25 20:11:23', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-22 18:45:42', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-22 18:45:42', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 3, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-25 20:09:47', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-03-22 18:45:42', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-03-22 18:45:42', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 3, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-25 20:32:35', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 3, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-25 20:32:45', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-03-22 18:45:42', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 2, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-25 20:32:58', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-03-22 18:45:42', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-03-22 18:45:42', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-03-22 18:45:42', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-03-22 18:45:42', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-03-22 18:45:42', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-22 18:45:42', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-22 18:45:42', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-22 18:45:42', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-03-22 18:45:42', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-03-22 18:45:42', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '测试系统管理', 0, 3, 'his', NULL, NULL, 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2022-03-22 23:30:58', 'admin', '2022-03-25 21:27:12', '');
INSERT INTO `sys_menu` VALUES (2001, '科室管理', 2000, 1, 'dept', 'his/dept/index', NULL, 1, 0, 'C', '0', '0', 'his:dept:list', 'excel', 'admin', '2022-03-22 23:34:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, 'His用户信息', 2000, 1, 'user', 'his/user/index', NULL, 1, 0, 'C', '0', '0', 'his:user:list', 'people', 'admin', '2022-03-24 19:11:15', 'admin', '2022-03-24 19:14:12', 'His用户信息菜单');
INSERT INTO `sys_menu` VALUES (2003, 'His用户信息查询', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'his:user:query', '#', 'admin', '2022-03-24 19:11:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, 'His用户信息新增', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'his:user:add', '#', 'admin', '2022-03-24 19:11:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, 'His用户信息修改', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'his:user:edit', '#', 'admin', '2022-03-24 19:11:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, 'His用户信息删除', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'his:user:remove', '#', 'admin', '2022-03-24 19:11:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, 'His用户信息导出', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'his:user:export', '#', 'admin', '2022-03-24 19:11:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '绿色通道', 0, 3, 'green', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dashboard', 'admin', '2022-03-24 21:11:30', 'admin', '2022-03-24 21:15:25', '');
INSERT INTO `sys_menu` VALUES (2009, '乡村患者信息管理', 2008, 2, 'user', 'green/user/index', NULL, 1, 0, 'C', '0', '0', 'green:user:list', 'people', 'admin', '2022-03-24 21:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '病例管理', 2008, 3, 'case', 'green/case/index', NULL, 1, 0, 'C', '0', '0', 'green:case:list', 'nested', 'admin', '2022-03-24 23:39:49', 'admin', '2022-03-24 23:40:23', '');
INSERT INTO `sys_menu` VALUES (2011, '紧急救治管理', 2008, 5, 'first_aid', 'green/first_aid/index', NULL, 1, 0, 'C', '0', '0', 'green:first_aid:list', 'tool', 'admin', '2022-03-24 23:43:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '状态监控系统', 0, 10, 'condition', NULL, NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-03-24 23:45:59', 'admin', '2022-03-24 23:47:35', '');
INSERT INTO `sys_menu` VALUES (2013, '设备检测', 2012, 2, 'equipment', 'condition/equipment/index', NULL, 1, 0, 'C', '0', '0', 'condition:equipment:list', 'phone', 'admin', '2022-03-24 23:49:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '设备警报管理', 2012, 2, 'alarm', 'condition/alarm/index', NULL, 1, 0, 'C', '0', '0', 'condition:alarm:list', 'button', 'admin', '2022-03-24 23:51:29', 'admin', '2022-03-24 23:52:06', '');
INSERT INTO `sys_menu` VALUES (2015, '位置信息管理', 2012, 5, 'map', 'condition/map/index', NULL, 1, 0, 'C', '0', '0', 'condition:map:list', 'search', 'admin', '2022-03-24 23:53:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '测试系统', 0, 5, 'test', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'bug', 'admin', '2022-03-25 20:10:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '前端地图测试', 2016, 2, 'front_map', 'test/front_map/index', NULL, 1, 0, 'C', '0', '0', 'test:front_map:list', 'textarea', 'admin', '2022-03-25 20:20:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '诊所管理', 1, 7, 'clinic', 'system/clinic/index', NULL, 1, 0, 'C', '0', '0', 'system:clinic:list', 'tool', 'admin', '2022-03-25 20:35:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-26 17:24:46', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：系统凌晨维护', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-26 17:24:55', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":3,\"menuName\":\"科室管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-22 23:30:58');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":3,\"menuName\":\"HIS系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"children\":[],\"createTime\":1647963058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-22 23:32:45');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":1,\"menuName\":\"科室管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"dept\",\"component\":\"his/dept/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"his:dept:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-22 23:34:19');
INSERT INTO `sys_oper_log` VALUES (103, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课\",\"params\":{},\"deptSort\":0,\"deptLeader\":\"测试\",\"deptCode\":\"154\",\"status\":\"0\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.his.mapper.HisDeptMapper.insertHisDept', '2022-03-23 15:52:19');
INSERT INTO `sys_oper_log` VALUES (104, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课\",\"params\":{},\"deptSort\":0,\"deptLeader\":\"测试\",\"deptCode\":\"154\",\"status\":\"0\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.his.mapper.HisDeptMapper.insertHisDept', '2022-03-23 15:52:38');
INSERT INTO `sys_oper_log` VALUES (105, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课\",\"deptId\":12,\"params\":{},\"deptSort\":0,\"deptLeader\":\"测试\",\"deptCode\":\"156\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 15:55:28');
INSERT INTO `sys_oper_log` VALUES (106, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课2\",\"deptId\":13,\"params\":{},\"deptSort\":0,\"deptLeader\":\"历史\",\"deptCode\":\"156\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 15:56:15');
INSERT INTO `sys_oper_log` VALUES (107, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试3\",\"deptId\":14,\"params\":{},\"deptSort\":0,\"deptLeader\":\"测试31\",\"deptCode\":\"15546\",\"deptPhone\":\"154\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 15:59:58');
INSERT INTO `sys_oper_log` VALUES (108, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"5\",\"deptId\":15,\"params\":{},\"deptSort\":0,\"deptLeader\":\"22\",\"deptCode\":\"22\",\"deptPhone\":\"22\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 17:00:23');
INSERT INTO `sys_oper_log` VALUES (109, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"22\",\"deptId\":16,\"params\":{},\"deptSort\":0,\"deptLeader\":\"22\",\"deptCode\":\"222\",\"deptPhone\":\"22\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 17:00:34');
INSERT INTO `sys_oper_log` VALUES (110, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"323\",\"deptId\":17,\"params\":{},\"deptSort\":0,\"deptLeader\":\"122\",\"deptCode\":\"21\",\"deptPhone\":\"12\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 17:00:44');
INSERT INTO `sys_oper_log` VALUES (111, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/5', '127.0.0.1', '内网IP', '{postIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 17:04:06');
INSERT INTO `sys_oper_log` VALUES (112, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/,', '127.0.0.1', '内网IP', '{postIds=,}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 17:04:17');
INSERT INTO `sys_oper_log` VALUES (113, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/17', '127.0.0.1', '内网IP', '{postIds=17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 17:04:24');
INSERT INTO `sys_oper_log` VALUES (114, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/,', '127.0.0.1', '内网IP', '{postIds=,}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 18:56:09');
INSERT INTO `sys_oper_log` VALUES (115, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/,', '127.0.0.1', '内网IP', '{postIds=,}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 18:56:25');
INSERT INTO `sys_oper_log` VALUES (116, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/16', '127.0.0.1', '内网IP', '{postIds=16}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 18:57:21');
INSERT INTO `sys_oper_log` VALUES (117, '科室管理', 3, 'com.ruoyi.web.controller.his.HisDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/his/dept/15', '127.0.0.1', '内网IP', '{postIds=15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 19:01:49');
INSERT INTO `sys_oper_log` VALUES (118, '科室管理', 5, 'com.ruoyi.web.controller.his.HisDeptController.export()', 'POST', 1, 'admin', NULL, '/his/dept/export', '127.0.0.1', '内网IP', '{\"params\":{},\"deptSort\":0}', NULL, 0, NULL, '2022-03-23 19:40:05');
INSERT INTO `sys_oper_log` VALUES (119, '科室管理', 5, 'com.ruoyi.web.controller.his.HisDeptController.export()', 'POST', 1, 'admin', NULL, '/his/dept/export', '127.0.0.1', '内网IP', '{\"params\":{},\"deptSort\":0}', NULL, 0, NULL, '2022-03-23 19:40:53');
INSERT INTO `sys_oper_log` VALUES (120, '科室管理', 5, 'com.ruoyi.web.controller.his.HisDeptController.export()', 'POST', 1, 'admin', NULL, '/his/dept/export', '127.0.0.1', '内网IP', '{\"params\":{},\"deptSort\":0}', NULL, 0, NULL, '2022-03-23 19:47:05');
INSERT INTO `sys_oper_log` VALUES (121, '科室管理', 5, 'com.ruoyi.web.controller.his.HisDeptController.export()', 'POST', 1, 'admin', NULL, '/his/dept/export', '127.0.0.1', '内网IP', '{\"params\":{},\"deptSort\":0}', NULL, 0, NULL, '2022-03-23 19:47:27');
INSERT INTO `sys_oper_log` VALUES (122, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试4\",\"deptId\":14,\"deptNum\":0,\"params\":{},\"deptSort\":0,\"createBy\":\"\",\"createTime\":1648022398000,\"deptLeader\":\"测试31\",\"deptCode\":\"15546\",\"deptPhone\":\"154\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,            create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'\n; Duplicate entry \'14\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'', '2022-03-23 20:11:25');
INSERT INTO `sys_oper_log` VALUES (123, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"放射科啊\",\"deptId\":9,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-FSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\n; Duplicate entry \'9\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'', '2022-03-23 20:18:59');
INSERT INTO `sys_oper_log` VALUES (124, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"放射科啊\",\"deptId\":9,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-FSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\n; Duplicate entry \'9\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'', '2022-03-23 20:24:03');
INSERT INTO `sys_oper_log` VALUES (125, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试3啊\",\"deptId\":14,\"deptNum\":0,\"params\":{},\"deptSort\":0,\"createBy\":\"\",\"createTime\":1648022398000,\"deptLeader\":\"测试31\",\"deptCode\":\"15546\",\"deptPhone\":\"154\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,            create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'\n; Duplicate entry \'14\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'', '2022-03-23 20:24:34');
INSERT INTO `sys_oper_log` VALUES (126, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试3啊\",\"deptId\":14,\"deptNum\":0,\"params\":{},\"deptSort\":0,\"createBy\":\"\",\"createTime\":1648022398000,\"deptLeader\":\"测试31\",\"deptCode\":\"15546\",\"deptPhone\":\"154\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,            create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'\n; Duplicate entry \'14\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14\' for key \'PRIMARY\'', '2022-03-23 20:28:33');
INSERT INTO `sys_oper_log` VALUES (127, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课2z\",\"deptId\":13,\"deptNum\":0,\"params\":{},\"deptSort\":0,\"createBy\":\"\",\"createTime\":1648022175000,\"deptLeader\":\"历史as\",\"deptCode\":\"156z\",\"deptPhone\":\"13\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'13\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,            create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'13\' for key \'PRIMARY\'\n; Duplicate entry \'13\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'13\' for key \'PRIMARY\'', '2022-03-23 20:40:37');
INSERT INTO `sys_oper_log` VALUES (128, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课2a\",\"deptId\":13,\"deptNum\":0,\"params\":{},\"deptSort\":0,\"createBy\":\"\",\"createTime\":1648022175000,\"deptLeader\":\"历史1\",\"deptCode\":\"1562\",\"deptPhone\":\"111\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'13\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,            create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'13\' for key \'PRIMARY\'\n; Duplicate entry \'13\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'13\' for key \'PRIMARY\'', '2022-03-23 20:45:07');
INSERT INTO `sys_oper_log` VALUES (129, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"5\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 20:45:50');
INSERT INTO `sys_oper_log` VALUES (130, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"6\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 20:46:04');
INSERT INTO `sys_oper_log` VALUES (131, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"放射科a\",\"deptId\":9,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-FSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\n; Duplicate entry \'9\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'', '2022-03-23 20:50:19');
INSERT INTO `sys_oper_log` VALUES (132, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试课a \",\"deptId\":12,\"deptNum\":0,\"params\":{},\"deptSort\":0,\"createBy\":\"\",\"createTime\":1648022128000,\"deptLeader\":\"测试\",\"deptCode\":\"156\",\"deptPhone\":\"15\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,            create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12\' for key \'PRIMARY\'\n; Duplicate entry \'12\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12\' for key \'PRIMARY\'', '2022-03-23 20:52:45');
INSERT INTO `sys_oper_log` VALUES (133, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a \",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\n; Duplicate entry \'11\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'', '2022-03-23 21:00:06');
INSERT INTO `sys_oper_log` VALUES (134, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"7\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:00:52');
INSERT INTO `sys_oper_log` VALUES (135, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"6\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:01:11');
INSERT INTO `sys_oper_log` VALUES (136, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"5\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:02:18');
INSERT INTO `sys_oper_log` VALUES (137, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"4\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:02:56');
INSERT INTO `sys_oper_log` VALUES (138, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a \",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\n; Duplicate entry \'11\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'', '2022-03-23 21:09:10');
INSERT INTO `sys_oper_log` VALUES (139, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a \",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\n; Duplicate entry \'11\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'', '2022-03-23 21:10:21');
INSERT INTO `sys_oper_log` VALUES (140, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"放射科a \",\"deptId\":9,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-FSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'\n; Duplicate entry \'9\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'9\' for key \'PRIMARY\'', '2022-03-23 21:10:46');
INSERT INTO `sys_oper_log` VALUES (141, '科室管理', 2, 'com.ruoyi.web.controller.his.HisDeptController.edit()', 'PUT', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a \",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"updateBy\":\"admin\",\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'精神科a \',\n			dept_code= \'HIS-JSK\',\n			dept_leader= \'枣庄学院\',\n			dept_\' at line 2\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.updateDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update his_dept    SET dept_name?,    dept_code= ?,    dept_leader= ?,    dept_phone= ?,        status= ?,    remark = ?,    update_by = ?,    update_time = sysdate()    where dept_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'精神科a \',\n			dept_code= \'HIS-JSK\',\n			dept_leader= \'枣庄学院\',\n			dept_\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'精神科a \',\n			dept_code= \'HIS-JSK\',\n			dept_leader= \'枣庄学院\',\n			dept_\' at line 2', '2022-03-23 21:14:26');
INSERT INTO `sys_oper_log` VALUES (142, '科室管理', 2, 'com.ruoyi.web.controller.his.HisDeptController.edit()', 'PUT', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a \",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"updateBy\":\"admin\",\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'精神科a \',\n			dept_code= \'HIS-JSK\',\n			dept_leader= \'枣庄学院\',\n			dept_\' at line 2\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.updateDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update his_dept    SET dept_name?,    dept_code= ?,    dept_leader= ?,    dept_phone= ?,        status= ?,    remark = ?,    update_by = ?,    update_time = sysdate()    where dept_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'精神科a \',\n			dept_code= \'HIS-JSK\',\n			dept_leader= \'枣庄学院\',\n			dept_\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'精神科a \',\n			dept_code= \'HIS-JSK\',\n			dept_leader= \'枣庄学院\',\n			dept_\' at line 2', '2022-03-23 21:16:56');
INSERT INTO `sys_oper_log` VALUES (143, '科室管理', 2, 'com.ruoyi.web.controller.his.HisDeptController.edit()', 'PUT', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a \",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"updateBy\":\"admin\",\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:19:17');
INSERT INTO `sys_oper_log` VALUES (144, '科室管理', 2, 'com.ruoyi.web.controller.his.HisDeptController.edit()', 'PUT', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科aa\",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"updateBy\":\"admin\",\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:43:01');
INSERT INTO `sys_oper_log` VALUES (145, '科室管理', 1, 'com.ruoyi.web.controller.his.HisDeptController.add()', 'POST', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科a\",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-his\\target\\classes\\mapper\\his\\HisDeptMapper.xml]\r\n### The error may involve com.ruoyi.his.mapper.HisDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into his_dept(    dept_id,     dept_code,     dept_name,     dept_leader,     dept_phone,         status,         create_by,    create_time   )values(    ?,     ?,     ?,     ?,     ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'\n; Duplicate entry \'11\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'PRIMARY\'', '2022-03-23 21:46:13');
INSERT INTO `sys_oper_log` VALUES (146, '科室管理', 2, 'com.ruoyi.web.controller.his.HisDeptController.edit()', 'PUT', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"精神科aaa\",\"deptId\":11,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"updateBy\":\"admin\",\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-JSK\",\"deptPhone\":\"18612345678\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-23 21:48:54');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'his_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 17:10:01');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"用户ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648113001000,\"tableId\":1,\"pk\":true,\"columnName\":\"user_id\"},{\"capJavaField\":\"DeptId\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deptId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"部门ID\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648113001000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"dept_id\"},{\"capJavaField\":\"Phonenumber\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"phonenumber\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"手机号码（登录身份）\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648113001000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"phonenumber\"},{\"capJavaField\":\"NickName\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户昵称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(30)\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 17:12:03');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-24 17:12:13');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":1,\"menuName\":\"His用户信息\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"user/user/index\",\"children\":[],\"createTime\":1648120275000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"user:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:14:12');
INSERT INTO `sys_oper_log` VALUES (151, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"新增角色\'管理员\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2022-03-24 20:04:38');
INSERT INTO `sys_oper_log` VALUES (152, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"中心医院\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"新增角色\'中心医院\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2022-03-24 20:05:04');
INSERT INTO `sys_oper_log` VALUES (153, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"centre\",\"roleName\":\"中心医院\",\"deptIds\":[],\"menuIds\":[2000,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,2001],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 20:07:53');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-03-24 20:18:13');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":4,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 20:18:24');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":4,\"menuName\":\"测试地址\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 20:18:44');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":4,\"menuName\":\"测试地址\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://www.csdn.net/\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 20:19:21');
INSERT INTO `sys_oper_log` VALUES (158, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clinic\",\"roleName\":\"门诊医院\",\"deptIds\":[],\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 20:33:34');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":3,\"menuName\":\"绿色通道\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"old\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:11:30');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":2,\"menuName\":\"乡村患者信息管理\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"green/user/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"green:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:14:57');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":3,\"menuName\":\"绿色通道\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"green\",\"children\":[],\"createTime\":1648127490000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:15:25');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":3,\"menuName\":\"病例管理\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"path\":\"case\",\"component\":\"green/case/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"green:case:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:39:49');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":3,\"menuName\":\"病例管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"case\",\"component\":\"green/case/index\",\"children\":[],\"createTime\":1648136389000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2010,\"menuType\":\"C\",\"perms\":\"green:case:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:40:11');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":3,\"menuName\":\"病例管理\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"case\",\"component\":\"green/case/index\",\"children\":[],\"createTime\":1648136389000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2010,\"menuType\":\"C\",\"perms\":\"green:case:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:40:23');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":5,\"menuName\":\"紧急救治管理\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"first_aid\",\"component\":\"green/first_aid/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"green:first_aid:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:43:54');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":3,\"menuName\":\"测试系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"children\":[],\"createTime\":1647963058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:44:17');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":1,\"menuName\":\"HIS系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:44:32');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":10,\"menuName\":\"设别管理系统\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"equipment\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:45:59');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":10,\"menuName\":\"状态监控系统\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"condition\",\"children\":[],\"createTime\":1648136759000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:47:35');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"phone\",\"orderNum\":2,\"menuName\":\"设备检测\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"equipment\",\"component\":\"condition/equipment/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"condition:equipment:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:49:11');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":2,\"menuName\":\"报警管理\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"alarm\",\"component\":\"condition/alarm/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"condition:alarm:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:51:29');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":15,\"menuName\":\"测试地址\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://www.csdn.net/\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:51:38');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":2,\"menuName\":\"设备警报管理\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"alarm\",\"component\":\"condition/alarm/index\",\"children\":[],\"createTime\":1648137089000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"condition:alarm:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:52:06');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"search\",\"orderNum\":5,\"menuName\":\"位置信息管理\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"map\",\"component\":\"condition/map/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"condition:map:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 23:53:28');
INSERT INTO `sys_oper_log` VALUES (175, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"17861918900\",\"remark\":\"五\",\"params\":{},\"linkMan\":\"李三\",\"oldCard\":\"3165456646546565\",\"oldDescribe\":\"1\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'old_name\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_green\\target\\classes\\mapper\\green\\GreenUserMapper.xml]\r\n### The error may involve com.ruoyi.green.mapper.GreenUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into green_user(                              old_describe,           old_card,           linkman,           link_phone,           status,           remark,                    create_time         )values(                              ?,           ?,           ?,           ?,           ?,           ?,                    sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'old_name\' doesn\'t have a default value\n; Field \'old_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'old_name\' doesn\'t have a default value', '2022-03-25 17:26:49');
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"17861918900\",\"remark\":\"五\",\"params\":{},\"linkMan\":\"李三\",\"oldCard\":\"3165456646546565\",\"oldDescribe\":\"1\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'old_name\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_green\\target\\classes\\mapper\\green\\GreenUserMapper.xml]\r\n### The error may involve com.ruoyi.green.mapper.GreenUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into green_user(                              old_describe,           old_card,           linkman,           link_phone,           status,           remark,                    create_time         )values(                              ?,           ?,           ?,           ?,           ?,           ?,                    sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'old_name\' doesn\'t have a default value\n; Field \'old_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'old_name\' doesn\'t have a default value', '2022-03-25 17:29:12');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"17861918900\",\"remark\":\"我\",\"oldId\":2,\"params\":{},\"linkMan\":\"李三\",\"oldCard\":\"371112456\",\"oldName\":\"李四\",\"oldDescribe\":\"没啥\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 17:31:45');
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"17861918900\",\"remark\":\"我啊\",\"oldId\":2,\"params\":{},\"linkMan\":\"李三\",\"createBy\":\"\",\"createTime\":1648200705000,\"oldCard\":\"371112456\",\"oldName\":\"李四\",\"oldDescribe\":\"没啥\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_green\\target\\classes\\mapper\\green\\GreenUserMapper.xml]\r\n### The error may involve com.ruoyi.green.mapper.GreenUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into green_user(          old_id,           old_name,           old_describe,           old_card,           linkman,           link_phone,           status,           remark,                    create_time         )values(          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,                    sysdate()         )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\n; Duplicate entry \'2\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'', '2022-03-25 17:36:56');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.green.GreenUserController.edit()', 'PUT', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"17861918900\",\"remark\":\"我\",\"oldId\":2,\"params\":{},\"linkMan\":\"李三\",\"createBy\":\"\",\"createTime\":1648200705000,\"updateBy\":\"admin\",\"oldCard\":\"371112456\",\"oldName\":\"李四啊\",\"oldDescribe\":\"没啥\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 17:38:10');
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 5, 'com.ruoyi.web.controller.green.GreenUserController.export()', 'POST', 1, 'admin', NULL, '/green/user/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-03-25 17:38:14');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tree-table\",\"orderNum\":3,\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"menu\",\"component\":\"system/menu/index\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:08:38');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tree-table\",\"orderNum\":0,\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"menu\",\"component\":\"system/menu/index\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:09:47');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":5,\"menuName\":\"测试系统\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"test\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:10:58');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":15,\"menuName\":\"测试地址\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"https://www.csdn.net/\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:11:23');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"textarea\",\"orderNum\":2,\"menuName\":\"前端地图测试\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"front_map\",\"component\":\"test/front_map/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"test:front_map:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:20:42');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"excel\",\"orderNum\":3,\"menuName\":\"测试系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"children\":[],\"createTime\":1647963058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:21:01');
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":6,\"menuName\":\"字典管理\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"dict\",\"component\":\"system/dict/index\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dict:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:32:35');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"edit\",\"orderNum\":7,\"menuName\":\"参数设置\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"system/config/index\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":106,\"menuType\":\"C\",\"perms\":\"system:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:32:45');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"log\",\"orderNum\":9,\"menuName\":\"日志管理\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"log\",\"component\":\"\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":108,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:32:58');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":7,\"menuName\":\"诊所管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"clinic\",\"component\":\"system/clinic/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:clinic:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:35:47');
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_clinic', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:53:30');
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"ClinicId\",\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinicId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"诊所ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648212810000,\"tableId\":2,\"pk\":true,\"columnName\":\"clinic_id\"},{\"capJavaField\":\"ClinicName\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clinicName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"诊所名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648212810000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"clinic_name\"},{\"capJavaField\":\"ClinicLocation\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clinicLocation\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"诊所位置\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648212810000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"clinic_location\"},{\"capJavaField\":\"Clinicleader\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinicleader\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"负责人\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:57:36');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"ClinicId\",\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinicId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"诊所ID\",\"updateTime\":1648213056000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648212810000,\"tableId\":2,\"pk\":true,\"columnName\":\"clinic_id\"},{\"capJavaField\":\"ClinicName\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clinicName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"诊所名称\",\"isQuery\":\"1\",\"updateTime\":1648213056000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648212810000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"clinic_name\"},{\"capJavaField\":\"ClinicLocation\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clinicLocation\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"诊所位置\",\"isQuery\":\"1\",\"updateTime\":1648213056000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648212810000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"clinic_location\"},{\"capJavaField\":\"Clinicleader\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinicleader\",\"htmlType\":\"input\",\"edit\":true,\"query\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 20:59:57');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-25 21:00:03');
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":3,\"menuName\":\"测试系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"children\":[],\"createTime\":1647963058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 21:27:12');
INSERT INTO `sys_oper_log` VALUES (196, '科室管理', 2, 'com.ruoyi.web.controller.his.HisDeptController.edit()', 'PUT', 1, 'admin', NULL, '/his/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"内科\",\"deptId\":1,\"deptNum\":1,\"remark\":\"\",\"params\":{},\"deptSort\":0,\"createBy\":\"admin\",\"createTime\":1647948831000,\"updateBy\":\"admin\",\"deptLeader\":\"枣庄学院\",\"deptCode\":\"HIS-NK\",\"deptPhone\":\"18612345678\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:32:38');
INSERT INTO `sys_oper_log` VALUES (197, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"新版本内容\",\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"温馨提醒：新版本发布啦\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 17:24:46');
INSERT INTO `sys_oper_log` VALUES (198, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>维护内容</p>\",\"createBy\":\"admin\",\"createTime\":1647945942000,\"updateBy\":\"admin\",\"noticeType\":\"1\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":2,\"noticeTitle\":\"维护通知：系统凌晨维护\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 17:24:55');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'dean', '院长', 1, '0', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'director', '主任', 2, '0', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'nurse', '护士', 5, '0', 'admin', '2022-03-22 18:45:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'doctor', '医生', 4, '0', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-23 21:02:56', '');
INSERT INTO `sys_post` VALUES (5, 'director_doctor', '乡村医生', 6, '0', 'admin', '2022-03-24 20:54:26', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-03-22 18:45:42', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '中心医院', 'centre', 3, '1', 1, 1, '0', '0', 'admin', '2022-03-24 20:07:53', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '门诊医院', 'clinic', 5, '1', 1, 1, '0', '0', 'admin', '2022-03-24 20:33:34', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 110);
INSERT INTO `sys_role_menu` VALUES (3, 111);
INSERT INTO `sys_role_menu` VALUES (3, 112);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 115);
INSERT INTO `sys_role_menu` VALUES (3, 116);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);
INSERT INTO `sys_role_menu` VALUES (3, 1047);
INSERT INTO `sys_role_menu` VALUES (3, 1048);
INSERT INTO `sys_role_menu` VALUES (3, 1049);
INSERT INTO `sys_role_menu` VALUES (3, 1050);
INSERT INTO `sys_role_menu` VALUES (3, 1051);
INSERT INTO `sys_role_menu` VALUES (3, 1052);
INSERT INTO `sys_role_menu` VALUES (3, 1053);
INSERT INTO `sys_role_menu` VALUES (3, 1054);
INSERT INTO `sys_role_menu` VALUES (3, 1055);
INSERT INTO `sys_role_menu` VALUES (3, 1056);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 1058);
INSERT INTO `sys_role_menu` VALUES (3, 1059);
INSERT INTO `sys_role_menu` VALUES (3, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2001);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (4, 2000);
INSERT INTO `sys_role_menu` VALUES (4, 2001);
INSERT INTO `sys_role_menu` VALUES (4, 2002);
INSERT INTO `sys_role_menu` VALUES (4, 2003);
INSERT INTO `sys_role_menu` VALUES (4, 2004);
INSERT INTO `sys_role_menu` VALUES (4, 2005);
INSERT INTO `sys_role_menu` VALUES (4, 2006);
INSERT INTO `sys_role_menu` VALUES (4, 2007);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 10, 'admin', '馆长', '00', 'xx@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-26 17:14:36', 'admin', '2022-03-22 18:45:42', '', '2022-03-26 17:14:36', '管理员');
INSERT INTO `sys_user` VALUES (2, 10, 'wf', '小弟', '00', 'xx@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-22 18:45:42', 'admin', '2022-03-22 18:45:42', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
