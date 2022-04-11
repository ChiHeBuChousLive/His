package com.ruoyi.armarium.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医疗设备保养对象 armarium_upkeep
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public class ArmariumUpkeep extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 保养单号ID */
    private Long upkeepId;

    /** 保养等级 */
    @Excel(name = "保养等级")
    private String upkeepLevel;

    /** 保养频次 */
    @Excel(name = "保养频次")
    private String upkeepFrequency;

    /** 维修结果 */
    @Excel(name = "维修结果")
    private String upkeepResult;

    /** 保养时间 */
    @Excel(name = "保养时间")
    private String upkeepTime;

    public void setUpkeepId(Long upkeepId) 
    {
        this.upkeepId = upkeepId;
    }

    public Long getUpkeepId() 
    {
        return upkeepId;
    }
    public void setUpkeepLevel(String upkeepLevel) 
    {
        this.upkeepLevel = upkeepLevel;
    }

    public String getUpkeepLevel() 
    {
        return upkeepLevel;
    }
    public void setUpkeepFrequency(String upkeepFrequency) 
    {
        this.upkeepFrequency = upkeepFrequency;
    }

    public String getUpkeepFrequency() 
    {
        return upkeepFrequency;
    }
    public void setUpkeepResult(String upkeepResult) 
    {
        this.upkeepResult = upkeepResult;
    }

    public String getUpkeepResult() 
    {
        return upkeepResult;
    }
    public void setUpkeepTime(String upkeepTime) 
    {
        this.upkeepTime = upkeepTime;
    }

    public String getUpkeepTime() 
    {
        return upkeepTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("upkeepId", getUpkeepId())
            .append("upkeepLevel", getUpkeepLevel())
            .append("upkeepFrequency", getUpkeepFrequency())
            .append("upkeepResult", getUpkeepResult())
            .append("upkeepTime", getUpkeepTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
