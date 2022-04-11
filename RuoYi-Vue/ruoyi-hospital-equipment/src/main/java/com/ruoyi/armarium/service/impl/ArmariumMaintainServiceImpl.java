package com.ruoyi.armarium.service.impl;

import java.util.List;

import com.ruoyi.armarium.domain.Armarium;
import com.ruoyi.armarium.domain.ArmariumMaintain;
import com.ruoyi.armarium.domain.ArmariumToMaintain;
import com.ruoyi.armarium.mapper.ArmariumMaintainMapper;
import com.ruoyi.armarium.mapper.ArmariumToMaintainMapper;
import com.ruoyi.armarium.service.IArmariumMaintainService;
import com.ruoyi.armarium.service.IArmariumService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 医疗设备维修Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
@Service
public class ArmariumMaintainServiceImpl implements IArmariumMaintainService
{
    @Autowired
    private ArmariumMaintainMapper armariumMaintainMapper;


    @Autowired
    private ArmariumToMaintainMapper armariumToMaintainMapper;

    @Autowired
    private IArmariumService iArmariumService;

    /**
     * 查询医疗设备维修
     * 
     * @param maintainId 医疗设备维修主键
     * @return 医疗设备维修
     */
    @Override
    public ArmariumMaintain selectArmariumMaintainByMaintainId(Long maintainId)
    {

        return armariumMaintainMapper.selectArmariumMaintainByMaintainId(maintainId);
    }

    @Override
    public Long selectLastArmariumId() {
        return armariumMaintainMapper.selectLastArmariumId();
    }

    /**
     * 查询医疗设备维修列表
     * 
     * @param armariumMaintain 医疗设备维修
     * @return 医疗设备维修
     */
    @Override
    public List<ArmariumMaintain> selectArmariumMaintainList(ArmariumMaintain armariumMaintain)
    {
        List<ArmariumMaintain> armariumMaintains = armariumMaintainMapper.selectArmariumMaintainList(armariumMaintain);
        for(ArmariumMaintain maintain:armariumMaintains){
            ArmariumToMaintain armariumToMaintain = armariumToMaintainMapper.selectArmariumToMaintainByMaintainId(maintain.getMaintainId());
//            ArmariumToMaintain armariumToMaintain = armariumToMaintainMapper.selectArmariumToMaintainByProductionId(maintain.getMaintainId());
            Armarium armarium = iArmariumService.selectArmariumByArmariumId(armariumToMaintain.getArmariumId());
            maintain.setArmariumId(armarium.getArmariumId());
        }

        return armariumMaintains;
    }

    /**
     * 新增医疗设备维修
     * 
     * @param armariumMaintain 医疗设备维修
     * @return 结果
     */
    @Override
    public int insertArmariumMaintain(ArmariumMaintain armariumMaintain)
    {
        armariumMaintainMapper.insertArmariumMaintain(armariumMaintain);
        Long aLong = armariumMaintainMapper.selectLastArmariumId();
        armariumMaintain.setCreateTime(DateUtils.getNowDate());
//        System.out.println(armariumMaintain);
        ArmariumToMaintain armariumToMaintain = new ArmariumToMaintain();
        armariumToMaintain.setArmariumId(armariumMaintain.getArmariumId());
        armariumToMaintain.setMaintainId(aLong);
        int i = armariumToMaintainMapper.insertArmariumToMaintain(armariumToMaintain);

        return i;

    }

    /**
     * 修改医疗设备维修
     * 
     * @param armariumMaintain 医疗设备维修
     * @return 结果
     */
    @Override
    public int updateArmariumMaintain(ArmariumMaintain armariumMaintain)
    {
        armariumMaintain.setUpdateTime(DateUtils.getNowDate());
        return armariumMaintainMapper.updateArmariumMaintain(armariumMaintain);
    }

    /**
     * 批量删除医疗设备维修
     * 
     * @param maintainIds 需要删除的医疗设备维修主键
     * @return 结果
     */
    @Override
    public int deleteArmariumMaintainByMaintainIds(Long[] maintainIds)
    {
        return armariumMaintainMapper.deleteArmariumMaintainByMaintainIds(maintainIds);
    }

    /**
     * 删除医疗设备维修信息
     * 
     * @param maintainId 医疗设备维修主键
     * @return 结果
     */
    @Override
    public int deleteArmariumMaintainByMaintainId(Long maintainId)
    {
        return armariumMaintainMapper.deleteArmariumMaintainByMaintainId(maintainId);
    }
}
