package com.ruoyi.green.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 老年人和检测设备关联对象 green_user_equipment
 * 
 * @author ruoyi
 * @date 2022-03-30
 */
public class GreenUserEquipment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 老年人ID */
    @Excel(name = "老年人ID")
    private Long oldId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long equipmentId;

    /** 设备与老人关联表Id */
    private Long userEquipmentRelation;

    public void setOldId(Long oldId) 
    {
        this.oldId = oldId;
    }

    public Long getOldId() 
    {
        return oldId;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setUserEquipmentRelation(Long userEquipmentRelation) 
    {
        this.userEquipmentRelation = userEquipmentRelation;
    }

    public Long getUserEquipmentRelation() 
    {
        return userEquipmentRelation;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("oldId", getOldId())
            .append("equipmentId", getEquipmentId())
            .append("userEquipmentRelation", getUserEquipmentRelation())
            .toString();
    }
}
