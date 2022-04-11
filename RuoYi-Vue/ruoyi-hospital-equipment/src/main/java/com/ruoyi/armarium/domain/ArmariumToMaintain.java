package com.ruoyi.armarium.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备与维修信息关联对象 armarium_to_maintain
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public class ArmariumToMaintain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备与维修Id */
    private Long amId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long armariumId;

    /** 维修单号ID、、表名有问题后期进行修改 */
    @Excel(name = "维修单号ID、、表名有问题后期进行修改")
    private Long maintainId;

    public void setAmId(Long amId) 
    {
        this.amId = amId;
    }

    public Long getAmId() 
    {
        return amId;
    }
    public void setArmariumId(Long armariumId) 
    {
        this.armariumId = armariumId;
    }

    public Long getArmariumId() 
    {
        return armariumId;
    }
    public void setMaintainId(Long maintainId) 
    {
        this.maintainId = maintainId;
    }

    public Long getMaintainId() 
    {
        return maintainId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("amId", getAmId())
            .append("armariumId", getArmariumId())
            .append("maintainId", getMaintainId())
            .toString();
    }
}
