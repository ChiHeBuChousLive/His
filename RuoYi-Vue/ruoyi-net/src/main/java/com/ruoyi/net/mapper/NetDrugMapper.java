package com.ruoyi.net.mapper;

import java.util.List;
import com.ruoyi.net.domain.NetDrug;

/**
 * 进销药品信息维护Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-20
 */
public interface NetDrugMapper 
{
    /**
     * 查询进销药品信息维护
     * 
     * @param drugId 进销药品信息维护主键
     * @return 进销药品信息维护
     */
    public NetDrug selectNetDrugByDrugId(Long drugId);

    /**
     * 查询进销药品信息维护列表
     * 
     * @param netDrug 进销药品信息维护
     * @return 进销药品信息维护集合
     */
    public List<NetDrug> selectNetDrugList(NetDrug netDrug);

    /**
     * 新增进销药品信息维护
     * 
     * @param netDrug 进销药品信息维护
     * @return 结果
     */
    public int insertNetDrug(NetDrug netDrug);

    /**
     * 修改进销药品信息维护
     * 
     * @param netDrug 进销药品信息维护
     * @return 结果
     */
    public int updateNetDrug(NetDrug netDrug);

    /**
     * 删除进销药品信息维护
     * 
     * @param drugId 进销药品信息维护主键
     * @return 结果
     */
    public int deleteNetDrugByDrugId(Long drugId);

    /**
     * 批量删除进销药品信息维护
     * 
     * @param drugIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNetDrugByDrugIds(Long[] drugIds);
}
