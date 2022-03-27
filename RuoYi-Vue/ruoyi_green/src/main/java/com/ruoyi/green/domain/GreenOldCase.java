package com.ruoyi.green.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 病例管理对象 green_old_case
 * 
 * @author kule
 * @date 2022-03-26
 */
public class GreenOldCase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病例Id */
    @Excel(name = "病例Id")
    private Long caseId;

    /** 糖尿病;1代表有，0代表无 */
    @Excel(name = "糖尿病;1代表有，0代表无")
    private String diabetes;

    /** 心脏病;1代表有，0代表无 */
    @Excel(name = "心脏病;1代表有，0代表无")
    private String heartDisease;

    /** 高血压;1代表有，0代表无 */
    @Excel(name = "高血压;1代表有，0代表无")
    private String highBloodPressure;

    /** 遗传病;1代表有，0代表无 */
    @Excel(name = "遗传病;1代表有，0代表无")
    private String geneticDisease;

    /** 癌症;1代表有，0代表无 */
    @Excel(name = "癌症;1代表有，0代表无")
    private String cancer;

    /**用户Id*/
    private Long oldId;

    /**用户姓名*/
    private String oldName;

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getOldId() {
        return oldId;
    }

    public void setOldId(Long oldId) {
        this.oldId = oldId;
    }

    public void setCaseId(Long caseId)
    {
        this.caseId = caseId;
    }

    public Long getCaseId() 
    {
        return caseId;
    }
    public void setDiabetes(String diabetes) 
    {
        this.diabetes = diabetes;
    }

    public String getDiabetes() 
    {
        return diabetes;
    }
    public void setHeartDisease(String heartDisease) 
    {
        this.heartDisease = heartDisease;
    }

    public String getHeartDisease() 
    {
        return heartDisease;
    }
    public void setHighBloodPressure(String highBloodPressure) 
    {
        this.highBloodPressure = highBloodPressure;
    }

    public String getHighBloodPressure() 
    {
        return highBloodPressure;
    }
    public void setGeneticDisease(String geneticDisease) 
    {
        this.geneticDisease = geneticDisease;
    }

    public String getGeneticDisease() 
    {
        return geneticDisease;
    }
    public void setCancer(String cancer) 
    {
        this.cancer = cancer;
    }

    public String getCancer() 
    {
        return cancer;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("caseId", getCaseId())
            .append("diabetes", getDiabetes())
            .append("heartDisease", getHeartDisease())
            .append("highBloodPressure", getHighBloodPressure())
            .append("geneticDisease", getGeneticDisease())
            .append("cancer", getCancer())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
