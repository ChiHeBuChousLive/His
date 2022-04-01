package com.ruoyi.green.mapper;

import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.domain.GreenUserEquipment;

import java.util.List;


/**
 * 老年人和检测设备关联Mapper接口
 * 
 * @author ruoyi
 * @date 2022-03-30
 */
public interface GreenUserEquipmentMapper 
{
    /**
     * 查询老年人和检测设备关联
     * 
     * @param userEquipmentRelation 老年人和检测设备关联主键
     * @return 老年人和检测设备关联
     */
    public GreenUserEquipment selectGreenUserEquipmentByUserEquipmentRelation(Long userEquipmentRelation);


    /**
     * 根据设备Id查询关联对象
     * @param equipmentId
     * @return
     */
    public GreenUserEquipment selectGreenUserByEquipmentId(Long equipmentId);


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
     * 删除老年人和检测设备关联
     * 
     * @param userEquipmentRelation 老年人和检测设备关联主键
     * @return 结果
     */
    public int deleteGreenUserEquipmentByUserEquipmentRelation(Long userEquipmentRelation);

    /**
     * 批量删除老年人和检测设备关联
     * 
     * @param userEquipmentRelations 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGreenUserEquipmentByUserEquipmentRelations(Long[] userEquipmentRelations);
}
