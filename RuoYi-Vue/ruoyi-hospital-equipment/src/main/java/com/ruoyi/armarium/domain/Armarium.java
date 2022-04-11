package com.ruoyi.armarium.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医疗设备对象 armarium
 * 
 * @author zhezhi
 * @date 2022-04-11
 */
public class Armarium extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long armariumId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String armariumName;

    /** 设备类型（0硬件1软件） */
    @Excel(name = "设备类型", readConverterExp = "0=硬件1软件")
    private String armariumTpye;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String armariumModels;

    /** 安装位置 */
    @Excel(name = "安装位置")
    private String armariumLocation;

    /** 负责人 */
    @Excel(name = "负责人")
    private String armariumLeader;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String clinicPhone;

    /** 状态（0正常;1停用,2报修,4故障） */
    @Excel(name = "状态", readConverterExp = "0=正常;1停用,2报修,4故障")
    private String status;

    public void setArmariumId(Long armariumId) 
    {
        this.armariumId = armariumId;
    }

    public Long getArmariumId() 
    {
        return armariumId;
    }
    public void setArmariumName(String armariumName) 
    {
        this.armariumName = armariumName;
    }

    public String getArmariumName() 
    {
        return armariumName;
    }
    public void setArmariumTpye(String armariumTpye) 
    {
        this.armariumTpye = armariumTpye;
    }

    public String getArmariumTpye() 
    {
        return armariumTpye;
    }
    public void setArmariumModels(String armariumModels) 
    {
        this.armariumModels = armariumModels;
    }

    public String getArmariumModels() 
    {
        return armariumModels;
    }
    public void setArmariumLocation(String armariumLocation) 
    {
        this.armariumLocation = armariumLocation;
    }

    public String getArmariumLocation() 
    {
        return armariumLocation;
    }
    public void setArmariumLeader(String armariumLeader) 
    {
        this.armariumLeader = armariumLeader;
    }

    public String getArmariumLeader() 
    {
        return armariumLeader;
    }
    public void setClinicPhone(String clinicPhone) 
    {
        this.clinicPhone = clinicPhone;
    }

    public String getClinicPhone() 
    {
        return clinicPhone;
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
            .append("armariumId", getArmariumId())
            .append("armariumName", getArmariumName())
            .append("armariumTpye", getArmariumTpye())
            .append("armariumModels", getArmariumModels())
            .append("armariumLocation", getArmariumLocation())
            .append("armariumLeader", getArmariumLeader())
            .append("clinicPhone", getClinicPhone())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
