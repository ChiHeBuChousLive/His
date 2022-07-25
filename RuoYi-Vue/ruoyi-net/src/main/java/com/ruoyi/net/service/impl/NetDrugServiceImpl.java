package com.ruoyi.net.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.net.mapper.NetDrugMapper;
import com.ruoyi.net.domain.NetDrug;
import com.ruoyi.net.service.INetDrugService;

/**
 * 进销药品信息维护Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
@Service
public class NetDrugServiceImpl implements INetDrugService 
{
    @Autowired
    private NetDrugMapper netDrugMapper;

    /**
     * 查询进销药品信息维护
     * 
     * @param drugId 进销药品信息维护主键
     * @return 进销药品信息维护
     */
    @Override
    public NetDrug selectNetDrugByDrugId(Long drugId)
    {
        return netDrugMapper.selectNetDrugByDrugId(drugId);
    }

    /**
     * 查询进销药品信息维护列表
     * 
     * @param netDrug 进销药品信息维护
     * @return 进销药品信息维护
     */
    @Override
    public List<NetDrug> selectNetDrugList(NetDrug netDrug)
    {
        return netDrugMapper.selectNetDrugList(netDrug);
    }

    /**
     * 新增进销药品信息维护
     * 
     * @param netDrug 进销药品信息维护
     * @return 结果
     */
    @Override
    public int insertNetDrug(NetDrug netDrug)
    {
        netDrug.setCreateTime(DateUtils.getNowDate());
        return netDrugMapper.insertNetDrug(netDrug);
    }

    /**
     * 修改进销药品信息维护
     * 
     * @param netDrug 进销药品信息维护
     * @return 结果
     */
    @Override
    public int updateNetDrug(NetDrug netDrug)
    {
        netDrug.setUpdateTime(DateUtils.getNowDate());
        return netDrugMapper.updateNetDrug(netDrug);
    }

    /**
     * 批量删除进销药品信息维护
     * 
     * @param drugIds 需要删除的进销药品信息维护主键
     * @return 结果
     */
    @Override
    public int deleteNetDrugByDrugIds(Long[] drugIds)
    {
        return netDrugMapper.deleteNetDrugByDrugIds(drugIds);
    }

    /**
     * 删除进销药品信息维护信息
     * 
     * @param drugId 进销药品信息维护主键
     * @return 结果
     */
    @Override
    public int deleteNetDrugByDrugId(Long drugId)
    {
        return netDrugMapper.deleteNetDrugByDrugId(drugId);
    }
}
