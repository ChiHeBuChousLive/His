package com.ruoyi.condition.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备对象 condition_equipment
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
public class ConditionEquipment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备Id */
    private Long equipmentId;

    /** 设备Ip */
    @Excel(name = "设备Ip")
    private String equipmentIp;

    /** 心率 */
    @Excel(name = "心率")
    private String equipmentHeartRate;

    /** 血氧饱和度 */
    @Excel(name = "血氧饱和度")
    private String equipmentOx;

    /** 报警信息 */
    @Excel(name = "报警信息")
    private String equipmentAlarm;

    /** 体温 */
    @Excel(name = "体温")
    private String equipmentTemperature;

    /** 经纬度坐标 */
    @Excel(name = "经纬度坐标")
    private String coordinate;

    /**  位置   */
    @Excel(name = "位置")
    private String equipmentLocation;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getEquipmentLocation() {
        return equipmentLocation;
    }

    public void setEquipmentLocation(String equipmentLocation) {
        this.equipmentLocation = equipmentLocation;
    }

    public void setEquipmentId(Long equipmentId)
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setEquipmentIp(String equipmentIp) 
    {
        this.equipmentIp = equipmentIp;
    }

    public String getEquipmentIp() 
    {
        return equipmentIp;
    }
    public void setEquipmentHeartRate(String equipmentHeartRate) 
    {
        this.equipmentHeartRate = equipmentHeartRate;
    }

    public String getEquipmentHeartRate() 
    {
        return equipmentHeartRate;
    }
    public void setEquipmentOx(String equipmentOx) 
    {
        this.equipmentOx = equipmentOx;
    }

    public String getEquipmentOx() 
    {
        return equipmentOx;
    }
    public void setEquipmentAlarm(String equipmentAlarm) 
    {
        this.equipmentAlarm = equipmentAlarm;
    }

    public String getEquipmentAlarm() 
    {
        return equipmentAlarm;
    }
    public void setEquipmentTemperature(String equipmentTemperature) 
    {
        this.equipmentTemperature = equipmentTemperature;
    }

    public String getEquipmentTemperature() 
    {
        return equipmentTemperature;
    }
    public void setCoordinate(String coordinate) 
    {
        this.coordinate = coordinate;
    }

    public String getCoordinate() 
    {
        return coordinate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("equipmentId", getEquipmentId())
            .append("equipmentIp", getEquipmentIp())
            .append("equipmentHeartRate", getEquipmentHeartRate())
            .append("equipmentOx", getEquipmentOx())
            .append("equipmentAlarm", getEquipmentAlarm())
            .append("equipmentTemperature", getEquipmentTemperature())
            .append("coordinate", getCoordinate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
