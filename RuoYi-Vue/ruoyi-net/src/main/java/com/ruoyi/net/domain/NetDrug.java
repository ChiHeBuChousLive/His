package com.ruoyi.net.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 进销药品信息维护对象 net_drug
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
public class NetDrug extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药品ID */
    private Long drugId;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String drugName;

    /** 药品编号 */
    @Excel(name = "药品编号")
    private String drugNumber;

    /** 生产厂家 */
    @Excel(name = "生产厂家")
    private String drugProduction;

    /** 药品类型 */
    @Excel(name = "药品类型")
    private String pdrugType;

    /** 处方类型 */
    @Excel(name = "处方类型")
    private String pdrugPrescription;

    /** 单位 */
    @Excel(name = "单位")
    private String drugUnits;

    /** 价格 */
    @Excel(name = "价格")
    private String drugPrice;

    /** 库存量 */
    @Excel(name = "库存量")
    private String drugStock;

    /** 预警值 */
    @Excel(name = "预警值")
    private String earlyWarning;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setDrugId(Long drugId) 
    {
        this.drugId = drugId;
    }

    public Long getDrugId() 
    {
        return drugId;
    }
    public void setDrugName(String drugName) 
    {
        this.drugName = drugName;
    }

    public String getDrugName() 
    {
        return drugName;
    }
    public void setDrugNumber(String drugNumber) 
    {
        this.drugNumber = drugNumber;
    }

    public String getDrugNumber() 
    {
        return drugNumber;
    }
    public void setDrugProduction(String drugProduction) 
    {
        this.drugProduction = drugProduction;
    }

    public String getDrugProduction() 
    {
        return drugProduction;
    }
    public void setPdrugType(String pdrugType) 
    {
        this.pdrugType = pdrugType;
    }

    public String getPdrugType() 
    {
        return pdrugType;
    }
    public void setPdrugPrescription(String pdrugPrescription) 
    {
        this.pdrugPrescription = pdrugPrescription;
    }

    public String getPdrugPrescription() 
    {
        return pdrugPrescription;
    }
    public void setDrugUnits(String drugUnits) 
    {
        this.drugUnits = drugUnits;
    }

    public String getDrugUnits() 
    {
        return drugUnits;
    }
    public void setDrugPrice(String drugPrice) 
    {
        this.drugPrice = drugPrice;
    }

    public String getDrugPrice() 
    {
        return drugPrice;
    }
    public void setDrugStock(String drugStock) 
    {
        this.drugStock = drugStock;
    }

    public String getDrugStock() 
    {
        return drugStock;
    }
    public void setEarlyWarning(String earlyWarning) 
    {
        this.earlyWarning = earlyWarning;
    }

    public String getEarlyWarning() 
    {
        return earlyWarning;
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
            .append("drugId", getDrugId())
            .append("drugName", getDrugName())
            .append("drugNumber", getDrugNumber())
            .append("drugProduction", getDrugProduction())
            .append("pdrugType", getPdrugType())
            .append("pdrugPrescription", getPdrugPrescription())
            .append("drugUnits", getDrugUnits())
            .append("drugPrice", getDrugPrice())
            .append("drugStock", getDrugStock())
            .append("earlyWarning", getEarlyWarning())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
