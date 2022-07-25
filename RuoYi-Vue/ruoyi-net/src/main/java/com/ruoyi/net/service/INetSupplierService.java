package com.ruoyi.net.service;

import java.util.List;
import com.ruoyi.net.domain.NetSupplier;

/**
 * 进销供应商Service接口
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
public interface INetSupplierService 
{
    /**
     * 查询进销供应商
     * 
     * @param supplierId 进销供应商主键
     * @return 进销供应商
     */
    public NetSupplier selectNetSupplierBySupplierId(Long supplierId);

    /**
     * 查询进销供应商列表
     * 
     * @param netSupplier 进销供应商
     * @return 进销供应商集合
     */
    public List<NetSupplier> selectNetSupplierList(NetSupplier netSupplier);

    /**
     * 新增进销供应商
     * 
     * @param netSupplier 进销供应商
     * @return 结果
     */
    public int insertNetSupplier(NetSupplier netSupplier);

    /**
     * 修改进销供应商
     * 
     * @param netSupplier 进销供应商
     * @return 结果
     */
    public int updateNetSupplier(NetSupplier netSupplier);

    /**
     * 批量删除进销供应商
     * 
     * @param supplierIds 需要删除的进销供应商主键集合
     * @return 结果
     */
    public int deleteNetSupplierBySupplierIds(Long[] supplierIds);

    /**
     * 删除进销供应商信息
     * 
     * @param supplierId 进销供应商主键
     * @return 结果
     */
    public int deleteNetSupplierBySupplierId(Long supplierId);
}
