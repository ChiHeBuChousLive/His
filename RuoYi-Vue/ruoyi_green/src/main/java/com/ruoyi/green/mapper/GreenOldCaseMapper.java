package com.ruoyi.green.mapper;

import com.ruoyi.green.domain.GreenOldCase;

import java.util.List;


/**
 * 病例管理Mapper接口
 * 
 * @author zhezhi
 * @date 2022-03-26
 */
public interface GreenOldCaseMapper 
{
    /**
     * 查询病例管理
     * 
     * @param caseId 病例管理主键
     * @return 病例管理
     */
    public GreenOldCase selectGreenOldCaseByCaseId(Long caseId);

    /**
     * 查询病例管理列表
     * 
     * @param greenOldCase 病例管理
     * @return 病例管理集合
     */
    public List<GreenOldCase> selectGreenOldCaseList(GreenOldCase greenOldCase);

    /**
     * 新增病例管理
     * 
     * @param greenOldCase 病例管理
     * @return 结果
     */
    public int insertGreenOldCase(GreenOldCase greenOldCase);

    /**
     * 修改病例管理
     * 
     * @param greenOldCase 病例管理
     * @return 结果
     */
    public int updateGreenOldCase(GreenOldCase greenOldCase);

    /**
     * 删除病例管理
     * 
     * @param caseId 病例管理主键
     * @return 结果
     */
    public int deleteGreenOldCaseByCaseId(Long caseId);

    /**
     * 批量删除病例管理
     * 
     * @param caseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGreenOldCaseByCaseIds(Long[] caseIds);

    public Long selectUserIdByCaseId(Long caseId);

    public Long selectCaseIdByUserId(Long userId);

    /**
     * 批量删除用户和岗位关联
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserPost(Long[] ids);

}
