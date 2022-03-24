package com.ruoyi.green.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class GreenUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Excel(name = "用户ID", cellType = Excel.ColumnType.NUMERIC)
    private Long oldId;

    @Excel(name= "姓名")
    private String oldName;

    @Excel(name = "描述:年人近期门诊反馈信息")
    private String oldDescribe;

    @Excel(name = "身份证")
    private String oldCard;
    @Excel(name = "紧急联系人")
    private String linkMan;
    @Excel(name = "联系人手机号")
    private String linkPhone;
    @Excel(name = "用户状态状态")
    private String status;

    @Override
    public String toString() {
        return "GreenUser{" +
                "oldId=" + oldId +
                ", oldName='" + oldName + '\'' +
                ", oldDescribe='" + oldDescribe + '\'' +
                ", oldCard='" + oldCard + '\'' +
                ", linkMan='" + linkMan + '\'' +
                ", linkPhone='" + linkPhone + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getOldId() {
        return oldId;
    }

    public void setOldId(Long oldId) {
        this.oldId = oldId;
    }

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }

    public String getOldDescribe() {
        return oldDescribe;
    }

    public void setOldDescribe(String oldDescribe) {
        this.oldDescribe = oldDescribe;
    }

    public String getOldCard() {
        return oldCard;
    }

    public void setOldCard(String oldCard) {
        this.oldCard = oldCard;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
