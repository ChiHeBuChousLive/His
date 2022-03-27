package com.ruoyi.condition.mapper;

import com.ruoyi.condition.domain.ConditionEquipment;

import java.util.List;


/**
 * 设备Mapper接口
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
public interface ConditionEquipmentMapper 
{
    /**
     * 查询设备
     * 
     * @param equipmentId 设备主键
     * @return 设备
     */
    public ConditionEquipment selectConditionEquipmentByEquipmentId(Long equipmentId);

    /**
     * 查询设备列表
     * 
     * @param conditionEquipment 设备
     * @return 设备集合
     */
    public List<ConditionEquipment> selectConditionEquipmentList(ConditionEquipment conditionEquipment);

    /**
     * 新增设备
     * 
     * @param conditionEquipment 设备
     * @return 结果
     */
    public int insertConditionEquipment(ConditionEquipment conditionEquipment);

    /**
     * 修改设备
     * 
     * @param conditionEquipment 设备
     * @return 结果
     */
    public int updateConditionEquipment(ConditionEquipment conditionEquipment);

    /**
     * 删除设备
     * 
     * @param equipmentId 设备主键
     * @return 结果
     */
    public int deleteConditionEquipmentByEquipmentId(Long equipmentId);

    /**
     * 批量删除设备
     * 
     * @param equipmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteConditionEquipmentByEquipmentIds(Long[] equipmentIds);
}
