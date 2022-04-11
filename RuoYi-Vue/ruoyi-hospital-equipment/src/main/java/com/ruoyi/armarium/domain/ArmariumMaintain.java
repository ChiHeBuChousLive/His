package com.ruoyi.armarium.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医疗设备维修对象 armarium_maintain
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public class ArmariumMaintain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修单号ID */
    @Excel(name = "维修单号ID")
    private Long maintainId;

    /** 故障原因 */
    @Excel(name = "故障原因")
    private String maintainCause;

    /** 维修人员 */
    @Excel(name = "维修人员")
    private String maintainPeople;

    /** 维修结果 */
    @Excel(name = "维修结果")
    private String maintainResult;

    /** 维修完成时间 */
    @Excel(name = "维修完成时间")
    private String maintainTime;

    /** 设备ID */
    private Long armariumId;

    public Long getArmariumId() {
        return armariumId;
    }

    public void setArmariumId(Long armariumId) {
        this.armariumId = armariumId;
    }

    public void setMaintainId(Long maintainId)
    {
        this.maintainId = maintainId;
    }

    public Long getMaintainId() 
    {
        return maintainId;
    }
    public void setMaintainCause(String maintainCause) 
    {
        this.maintainCause = maintainCause;
    }

    public String getMaintainCause() 
    {
        return maintainCause;
    }
    public void setMaintainPeople(String maintainPeople) 
    {
        this.maintainPeople = maintainPeople;
    }

    public String getMaintainPeople() 
    {
        return maintainPeople;
    }
    public void setMaintainResult(String maintainResult) 
    {
        this.maintainResult = maintainResult;
    }

    public String getMaintainResult() 
    {
        return maintainResult;
    }
    public void setMaintainTime(String maintainTime) 
    {
        this.maintainTime = maintainTime;
    }

    public String getMaintainTime() 
    {
        return maintainTime;
    }

    @Override
    public String toString() {
        return "ArmariumMaintain{" +
                "maintainId=" + maintainId +
                ", maintainCause='" + maintainCause + '\'' +
                ", maintainPeople='" + maintainPeople + '\'' +
                ", maintainResult='" + maintainResult + '\'' +
                ", maintainTime='" + maintainTime + '\'' +
                ", armariumId=" + armariumId +
                '}';
    }
}
