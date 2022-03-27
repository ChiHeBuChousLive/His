package com.ruoyi.condition.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备警报管理对象 condition_alarm
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
public class ConditionAlarm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 警报Id */
    private Long alarmId;

    /** 设备与老人关联表Id */
    private Long userEquipmentRelation;

    /** 是否通知诊所 */
    @Excel(name = "是否通知诊所")
    private String isNotice;

    /** 通知的诊所位置 */
    @Excel(name = "通知的诊所位置")
    private String noticeClinicLocation;

    /** 帮助的老人设备位置 */
    @Excel(name = "帮助的老人设备位置")
    private String helpEquipmentLocation;

    public void setAlarmId(Long alarmId) 
    {
        this.alarmId = alarmId;
    }

    public Long getAlarmId() 
    {
        return alarmId;
    }
    public void setUserEquipmentRelation(Long userEquipmentRelation) 
    {
        this.userEquipmentRelation = userEquipmentRelation;
    }

    public Long getUserEquipmentRelation() 
    {
        return userEquipmentRelation;
    }
    public void setIsNotice(String isNotice) 
    {
        this.isNotice = isNotice;
    }

    public String getIsNotice() 
    {
        return isNotice;
    }
    public void setNoticeClinicLocation(String noticeClinicLocation) 
    {
        this.noticeClinicLocation = noticeClinicLocation;
    }

    public String getNoticeClinicLocation() 
    {
        return noticeClinicLocation;
    }
    public void setHelpEquipmentLocation(String helpEquipmentLocation) 
    {
        this.helpEquipmentLocation = helpEquipmentLocation;
    }

    public String getHelpEquipmentLocation() 
    {
        return helpEquipmentLocation;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("alarmId", getAlarmId())
            .append("userEquipmentRelation", getUserEquipmentRelation())
            .append("isNotice", getIsNotice())
            .append("noticeClinicLocation", getNoticeClinicLocation())
            .append("helpEquipmentLocation", getHelpEquipmentLocation())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
