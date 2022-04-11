package com.ruoyi.armarium.service;

import com.ruoyi.armarium.domain.ArmariumMaintain;

import java.util.List;

/**
 * 医疗设备维修Service接口
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
public interface IArmariumMaintainService 
{
    /**
     * 查询医疗设备维修
     * 
     * @param maintainId 医疗设备维修主键
     * @return 医疗设备维修
     */
    public ArmariumMaintain selectArmariumMaintainByMaintainId(Long maintainId);


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
     * 批量删除医疗设备维修
     * 
     * @param maintainIds 需要删除的医疗设备维修主键集合
     * @return 结果
     */
    public int deleteArmariumMaintainByMaintainIds(Long[] maintainIds);

    /**
     * 删除医疗设备维修信息
     * 
     * @param maintainId 医疗设备维修主键
     * @return 结果
     */
    public int deleteArmariumMaintainByMaintainId(Long maintainId);
}
