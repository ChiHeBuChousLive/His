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

 Date: 11/04/2022 21:09:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for armarium
-- ----------------------------
DROP TABLE IF EXISTS `armarium`;
CREATE TABLE `armarium`  (
  `armarium_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `armarium_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `armarium_tpye` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备类型（0非消耗品1消耗品）',
  `armarium_models` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `armarium_location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装位置',
  `armarium_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `clinic_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常;1停用,2报修,4故障）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`armarium_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医疗设备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of armarium
-- ----------------------------
INSERT INTO `armarium` VALUES (1, '核酸检测设备', '0', 'x115', '枣庄学院大学生服务中心', '刘川', '17844512345', '0', NULL, '2022-04-11 16:39:30', NULL, '2022-04-11 16:58:51', NULL);

-- ----------------------------
-- Table structure for armarium_maintain
-- ----------------------------
DROP TABLE IF EXISTS `armarium_maintain`;
CREATE TABLE `armarium_maintain`  (
  `maintain_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '维修单号ID',
  `maintain_cause` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '故障原因',
  `maintain_people` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修人员',
  `maintain_result` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修结果',
  `maintain_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修完成时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`maintain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医疗设备维修表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of armarium_maintain
-- ----------------------------
INSERT INTO `armarium_maintain` VALUES (9, '测试', '测试', '测试', '2022-04-11', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for armarium_purchase
-- ----------------------------
DROP TABLE IF EXISTS `armarium_purchase`;
CREATE TABLE `armarium_purchase`  (
  `purchase_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '单据ID',
  `purchase_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `purchase_sum` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购总量',
  `purchase_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `purchase_warehouse` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库操作人',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`purchase_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备采购入库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of armarium_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for armarium_to_maintain
-- ----------------------------
DROP TABLE IF EXISTS `armarium_to_maintain`;
CREATE TABLE `armarium_to_maintain`  (
  `am_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备与维修Id',
  `armarium_id` bigint(20) NULL DEFAULT NULL COMMENT '设备ID',
  `maintain_id` bigint(20) NULL DEFAULT NULL COMMENT '维修单号ID、、表名有问题后期进行修改',
  PRIMARY KEY (`am_id`) USING BTREE,
  INDEX `设备ID`(`armarium_id`) USING BTREE,
  INDEX `维护单号ID`(`maintain_id`) USING BTREE,
  CONSTRAINT `设备ID` FOREIGN KEY (`armarium_id`) REFERENCES `armarium` (`armarium_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `维护单号ID` FOREIGN KEY (`maintain_id`) REFERENCES `armarium_maintain` (`maintain_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备与维修信息关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of armarium_to_maintain
-- ----------------------------
INSERT INTO `armarium_to_maintain` VALUES (3, 1, NULL);
INSERT INTO `armarium_to_maintain` VALUES (4, 1, NULL);
INSERT INTO `armarium_to_maintain` VALUES (5, 1, NULL);
INSERT INTO `armarium_to_maintain` VALUES (6, 1, 9);

-- ----------------------------
-- Table structure for armarium_to_upkeep
-- ----------------------------
DROP TABLE IF EXISTS `armarium_to_upkeep`;
CREATE TABLE `armarium_to_upkeep`  (
  `pu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备与维护Id',
  `armarium_id` bigint(20) NULL DEFAULT NULL COMMENT '设备ID',
  `upkeep_id` bigint(20) NULL DEFAULT NULL COMMENT '维护单号ID',
  PRIMARY KEY (`pu_id`) USING BTREE,
  INDEX `保养单号ID`(`upkeep_id`) USING BTREE,
  CONSTRAINT `保养单号ID` FOREIGN KEY (`upkeep_id`) REFERENCES `armarium_upkeep` (`upkeep_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备与维护信息关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of armarium_to_upkeep
-- ----------------------------

-- ----------------------------
-- Table structure for armarium_upkeep
-- ----------------------------
DROP TABLE IF EXISTS `armarium_upkeep`;
CREATE TABLE `armarium_upkeep`  (
  `upkeep_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '保养单号ID',
  `upkeep_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保养等级（1一级，2二级，3三级）',
  `upkeep_frequency` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保养频次',
  `upkeep_result` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修结果',
  `upkeep_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`upkeep_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医疗设备保养表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of armarium_upkeep
-- ----------------------------
INSERT INTO `armarium_upkeep` VALUES (1, '1', '1周1词', '成功', '2022.4.11', NULL, '2022-04-11 17:25:26', NULL, NULL, NULL);

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
  `equipment_id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `equipment_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地理名称',
  PRIMARY KEY (`equipment_id`) USING BTREE,
  INDEX `equipment_id`(`equipment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of condition_equipment
-- ----------------------------
INSERT INTO `condition_equipment` VALUES (1, '1', '50', '20', '警告！', '28', '117.545000,34.910000', '1小区', NULL, NULL, NULL, NULL, '枣庄学院大门口');
INSERT INTO `condition_equipment` VALUES (2, '15', '456', '45', '测试', '50', NULL, NULL, '2022-04-10 18:10:19', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '位置信息管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of condition_seat
-- ----------------------------
INSERT INTO `condition_seat` VALUES (1, 1, NULL, 'admin', NULL, '', NULL, NULL);
INSERT INTO `condition_seat` VALUES (2, NULL, 1, 'admin', NULL, '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'green_old_case', '老年人病例（参考）', '', '', 'GreenOldCase', 'crud', 'com.ruoyi.system', 'case', 'case', '病例管理', 'kule', '0', '/', '{\"parentMenuId\":\"2008\"}', 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57', NULL);
INSERT INTO `gen_table` VALUES (5, 'green_first_aid', '紧急救治（关联病历与药物）', '', '', 'GreenFirstAid', 'tree', 'com.ruoyi.system', 'aid', 'aid', '紧急救治（关联病历与药物）', 'ruoyi', '0', '/', '{\"treeCode\":\"aid_id\",\"treeName\":\"aid_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":2008}', 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40', NULL);
INSERT INTO `gen_table` VALUES (6, 'condition_equipment', '设备', NULL, NULL, 'ConditionEquipment', 'crud', 'com.ruoyi.system', 'condition', 'equipment', '设备', 'ruoyi', '0', '/', '{\"parentMenuId\":2012}', 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41', NULL);
INSERT INTO `gen_table` VALUES (7, 'condition_alarm', '设备警报管理', NULL, NULL, 'ConditionAlarm', 'crud', 'com.ruoyi.system', 'system', 'alarm', '设备警报管理', 'zhezhi', '0', '/', '{\"parentMenuId\":2021}', 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56', NULL);
INSERT INTO `gen_table` VALUES (8, 'condition_seat', '位置信息管理', NULL, NULL, 'ConditionSeat', 'crud', 'com.ruoyi.system', 'condition', 'seat', '位置信息管理', 'zhezhi', '0', '/', '{\"parentMenuId\":2012}', 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39', NULL);
INSERT INTO `gen_table` VALUES (9, 'green_user_equipment', '老年人和检测设备关联表', NULL, NULL, 'GreenUserEquipment', 'crud', 'com.ruoyi.system', 'system', 'equipment', '老年人和检测设备关联', 'ruoyi', '0', '/', '{\"parentMenuId\":2008}', 'admin', '2022-03-30 20:58:56', '', '2022-03-30 20:59:34', NULL);
INSERT INTO `gen_table` VALUES (10, 'armarium', '医疗设备表', NULL, NULL, 'Armarium', 'crud', 'com.ruoyi.system', 'system', 'armarium', '医疗设备', 'zhezhi', '0', '/', '{}', 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44', NULL);
INSERT INTO `gen_table` VALUES (11, 'armarium_maintain', '医疗设备维修表', NULL, NULL, 'ArmariumMaintain', 'crud', 'com.ruoyi.system', 'system', 'maintain', '医疗设备维修', 'ruoyi', '0', '/', '{}', 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17', NULL);
INSERT INTO `gen_table` VALUES (12, 'armarium_upkeep', '医疗设备保养表', NULL, NULL, 'ArmariumUpkeep', 'crud', 'com.ruoyi.system', 'system', 'upkeep', '医疗设备保养', 'ruoyi', '0', '/', '{}', 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57', NULL);
INSERT INTO `gen_table` VALUES (14, 'armarium_to_maintain', '设备与维修信息关联表', NULL, NULL, 'ArmariumToMaintain', 'crud', 'com.ruoyi.system', 'system', 'maintain', '设备与维修信息关联', 'ruoyi', '0', '/', NULL, 'admin', '2022-04-11 20:12:16', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (31, '3', 'case_id', '病例Id', 'bigint(20)', 'Long', 'caseId', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (32, '3', 'diabetes', '糖尿病;1代表有，0代表无', 'varchar(1)', 'String', 'diabetes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_yes_no', 2, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (33, '3', 'heart_disease', '心脏病;1代表有，0代表无', 'varchar(1)', 'String', 'heartDisease', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_yes_no', 3, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (34, '3', 'high_blood_pressure', '高血压;1代表有，0代表无', 'varchar(1)', 'String', 'highBloodPressure', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_yes_no', 4, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (35, '3', 'genetic_disease', '遗传病;1代表有，0代表无', 'varchar(1)', 'String', 'geneticDisease', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_yes_no', 5, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (36, '3', 'cancer', '癌症;1代表有，0代表无', 'varchar(1)', 'String', 'cancer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_yes_no', 6, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (37, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (38, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (39, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (40, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (41, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2022-03-26 19:00:25', '', '2022-03-26 19:31:57');
INSERT INTO `gen_table_column` VALUES (50, '5', 'aid_id', '主节点id', 'bigint(20)', 'Long', 'aidId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (51, '5', 'parent_id', '父id节点', 'bigint(20)', 'Long', 'parentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (52, '5', 'aid_name', '一级节点为病历名，二级节点为药物名称', 'varchar(255)', 'String', 'aidName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (53, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (54, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (55, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (56, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (57, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-03-27 15:45:18', '', '2022-03-27 15:47:40');
INSERT INTO `gen_table_column` VALUES (58, '6', 'equipment_id', '设备Id', 'bigint(20)', 'Long', 'equipmentId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (59, '6', 'equipment_ip', '设备Ip', 'varchar(255)', 'String', 'equipmentIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (60, '6', 'equipment_heart_rate', '心率', 'varchar(255)', 'String', 'equipmentHeartRate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (61, '6', 'equipment_ox', '血氧饱和度', 'varchar(255)', 'String', 'equipmentOx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (62, '6', 'equipment_alarm', '报警信息', 'varchar(255)', 'String', 'equipmentAlarm', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (63, '6', 'equipment_temperature', '体温', 'varchar(255)', 'String', 'equipmentTemperature', '0', '0', NULL, '1', '1', '1', '1', 'GTE', 'input', '', 6, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (64, '6', 'coordinate', '经纬度坐标', 'varchar(255)', 'String', 'coordinate', '0', '0', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 7, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (65, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (66, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (67, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (68, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (69, '6', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-27 18:00:01', '', '2022-03-27 20:44:41');
INSERT INTO `gen_table_column` VALUES (70, '7', 'alarm_id', '警报Id', 'bigint(20)', 'Long', 'alarmId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (71, '7', 'user_equipment_relation', '设备与老人关联表Id', 'bigint(20)', 'Long', 'userEquipmentRelation', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (72, '7', 'is_notice', '是否通知诊所', 'varchar(1)', 'String', 'isNotice', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (73, '7', 'notice_clinic_location', '通知的诊所位置', 'varchar(255)', 'String', 'noticeClinicLocation', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (74, '7', 'help_equipment_location', '帮助的老人设备位置', 'varchar(255)', 'String', 'helpEquipmentLocation', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (75, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (76, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (77, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (78, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (79, '7', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 21:03:41', '', '2022-04-01 07:47:56');
INSERT INTO `gen_table_column` VALUES (80, '8', 'seat_id', '位置信息Id', 'bigint(20)', 'Long', 'seatId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (81, '8', 'clinic_Id', '诊所外键Id', 'bigint(20)', 'Long', 'clinicId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (82, '8', 'equipment_id', '设备外键Id', 'bigint(20)', 'Long', 'equipmentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (83, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (84, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (85, '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (86, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (87, '8', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-27 22:37:10', '', '2022-03-27 22:38:39');
INSERT INTO `gen_table_column` VALUES (88, '9', 'old_id', '老年人ID', 'bigint(20)', 'Long', 'oldId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2022-03-30 20:58:56', '', '2022-03-30 20:59:34');
INSERT INTO `gen_table_column` VALUES (89, '9', 'equipment_id', '设备ID', 'bigint(20)', 'Long', 'equipmentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-30 20:58:56', '', '2022-03-30 20:59:34');
INSERT INTO `gen_table_column` VALUES (90, '9', 'user_equipment_relation', '设备与老人关联表Id', 'bigint(20)', 'Long', 'userEquipmentRelation', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-30 20:58:56', '', '2022-03-30 20:59:34');
INSERT INTO `gen_table_column` VALUES (91, '10', 'armarium_id', '设备ID', 'bigint(20)', 'Long', 'armariumId', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (92, '10', 'armarium_name', '设备名称', 'varchar(50)', 'String', 'armariumName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (93, '10', 'armarium_tpye', '设备类型（0硬件1软件）', 'varchar(1)', 'String', 'armariumTpye', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'armarium_type', 3, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (94, '10', 'armarium_models', '规格型号', 'varchar(64)', 'String', 'armariumModels', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (95, '10', 'armarium_location', '安装位置', 'varchar(64)', 'String', 'armariumLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (96, '10', 'armarium_leader', '负责人', 'varchar(64)', 'String', 'armariumLeader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (97, '10', 'clinic_phone', '手机号码', 'varchar(11)', 'String', 'clinicPhone', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (98, '10', 'status', '状态（0正常;1停用,2报修,4故障）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 8, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (99, '10', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (100, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (101, '10', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (102, '10', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (103, '10', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2022-04-10 23:32:29', '', '2022-04-11 16:56:44');
INSERT INTO `gen_table_column` VALUES (104, '11', 'maintain_id', '维修单号ID', 'bigint(20)', 'Long', 'maintainId', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (105, '11', 'maintain_cause', '故障原因', 'varchar(50)', 'String', 'maintainCause', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'editor', '', 2, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (106, '11', 'maintain_people', '维修人员', 'varchar(500)', 'String', 'maintainPeople', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (107, '11', 'maintain_result', '维修结果', 'varchar(64)', 'String', 'maintainResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (108, '11', 'maintain_time', '维修完成时间', 'varchar(64)', 'String', 'maintainTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (109, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (110, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (111, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (112, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (113, '11', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-04-11 17:01:34', '', '2022-04-11 17:03:17');
INSERT INTO `gen_table_column` VALUES (114, '12', 'upkeep_id', '保养单号ID', 'bigint(20)', 'Long', 'upkeepId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (115, '12', 'upkeep_level', '保养等级', 'varchar(50)', 'String', 'upkeepLevel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'level_three', 2, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (116, '12', 'upkeep_frequency', '保养频次', 'varchar(500)', 'String', 'upkeepFrequency', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (117, '12', 'upkeep_result', '维修结果', 'varchar(64)', 'String', 'upkeepResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (118, '12', 'upkeep_time', '保养时间', 'varchar(64)', 'String', 'upkeepTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (119, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (120, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (121, '12', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (122, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (123, '12', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-04-11 17:13:16', '', '2022-04-11 17:20:57');
INSERT INTO `gen_table_column` VALUES (127, '14', 'am_id', '设备与维修Id', 'bigint(20)', 'Long', 'amId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-11 20:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, '14', 'armarium_id', '设备ID', 'bigint(20)', 'Long', 'armariumId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-11 20:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '14', 'maintain_id', '维修单号ID、、表名有问题后期进行修改', 'bigint(20)', 'Long', 'maintainId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-04-11 20:12:16', '', NULL);

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
-- Table structure for green_first_aid
-- ----------------------------
DROP TABLE IF EXISTS `green_first_aid`;
CREATE TABLE `green_first_aid`  (
  `aid_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主节点id',
  `parent_id` bigint(20) NOT NULL COMMENT '父id节点',
  `aid_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级节点为病历名，二级节点为药物名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`aid_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '紧急救治（关联病历与药物）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_first_aid
-- ----------------------------
INSERT INTO `green_first_aid` VALUES (1, 0, '糖尿病', 'admin', '2022-03-27 15:17:06', '', NULL, NULL);
INSERT INTO `green_first_aid` VALUES (2, 0, '心脏病', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (3, 0, '高血压', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (4, 0, '遗传病', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (5, 0, '癌症', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (6, 1, '氢化可的松', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (7, 1, '地塞米松', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (8, 1, '肾上腺素受体激动剂', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (9, 1, '抗结核药物', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (10, 2, '地高辛', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (11, 2, '多巴酚丁胺', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (12, 3, '复方罗布麻片与半夏露', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (13, 3, '甘草制剂', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (14, 3, '多巴胺', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (15, 3, '去甲肾上腺素', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (16, 3, '肾上腺素', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `green_first_aid` VALUES (17, 4, '测试', '', '2022-03-27 16:02:25', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人病例（参考）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_old_case
-- ----------------------------
INSERT INTO `green_old_case` VALUES (1, '0', '0', '0', '0', '0', '', NULL, '', NULL, NULL);
INSERT INTO `green_old_case` VALUES (2, '0', '0', '0', '0', '0', '', '2022-03-30 19:57:32', '', NULL, NULL);
INSERT INTO `green_old_case` VALUES (3, '1', '1', '1', '0', '0', '', '2022-04-10 18:03:35', '', NULL, NULL);
INSERT INTO `green_old_case` VALUES (4, '1', '1', '0', '0', '0', '', '2022-04-10 18:04:08', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人绿色通道' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_user
-- ----------------------------
INSERT INTO `green_user` VALUES (1, '张三', '无', '371121200009090431', '张四', '18612345678', '0', 'admin', '2022-03-24 21:27:29', 'admin', '2022-03-24 21:27:33', NULL);
INSERT INTO `green_user` VALUES (2, '李四啊', '没啥', '371112456', '李三', '17861918900', '0', '', '2022-03-25 17:31:45', 'admin', '2022-03-25 17:38:10', '我');
INSERT INTO `green_user` VALUES (3, '王五', '无', '31754645613', '1556', '12346545', '0', '', '2022-04-10 18:02:56', '', NULL, NULL);
INSERT INTO `green_user` VALUES (4, '李三', '啊', '785223545612', '啊', '啊', '0', '', '2022-04-10 18:03:09', '', NULL, NULL);
INSERT INTO `green_user` VALUES (5, '测试1', '测试1', '789545', '测试1', '测试1', '0', '', '2022-04-10 18:03:19', '', NULL, NULL);

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
  CONSTRAINT `病例关联老年人` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `老年人关联病例` FOREIGN KEY (`old_id`) REFERENCES `green_user` (`old_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人和病例关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_user_case
-- ----------------------------
INSERT INTO `green_user_case` VALUES (1, 1, 3);
INSERT INTO `green_user_case` VALUES (2, 2, 4);
INSERT INTO `green_user_case` VALUES (3, 3, 5);
INSERT INTO `green_user_case` VALUES (4, 4, 6);

-- ----------------------------
-- Table structure for green_user_equipment
-- ----------------------------
DROP TABLE IF EXISTS `green_user_equipment`;
CREATE TABLE `green_user_equipment`  (
  `old_id` bigint(20) NULL DEFAULT NULL COMMENT '老年人ID',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备ID',
  `user_equipment_relation` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备与老人关联表Id',
  PRIMARY KEY (`user_equipment_relation`) USING BTREE,
  INDEX `老人关联设备`(`old_id`) USING BTREE,
  INDEX `设备关联老人`(`equipment_id`) USING BTREE,
  CONSTRAINT `老人关联设备` FOREIGN KEY (`old_id`) REFERENCES `green_user` (`old_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `设备关联老人` FOREIGN KEY (`equipment_id`) REFERENCES `condition_equipment` (`equipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老年人和检测设备关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of green_user_equipment
-- ----------------------------
INSERT INTO `green_user_equipment` VALUES (1, 1, 1);
INSERT INTO `green_user_equipment` VALUES (3, 2, 2);

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
-- Table structure for net_drug
-- ----------------------------
DROP TABLE IF EXISTS `net_drug`;
CREATE TABLE `net_drug`  (
  `drug_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `drug_name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `drug_number` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `drug_production` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `pdrug_type` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品类型',
  `pdrug_prescription` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方类型',
  `drug_units` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `drug_price` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
  `drug_stock` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存量',
  `early_warning` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预警值',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`drug_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进销药品信息维护表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of net_drug
-- ----------------------------

-- ----------------------------
-- Table structure for net_production
-- ----------------------------
DROP TABLE IF EXISTS `net_production`;
CREATE TABLE `net_production`  (
  `production_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '厂家ID',
  `production_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '厂家名称',
  `production_number` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '厂家编码',
  `production_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `production_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `production_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`production_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进销生产厂家表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of net_production
-- ----------------------------

-- ----------------------------
-- Table structure for net_production_drug
-- ----------------------------
DROP TABLE IF EXISTS `net_production_drug`;
CREATE TABLE `net_production_drug`  (
  `pd_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '生产厂家与药物信息Id',
  `drug_id` bigint(20) NULL DEFAULT NULL COMMENT '药物ID',
  `production_id` bigint(20) NULL DEFAULT NULL COMMENT '生产厂家ID',
  PRIMARY KEY (`pd_id`) USING BTREE,
  INDEX `药物ID`(`drug_id`) USING BTREE,
  INDEX `厂家ID`(`production_id`) USING BTREE,
  CONSTRAINT `药物ID` FOREIGN KEY (`drug_id`) REFERENCES `net_drug` (`drug_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `厂家ID` FOREIGN KEY (`production_id`) REFERENCES `net_production` (`production_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产厂家与药物信息关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of net_production_drug
-- ----------------------------

-- ----------------------------
-- Table structure for net_purchase
-- ----------------------------
DROP TABLE IF EXISTS `net_purchase`;
CREATE TABLE `net_purchase`  (
  `purchase_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '单据ID',
  `purchase_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `purchase_sum` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购总量',
  `purchase_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `purchase_warehouse` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库操作人',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`purchase_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进销采购入库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of net_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for net_supplier
-- ----------------------------
DROP TABLE IF EXISTS `net_supplier`;
CREATE TABLE `net_supplier`  (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `supplier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `supplier_number` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡号',
  `supplier_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `supplier_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `supplier_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进销供应商表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of net_supplier
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门诊信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_clinic
-- ----------------------------
INSERT INTO `sys_clinic` VALUES (1, '老中医1', 'HIS-N', '枣庄学院', '17861918900', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '117.445000,34.810000');
INSERT INTO `sys_clinic` VALUES (2, '老中医2', 'HIS-W', '枣庄学院', '17861918900', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '117.445000,34.910000');
INSERT INTO `sys_clinic` VALUES (3, '老中医3', 'HIS-G', '枣庄学院', '17861918900', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '117.645000,34.910000');
INSERT INTO `sys_clinic` VALUES (4, '老中医4', 'HIS-E', '枣庄学院', '17861918900', '0', 'admin', '2022-03-22 19:51:33', 'admin', '2022-03-22 19:51:33', '', '117.500000,34.910000');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_dict_data` VALUES (31, 1, '无', '0', 'have_medical_condition', NULL, 'success', 'N', '0', 'admin', '2022-03-30 19:29:22', '', NULL, '是否患有疾病');
INSERT INTO `sys_dict_data` VALUES (32, 2, '有', '1', 'have_medical_condition', NULL, 'danger', 'N', '0', 'admin', '2022-03-30 19:29:43', '', NULL, '是否患有疾病');
INSERT INTO `sys_dict_data` VALUES (33, 1, '非消耗品', '0', 'armarium_type', NULL, 'warning', 'N', '0', 'admin', '2022-04-11 16:51:06', 'admin', '2022-04-11 16:52:39', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 2, '消耗品', '1', 'armarium_type', NULL, 'success', 'N', '0', 'admin', '2022-04-11 16:52:10', 'admin', '2022-04-11 16:52:34', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 1, '一级', '1', 'level_three', NULL, 'primary', 'N', '0', 'admin', '2022-04-11 17:18:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 2, '二级', '2', 'level_three', NULL, 'info', 'N', '0', 'admin', '2022-04-11 17:19:40', 'admin', '2022-04-11 17:20:07', NULL);
INSERT INTO `sys_dict_data` VALUES (37, 3, '三级', '3', 'level_three', NULL, 'warning', 'N', '0', 'admin', '2022-04-11 17:20:00', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_dict_type` VALUES (11, '是否患有疾病', 'have_medical_condition', '0', 'admin', '2022-03-30 17:48:05', '', NULL, '是否患有疾病');
INSERT INTO `sys_dict_type` VALUES (12, '医疗设备类型', 'armarium_type', '0', 'admin', '2022-04-11 16:50:00', '', NULL, '0硬件1软件');
INSERT INTO `sys_dict_type` VALUES (13, '等级（三级菜单）', 'level_three', '0', 'admin', '2022-04-11 17:15:34', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

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
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 19:00:05');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-26 19:26:17');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-26 19:26:26');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 19:26:29');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-26 19:27:42');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-26 19:27:47');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 19:27:53');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 21:49:35');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 14:51:39');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 17:58:38');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 20:42:10');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 22:31:02');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 15:40:45');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 16:11:47');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 16:53:19');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 20:42:01');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-28 21:31:35');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 21:31:38');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 22:29:49');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 11:18:51');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 16:38:22');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:24:18');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 19:33:08');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 20:34:45');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 19:27:43');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-30 20:17:37');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 20:17:42');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 20:37:24');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 09:51:30');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 19:02:45');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-31 19:11:53');
INSERT INTO `sys_logininfor` VALUES (153, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 19:12:03');
INSERT INTO `sys_logininfor` VALUES (154, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-31 19:12:31');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 19:12:35');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-31 19:14:01');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-31 19:14:07');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-31 19:14:13');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 19:14:16');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 21:00:30');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 07:40:56');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 09:27:25');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 15:29:13');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 15:35:01');
INSERT INTO `sys_logininfor` VALUES (165, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 15:35:20');
INSERT INTO `sys_logininfor` VALUES (166, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 15:35:37');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 15:36:11');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 20:59:19');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 20:43:46');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 21:32:11');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-03 19:40:22');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 21:54:31');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 22:44:25');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-04-07 20:05:56');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-07 20:05:59');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-07 21:33:54');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 14:35:03');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 15:09:07');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 17:30:27');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-10 17:55:26');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 19:17:25');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 21:03:58');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 21:57:17');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 22:56:16');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 16:02:17');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 19:26:21');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 20:04:50');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 20:22:58');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 20:23:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2038 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 'HIS系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-03-22 18:45:42', 'admin', '2022-03-24 23:44:32', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 14, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-03-22 18:45:42', 'admin', '2022-04-01 08:39:47', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 15, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-03-22 18:45:42', 'admin', '2022-04-01 08:39:36', '系统工具目录');
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
INSERT INTO `sys_menu` VALUES (2000, '测试系统管理', 0, 13, 'his', NULL, NULL, 1, 0, 'M', '1', '0', '', 'excel', 'admin', '2022-03-22 23:30:58', 'admin', '2022-04-11 16:11:48', '');
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
INSERT INTO `sys_menu` VALUES (2014, '设备警报管理（已弃用）', 2012, 2, 'alarm', 'condition/alarm/index', NULL, 1, 0, 'C', '0', '0', '', 'button', 'admin', '2022-03-24 23:51:29', 'admin', '2022-04-01 07:42:42', '');
INSERT INTO `sys_menu` VALUES (2015, '位置信息管理', 2012, 5, 'seat', 'condition/seat/index', NULL, 1, 0, 'C', '0', '0', 'condition:seat:list', 'search', 'admin', '2022-03-24 23:53:28', 'admin', '2022-03-27 22:57:04', '');
INSERT INTO `sys_menu` VALUES (2016, '测试系统', 0, 5, 'test', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'bug', 'admin', '2022-03-25 20:10:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '前端地图测试', 2016, 2, 'front_map', 'test/front_map/index', NULL, 1, 0, 'C', '0', '0', 'test:front_map:list', 'textarea', 'admin', '2022-03-25 20:20:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '诊所管理', 1, 7, 'clinic', 'system/clinic/index', NULL, 1, 0, 'C', '0', '0', 'system:clinic:list', 'tool', 'admin', '2022-03-25 20:35:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '测试前端页面效果', 2000, 1, 'test_view', 'his/test_view/index', NULL, 1, 0, 'C', '0', '0', 'his:test_view:list', 'bug', 'admin', '2022-03-29 11:21:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '设备模拟', 2016, 1, 'analog', 'test/analog/index', NULL, 1, 0, 'C', '1', '0', 'test:analog:list', 'bug', 'admin', '2022-03-30 20:36:31', 'admin', '2022-04-01 09:32:33', '');
INSERT INTO `sys_menu` VALUES (2021, '设备报警系统', 0, 11, 'caution', NULL, NULL, 1, 0, 'M', '0', '0', '', 'lock', 'admin', '2022-04-01 07:45:22', 'admin', '2022-04-01 07:45:31', '');
INSERT INTO `sys_menu` VALUES (2022, '警报管理', 2021, 0, 'caution', 'caution/alarm/index', NULL, 1, 0, 'C', '0', '0', 'caution:alarm:list', 'button', 'admin', '2022-04-01 07:47:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '物理设备模拟器', 0, 11, 'simulator', NULL, NULL, 1, 0, 'M', '0', '0', '', 'example', 'admin', '2022-04-01 08:42:05', 'admin', '2022-04-01 08:43:37', '');
INSERT INTO `sys_menu` VALUES (2024, '设备模拟器（自带检测功能）', 2023, 1, 'detection', 'simulator/detection/index', NULL, 1, 0, 'C', '0', '0', 'simulator:detection:list', 'cascader', 'admin', '2022-04-01 08:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '设别模拟器（仅带有数据）', 2023, 2, 'notdetection', 'simulator/notdetection/index', NULL, 1, 0, 'C', '0', '0', 'simulator:notdetection:list', 'druid', 'admin', '2022-04-01 08:48:35', 'admin', '2022-04-02 20:54:44', '');
INSERT INTO `sys_menu` VALUES (2026, '物理设备信息显示折线图', 2023, 1, 'heart_rate_chart', 'simulator/notdetection/heart_rate_chart', NULL, 1, 1, 'C', '1', '0', NULL, '404', 'admin', '2022-04-03 20:30:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '医疗设备管理', 0, 5, 'hospital', '', NULL, 1, 0, 'M', '0', '0', '', 'drag', 'admin', '2022-04-10 23:03:22', 'admin', '2022-04-11 16:16:03', '');
INSERT INTO `sys_menu` VALUES (2030, '医疗设备详情', 2029, 1, 'armarium', 'hospital/armarium/index', NULL, 1, 0, 'C', '0', '0', 'hospital:armarium:list', 'clipboard', 'admin', '2022-04-10 23:05:01', 'admin', '2022-04-11 16:16:41', '');
INSERT INTO `sys_menu` VALUES (2031, '维修管理', 2029, 3, 'maintain', 'hospital/maintain/index', NULL, 1, 0, 'C', '0', '0', 'hospital:maintain:list', 'documentation', 'admin', '2022-04-10 23:09:09', 'admin', '2022-04-11 16:16:49', '');
INSERT INTO `sys_menu` VALUES (2032, '修护管理', 2029, 3, 'upkeep', 'hospital/upkeep/index', NULL, 1, 0, 'C', '0', '0', 'hospital:upkeep:list', 'form', 'admin', '2022-04-10 23:11:40', 'admin', '2022-04-11 16:16:57', '');
INSERT INTO `sys_menu` VALUES (2033, '药物进销存', 0, 5, 'net', NULL, NULL, 1, 0, 'M', '0', '0', '', 'fullscreen', 'admin', '2022-04-10 23:13:37', 'admin', '2022-04-11 16:04:31', '');
INSERT INTO `sys_menu` VALUES (2034, '生产厂家维护', 2033, 1, 'production', 'net/production/index', NULL, 1, 0, 'C', '0', '0', 'net:production:list', 'row', 'admin', '2022-04-11 16:06:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '供应商维护', 2033, 2, 'supplier', 'net/supplier/index', NULL, 1, 0, 'C', '0', '0', 'net:supplier:list', 'row', 'admin', '2022-04-11 16:08:24', 'admin', '2022-04-11 16:10:22', '');
INSERT INTO `sys_menu` VALUES (2036, '药物信息维护', 2033, 3, 'drug', 'net/drug/index', NULL, 1, 0, 'C', '0', '0', 'net:drug:list', 'icon', 'admin', '2022-04-11 16:09:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '采购入库管理', 2033, 4, 'purchase', 'net/purchase/index', NULL, 1, 0, 'C', '0', '0', 'net:purchase:list', 'download', 'admin', '2022-04-11 16:11:22', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 357 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

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
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'green_old_case', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 19:00:25');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":true,\"subTableName\":\"sys_clinic\",\"functionAuthor\":\"kule\",\"columns\":[{\"capJavaField\":\"CaseId\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"caseId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"caseid\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648292425000,\"tableId\":3,\"pk\":true,\"columnName\":\"case_id\"},{\"capJavaField\":\"Diabetes\",\"usableColumn\":false,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diabetes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"糖尿病;1代表有，0代表无\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"diabetes\"},{\"capJavaField\":\"HeartDisease\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"heartDisease\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"心脏病;1代表有，0代表无\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"heart_disease\"},{\"capJavaField\":\"HighBloodPressure\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"highBloodPressure\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"高血压;1代表有，0代表无\",\"isQuery\":\"1\",\"so', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 19:08:43');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":true,\"subTableName\":\"sys_clinic\",\"functionAuthor\":\"kule\",\"columns\":[{\"capJavaField\":\"CaseId\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"caseId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"病例Id\",\"updateTime\":1648292923000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648292425000,\"tableId\":3,\"pk\":true,\"columnName\":\"case_id\"},{\"capJavaField\":\"Diabetes\",\"usableColumn\":false,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diabetes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"糖尿病;1代表有，0代表无\",\"isQuery\":\"1\",\"updateTime\":1648292923000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"diabetes\"},{\"capJavaField\":\"HeartDisease\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"heartDisease\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"心脏病;1代表有，0代表无\",\"isQuery\":\"1\",\"updateTime\":1648292923000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"heart_disease\"},{\"capJavaField\":\"HighBloodPressure\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"highBloodPressure\",\"htmlType\":\"inpu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 19:25:51');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-26 19:28:56');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":true,\"subTableName\":\"sys_clinic\",\"functionAuthor\":\"kule\",\"columns\":[{\"capJavaField\":\"CaseId\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"caseId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"病例Id\",\"updateTime\":1648293951000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648292425000,\"tableId\":3,\"pk\":true,\"columnName\":\"case_id\"},{\"capJavaField\":\"Diabetes\",\"usableColumn\":false,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diabetes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"糖尿病;1代表有，0代表无\",\"isQuery\":\"1\",\"updateTime\":1648293951000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"diabetes\"},{\"capJavaField\":\"HeartDisease\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"heartDisease\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"心脏病;1代表有，0代表无\",\"isQuery\":\"1\",\"updateTime\":1648293951000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"heart_disease\"},{\"capJavaField\":\"HighBloodPressure\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"highBloodPressure\",\"htmlType\":\"inpu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 19:31:09');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"kule\",\"columns\":[{\"capJavaField\":\"CaseId\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"caseId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"病例Id\",\"updateTime\":1648294269000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648292425000,\"tableId\":3,\"pk\":true,\"columnName\":\"case_id\"},{\"capJavaField\":\"Diabetes\",\"usableColumn\":false,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diabetes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"糖尿病;1代表有，0代表无\",\"isQuery\":\"1\",\"updateTime\":1648294269000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"diabetes\"},{\"capJavaField\":\"HeartDisease\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"heartDisease\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"心脏病;1代表有，0代表无\",\"isQuery\":\"1\",\"updateTime\":1648294269000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648292425000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"heart_disease\"},{\"capJavaField\":\"HighBloodPressure\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"highBloodPressure\",\"htmlType\":\"input\",\"edit\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 19:31:57');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-26 19:32:00');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'green_first_aid', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:05:56');
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '127.0.0.1', '内网IP', '{menuId=2020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:07:41');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2021', '127.0.0.1', '内网IP', '{menuId=2021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:07:43');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:07:46');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:07:48');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:07:50');
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"AidId\",\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aidId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"节点ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648364756000,\"tableId\":4,\"pk\":true,\"columnName\":\"aid_id\"},{\"capJavaField\":\"ParantId\",\"usableColumn\":false,\"columnId\":43,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"parantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父id节点\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648364756000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"parant_id\"},{\"capJavaField\":\"Aidname\",\"usableColumn\":false,\"columnId\":44,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aidname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648364756000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"aidName\"},{\"capJavaField\":\"CreateBy\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createBy\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"创建者\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:10:00');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 15:10:02');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 15:10:24');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:45:14');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'green_first_aid', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:45:18');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"AidId\",\"usableColumn\":false,\"columnId\":50,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aidId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主节点id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648367118000,\"tableId\":5,\"pk\":true,\"columnName\":\"aid_id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":51,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父id节点\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648367118000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"AidName\",\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aidName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"一级节点为病历名，二级节点为药物名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648367118000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"aid_name\"},{\"capJavaField\":\"CreateBy\",\"usableColumn\":false,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createBy\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"创建者\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"c', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:46:35');
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"AidId\",\"usableColumn\":false,\"columnId\":50,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aidId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主节点id\",\"updateTime\":1648367195000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648367118000,\"tableId\":5,\"pk\":true,\"columnName\":\"aid_id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":51,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父id节点\",\"isQuery\":\"1\",\"updateTime\":1648367195000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648367118000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"AidName\",\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aidName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"一级节点为病历名，二级节点为药物名称\",\"isQuery\":\"1\",\"updateTime\":1648367195000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648367118000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"aid_name\"},{\"capJavaField\":\"CreateBy\",\"usableColumn\":false,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createBy\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"创建者\",\"updateTime\":164836', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 15:47:40');
INSERT INTO `sys_oper_log` VALUES (219, '紧急救治（关联病历与药物）', 1, 'com.ruoyi.web.controller.green.GreenFirstAidController.add()', 'POST', 1, 'admin', NULL, '/green/first_aid', '127.0.0.1', '内网IP', '{\"aidName\":\"测试\",\"remark\":\"仅为一个测试\",\"params\":{},\"parentId\":4,\"children\":[],\"createTime\":1648367766562}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'aid_name\' in \'class com.ruoyi.green.domain.GreenFirstAid\'', '2022-03-27 15:56:06');
INSERT INTO `sys_oper_log` VALUES (220, '紧急救治（关联病历与药物）', 1, 'com.ruoyi.web.controller.green.GreenFirstAidController.add()', 'POST', 1, 'admin', NULL, '/green/first_aid', '127.0.0.1', '内网IP', '{\"aidName\":\"测试\",\"params\":{},\"parentId\":4,\"children\":[],\"createTime\":1648368145136,\"aidId\":17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 16:02:25');
INSERT INTO `sys_oper_log` VALUES (221, '病例管理', 1, 'com.ruoyi.web.controller.green.GreenOldCaseController.add()', 'POST', 1, 'admin', NULL, '/green/case', '127.0.0.1', '内网IP', '{\"geneticDisease\":\"0\",\"heartDisease\":\"0\",\"highBloodPressure\":\"0\",\"oldId\":1,\"params\":{},\"cancer\":\"0\",\"diabetes\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'case_id\' cannot be null\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_green\\target\\classes\\mapper\\green\\GreenOldUserCaseMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into green_user_case(old_id, case_id) values                        (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'case_id\' cannot be null\n; Column \'case_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'case_id\' cannot be null', '2022-03-27 16:50:11');
INSERT INTO `sys_oper_log` VALUES (222, '病例管理', 1, 'com.ruoyi.web.controller.green.GreenOldCaseController.add()', 'POST', 1, 'admin', NULL, '/green/case', '127.0.0.1', '内网IP', '{\"geneticDisease\":\"0\",\"heartDisease\":\"0\",\"highBloodPressure\":\"0\",\"oldId\":1,\"params\":{},\"caseId\":1,\"cancer\":\"0\",\"diabetes\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`his`.`green_user_case`, CONSTRAINT `病例关联老年人` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION)\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_green\\target\\classes\\mapper\\green\\GreenOldUserCaseMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into green_user_case(old_id, case_id) values                        (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`his`.`green_user_case`, CONSTRAINT `病例关联老年人` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION)\n; Cannot add or update a child row: a foreign key constraint fails (`his`.`green_user_case`, CONSTRAINT `病例关联老年人` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`his`.`green_user_case`, CONSTRAINT `病例关联老年人` FOREIGN KEY (`case_id`) REFERENCES `green_old_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION)', '2022-03-27 16:54:19');
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'condition_equipment', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:00:01');
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:00:07');
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:00:08');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"EquipmentId\",\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备Id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375201000,\"tableId\":6,\"pk\":true,\"columnName\":\"equipment_id\"},{\"capJavaField\":\"EquipmentIp\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentIp\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备Ip\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375201000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"equipment_ip\"},{\"capJavaField\":\"EquipmentHeartRate\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentHeartRate\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"心率\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375201000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"equipment_heart_rate\"},{\"capJavaField\":\"EquipmentOx\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentOx\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"血氧饱和度\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:00:51');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 20:42:41');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"EquipmentId\",\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备Id\",\"updateTime\":1648375251000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375201000,\"tableId\":6,\"pk\":true,\"columnName\":\"equipment_id\"},{\"capJavaField\":\"EquipmentIp\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentIp\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备Ip\",\"isQuery\":\"1\",\"updateTime\":1648375251000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375201000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"equipment_ip\"},{\"capJavaField\":\"EquipmentHeartRate\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentHeartRate\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"心率\",\"isQuery\":\"1\",\"updateTime\":1648375251000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375201000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"equipment_heart_rate\"},{\"capJavaField\":\"EquipmentOx\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentOx\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnCo', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:44:41');
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 20:44:45');
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'condition_alarm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:03:41');
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"AlarmId\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"alarmId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"警报Id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648386221000,\"tableId\":7,\"pk\":true,\"columnName\":\"alarm_id\"},{\"capJavaField\":\"UserEquipmentRelation\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"userEquipmentRelation\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备与老人关联表Id\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648386221000,\"tableId\":7,\"pk\":false,\"columnName\":\"user_equipment_relation\"},{\"capJavaField\":\"IsNotice\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"isNotice\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"是否通知诊所\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648386221000,\"tableId\":7,\"pk\":false,\"columnName\":\"is_notice\"},{\"capJavaField\":\"NoticeClinicLocation\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"noticeClinicLocation\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"通知的诊所位置\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:10:03');
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 21:10:06');
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'condition_seat', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:37:10');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"SeatId\",\"usableColumn\":false,\"columnId\":80,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"seatId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"位置信息Id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648391830000,\"tableId\":8,\"pk\":true,\"columnName\":\"seat_id\"},{\"capJavaField\":\"ClinicId\",\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinicId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"诊所外键Id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648391830000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"clinic_Id\"},{\"capJavaField\":\"EquipmentId\",\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备外键Id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648391830000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"equipment_id\"},{\"capJavaField\":\"CreateBy\",\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createBy\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"创建者\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"cre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:38:39');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 22:38:45');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"search\",\"orderNum\":5,\"menuName\":\"位置信息管理\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"seat\",\"component\":\"condition/seat/index\",\"children\":[],\"createTime\":1648137208000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"C\",\"perms\":\"condition:seat:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:57:05');
INSERT INTO `sys_oper_log` VALUES (237, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1648123673000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"centre\",\"roleName\":\"中心医院\",\"menuIds\":[1,2000,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,107,1036,1037,1038,1039,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,108,500,1040,1041,1042,501,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,102,1013,1014,1015,1016,116,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,2001,2016,2017,4,2012,2013,2014,2015],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 17:20:43');
INSERT INTO `sys_oper_log` VALUES (238, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createTime\":1648125214000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clinic\",\"roleName\":\"门诊医院\",\"menuIds\":[2016,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 17:21:02');
INSERT INTO `sys_oper_log` VALUES (239, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17855025585\",\"admin\":false,\"password\":\"$2a$10$V2O2PtyOFNFkQbvKTQ8hNu.RMxOJI2SPo8s5Q95yJhMAgfE6fzK5i\",\"postIds\":[],\"email\":\"27@qq.com\",\"nickName\":\"医院人员\",\"sex\":\"0\",\"deptId\":12,\"params\":{},\"userName\":\"test\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 17:22:05');
INSERT INTO `sys_oper_log` VALUES (240, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17866553322\",\"admin\":false,\"password\":\"$2a$10$byXPworrIhLTkxM25T/nf.xd1PfquNfxSzzeVhW8lvgOYtZonDWWy\",\"postIds\":[],\"email\":\"88@qq.com\",\"nickName\":\"乡村测试人员\",\"sex\":\"0\",\"deptId\":13,\"params\":{},\"userName\":\"test_village\",\"userId\":4,\"createBy\":\"admin\",\"roleIds\":[4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 17:23:21');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":1,\"menuName\":\"测试前端页面效果\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"test_view\",\"component\":\"his/test_view/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"his:test_view:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-29 11:21:04');
INSERT INTO `sys_oper_log` VALUES (242, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否患有疾病\",\"remark\":\"是否患有疾病\",\"params\":{},\"dictType\":\"have_medical_condition\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 17:48:05');
INSERT INTO `sys_oper_log` VALUES (243, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 17:48:12');
INSERT INTO `sys_oper_log` VALUES (244, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"success\",\"dictSort\":1,\"remark\":\"是否患有疾病\",\"params\":{},\"dictType\":\"have_medical_condition\",\"dictLabel\":\"无\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 19:29:22');
INSERT INTO `sys_oper_log` VALUES (245, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"danger\",\"dictSort\":2,\"remark\":\"是否患有疾病\",\"params\":{},\"dictType\":\"have_medical_condition\",\"dictLabel\":\"有\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 19:29:43');
INSERT INTO `sys_oper_log` VALUES (246, '病例管理', 1, 'com.ruoyi.web.controller.green.GreenOldCaseController.add()', 'POST', 1, 'admin', NULL, '/green/case', '127.0.0.1', '内网IP', '{\"geneticDisease\":\"0\",\"heartDisease\":\"0\",\"highBloodPressure\":\"0\",\"oldId\":2,\"params\":{},\"cancer\":\"0\",\"diabetes\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'case_id\' cannot be null\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_green\\target\\classes\\mapper\\green\\GreenOldUserCaseMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into green_user_case(old_id, case_id) values                        (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'case_id\' cannot be null\n; Column \'case_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'case_id\' cannot be null', '2022-03-30 19:40:12');
INSERT INTO `sys_oper_log` VALUES (247, '病例管理', 1, 'com.ruoyi.web.controller.green.GreenOldCaseController.add()', 'POST', 1, 'admin', NULL, '/green/case', '127.0.0.1', '内网IP', '{\"geneticDisease\":\"0\",\"heartDisease\":\"0\",\"highBloodPressure\":\"0\",\"oldId\":2,\"params\":{},\"createTime\":1648641452299,\"caseId\":2,\"cancer\":\"0\",\"diabetes\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 19:57:32');
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":1,\"menuName\":\"设备模拟\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"analog\",\"component\":\"test/analog/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"test:analog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 20:36:31');
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":1,\"menuName\":\"设备模拟\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"analog\",\"component\":\"test/analog/index\",\"children\":[],\"createTime\":1648643791000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"test:analog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 20:38:00');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'green_user_equipment', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 20:58:56');
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"OldId\",\"usableColumn\":false,\"columnId\":88,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"oldId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"老年人ID\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648645136000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"old_id\"},{\"capJavaField\":\"EquipmentId\",\"usableColumn\":false,\"columnId\":89,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"equipmentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备ID\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648645136000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"equipment_id\"},{\"capJavaField\":\"UserEquipmentRelation\",\"usableColumn\":false,\"columnId\":90,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userEquipmentRelation\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备与老人关联表Id\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648645136000,\"tableId\":9,\"pk\":true,\"columnName\":\"user_equipment_relation\"}],\"businessName\":\"equipment\",\"moduleName\":\"system\",\"className\":\"GreenUserEquipment\",\"tableName\":\"green_user_equipment\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2008}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"老年人和检测设备关联\",\"tree\":false,\"tableComment\":\"老年人和检测设备关联表\",\"params\":{\"parentMenuId\":2008},\"tplCategory\":\"crud\",\"parentMenuId\":\"2008\",\"tableId\":9,\"genPat', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-30 20:59:34');
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-30 20:59:37');
INSERT INTO `sys_oper_log` VALUES (253, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1648123673000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"centre\",\"roleName\":\"中心医院\",\"menuIds\":[1,2000,2016,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,107,1036,1037,1038,1039,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,108,500,1040,1041,1042,501,1043,1044,1045,2001,2017,4,2012,2013,2014,2015],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-31 19:13:06');
INSERT INTO `sys_oper_log` VALUES (254, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createTime\":1648125214000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clinic\",\"roleName\":\"门诊医院\",\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2019,2008,2009,2010,2011,2016,2020,2017,4,2012,2013,2014,2015],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-31 19:13:56');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":2,\"menuName\":\"设备警报管理\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"alarm\",\"component\":\"condition/alarm/index\",\"children\":[],\"createTime\":1648137089000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"alarm:alarm:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-31 21:11:26');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":2,\"menuName\":\"设备警报管理\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"alarm\",\"component\":\"condition/alarm/index\",\"children\":[],\"createTime\":1648137089000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-31 21:12:07');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":2,\"menuName\":\"设备警报管理（已弃用）\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"alarm\",\"component\":\"condition/alarm/index\",\"children\":[],\"createTime\":1648137089000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 07:42:42');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"lock\",\"orderNum\":9,\"menuName\":\"设备报警系统\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"caution\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 07:45:22');
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"lock\",\"orderNum\":11,\"menuName\":\"设备报警系统\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"caution\",\"children\":[],\"createTime\":1648770322000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 07:45:31');
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":0,\"menuName\":\"警报管理\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"caution\",\"component\":\"caution/alarm/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"caution:alarm:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 07:47:15');
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"AlarmId\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"alarmId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"警报Id\",\"updateTime\":1648386603000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648386221000,\"tableId\":7,\"pk\":true,\"columnName\":\"alarm_id\"},{\"capJavaField\":\"UserEquipmentRelation\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"userEquipmentRelation\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备与老人关联表Id\",\"updateTime\":1648386603000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648386221000,\"tableId\":7,\"pk\":false,\"columnName\":\"user_equipment_relation\"},{\"capJavaField\":\"IsNotice\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"isNotice\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"是否通知诊所\",\"isQuery\":\"1\",\"updateTime\":1648386603000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648386221000,\"tableId\":7,\"pk\":false,\"columnName\":\"is_notice\"},{\"capJavaField\":\"NoticeClinicLocation\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"noticeClinicLocation\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"通知的诊所位置\",\"updateTime\":1648386603000,\"sort\":4,\"list\":true,\"params\":{},\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 07:47:56');
INSERT INTO `sys_oper_log` VALUES (262, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-01 07:48:02');
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":15,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:39:36');
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":14,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1647945942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:39:47');
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":13,\"menuName\":\"测试系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"children\":[],\"createTime\":1647963058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:39:57');
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":11,\"menuName\":\"物理设备模拟器\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"simulator\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:42:05');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":11,\"menuName\":\"物理设备模拟器\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"simulator\",\"children\":[],\"createTime\":1648773725000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2023,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:43:37');
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":1,\"menuName\":\"设备模拟器（自带检测功能）\",\"params\":{},\"parentId\":2023,\"isCache\":\"0\",\"path\":\"detection\",\"component\":\"simulator/detection/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"simulator:detection:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:46:41');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":2,\"menuName\":\"设别模拟器（仅带有数据）\",\"params\":{},\"parentId\":2023,\"isCache\":\"0\",\"path\":\"not_detection\",\"component\":\"simulator/not_detection/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"simulator:not_detection:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 08:48:35');
INSERT INTO `sys_oper_log` VALUES (270, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/04/01/blob_20220401092825A001.jpeg\",\"code\":200}', 0, NULL, '2022-04-01 09:28:25');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"bug\",\"orderNum\":1,\"menuName\":\"设备模拟\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"analog\",\"component\":\"test/analog/index\",\"children\":[],\"createTime\":1648643791000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"test:analog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 09:32:33');
INSERT INTO `sys_oper_log` VALUES (272, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1648123673000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"centre\",\"roleName\":\"中心医院\",\"menuIds\":[1,2016,2000,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,107,1036,1037,1038,1039,2017,4,2012,2013,2014,2015,2021,2022,2001,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-01 15:34:56');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":2,\"menuName\":\"设别模拟器（仅带有数据）\",\"params\":{},\"parentId\":2023,\"isCache\":\"0\",\"path\":\"notdetection\",\"component\":\"simulator/notdetection/index\",\"children\":[],\"createTime\":1648774115000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"simulator:notdetection:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-02 20:54:44');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"404\",\"orderNum\":1,\"menuName\":\"物理设备信息显示折线图\",\"params\":{},\"parentId\":2023,\"isCache\":\"1\",\"path\":\"heart_rate_chart\",\"component\":\"simulator/notdetection/heart_rate_chart\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-03 20:30:22');
INSERT INTO `sys_oper_log` VALUES (275, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"12346545\",\"oldId\":3,\"params\":{},\"linkMan\":\"1556\",\"oldCard\":\"31754645613\",\"oldName\":\"王五\",\"oldDescribe\":\"无\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 18:02:56');
INSERT INTO `sys_oper_log` VALUES (276, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"啊\",\"oldId\":4,\"params\":{},\"linkMan\":\"啊\",\"oldCard\":\"785223545612\",\"oldName\":\"李三\",\"oldDescribe\":\"啊\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 18:03:09');
INSERT INTO `sys_oper_log` VALUES (277, '用户管理', 1, 'com.ruoyi.web.controller.green.GreenUserController.add()', 'POST', 1, 'admin', NULL, '/green/user', '127.0.0.1', '内网IP', '{\"linkPhone\":\"测试1\",\"oldId\":5,\"params\":{},\"linkMan\":\"测试1\",\"oldCard\":\"789545\",\"oldName\":\"测试1\",\"oldDescribe\":\"测试1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 18:03:19');
INSERT INTO `sys_oper_log` VALUES (278, '病例管理', 1, 'com.ruoyi.web.controller.green.GreenOldCaseController.add()', 'POST', 1, 'admin', NULL, '/green/case', '127.0.0.1', '内网IP', '{\"geneticDisease\":\"0\",\"heartDisease\":\"1\",\"highBloodPressure\":\"1\",\"oldId\":3,\"params\":{},\"createTime\":1649585015291,\"caseId\":3,\"cancer\":\"0\",\"diabetes\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 18:03:35');
INSERT INTO `sys_oper_log` VALUES (279, '病例管理', 1, 'com.ruoyi.web.controller.green.GreenOldCaseController.add()', 'POST', 1, 'admin', NULL, '/green/case', '127.0.0.1', '内网IP', '{\"geneticDisease\":\"0\",\"heartDisease\":\"1\",\"highBloodPressure\":\"0\",\"oldId\":4,\"params\":{},\"createTime\":1649585048580,\"caseId\":4,\"cancer\":\"0\",\"diabetes\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 18:04:08');
INSERT INTO `sys_oper_log` VALUES (280, '设备', 1, 'com.ruoyi.web.controller.condition.ConditionEquipmentController.add()', 'POST', 1, 'admin', NULL, '/condition/equipment', '127.0.0.1', '内网IP', '{\"equipmentTemperature\":\"测试\",\"coordinate\":\"125,167\",\"remark\":\"测试\",\"params\":{},\"equipmentIp\":\"2\",\"equipmentHeartRate\":\"70\",\"equipmentOx\":\"555\",\"createTime\":1649585135157,\"equipmentAlarm\":\"测试\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_condition\\target\\classes\\mapper\\condition\\ConditionEquipmentMapper.xml]\r\n### The error may involve com.ruoyi.condition.mapper.ConditionEquipmentMapper.insertConditionEquipment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into condition_equipment          ( equipment_ip,             equipment_heart_rate,             equipment_ox,             equipment_alarm,             equipment_temperature,                          coordinate,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,                          ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\n; Field \'equipment_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value', '2022-04-10 18:05:35');
INSERT INTO `sys_oper_log` VALUES (281, '设备', 1, 'com.ruoyi.web.controller.condition.ConditionEquipmentController.add()', 'POST', 1, 'admin', NULL, '/condition/equipment', '127.0.0.1', '内网IP', '{\"equipmentTemperature\":\"测试\",\"coordinate\":\"\",\"remark\":\"测试\",\"params\":{},\"equipmentIp\":\"2\",\"equipmentHeartRate\":\"70\",\"equipmentOx\":\"555\",\"createTime\":1649585142611,\"equipmentAlarm\":\"测试\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_condition\\target\\classes\\mapper\\condition\\ConditionEquipmentMapper.xml]\r\n### The error may involve com.ruoyi.condition.mapper.ConditionEquipmentMapper.insertConditionEquipment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into condition_equipment          ( equipment_ip,             equipment_heart_rate,             equipment_ox,             equipment_alarm,             equipment_temperature,                          coordinate,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,                          ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\n; Field \'equipment_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value', '2022-04-10 18:05:42');
INSERT INTO `sys_oper_log` VALUES (282, '设备', 1, 'com.ruoyi.web.controller.condition.ConditionEquipmentController.add()', 'POST', 1, 'admin', NULL, '/condition/equipment', '127.0.0.1', '内网IP', '{\"equipmentTemperature\":\"测试\",\"params\":{},\"equipmentIp\":\"2\",\"equipmentHeartRate\":\"50\",\"equipmentOx\":\"50\",\"createTime\":1649585317488,\"equipmentAlarm\":\"警告\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_condition\\target\\classes\\mapper\\condition\\ConditionEquipmentMapper.xml]\r\n### The error may involve com.ruoyi.condition.mapper.ConditionEquipmentMapper.insertConditionEquipment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into condition_equipment          ( equipment_ip,             equipment_heart_rate,             equipment_ox,             equipment_alarm,             equipment_temperature,                                                    create_time )           values ( ?,             ?,             ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\n; Field \'equipment_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value', '2022-04-10 18:08:37');
INSERT INTO `sys_oper_log` VALUES (283, '设备', 1, 'com.ruoyi.web.controller.condition.ConditionEquipmentController.add()', 'POST', 1, 'admin', NULL, '/condition/equipment', '127.0.0.1', '内网IP', '{\"equipmentTemperature\":\"测试\",\"params\":{},\"equipmentIp\":\"\",\"equipmentHeartRate\":\"50\",\"equipmentOx\":\"50\",\"createTime\":1649585341434,\"equipmentAlarm\":\"警告\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi_condition\\target\\classes\\mapper\\condition\\ConditionEquipmentMapper.xml]\r\n### The error may involve com.ruoyi.condition.mapper.ConditionEquipmentMapper.insertConditionEquipment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into condition_equipment          ( equipment_ip,             equipment_heart_rate,             equipment_ox,             equipment_alarm,             equipment_temperature,                                                    create_time )           values ( ?,             ?,             ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value\n; Field \'equipment_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'equipment_id\' doesn\'t have a default value', '2022-04-10 18:09:01');
INSERT INTO `sys_oper_log` VALUES (284, '设备', 1, 'com.ruoyi.web.controller.condition.ConditionEquipmentController.add()', 'POST', 1, 'admin', NULL, '/condition/equipment', '127.0.0.1', '内网IP', '{\"equipmentTemperature\":\"50\",\"params\":{},\"equipmentIp\":\"15\",\"equipmentHeartRate\":\"456\",\"equipmentOx\":\"45\",\"createTime\":1649585419074,\"equipmentAlarm\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 18:10:19');
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"logininfor\",\"orderNum\":6,\"menuName\":\"中心医院系统\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"hospital\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 22:58:13');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 22:58:44');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":6,\"menuName\":\"设备管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"armarium\",\"component\":\"system/armarium/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:armarium:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:00:58');
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:01:50');
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":5,\"menuName\":\"中心医院\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"hospital \",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:03:22');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":1,\"menuName\":\"医疗设备管理\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"armarium\",\"component\":\"hospital /armarium/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"hospital:armarium:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:05:01');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":5,\"menuName\":\"维护管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"maintain\",\"component\":\"hospital /maintain/index\",\"children\":[],\"createTime\":1649603002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2029,\"menuType\":\"C\",\"perms\":\"hospital:maintain:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:06:50');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":5,\"menuName\":\"中心医院\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"hospital\",\"component\":\"hospital /maintain/index\",\"children\":[],\"createTime\":1649603002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2029,\"menuType\":\"M\",\"perms\":\"hospital:maintain:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:07:56');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":3,\"menuName\":\"维修管理\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"maintain\",\"component\":\"hospital /maintain/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"hospital:maintain:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:09:09');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":3,\"menuName\":\"修护管理\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"upkeep\",\"component\":\"hospital /upkeep/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"hospital:upkeep:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:11:40');
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":1,\"menuName\":\"医疗设备详情\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"armarium\",\"component\":\"hospital /armarium/index\",\"children\":[],\"createTime\":1649603101000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"C\",\"perms\":\"hospital:armarium:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:12:48');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":5,\"menuName\":\"医疗设备管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"hospital\",\"component\":\"hospital /maintain/index\",\"children\":[],\"createTime\":1649603002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2029,\"menuType\":\"M\",\"perms\":\"hospital:maintain:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:12:58');
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"fullscreen\",\"orderNum\":5,\"menuName\":\"仓库管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"warehouse\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:13:37');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"fullscreen\",\"orderNum\":5,\"menuName\":\"药物进销存\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"sale_stock \",\"children\":[],\"createTime\":1649603617000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:27:14');
INSERT INTO `sys_oper_log` VALUES (299, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'armarium', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-10 23:32:29');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"fullscreen\",\"orderNum\":5,\"menuName\":\"药物进销存\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"net\",\"children\":[],\"createTime\":1649603617000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:04:31');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"row\",\"orderNum\":1,\"menuName\":\"生产厂家维护\",\"params\":{},\"parentId\":2033,\"isCache\":\"0\",\"path\":\"production\",\"component\":\"net/production/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"net:production:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:06:53');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":2,\"menuName\":\"供应商维护\",\"params\":{},\"parentId\":2033,\"isCache\":\"0\",\"path\":\"purchase\",\"component\":\"net/purchase/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"net:purchase:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:08:24');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"icon\",\"orderNum\":3,\"menuName\":\"药物信息维护\",\"params\":{},\"parentId\":2033,\"isCache\":\"0\",\"path\":\"drug\",\"component\":\"net/drug/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"net:drug:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:09:16');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":2,\"menuName\":\"供应商维护\",\"params\":{},\"parentId\":2033,\"isCache\":\"0\",\"path\":\"supplier\",\"component\":\"net/supplier/index\",\"children\":[],\"createTime\":1649664504000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2035,\"menuType\":\"C\",\"perms\":\"net:supplier:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:10:22');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"download\",\"orderNum\":4,\"menuName\":\"采购入库管理\",\"params\":{},\"parentId\":2033,\"isCache\":\"0\",\"path\":\"purchase\",\"component\":\"net/purchase/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"net:purchase:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:11:22');
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"excel\",\"orderNum\":13,\"menuName\":\"测试系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"his\",\"children\":[],\"createTime\":1647963058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:11:48');
INSERT INTO `sys_oper_log` VALUES (307, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"ArmariumId\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"armariumId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649604749000,\"tableId\":10,\"pk\":true,\"columnName\":\"armarium_id\"},{\"capJavaField\":\"ArmariumName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_name\"},{\"capJavaField\":\"ArmariumTpye\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumTpye\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备类型（0硬件1软件）\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_tpye\"},{\"capJavaField\":\"ArmariumModels\",\"usableColumn\":false,\"columnId\":94,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"armariumModels\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"规格型号\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"pa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:14:42');
INSERT INTO `sys_oper_log` VALUES (308, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 16:14:46');
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":5,\"menuName\":\"医疗设备管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"hospital\",\"component\":\"\",\"children\":[],\"createTime\":1649603002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2029,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:16:03');
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":1,\"menuName\":\"医疗设备详情\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"armarium\",\"component\":\"hospital/armarium/index\",\"children\":[],\"createTime\":1649603101000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"C\",\"perms\":\"hospital:armarium:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:16:41');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":3,\"menuName\":\"维修管理\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"maintain\",\"component\":\"hospital/maintain/index\",\"children\":[],\"createTime\":1649603349000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"hospital:maintain:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:16:49');
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":3,\"menuName\":\"修护管理\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"upkeep\",\"component\":\"hospital/upkeep/index\",\"children\":[],\"createTime\":1649603500000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2032,\"menuType\":\"C\",\"perms\":\"hospital:upkeep:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:16:57');
INSERT INTO `sys_oper_log` VALUES (313, '医疗设备', 1, 'com.ruoyi.web.controller.hospital.ArmariumController.add()', 'POST', 1, 'admin', NULL, '/system/armarium', '127.0.0.1', '内网IP', '{\"armariumTpye\":\"非消耗物品\",\"armariumName\":\"核酸检测设备\",\"armariumModels\":\"x115\",\"armariumLeader\":\"刘川\",\"params\":{},\"clinicPhone\":\"17844512345\",\"createTime\":1649666325959,\"armariumLocation\":\"枣庄学院大学生服务中心\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'armarium_tpye\' at row 1\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-hospital-equipment\\target\\classes\\mapper\\armarium\\ArmariumMapper.xml]\r\n### The error may involve com.ruoyi.armarium.mapper.ArmariumMapper.insertArmarium-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into armarium          ( armarium_name,             armarium_tpye,             armarium_models,             armarium_location,             armarium_leader,             clinic_phone,             status,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'armarium_tpye\' at row 1\n; Data truncation: Data too long for column \'armarium_tpye\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'armarium_tpye\' at row 1', '2022-04-11 16:38:46');
INSERT INTO `sys_oper_log` VALUES (314, '医疗设备', 1, 'com.ruoyi.web.controller.hospital.ArmariumController.add()', 'POST', 1, 'admin', NULL, '/system/armarium', '127.0.0.1', '内网IP', '{\"armariumTpye\":\"1\",\"armariumName\":\"核酸检测设备\",\"armariumModels\":\"x115\",\"armariumLeader\":\"刘川\",\"params\":{},\"clinicPhone\":\"17844512345\",\"createTime\":1649666370954,\"armariumLocation\":\"枣庄学院大学生服务中心\",\"armariumId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:39:30');
INSERT INTO `sys_oper_log` VALUES (315, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"ArmariumId\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"armariumId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1649664882000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649604749000,\"tableId\":10,\"pk\":true,\"columnName\":\"armarium_id\"},{\"capJavaField\":\"ArmariumName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1649664882000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_name\"},{\"capJavaField\":\"ArmariumTpye\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumTpye\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备类型（0硬件1软件）\",\"isQuery\":\"1\",\"updateTime\":1649664882000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_tpye\"},{\"capJavaField\":\"ArmariumModels\",\"usableColumn\":false,\"columnId\":94,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"armariumModels\",\"htmlType\":\"input\",\"edit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:41:44');
INSERT INTO `sys_oper_log` VALUES (316, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 16:46:50');
INSERT INTO `sys_oper_log` VALUES (317, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"医疗设备类型\",\"remark\":\"0硬件1软件\",\"params\":{},\"dictType\":\"armarium_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:50:00');
INSERT INTO `sys_oper_log` VALUES (318, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"armarium_type\",\"dictLabel\":\"硬件\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:51:06');
INSERT INTO `sys_oper_log` VALUES (319, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"armarium_type\",\"dictLabel\":\"非消耗品\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1649667066000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:51:37');
INSERT INTO `sys_oper_log` VALUES (320, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":2,\"params\":{},\"dictType\":\"armarium_type\",\"dictLabel\":\"消耗品\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:52:10');
INSERT INTO `sys_oper_log` VALUES (321, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"success\",\"dictSort\":1,\"params\":{},\"dictType\":\"armarium_type\",\"dictLabel\":\"非消耗品\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1649667066000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:52:23');
INSERT INTO `sys_oper_log` VALUES (322, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":2,\"params\":{},\"dictType\":\"armarium_type\",\"dictLabel\":\"消耗品\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1649667130000,\"dictCode\":34,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:52:34');
INSERT INTO `sys_oper_log` VALUES (323, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"warning\",\"dictSort\":1,\"params\":{},\"dictType\":\"armarium_type\",\"dictLabel\":\"非消耗品\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1649667066000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:52:39');
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"ArmariumId\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"armariumId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1649666504000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649604749000,\"tableId\":10,\"pk\":true,\"columnName\":\"armarium_id\"},{\"capJavaField\":\"ArmariumName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1649666504000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_name\"},{\"capJavaField\":\"ArmariumTpye\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"armarium_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumTpye\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"设备类型（0硬件1软件）\",\"isQuery\":\"1\",\"updateTime\":1649666504000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_tpye\"},{\"capJavaField\":\"ArmariumModels\",\"usableColumn\":false,\"columnId\":94,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"armariumModels\",\"htmlType\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:54:27');
INSERT INTO `sys_oper_log` VALUES (325, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 16:54:30');
INSERT INTO `sys_oper_log` VALUES (326, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zhezhi\",\"columns\":[{\"capJavaField\":\"ArmariumId\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"armariumId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1649667267000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649604749000,\"tableId\":10,\"pk\":true,\"columnName\":\"armarium_id\"},{\"capJavaField\":\"ArmariumName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1649667267000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_name\"},{\"capJavaField\":\"ArmariumTpye\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"armarium_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"armariumTpye\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"设备类型（0硬件1软件）\",\"isQuery\":\"1\",\"updateTime\":1649667267000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649604749000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"armarium_tpye\"},{\"capJavaField\":\"ArmariumModels\",\"usableColumn\":false,\"columnId\":94,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"armariumModels\",\"htmlType\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:56:44');
INSERT INTO `sys_oper_log` VALUES (327, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 16:57:25');
INSERT INTO `sys_oper_log` VALUES (328, '医疗设备', 2, 'com.ruoyi.web.controller.hospital.ArmariumController.edit()', 'PUT', 1, 'admin', NULL, '/system/armarium', '127.0.0.1', '内网IP', '{\"armariumTpye\":\"0\",\"armariumName\":\"核酸检测设备\",\"armariumModels\":\"x115\",\"updateTime\":1649667531707,\"armariumLeader\":\"刘川\",\"params\":{},\"clinicPhone\":\"17844512345\",\"createTime\":1649666370000,\"armariumLocation\":\"枣庄学院大学生服务中心\",\"armariumId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 16:58:51');
INSERT INTO `sys_oper_log` VALUES (329, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'armarium_maintain', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:01:34');
INSERT INTO `sys_oper_log` VALUES (330, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"MaintainId\",\"usableColumn\":false,\"columnId\":104,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"maintainId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"维修单号ID\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649667694000,\"tableId\":11,\"pk\":true,\"columnName\":\"maintain_id\"},{\"capJavaField\":\"MaintainCause\",\"usableColumn\":false,\"columnId\":105,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maintainCause\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"故障原因\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649667694000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"maintain_cause\"},{\"capJavaField\":\"MaintainPeople\",\"usableColumn\":false,\"columnId\":106,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maintainPeople\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"维修人员\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649667694000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"maintain_people\"},{\"capJavaField\":\"MaintainResult\",\"usableColumn\":false,\"columnId\":107,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"maintainResult\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"维修结果\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"param', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:03:17');
INSERT INTO `sys_oper_log` VALUES (331, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 17:03:25');
INSERT INTO `sys_oper_log` VALUES (332, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'armarium_upkeep', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:13:16');
INSERT INTO `sys_oper_log` VALUES (333, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"等级（三级菜单）\",\"params\":{},\"dictType\":\"level_three\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:15:34');
INSERT INTO `sys_oper_log` VALUES (334, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":1,\"params\":{},\"dictType\":\"level_three\",\"dictLabel\":\"一级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:18:38');
INSERT INTO `sys_oper_log` VALUES (335, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"info\",\"dictSort\":0,\"params\":{},\"dictType\":\"level_three\",\"dictLabel\":\"二级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:19:40');
INSERT INTO `sys_oper_log` VALUES (336, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"warning\",\"dictSort\":3,\"params\":{},\"dictType\":\"level_three\",\"dictLabel\":\"三级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:20:00');
INSERT INTO `sys_oper_log` VALUES (337, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"info\",\"dictSort\":2,\"params\":{},\"dictType\":\"level_three\",\"dictLabel\":\"二级\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1649668780000,\"dictCode\":36,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:20:08');
INSERT INTO `sys_oper_log` VALUES (338, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"UpkeepId\",\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"upkeepId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"保养单号ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649668396000,\"tableId\":12,\"pk\":true,\"columnName\":\"upkeep_id\"},{\"capJavaField\":\"UpkeepLevel\",\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"upkeepLevel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"保养等级\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649668396000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"upkeep_level\"},{\"capJavaField\":\"UpkeepFrequency\",\"usableColumn\":false,\"columnId\":116,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"upkeepFrequency\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"保养频次\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649668396000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"upkeep_frequency\"},{\"capJavaField\":\"UpkeepResult\",\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"upkeepResult\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"维修结果\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"para', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:20:21');
INSERT INTO `sys_oper_log` VALUES (339, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"UpkeepId\",\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"upkeepId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"保养单号ID\",\"updateTime\":1649668821000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649668396000,\"tableId\":12,\"pk\":true,\"columnName\":\"upkeep_id\"},{\"capJavaField\":\"UpkeepLevel\",\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"level_three\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"upkeepLevel\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"保养等级\",\"isQuery\":\"1\",\"updateTime\":1649668821000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649668396000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"upkeep_level\"},{\"capJavaField\":\"UpkeepFrequency\",\"usableColumn\":false,\"columnId\":116,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"upkeepFrequency\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"保养频次\",\"isQuery\":\"1\",\"updateTime\":1649668821000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649668396000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"upkeep_frequency\"},{\"capJavaField\":\"UpkeepResult\",\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"upkeepResult\",\"htmlType\":\"ed', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:20:57');
INSERT INTO `sys_oper_log` VALUES (340, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 17:21:00');
INSERT INTO `sys_oper_log` VALUES (341, '医疗设备保养', 1, 'com.ruoyi.web.controller.hospital.ArmariumUpkeepController.add()', 'POST', 1, 'admin', NULL, '/system/upkeep', '127.0.0.1', '内网IP', '{\"upkeepTime\":\"2022.4.11\",\"upkeepId\":1,\"createTime\":1649669126070,\"upkeepFrequency\":\"1周1词\",\"upkeepResult\":\"成功\",\"params\":{},\"upkeepLevel\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 17:25:26');
INSERT INTO `sys_oper_log` VALUES (342, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'armarium_to_maintain', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 19:26:39');
INSERT INTO `sys_oper_log` VALUES (343, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"AmId\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"amId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备与维修Id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649676398000,\"tableId\":13,\"pk\":true,\"columnName\":\"am_id\"},{\"capJavaField\":\"ArmariumId\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"armariumId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备ID\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649676398000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"armarium_id\"},{\"capJavaField\":\"ProductionId\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"productionId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"维修单号ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649676398000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"production_id\"}],\"businessName\":\"maintain\",\"moduleName\":\"system\",\"className\":\"ArmariumToMaintain\",\"tableName\":\"armarium_to_maintain\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"设备与维修信息关联\",\"tree\":false,\"tableComment\":\"设备与维修信息关联表\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":13,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 19:26:50');
INSERT INTO `sys_oper_log` VALUES (344, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 19:26:53');
INSERT INTO `sys_oper_log` VALUES (345, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"张四\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"没问题\",\"maintainId\":1,\"createTime\":1649678735272,\"maintainCause\":\"大大的问题\",\"armariumId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:05:35');
INSERT INTO `sys_oper_log` VALUES (346, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试人员\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"没问题\",\"maintainId\":3,\"createTime\":1649678888571,\"maintainCause\":\"很撑问题\",\"armariumId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:08:08');
INSERT INTO `sys_oper_log` VALUES (347, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/13', '127.0.0.1', '内网IP', '{tableIds=13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:12:11');
INSERT INTO `sys_oper_log` VALUES (348, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'armarium_to_maintain', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:12:16');
INSERT INTO `sys_oper_log` VALUES (349, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-04-11 20:12:20');
INSERT INTO `sys_oper_log` VALUES (350, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"测试\",\"maintainId\":5,\"createTime\":1649679861734,\"maintainCause\":\"测试\",\"armariumId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:24:21');
INSERT INTO `sys_oper_log` VALUES (351, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"测试\",\"maintainId\":6,\"createTime\":1649680663333,\"maintainCause\":\"测试\",\"armariumId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:37:43');
INSERT INTO `sys_oper_log` VALUES (352, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"测试\",\"maintainId\":7,\"createTime\":1649680852271,\"maintainCause\":\"测试\",\"armariumId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 20:40:52');
INSERT INTO `sys_oper_log` VALUES (353, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"params\":{},\"createTime\":1649680905383,\"armariumId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'maintain_cause\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-hospital-equipment\\target\\classes\\mapper\\armarium\\ArmariumMaintainMapper.xml]\r\n### The error may involve com.ruoyi.armarium.mapper.ArmariumMaintainMapper.insertArmariumMaintain-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into armarium_maintain          ( maintain_people,                                                    create_time )           values ( ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'maintain_cause\' doesn\'t have a default value\n; Field \'maintain_cause\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'maintain_cause\' doesn\'t have a default value', '2022-04-11 20:42:33');
INSERT INTO `sys_oper_log` VALUES (354, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"params\":{},\"armariumId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'maintain_cause\' doesn\'t have a default value\r\n### The error may exist in file [H:\\His\\HisYiVue\\RuoYi-Vue\\ruoyi-hospital-equipment\\target\\classes\\mapper\\armarium\\ArmariumMaintainMapper.xml]\r\n### The error may involve com.ruoyi.armarium.mapper.ArmariumMaintainMapper.insertArmariumMaintain-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into armarium_maintain          ( maintain_people )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'maintain_cause\' doesn\'t have a default value\n; Field \'maintain_cause\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'maintain_cause\' doesn\'t have a default value', '2022-04-11 20:59:56');
INSERT INTO `sys_oper_log` VALUES (355, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"测试\",\"maintainId\":8,\"maintainCause\":\"测试\",\"armariumId\":1}', NULL, 1, 'com.ruoyi.armarium.domain.ArmariumMaintain cannot be cast to java.lang.Long', '2022-04-11 21:00:30');
INSERT INTO `sys_oper_log` VALUES (356, '医疗设备维修', 1, 'com.ruoyi.web.controller.hospital.ArmariumMaintainController.add()', 'POST', 1, 'admin', NULL, '/system/maintain', '127.0.0.1', '内网IP', '{\"maintainPeople\":\"测试\",\"maintainTime\":\"2022-04-11\",\"params\":{},\"maintainResult\":\"测试\",\"maintainId\":9,\"createTime\":1649682203429,\"maintainCause\":\"测试\",\"armariumId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-11 21:03:23');

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
INSERT INTO `sys_role` VALUES (3, '中心医院', 'centre', 3, '1', 1, 1, '0', '0', 'admin', '2022-03-24 20:07:53', 'admin', '2022-04-01 15:34:56', NULL);
INSERT INTO `sys_role` VALUES (4, '门诊医院', 'clinic', 5, '1', 1, 1, '0', '0', 'admin', '2022-03-24 20:33:34', 'admin', '2022-03-31 19:13:56', NULL);

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
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 110);
INSERT INTO `sys_role_menu` VALUES (3, 111);
INSERT INTO `sys_role_menu` VALUES (3, 112);
INSERT INTO `sys_role_menu` VALUES (3, 113);
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
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
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
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2001);
INSERT INTO `sys_role_menu` VALUES (3, 2012);
INSERT INTO `sys_role_menu` VALUES (3, 2013);
INSERT INTO `sys_role_menu` VALUES (3, 2014);
INSERT INTO `sys_role_menu` VALUES (3, 2015);
INSERT INTO `sys_role_menu` VALUES (3, 2016);
INSERT INTO `sys_role_menu` VALUES (3, 2017);
INSERT INTO `sys_role_menu` VALUES (3, 2021);
INSERT INTO `sys_role_menu` VALUES (3, 2022);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (4, 2000);
INSERT INTO `sys_role_menu` VALUES (4, 2001);
INSERT INTO `sys_role_menu` VALUES (4, 2002);
INSERT INTO `sys_role_menu` VALUES (4, 2003);
INSERT INTO `sys_role_menu` VALUES (4, 2004);
INSERT INTO `sys_role_menu` VALUES (4, 2005);
INSERT INTO `sys_role_menu` VALUES (4, 2006);
INSERT INTO `sys_role_menu` VALUES (4, 2007);
INSERT INTO `sys_role_menu` VALUES (4, 2008);
INSERT INTO `sys_role_menu` VALUES (4, 2009);
INSERT INTO `sys_role_menu` VALUES (4, 2010);
INSERT INTO `sys_role_menu` VALUES (4, 2011);
INSERT INTO `sys_role_menu` VALUES (4, 2012);
INSERT INTO `sys_role_menu` VALUES (4, 2013);
INSERT INTO `sys_role_menu` VALUES (4, 2014);
INSERT INTO `sys_role_menu` VALUES (4, 2015);
INSERT INTO `sys_role_menu` VALUES (4, 2016);
INSERT INTO `sys_role_menu` VALUES (4, 2017);
INSERT INTO `sys_role_menu` VALUES (4, 2019);
INSERT INTO `sys_role_menu` VALUES (4, 2020);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 10, 'admin', '馆长', '00', 'xx@163.com', '15888888888', '1', '/profile/avatar/2022/04/01/blob_20220401092825A001.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-11 20:23:01', 'admin', '2022-03-22 18:45:42', '', '2022-04-11 20:23:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 10, 'wf', '小弟', '00', 'xx@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-22 18:45:42', 'admin', '2022-03-22 18:45:42', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 12, 'test', '医院人员', '00', '27@qq.com', '17855025585', '0', '', '$2a$10$V2O2PtyOFNFkQbvKTQ8hNu.RMxOJI2SPo8s5Q95yJhMAgfE6fzK5i', '0', '0', '127.0.0.1', '2022-04-01 15:35:20', 'admin', '2022-03-28 17:22:05', '', '2022-04-01 15:35:20', NULL);
INSERT INTO `sys_user` VALUES (4, 13, 'test_village', '乡村测试人员', '00', '88@qq.com', '17866553322', '0', '', '$2a$10$byXPworrIhLTkxM25T/nf.xd1PfquNfxSzzeVhW8lvgOYtZonDWWy', '0', '0', '', NULL, 'admin', '2022-03-28 17:23:21', '', NULL, NULL);

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
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `warehouse_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `warehouse_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库等级',
  `warehouse_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库类型',
  `warehouse_capacity` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库容量',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '仓库状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医疗仓库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warehouse
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
