CREATE TABLE `his_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dept_name` varchar(50) NOT NULL COMMENT '科室名称',
  `dept_code` varchar(64) NOT NULL COMMENT '科室编码',
  `dept_num` bigint(20) DEFAULT '0' COMMENT '当前挂号量',
  `dept_leader` varchar(64) DEFAULT '' COMMENT '负责人',
  `dept_phone` varchar(11) DEFAULT '' COMMENT '手机号码',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `dept_sort` int(5) DEFAULT NULL COMMENT '推荐码',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='科室表';