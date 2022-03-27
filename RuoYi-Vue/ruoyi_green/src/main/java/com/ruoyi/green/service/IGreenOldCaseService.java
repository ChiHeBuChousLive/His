package com.ruoyi.green.service;

import com.ruoyi.green.domain.GreenOldCase;
import com.ruoyi.green.domain.CaseUserVo;

import java.util.List;


/**
 * 病例管理Service接口
 * 
 * @author zhezhi
 * @date 2022-03-26
 */
public interface IGreenOldCaseService 
{
    /**
     * 查询病例管理
     * 
     * @param caseId 病例管理主键
     * @return 病例管理
     */
    public CaseUserVo selectGreenOldCaseByCaseId(Long caseId);

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
     * 批量删除病例管理
     * 
     * @param caseIds 需要删除的病例管理主键集合
     * @return 结果
     */
    public int deleteGreenOldCaseByCaseIds(Long[] caseIds);

    /**
     * 删除病例管理信息
     * 
     * @param caseId 病例管理主键
     * @return 结果
     */
    public int deleteGreenOldCaseByCaseId(Long caseId);


}
