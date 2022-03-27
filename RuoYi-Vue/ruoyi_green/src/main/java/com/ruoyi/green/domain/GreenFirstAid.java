package com.ruoyi.green.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 紧急救治（关联病历与药物）对象 green_first_aid
 *
 * @author zhezhi
 * @date 2022-03-27
 */
public class GreenFirstAid extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 主节点id */
    private Long aidId;

    /** 一级节点为病历名，二级节点为药物名称 */
    @Excel(name = "一级节点为病历名，二级节点为药物名称")
    private String aidName;

    public void setAidId(Long aidId)
    {
        this.aidId = aidId;
    }

    public Long getAidId()
    {
        return aidId;
    }
    public void setAidName(String aidName)
    {
        this.aidName = aidName;
    }

    public String getAidName()
    {
        return aidName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("aidId", getAidId())
                .append("parentId", getParentId())
                .append("aidName", getAidName())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
