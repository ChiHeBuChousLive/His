package com.ruoyi.green.service.Impl;

import java.util.List;

import com.ruoyi.green.domain.GreenUserEquipment;
import com.ruoyi.green.mapper.GreenUserEquipmentMapper;
import com.ruoyi.green.service.IGreenUserEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 老年人和检测设备关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-30
 */
@Service
public class GreenUserEquipmentServiceImpl implements IGreenUserEquipmentService
{
    @Autowired
    private GreenUserEquipmentMapper greenUserEquipmentMapper;

    /**
     * 查询老年人和检测设备关联
     * 
     * @param userEquipmentRelation 老年人和检测设备关联主键
     * @return 老年人和检测设备关联
     */
    @Override
    public GreenUserEquipment selectGreenUserEquipmentByUserEquipmentRelation(Long userEquipmentRelation)
    {
        return greenUserEquipmentMapper.selectGreenUserEquipmentByUserEquipmentRelation(userEquipmentRelation);
    }

    /**
     * 查询老年人和检测设备关联列表
     * 
     * @param greenUserEquipment 老年人和检测设备关联
     * @return 老年人和检测设备关联
     */
    @Override
    public List<GreenUserEquipment> selectGreenUserEquipmentList(GreenUserEquipment greenUserEquipment)
    {
        return greenUserEquipmentMapper.selectGreenUserEquipmentList(greenUserEquipment);
    }

    /**
     * 新增老年人和检测设备关联
     * 
     * @param greenUserEquipment 老年人和检测设备关联
     * @return 结果
     */
    @Override
    public int insertGreenUserEquipment(GreenUserEquipment greenUserEquipment)
    {
        return greenUserEquipmentMapper.insertGreenUserEquipment(greenUserEquipment);
    }

    /**
     * 修改老年人和检测设备关联
     * 
     * @param greenUserEquipment 老年人和检测设备关联
     * @return 结果
     */
    @Override
    public int updateGreenUserEquipment(GreenUserEquipment greenUserEquipment)
    {
        return greenUserEquipmentMapper.updateGreenUserEquipment(greenUserEquipment);
    }

    /**
     * 批量删除老年人和检测设备关联
     * 
     * @param userEquipmentRelations 需要删除的老年人和检测设备关联主键
     * @return 结果
     */
    @Override
    public int deleteGreenUserEquipmentByUserEquipmentRelations(Long[] userEquipmentRelations)
    {
        return greenUserEquipmentMapper.deleteGreenUserEquipmentByUserEquipmentRelations(userEquipmentRelations);
    }

    /**
     * 删除老年人和检测设备关联信息
     * 
     * @param userEquipmentRelation 老年人和检测设备关联主键
     * @return 结果
     */
    @Override
    public int deleteGreenUserEquipmentByUserEquipmentRelation(Long userEquipmentRelation)
    {
        return greenUserEquipmentMapper.deleteGreenUserEquipmentByUserEquipmentRelation(userEquipmentRelation);
    }
}
