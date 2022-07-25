package com.ruoyi.net.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.net.mapper.NetSupplierMapper;
import com.ruoyi.net.domain.NetSupplier;
import com.ruoyi.net.service.INetSupplierService;

/**
 * 进销供应商Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
@Service
public class NetSupplierServiceImpl implements INetSupplierService 
{
    @Autowired
    private NetSupplierMapper netSupplierMapper;

    /**
     * 查询进销供应商
     * 
     * @param supplierId 进销供应商主键
     * @return 进销供应商
     */
    @Override
    public NetSupplier selectNetSupplierBySupplierId(Long supplierId)
    {
        return netSupplierMapper.selectNetSupplierBySupplierId(supplierId);
    }

    /**
     * 查询进销供应商列表
     * 
     * @param netSupplier 进销供应商
     * @return 进销供应商
     */
    @Override
    public List<NetSupplier> selectNetSupplierList(NetSupplier netSupplier)
    {
        return netSupplierMapper.selectNetSupplierList(netSupplier);
    }

    /**
     * 新增进销供应商
     * 
     * @param netSupplier 进销供应商
     * @return 结果
     */
    @Override
    public int insertNetSupplier(NetSupplier netSupplier)
    {
        netSupplier.setCreateTime(DateUtils.getNowDate());
        return netSupplierMapper.insertNetSupplier(netSupplier);
    }

    /**
     * 修改进销供应商
     * 
     * @param netSupplier 进销供应商
     * @return 结果
     */
    @Override
    public int updateNetSupplier(NetSupplier netSupplier)
    {
        netSupplier.setUpdateTime(DateUtils.getNowDate());
        return netSupplierMapper.updateNetSupplier(netSupplier);
    }

    /**
     * 批量删除进销供应商
     * 
     * @param supplierIds 需要删除的进销供应商主键
     * @return 结果
     */
    @Override
    public int deleteNetSupplierBySupplierIds(Long[] supplierIds)
    {
        return netSupplierMapper.deleteNetSupplierBySupplierIds(supplierIds);
    }

    /**
     * 删除进销供应商信息
     * 
     * @param supplierId 进销供应商主键
     * @return 结果
     */
    @Override
    public int deleteNetSupplierBySupplierId(Long supplierId)
    {
        return netSupplierMapper.deleteNetSupplierBySupplierId(supplierId);
    }
}
