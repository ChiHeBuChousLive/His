package com.ruoyi.armarium.service;

import com.ruoyi.armarium.domain.Armarium;

import java.util.List;


/**
 * 医疗设备Service接口
 * 
 * @author zhezhi
 * @date 2022-04-11
 */
public interface IArmariumService 
{
    /**
     * 查询医疗设备
     * 
     * @param armariumId 医疗设备主键
     * @return 医疗设备
     */
    public Armarium selectArmariumByArmariumId(Long armariumId);

    /**
     * 查询医疗设备列表
     * 
     * @param armarium 医疗设备
     * @return 医疗设备集合
     */
    public List<Armarium> selectArmariumList(Armarium armarium);

    /**
     * 新增医疗设备
     * 
     * @param armarium 医疗设备
     * @return 结果
     */
    public int insertArmarium(Armarium armarium);

    /**
     * 修改医疗设备
     * 
     * @param armarium 医疗设备
     * @return 结果
     */
    public int updateArmarium(Armarium armarium);

    /**
     * 批量删除医疗设备
     * 
     * @param armariumIds 需要删除的医疗设备主键集合
     * @return 结果
     */
    public int deleteArmariumByArmariumIds(Long[] armariumIds);

    /**
     * 删除医疗设备信息
     * 
     * @param armariumId 医疗设备主键
     * @return 结果
     */
    public int deleteArmariumByArmariumId(Long armariumId);
}
