package com.ruoyi.net.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 进销生产厂家对象 net_production
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
public class NetProduction extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 厂家ID */
    private Long productionId;

    /** 厂家名称 */
    @Excel(name = "厂家名称")
    private String productionName;

    /** 厂家编码 */
    @Excel(name = "厂家编码")
    private String productionNumber;

    /** 联系人 */
    @Excel(name = "联系人")
    private String productionLeader;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String productionPhone;

    /** 厂家地址 */
    @Excel(name = "厂家地址")
    private String productionLocation;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setProductionId(Long productionId) 
    {
        this.productionId = productionId;
    }

    public Long getProductionId() 
    {
        return productionId;
    }
    public void setProductionName(String productionName) 
    {
        this.productionName = productionName;
    }

    public String getProductionName() 
    {
        return productionName;
    }
    public void setProductionNumber(String productionNumber) 
    {
        this.productionNumber = productionNumber;
    }

    public String getProductionNumber() 
    {
        return productionNumber;
    }
    public void setProductionLeader(String productionLeader) 
    {
        this.productionLeader = productionLeader;
    }

    public String getProductionLeader() 
    {
        return productionLeader;
    }
    public void setProductionPhone(String productionPhone) 
    {
        this.productionPhone = productionPhone;
    }

    public String getProductionPhone() 
    {
        return productionPhone;
    }
    public void setProductionLocation(String productionLocation) 
    {
        this.productionLocation = productionLocation;
    }

    public String getProductionLocation() 
    {
        return productionLocation;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productionId", getProductionId())
            .append("productionName", getProductionName())
            .append("productionNumber", getProductionNumber())
            .append("productionLeader", getProductionLeader())
            .append("productionPhone", getProductionPhone())
            .append("productionLocation", getProductionLocation())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
