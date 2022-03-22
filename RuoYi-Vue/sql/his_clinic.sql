CREATE TABLE `his_clinic` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '诊所ID',
  `dept_name` varchar(50) NOT NULL COMMENT '诊所名称',
  `dept_location` varchar(500) NOT NULL COMMENT '诊所位置',
  `dept_leader` varchar(64) DEFAULT NULL COMMENT '负责人',
  `dept_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `status` char(1) NOT NULL COMMENT '状态（0正常;1停用）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='门诊信息表';




insert into his_clinic values(1,'老中医1','HIS-N','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(2,'老中医2','HIS-W','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(3,'老中医3','HIS-G','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(4,'老中医4','HIS-E','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(5,'老中医5','HIS-F','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(6,'新地区5','HIS-N','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(7,'新地区6','HIS-X','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(8,'新地区7','HIS-ss','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
insert into his_clinic values(9,'新地区8','HIS-Fss','枣庄学院','18612345678',0,'admin',now(),'admin',now(),'');
