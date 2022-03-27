package com.ruoyi.condition.service;

import com.ruoyi.condition.domain.ConditionAlarm;

import java.util.List;


/**
 * 设备警报管理Service接口
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
public interface IConditionAlarmService 
{
    /**
     * 查询设备警报管理
     * 
     * @param alarmId 设备警报管理主键
     * @return 设备警报管理
     */
    public ConditionAlarm selectConditionAlarmByAlarmId(Long alarmId);

    /**
     * 查询设备警报管理列表
     * 
     * @param conditionAlarm 设备警报管理
     * @return 设备警报管理集合
     */
    public List<ConditionAlarm> selectConditionAlarmList(ConditionAlarm conditionAlarm);

    /**
     * 新增设备警报管理
     * 
     * @param conditionAlarm 设备警报管理
     * @return 结果
     */
    public int insertConditionAlarm(ConditionAlarm conditionAlarm);

    /**
     * 修改设备警报管理
     * 
     * @param conditionAlarm 设备警报管理
     * @return 结果
     */
    public int updateConditionAlarm(ConditionAlarm conditionAlarm);

    /**
     * 批量删除设备警报管理
     * 
     * @param alarmIds 需要删除的设备警报管理主键集合
     * @return 结果
     */
    public int deleteConditionAlarmByAlarmIds(Long[] alarmIds);

    /**
     * 删除设备警报管理信息
     * 
     * @param alarmId 设备警报管理主键
     * @return 结果
     */
    public int deleteConditionAlarmByAlarmId(Long alarmId);
}
