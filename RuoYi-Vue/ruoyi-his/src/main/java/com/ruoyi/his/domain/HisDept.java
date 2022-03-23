package com.ruoyi.his.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 科室表
 *
 * @author ruoyi
 */
public class HisDept extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Excel(name = "科室ID", cellType = Excel.ColumnType.NUMERIC)
    private Long deptId;

    @Excel(name= "科室名称")
    private String deptName;

    @Excel(name = "科室编号")
    private String deptCode;

    @Excel(name = "挂号数量", cellType = Excel.ColumnType.NUMERIC)
    private Long deptNum;
    @Excel(name = "负责人手机")
    private String deptLeader;
    @Excel(name = "负责人手机号")
    private String deptPhone;
    @Excel(name = "科室状态")
    private String status;

    @Excel(name = "推荐号", cellType = Excel.ColumnType.NUMERIC)
    private int deptSort;


    public int getDeptSort() {
        return deptSort;
    }

    public void setDeptSort(int deptSort) {
        this.deptSort = deptSort;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public Long getDeptNum() {
        return deptNum;
    }

    public void setDeptNum(Long deptNum) {
        this.deptNum = deptNum;
    }

    public String getDeptLeader() {
        return deptLeader;
    }

    public void setDeptLeader(String deptLeader) {
        this.deptLeader = deptLeader;
    }

    public String getDeptPhone() {
        return deptPhone;
    }

    public void setDeptPhone(String deptPhone) {
        this.deptPhone = deptPhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
