package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysClinicMapper;
import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.system.service.ISysClinicService;

/**
 * 门诊管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-25
 */
@Service
public class SysClinicServiceImpl implements ISysClinicService 
{
    @Autowired
    private SysClinicMapper sysClinicMapper;

    /**
     * 查询门诊管理
     * 
     * @param clinicId 门诊管理主键
     * @return 门诊管理
     */
    @Override
    public SysClinic selectSysClinicByClinicId(Long clinicId)
    {
        return sysClinicMapper.selectSysClinicByClinicId(clinicId);
    }

    /**
     * 查询门诊管理列表
     * 
     * @param sysClinic 门诊管理
     * @return 门诊管理
     */
    @Override
    public List<SysClinic> selectSysClinicList(SysClinic sysClinic)
    {
        return sysClinicMapper.selectSysClinicList(sysClinic);
    }

    /**
     * 新增门诊管理
     * 
     * @param sysClinic 门诊管理
     * @return 结果
     */
    @Override
    public int insertSysClinic(SysClinic sysClinic)
    {
        sysClinic.setCreateTime(DateUtils.getNowDate());
        return sysClinicMapper.insertSysClinic(sysClinic);
    }

    /**
     * 修改门诊管理
     * 
     * @param sysClinic 门诊管理
     * @return 结果
     */
    @Override
    public int updateSysClinic(SysClinic sysClinic)
    {
        sysClinic.setUpdateTime(DateUtils.getNowDate());
        return sysClinicMapper.updateSysClinic(sysClinic);
    }

    /**
     * 批量删除门诊管理
     * 
     * @param clinicIds 需要删除的门诊管理主键
     * @return 结果
     */
    @Override
    public int deleteSysClinicByClinicIds(Long[] clinicIds)
    {
        return sysClinicMapper.deleteSysClinicByClinicIds(clinicIds);
    }

    /**
     * 删除门诊管理信息
     * 
     * @param clinicId 门诊管理主键
     * @return 结果
     */
    @Override
    public int deleteSysClinicByClinicId(Long clinicId)
    {
        return sysClinicMapper.deleteSysClinicByClinicId(clinicId);
    }
}
