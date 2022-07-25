package com.ruoyi.net.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 进销供应商对象 net_supplier
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
public class NetSupplier extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 供应商ID */
    private Long supplierId;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 银行卡号 */
    @Excel(name = "银行卡号")
    private String supplierNumber;

    /** 联系人 */
    @Excel(name = "联系人")
    private String supplierLeader;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String supplierPhone;

    /** 地址 */
    @Excel(name = "地址")
    private String supplierLocation;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setSupplierId(Long supplierId) 
    {
        this.supplierId = supplierId;
    }

    public Long getSupplierId() 
    {
        return supplierId;
    }
    public void setSupplierName(String supplierName) 
    {
        this.supplierName = supplierName;
    }

    public String getSupplierName() 
    {
        return supplierName;
    }
    public void setSupplierNumber(String supplierNumber) 
    {
        this.supplierNumber = supplierNumber;
    }

    public String getSupplierNumber() 
    {
        return supplierNumber;
    }
    public void setSupplierLeader(String supplierLeader) 
    {
        this.supplierLeader = supplierLeader;
    }

    public String getSupplierLeader() 
    {
        return supplierLeader;
    }
    public void setSupplierPhone(String supplierPhone) 
    {
        this.supplierPhone = supplierPhone;
    }

    public String getSupplierPhone() 
    {
        return supplierPhone;
    }
    public void setSupplierLocation(String supplierLocation) 
    {
        this.supplierLocation = supplierLocation;
    }

    public String getSupplierLocation() 
    {
        return supplierLocation;
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
            .append("supplierId", getSupplierId())
            .append("supplierName", getSupplierName())
            .append("supplierNumber", getSupplierNumber())
            .append("supplierLeader", getSupplierLeader())
            .append("supplierPhone", getSupplierPhone())
            .append("supplierLocation", getSupplierLocation())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
