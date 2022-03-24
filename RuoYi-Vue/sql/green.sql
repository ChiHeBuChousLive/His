-- ----------------------------
-- 创建绿色用户表
-- ----------------------------
DROP TABLE IF EXISTS green_user;
CREATE TABLE green_user(
    old_id BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '老年人Id' ,
    old_name VARCHAR(50) NOT NULL   COMMENT '老年人姓名' ,
    old_describe VARCHAR(500)    COMMENT '描述;老年人近期门诊反馈信息' ,
    old_card VARCHAR(255)    COMMENT '身份证' ,
    linkman VARCHAR(255)    COMMENT '紧急联系人;用于联系老人的看护人或者家属' ,
    link_phone VARCHAR(11)    COMMENT '紧急联系人电话;用于联系老人的看护人或者家属' ,
    status CHAR(1) NOT NULL   COMMENT '状态（0正常;1停用）' ,
    create_by VARCHAR(64)    COMMENT '创建者' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_by VARCHAR(64)    COMMENT '更新者' ,
    update_time DATETIME    COMMENT '更新时间' ,
    remark VARCHAR(500)    COMMENT '备注' ,
    PRIMARY KEY (old_id)
)  COMMENT = '老年人绿色通道';
