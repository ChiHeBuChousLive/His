package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 门诊管理对象 sys_clinic
 * 
 * @author zhezhi
 * @date 2022-03-25
 */
public class SysClinic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 诊所ID */
    private Long clinicId;

    /** 诊所名称 */
    @Excel(name = "诊所名称")
    private String clinicName;

    /** 诊所位置 */
    @Excel(name = "诊所位置")
    private String clinicLocation;

    /** 负责人 */
    @Excel(name = "负责人")
    private String clinicLeader;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String clinicPhone;

    /** 状态（0正常;1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常;1停用")
    private String status;

    /** 经纬度坐标 */
    @Excel(name = "经纬度坐标")
    private String coordinate;

    public void setClinicId(Long clinicId) 
    {
        this.clinicId = clinicId;
    }

    public Long getClinicId() 
    {
        return clinicId;
    }
    public void setClinicName(String clinicName) 
    {
        this.clinicName = clinicName;
    }

    public String getClinicName() 
    {
        return clinicName;
    }
    public void setClinicLocation(String clinicLocation) 
    {
        this.clinicLocation = clinicLocation;
    }

    public String getClinicLocation()
    {
        return clinicLocation;
    }

    public String getClinicLeader() {
        return clinicLeader;
    }

    public void setClinicLeader(String clinicLeader) {
        this.clinicLeader = clinicLeader;
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
    public void setCoordinate(String coordinate) 
    {
        this.coordinate = coordinate;
    }

    public String getCoordinate() 
    {
        return coordinate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("clinicId", getClinicId())
            .append("clinicName", getClinicName())
            .append("clinicLocation", getClinicLocation())
            .append("clinicleader", getClinicLeader())
            .append("clinicPhone", getClinicPhone())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("coordinate", getCoordinate())
            .toString();
    }
}
