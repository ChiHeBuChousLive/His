package com.ruoyi.armarium.service.impl;

import java.util.List;

import com.ruoyi.armarium.domain.ArmariumToMaintain;
import com.ruoyi.armarium.mapper.ArmariumToMaintainMapper;
import com.ruoyi.armarium.service.IArmariumToMaintainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 设备与维修信息关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
@Service
public class ArmariumToMaintainServiceImpl implements IArmariumToMaintainService
{
    @Autowired
    private ArmariumToMaintainMapper armariumToMaintainMapper;

    /**
     * 查询设备与维修信息关联
     * 
     * @param amId 设备与维修信息关联主键
     * @return 设备与维修信息关联
     */
    @Override
    public ArmariumToMaintain selectArmariumToMaintainByAmId(Long amId)
    {
        return armariumToMaintainMapper.selectArmariumToMaintainByAmId(amId);
    }

    /**
     * 查询设备与维修信息关联列表
     * 
     * @param armariumToMaintain 设备与维修信息关联
     * @return 设备与维修信息关联
     */
    @Override
    public List<ArmariumToMaintain> selectArmariumToMaintainList(ArmariumToMaintain armariumToMaintain)
    {
        return armariumToMaintainMapper.selectArmariumToMaintainList(armariumToMaintain);
    }

    /**
     * 新增设备与维修信息关联
     * 
     * @param armariumToMaintain 设备与维修信息关联
     * @return 结果
     */
    @Override
    public int insertArmariumToMaintain(ArmariumToMaintain armariumToMaintain)
    {
        return armariumToMaintainMapper.insertArmariumToMaintain(armariumToMaintain);
    }

    /**
     * 修改设备与维修信息关联
     * 
     * @param armariumToMaintain 设备与维修信息关联
     * @return 结果
     */
    @Override
    public int updateArmariumToMaintain(ArmariumToMaintain armariumToMaintain)
    {
        return armariumToMaintainMapper.updateArmariumToMaintain(armariumToMaintain);
    }

    /**
     * 批量删除设备与维修信息关联
     * 
     * @param amIds 需要删除的设备与维修信息关联主键
     * @return 结果
     */
    @Override
    public int deleteArmariumToMaintainByAmIds(Long[] amIds)
    {
        return armariumToMaintainMapper.deleteArmariumToMaintainByAmIds(amIds);
    }

    /**
     * 删除设备与维修信息关联信息
     * 
     * @param amId 设备与维修信息关联主键
     * @return 结果
     */
    @Override
    public int deleteArmariumToMaintainByAmId(Long amId)
    {
        return armariumToMaintainMapper.deleteArmariumToMaintainByAmId(amId);
    }
}
