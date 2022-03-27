package com.ruoyi.green.service.Impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.green.mapper.GreenFirstAidMapper;
import com.ruoyi.green.domain.GreenFirstAid;
import com.ruoyi.green.service.IGreenFirstAidService;

/**
 * 紧急救治（关联病历与药物）Service业务层处理
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@Service
public class GreenFirstAidServiceImpl implements IGreenFirstAidService 
{
    @Autowired
    private GreenFirstAidMapper greenFirstAidMapper;

    /**
     * 查询紧急救治（关联病历与药物）
     * 
     * @param aidId 紧急救治（关联病历与药物）主键
     * @return 紧急救治（关联病历与药物）
     */
    @Override
    public GreenFirstAid selectGreenFirstAidByAidId(Long aidId)
    {
        return greenFirstAidMapper.selectGreenFirstAidByAidId(aidId);
    }

    /**
     * 查询紧急救治（关联病历与药物）列表
     * 
     * @param greenFirstAid 紧急救治（关联病历与药物）
     * @return 紧急救治（关联病历与药物）
     */
    @Override
    public List<GreenFirstAid> selectGreenFirstAidList(GreenFirstAid greenFirstAid)
    {
        return greenFirstAidMapper.selectGreenFirstAidList(greenFirstAid);
    }

    /**
     * 新增紧急救治（关联病历与药物）
     * 
     * @param greenFirstAid 紧急救治（关联病历与药物）
     * @return 结果
     */
    @Override
    public int insertGreenFirstAid(GreenFirstAid greenFirstAid)
    {
        greenFirstAid.setCreateTime(DateUtils.getNowDate());
        return greenFirstAidMapper.insertGreenFirstAid(greenFirstAid);
    }

    /**
     * 修改紧急救治（关联病历与药物）
     * 
     * @param greenFirstAid 紧急救治（关联病历与药物）
     * @return 结果
     */
    @Override
    public int updateGreenFirstAid(GreenFirstAid greenFirstAid)
    {
        greenFirstAid.setUpdateTime(DateUtils.getNowDate());
        return greenFirstAidMapper.updateGreenFirstAid(greenFirstAid);
    }

    /**
     * 批量删除紧急救治（关联病历与药物）
     * 
     * @param aidIds 需要删除的紧急救治（关联病历与药物）主键
     * @return 结果
     */
    @Override
    public int deleteGreenFirstAidByAidIds(Long[] aidIds)
    {
        return greenFirstAidMapper.deleteGreenFirstAidByAidIds(aidIds);
    }

    /**
     * 删除紧急救治（关联病历与药物）信息
     * 
     * @param aidId 紧急救治（关联病历与药物）主键
     * @return 结果
     */
    @Override
    public int deleteGreenFirstAidByAidId(Long aidId)
    {
        return greenFirstAidMapper.deleteGreenFirstAidByAidId(aidId);
    }
}
