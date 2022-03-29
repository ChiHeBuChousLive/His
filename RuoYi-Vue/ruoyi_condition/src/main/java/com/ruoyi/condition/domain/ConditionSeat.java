package com.ruoyi.condition.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 位置信息管理对象 condition_seat
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
public class ConditionSeat extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 位置信息Id */
    private Long seatId;

    /** 诊所外键Id */
    @Excel(name = "诊所外键Id")
    private Long clinicId;

    /** 设备外键Id */
    @Excel(name = "设备外键Id")
    private Long equipmentId;

    @Excel(name = "前端显示名称")
    private String frontName;

    @Excel(name = "前端显示地理位置")
    private String frontLocation;

    public String getFrontName() {
        return frontName;
    }

    public void setFrontName(String frontName) {
        this.frontName = frontName;
    }

    public String getFrontLocation() {
        return frontLocation;
    }

    public void setFrontLocation(String frontLocation) {
        this.frontLocation = frontLocation;
    }

    /**下面四个属性弃用，走不通*/
    private String equipmentName;

    private String equipmentLocation;

    private String clinicName;

    private String clinicLocation;




    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getEquipmentLocation() {
        return equipmentLocation;
    }

    public void setEquipmentLocation(String equipmentLocation) {
        this.equipmentLocation = equipmentLocation;
    }

    public String getClinicName() {
        return clinicName;
    }

    public void setClinicName(String clinicName) {
        this.clinicName = clinicName;
    }

    public String getClinicLocation() {
        return clinicLocation;
    }

    public void setClinicLocation(String clinicLocation) {
        this.clinicLocation = clinicLocation;
    }

    public void setSeatId(Long seatId)
    {
        this.seatId = seatId;
    }

    public Long getSeatId() 
    {
        return seatId;
    }
    public void setClinicId(Long clinicId) 
    {
        this.clinicId = clinicId;
    }

    public Long getClinicId() 
    {
        return clinicId;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("seatId", getSeatId())
            .append("clinicId", getClinicId())
            .append("equipmentId", getEquipmentId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
