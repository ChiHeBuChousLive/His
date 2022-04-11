package com.ruoyi.armarium.mapper;

import com.ruoyi.armarium.domain.ArmariumMaintain;

import java.util.List;


/**
 * 医疗设备维修Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public interface ArmariumMaintainMapper 
{
    /**
     * 查询医疗设备维修
     * 
     * @param maintainId 医疗设备维修主键
     * @return 医疗设备维修
     */
    public ArmariumMaintain selectArmariumMaintainByMaintainId(Long maintainId);


    /**
     * 查询最新ID
     * @return
     */
    public Long selectLastArmariumId();


    /**
     * 查询医疗设备维修列表
     * 
     * @param armariumMaintain 医疗设备维修
     * @return 医疗设备维修集合
     */
    public List<ArmariumMaintain> selectArmariumMaintainList(ArmariumMaintain armariumMaintain);

    /**
     * 新增医疗设备维修
     * 
     * @param armariumMaintain 医疗设备维修
     * @return 结果
     */
    public int insertArmariumMaintain(ArmariumMaintain armariumMaintain);

    /**
     * 修改医疗设备维修
     * 
     * @param armariumMaintain 医疗设备维修
     * @return 结果
     */
    public int updateArmariumMaintain(ArmariumMaintain armariumMaintain);

    /**
     * 删除医疗设备维修
     * 
     * @param maintainId 医疗设备维修主键
     * @return 结果
     */
    public int deleteArmariumMaintainByMaintainId(Long maintainId);

    /**
     * 批量删除医疗设备维修
     * 
     * @param maintainIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArmariumMaintainByMaintainIds(Long[] maintainIds);
}
