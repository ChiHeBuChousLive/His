package com.ruoyi.net.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.net.mapper.NetProductionMapper;
import com.ruoyi.net.domain.NetProduction;
import com.ruoyi.net.service.INetProductionService;

/**
 * 进销生产厂家Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
@Service
public class NetProductionServiceImpl implements INetProductionService 
{
    @Autowired
    private NetProductionMapper netProductionMapper;

    /**
     * 查询进销生产厂家
     * 
     * @param productionId 进销生产厂家主键
     * @return 进销生产厂家
     */
    @Override
    public NetProduction selectNetProductionByProductionId(Long productionId)
    {
        return netProductionMapper.selectNetProductionByProductionId(productionId);
    }

    /**
     * 查询进销生产厂家列表
     * 
     * @param netProduction 进销生产厂家
     * @return 进销生产厂家
     */
    @Override
    public List<NetProduction> selectNetProductionList(NetProduction netProduction)
    {
        return netProductionMapper.selectNetProductionList(netProduction);
    }

    /**
     * 新增进销生产厂家
     * 
     * @param netProduction 进销生产厂家
     * @return 结果
     */
    @Override
    public int insertNetProduction(NetProduction netProduction)
    {
        netProduction.setCreateTime(DateUtils.getNowDate());
        return netProductionMapper.insertNetProduction(netProduction);
    }

    /**
     * 修改进销生产厂家
     * 
     * @param netProduction 进销生产厂家
     * @return 结果
     */
    @Override
    public int updateNetProduction(NetProduction netProduction)
    {
        netProduction.setUpdateTime(DateUtils.getNowDate());
        return netProductionMapper.updateNetProduction(netProduction);
    }

    /**
     * 批量删除进销生产厂家
     * 
     * @param productionIds 需要删除的进销生产厂家主键
     * @return 结果
     */
    @Override
    public int deleteNetProductionByProductionIds(Long[] productionIds)
    {
        return netProductionMapper.deleteNetProductionByProductionIds(productionIds);
    }

    /**
     * 删除进销生产厂家信息
     * 
     * @param productionId 进销生产厂家主键
     * @return 结果
     */
    @Override
    public int deleteNetProductionByProductionId(Long productionId)
    {
        return netProductionMapper.deleteNetProductionByProductionId(productionId);
    }
}
