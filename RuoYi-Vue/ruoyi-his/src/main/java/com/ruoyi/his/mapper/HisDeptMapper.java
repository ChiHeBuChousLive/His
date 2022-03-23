package com.ruoyi.his.mapper;

import com.ruoyi.his.domain.HisDept;

import java.util.List;

public interface HisDeptMapper {
    /**
     * 查询全部科室
     * @param hisDept
     * @return
     */
    List<HisDept> selectDeptList(HisDept hisDept);

    /**
     * 增加科室
     * @param hisDept
     * @return
     */
    int  insertDept(HisDept hisDept);

    /**
     * 删除单个科室
     * @param deptId
     * @return
     */
    public int deleteDeptById(Long deptId);

    /***
     * 批量删除科室
     * @param deptIds
     * @return
     */
    public int deleteDeptByIds(Long[] deptIds);


    HisDept selectDeptById(Long deptId);

    public int updateDept(HisDept hisDept);

}
