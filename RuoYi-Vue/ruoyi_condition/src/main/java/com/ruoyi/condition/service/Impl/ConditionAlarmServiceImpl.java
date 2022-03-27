package com.ruoyi.condition.service.Impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.condition.domain.ConditionAlarm;
import com.ruoyi.condition.mapper.ConditionAlarmMapper;
import com.ruoyi.condition.service.IConditionAlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备警报管理Service业务层处理
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@Service
public class ConditionAlarmServiceImpl implements IConditionAlarmService
{
    @Autowired
    private ConditionAlarmMapper conditionAlarmMapper;

    /**
     * 查询设备警报管理
     * 
     * @param alarmId 设备警报管理主键
     * @return 设备警报管理
     */
    @Override
    public ConditionAlarm selectConditionAlarmByAlarmId(Long alarmId)
    {
        return conditionAlarmMapper.selectConditionAlarmByAlarmId(alarmId);
    }

    /**
     * 查询设备警报管理列表
     * 
     * @param conditionAlarm 设备警报管理
     * @return 设备警报管理
     */
    @Override
    public List<ConditionAlarm> selectConditionAlarmList(ConditionAlarm conditionAlarm)
    {
        return conditionAlarmMapper.selectConditionAlarmList(conditionAlarm);
    }

    /**
     * 新增设备警报管理
     * 
     * @param conditionAlarm 设备警报管理
     * @return 结果
     */
    @Override
    public int insertConditionAlarm(ConditionAlarm conditionAlarm)
    {
        conditionAlarm.setCreateTime(DateUtils.getNowDate());
        return conditionAlarmMapper.insertConditionAlarm(conditionAlarm);
    }

    /**
     * 修改设备警报管理
     * 
     * @param conditionAlarm 设备警报管理
     * @return 结果
     */
    @Override
    public int updateConditionAlarm(ConditionAlarm conditionAlarm)
    {
        conditionAlarm.setUpdateTime(DateUtils.getNowDate());
        return conditionAlarmMapper.updateConditionAlarm(conditionAlarm);
    }

    /**
     * 批量删除设备警报管理
     * 
     * @param alarmIds 需要删除的设备警报管理主键
     * @return 结果
     */
    @Override
    public int deleteConditionAlarmByAlarmIds(Long[] alarmIds)
    {
        return conditionAlarmMapper.deleteConditionAlarmByAlarmIds(alarmIds);
    }

    /**
     * 删除设备警报管理信息
     * 
     * @param alarmId 设备警报管理主键
     * @return 结果
     */
    @Override
    public int deleteConditionAlarmByAlarmId(Long alarmId)
    {
        return conditionAlarmMapper.deleteConditionAlarmByAlarmId(alarmId);
    }
}
