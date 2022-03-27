package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysClinic;

/**
 * 门诊管理Mapper接口
 * 
 * @author zhezhi
 * @date 2022-03-25
 */
public interface SysClinicMapper 
{
    /**
     * 查询门诊管理
     * 
     * @param clinicId 门诊管理主键
     * @return 门诊管理
     */
    public SysClinic selectSysClinicByClinicId(Long clinicId);

    /**
     * 查询门诊管理列表
     * 
     * @param sysClinic 门诊管理
     * @return 门诊管理集合
     */
    public List<SysClinic> selectSysClinicList(SysClinic sysClinic);

    /**
     * 新增门诊管理
     * 
     * @param sysClinic 门诊管理
     * @return 结果
     */
    public int insertSysClinic(SysClinic sysClinic);

    /**
     * 修改门诊管理
     * 
     * @param sysClinic 门诊管理
     * @return 结果
     */
    public int updateSysClinic(SysClinic sysClinic);

    /**
     * 删除门诊管理
     * 
     * @param clinicId 门诊管理主键
     * @return 结果
     */
    public int deleteSysClinicByClinicId(Long clinicId);

    /**
     * 批量删除门诊管理
     * 
     * @param clinicIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysClinicByClinicIds(Long[] clinicIds);
}
