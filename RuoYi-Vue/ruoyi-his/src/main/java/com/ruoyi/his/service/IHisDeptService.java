package com.ruoyi.his.service;

import com.ruoyi.his.domain.HisDept;

import java.util.List;

public interface IHisDeptService {


    /**
     * 查询全部科室
     * @param hisDept
     * @return
     */
    public List<HisDept> selectHisDeptList(HisDept hisDept);

    /**
     * 增加科室
     * @param hisDept
     * @return
     */
    public int insertDept(HisDept hisDept);


    /**
     * 删除单个...空闲了
     * @param deptId
     * @return
     */
    public int deleteDeptById(Long deptId);

    /**
     * 批量删除科室
     * @param deptIds
     * @return
     */
    public int deleteDeptByIds(Long[] deptIds);


    public HisDept selectDeptById(Long deptId);

    public int updateDept(HisDept hisDept);
}
