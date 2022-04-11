package com.ruoyi.armarium.mapper;

import com.ruoyi.armarium.domain.ArmariumToMaintain;

import java.util.List;


/**
 * 设备与维修信息关联Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public interface ArmariumToMaintainMapper 
{
    /**
     * 查询设备与维修信息关联
     * 
     * @param amId 设备与维修信息关联主键
     * @return 设备与维修信息关联
     */
    public ArmariumToMaintain selectArmariumToMaintainByAmId(Long amId);


    public ArmariumToMaintain selectArmariumToMaintainByMaintainId(Long maintainId);

    public ArmariumToMaintain selectArmariumToMaintainByArmariumId(Long armariumId);

    /**
     * 查询设备与维修信息关联列表
     * 
     * @param armariumToMaintain 设备与维修信息关联
     * @return 设备与维修信息关联集合
     */
    public List<ArmariumToMaintain> selectArmariumToMaintainList(ArmariumToMaintain armariumToMaintain);

    /**
     * 新增设备与维修信息关联
     * 
     * @param armariumToMaintain 设备与维修信息关联
     * @return 结果
     */
    public int insertArmariumToMaintain(ArmariumToMaintain armariumToMaintain);

    /**
     * 修改设备与维修信息关联
     * 
     * @param armariumToMaintain 设备与维修信息关联
     * @return 结果
     */
    public int updateArmariumToMaintain(ArmariumToMaintain armariumToMaintain);

    /**
     * 删除设备与维修信息关联
     * 
     * @param amId 设备与维修信息关联主键
     * @return 结果
     */
    public int deleteArmariumToMaintainByAmId(Long amId);

    /**
     * 批量删除设备与维修信息关联
     * 
     * @param amIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArmariumToMaintainByAmIds(Long[] amIds);
}
