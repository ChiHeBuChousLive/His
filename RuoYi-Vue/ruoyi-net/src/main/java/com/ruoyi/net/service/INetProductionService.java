package com.ruoyi.net.service;

import java.util.List;
import com.ruoyi.net.domain.NetProduction;

/**
 * 进销生产厂家Service接口
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
public interface INetProductionService 
{
    /**
     * 查询进销生产厂家
     * 
     * @param productionId 进销生产厂家主键
     * @return 进销生产厂家
     */
    public NetProduction selectNetProductionByProductionId(Long productionId);

    /**
     * 查询进销生产厂家列表
     * 
     * @param netProduction 进销生产厂家
     * @return 进销生产厂家集合
     */
    public List<NetProduction> selectNetProductionList(NetProduction netProduction);

    /**
     * 新增进销生产厂家
     * 
     * @param netProduction 进销生产厂家
     * @return 结果
     */
    public int insertNetProduction(NetProduction netProduction);

    /**
     * 修改进销生产厂家
     * 
     * @param netProduction 进销生产厂家
     * @return 结果
     */
    public int updateNetProduction(NetProduction netProduction);

    /**
     * 批量删除进销生产厂家
     * 
     * @param productionIds 需要删除的进销生产厂家主键集合
     * @return 结果
     */
    public int deleteNetProductionByProductionIds(Long[] productionIds);

    /**
     * 删除进销生产厂家信息
     * 
     * @param productionId 进销生产厂家主键
     * @return 结果
     */
    public int deleteNetProductionByProductionId(Long productionId);
}
