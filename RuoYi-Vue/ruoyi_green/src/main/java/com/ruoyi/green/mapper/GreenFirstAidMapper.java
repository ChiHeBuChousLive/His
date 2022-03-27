package com.ruoyi.green.mapper;

import java.util.List;
import com.ruoyi.green.domain.GreenFirstAid;

/**
 * 紧急救治（关联病历与药物）Mapper接口
 * 
 * @author ruoyi
 * @date 2022-03-27
 */
public interface GreenFirstAidMapper 
{
    /**
     * 查询紧急救治（关联病历与药物）
     * 
     * @param aidId 紧急救治（关联病历与药物）主键
     * @return 紧急救治（关联病历与药物）
     */
    public GreenFirstAid selectGreenFirstAidByAidId(Long aidId);

    /**
     * 查询紧急救治（关联病历与药物）列表
     * 
     * @param greenFirstAid 紧急救治（关联病历与药物）
     * @return 紧急救治（关联病历与药物）集合
     */
    public List<GreenFirstAid> selectGreenFirstAidList(GreenFirstAid greenFirstAid);

    /**
     * 新增紧急救治（关联病历与药物）
     * 
     * @param greenFirstAid 紧急救治（关联病历与药物）
     * @return 结果
     */
    public int insertGreenFirstAid(GreenFirstAid greenFirstAid);

    /**
     * 修改紧急救治（关联病历与药物）
     * 
     * @param greenFirstAid 紧急救治（关联病历与药物）
     * @return 结果
     */
    public int updateGreenFirstAid(GreenFirstAid greenFirstAid);

    /**
     * 删除紧急救治（关联病历与药物）
     * 
     * @param aidId 紧急救治（关联病历与药物）主键
     * @return 结果
     */
    public int deleteGreenFirstAidByAidId(Long aidId);

    /**
     * 批量删除紧急救治（关联病历与药物）
     * 
     * @param aidIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGreenFirstAidByAidIds(Long[] aidIds);
}
