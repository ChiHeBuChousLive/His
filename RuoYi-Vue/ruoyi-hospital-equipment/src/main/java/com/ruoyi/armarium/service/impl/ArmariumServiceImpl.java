package com.ruoyi.armarium.service.impl;

import java.util.List;

import com.ruoyi.armarium.domain.Armarium;
import com.ruoyi.armarium.mapper.ArmariumMapper;
import com.ruoyi.armarium.service.IArmariumService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 医疗设备Service业务层处理
 * 
 * @author zhezhi
 * @date 2022-04-11
 */
@Service
public class ArmariumServiceImpl implements IArmariumService
{
    @Autowired
    private ArmariumMapper armariumMapper;

    /**
     * 查询医疗设备
     * 
     * @param armariumId 医疗设备主键
     * @return 医疗设备
     */
    @Override
    public Armarium selectArmariumByArmariumId(Long armariumId)
    {
        return armariumMapper.selectArmariumByArmariumId(armariumId);
    }

    /**
     * 查询医疗设备列表
     * 
     * @param armarium 医疗设备
     * @return 医疗设备
     */
    @Override
    public List<Armarium> selectArmariumList(Armarium armarium)
    {
        return armariumMapper.selectArmariumList(armarium);
    }

    /**
     * 新增医疗设备
     * 
     * @param armarium 医疗设备
     * @return 结果
     */
    @Override
    public int insertArmarium(Armarium armarium)
    {
        armarium.setCreateTime(DateUtils.getNowDate());
        return armariumMapper.insertArmarium(armarium);
    }

    /**
     * 修改医疗设备
     * 
     * @param armarium 医疗设备
     * @return 结果
     */
    @Override
    public int updateArmarium(Armarium armarium)
    {
        armarium.setUpdateTime(DateUtils.getNowDate());
        return armariumMapper.updateArmarium(armarium);
    }

    /**
     * 批量删除医疗设备
     * 
     * @param armariumIds 需要删除的医疗设备主键
     * @return 结果
     */
    @Override
    public int deleteArmariumByArmariumIds(Long[] armariumIds)
    {
        return armariumMapper.deleteArmariumByArmariumIds(armariumIds);
    }

    /**
     * 删除医疗设备信息
     * 
     * @param armariumId 医疗设备主键
     * @return 结果
     */
    @Override
    public int deleteArmariumByArmariumId(Long armariumId)
    {
        return armariumMapper.deleteArmariumByArmariumId(armariumId);
    }
}
