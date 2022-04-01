package com.ruoyi.green.service;

import com.ruoyi.green.domain.GreenUserEquipment;

import java.util.List;

/**
 * 老年人和检测设备关联Service接口
 * 
 * @author ruoyi
 * @date 2022-03-30
 */
public interface IGreenUserEquipmentService 
{
    /**
     * 查询老年人和检测设备关联
     * 
     * @param userEquipmentRelation 老年人和检测设备关联主键
     * @return 老年人和检测设备关联
     */
    public GreenUserEquipment selectGreenUserEquipmentByUserEquipmentRelation(Long userEquipmentRelation);

    /**
     * 查询老年人和检测设备关联列表
     * 
     * @param greenUserEquipment 老年人和检测设备关联
     * @return 老年人和检测设备关联集合
     */
    public List<GreenUserEquipment> selectGreenUserEquipmentList(GreenUserEquipment greenUserEquipment);

    /**
     * 新增老年人和检测设备关联
     * 
     * @param greenUserEquipment 老年人和检测设备关联
     * @return 结果
     */
    public int insertGreenUserEquipment(GreenUserEquipment greenUserEquipment);

    /**
     * 修改老年人和检测设备关联
     * 
     * @param greenUserEquipment 老年人和检测设备关联
     * @return 结果
     */
    public int updateGreenUserEquipment(GreenUserEquipment greenUserEquipment);

    /**
     * 批量删除老年人和检测设备关联
     * 
     * @param userEquipmentRelations 需要删除的老年人和检测设备关联主键集合
     * @return 结果
     */
    public int deleteGreenUserEquipmentByUserEquipmentRelations(Long[] userEquipmentRelations);

    /**
     * 删除老年人和检测设备关联信息
     * 
     * @param userEquipmentRelation 老年人和检测设备关联主键
     * @return 结果
     */
    public int deleteGreenUserEquipmentByUserEquipmentRelation(Long userEquipmentRelation);
}
