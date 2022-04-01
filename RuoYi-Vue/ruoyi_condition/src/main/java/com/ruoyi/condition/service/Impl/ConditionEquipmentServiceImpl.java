package com.ruoyi.condition.service.Impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.condition.domain.ConditionEquipment;
import com.ruoyi.condition.mapper.ConditionEquipmentMapper;
import com.ruoyi.condition.service.IConditionEquipmentService;
import com.ruoyi.green.domain.GreenUserEquipment;
import com.ruoyi.green.service.IGreenUserEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-27
 */
@Service
public class ConditionEquipmentServiceImpl implements IConditionEquipmentService
{
    @Autowired
    private ConditionEquipmentMapper conditionEquipmentMapper;

    @Autowired
    private IGreenUserEquipmentService iGreenUserEquipmentService;

    /**
     * 查询设备
     * 
     * @param equipmentId 设备主键
     * @return 设备
     */
    @Override
    public ConditionEquipment selectConditionEquipmentByEquipmentId(Long equipmentId)
    {
        return conditionEquipmentMapper.selectConditionEquipmentByEquipmentId(equipmentId);
    }

    /**
     * 查询设备列表
     * 
     * @param conditionEquipment 设备
     * @return 设备
     */
    @Override
    public List<ConditionEquipment> selectConditionEquipmentList(ConditionEquipment conditionEquipment)
    {
        return conditionEquipmentMapper.selectConditionEquipmentList(conditionEquipment);
    }

    /**
     * 新增设备,新增设备并关联老人(当前配置新增设备必须关联老人Id)
     * 
     * @param conditionEquipment 设备
     * @return 结果
     */
    @Override
    public int insertConditionEquipment(ConditionEquipment conditionEquipment)
    {
        conditionEquipment.setCreateTime(DateUtils.getNowDate());
        int i = conditionEquipmentMapper.insertConditionEquipment(conditionEquipment);
        if (i>0){
            ConditionEquipment conditionEquipment1 = conditionEquipmentMapper.selectLastEquipment();
            Long oldId = conditionEquipment.getOldId();
            Long equipmentId = conditionEquipment1.getEquipmentId();
            GreenUserEquipment greenUserEquipment = new GreenUserEquipment();
            greenUserEquipment.setOldId(oldId);
            greenUserEquipment.setEquipmentId(equipmentId);
            iGreenUserEquipmentService.insertGreenUserEquipment(greenUserEquipment);
        }
        return i;
    }

    /**
     * 修改设备
     * 
     * @param conditionEquipment 设备
     * @return 结果
     */
    @Override
    public int updateConditionEquipment(ConditionEquipment conditionEquipment)
    {
        conditionEquipment.setUpdateTime(DateUtils.getNowDate());
        return conditionEquipmentMapper.updateConditionEquipment(conditionEquipment);
    }

    /**
     * 批量删除设备
     * 
     * @param equipmentIds 需要删除的设备主键
     * @return 结果
     */
    @Override
    public int deleteConditionEquipmentByEquipmentIds(Long[] equipmentIds)
    {
        return conditionEquipmentMapper.deleteConditionEquipmentByEquipmentIds(equipmentIds);
    }

    /**
     * 删除设备信息
     * 
     * @param equipmentId 设备主键
     * @return 结果
     */
    @Override
    public int deleteConditionEquipmentByEquipmentId(Long equipmentId)
    {
        return conditionEquipmentMapper.deleteConditionEquipmentByEquipmentId(equipmentId);
    }

    @Override
    public int insertEquipmentInference(Long Ip, String message) {
        return 0;
    }
}
