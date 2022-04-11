package com.ruoyi.armarium.service.impl;

import java.util.List;

import com.ruoyi.armarium.domain.ArmariumUpkeep;
import com.ruoyi.armarium.mapper.ArmariumUpkeepMapper;
import com.ruoyi.armarium.service.IArmariumUpkeepService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 医疗设备保养Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
@Service
public class ArmariumUpkeepServiceImpl implements IArmariumUpkeepService
{
    @Autowired
    private ArmariumUpkeepMapper armariumUpkeepMapper;

    /**
     * 查询医疗设备保养
     * 
     * @param upkeepId 医疗设备保养主键
     * @return 医疗设备保养
     */
    @Override
    public ArmariumUpkeep selectArmariumUpkeepByUpkeepId(Long upkeepId)
    {
        return armariumUpkeepMapper.selectArmariumUpkeepByUpkeepId(upkeepId);
    }

    /**
     * 查询医疗设备保养列表
     * 
     * @param armariumUpkeep 医疗设备保养
     * @return 医疗设备保养
     */
    @Override
    public List<ArmariumUpkeep> selectArmariumUpkeepList(ArmariumUpkeep armariumUpkeep)
    {
        return armariumUpkeepMapper.selectArmariumUpkeepList(armariumUpkeep);
    }

    /**
     * 新增医疗设备保养
     * 
     * @param armariumUpkeep 医疗设备保养
     * @return 结果
     */
    @Override
    public int insertArmariumUpkeep(ArmariumUpkeep armariumUpkeep)
    {
        armariumUpkeep.setCreateTime(DateUtils.getNowDate());
        return armariumUpkeepMapper.insertArmariumUpkeep(armariumUpkeep);
    }

    /**
     * 修改医疗设备保养
     * 
     * @param armariumUpkeep 医疗设备保养
     * @return 结果
     */
    @Override
    public int updateArmariumUpkeep(ArmariumUpkeep armariumUpkeep)
    {
        armariumUpkeep.setUpdateTime(DateUtils.getNowDate());
        return armariumUpkeepMapper.updateArmariumUpkeep(armariumUpkeep);
    }

    /**
     * 批量删除医疗设备保养
     * 
     * @param upkeepIds 需要删除的医疗设备保养主键
     * @return 结果
     */
    @Override
    public int deleteArmariumUpkeepByUpkeepIds(Long[] upkeepIds)
    {
        return armariumUpkeepMapper.deleteArmariumUpkeepByUpkeepIds(upkeepIds);
    }

    /**
     * 删除医疗设备保养信息
     * 
     * @param upkeepId 医疗设备保养主键
     * @return 结果
     */
    @Override
    public int deleteArmariumUpkeepByUpkeepId(Long upkeepId)
    {
        return armariumUpkeepMapper.deleteArmariumUpkeepByUpkeepId(upkeepId);
    }
}
