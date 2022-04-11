package com.ruoyi.armarium.mapper;

import com.ruoyi.armarium.domain.ArmariumUpkeep;

import java.util.List;


/**
 * 医疗设备保养Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public interface ArmariumUpkeepMapper 
{
    /**
     * 查询医疗设备保养
     * 
     * @param upkeepId 医疗设备保养主键
     * @return 医疗设备保养
     */
    public ArmariumUpkeep selectArmariumUpkeepByUpkeepId(Long upkeepId);

    /**
     * 查询医疗设备保养列表
     * 
     * @param armariumUpkeep 医疗设备保养
     * @return 医疗设备保养集合
     */
    public List<ArmariumUpkeep> selectArmariumUpkeepList(ArmariumUpkeep armariumUpkeep);

    /**
     * 新增医疗设备保养
     * 
     * @param armariumUpkeep 医疗设备保养
     * @return 结果
     */
    public int insertArmariumUpkeep(ArmariumUpkeep armariumUpkeep);

    /**
     * 修改医疗设备保养
     * 
     * @param armariumUpkeep 医疗设备保养
     * @return 结果
     */
    public int updateArmariumUpkeep(ArmariumUpkeep armariumUpkeep);

    /**
     * 删除医疗设备保养
     * 
     * @param upkeepId 医疗设备保养主键
     * @return 结果
     */
    public int deleteArmariumUpkeepByUpkeepId(Long upkeepId);

    /**
     * 批量删除医疗设备保养
     * 
     * @param upkeepIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArmariumUpkeepByUpkeepIds(Long[] upkeepIds);
}
