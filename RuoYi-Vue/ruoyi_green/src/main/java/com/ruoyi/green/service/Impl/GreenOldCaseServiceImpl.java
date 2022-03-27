package com.ruoyi.green.service.Impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.green.domain.GreenOldCase;
import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.domain.CaseUserVo;
import com.ruoyi.green.domain.GreenUserCase;
import com.ruoyi.green.mapper.GreenOldCaseMapper;
import com.ruoyi.green.mapper.GreenUserMapper;
import com.ruoyi.green.mapper.GreenOldUserCaseMapper;
import com.ruoyi.green.service.IGreenOldCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 病例管理Service业务层处理
 * 
 * @author zhezhi
 * @date 2022-03-26
 */
@Service
public class GreenOldCaseServiceImpl implements IGreenOldCaseService
{
    @Autowired
    private GreenOldCaseMapper greenOldCaseMapper;

    @Autowired
    private GreenOldUserCaseMapper userOldCaseMapper;

    @Autowired
    private GreenUserMapper greenUserMapper;

    /**
     * 查询病例管理
     * 
     * @param caseId 病例管理主键
     * @return 病例管理
     */
    @Override
    public CaseUserVo selectGreenOldCaseByCaseId(Long caseId)
    {

        GreenUser greenUser = greenUserMapper.selectUserById(userOldCaseMapper.selectUserIdByCaseId(caseId));
        GreenOldCase greenOldCase = greenOldCaseMapper.selectGreenOldCaseByCaseId(caseId);
//
        CaseUserVo caseUserVo = new CaseUserVo();
        caseUserVo.setOldName(greenUser.getOldName());
        caseUserVo.setCaseId(greenOldCase.getCaseId());
        caseUserVo.setDiabetes(greenOldCase.getDiabetes());
        caseUserVo.setCancer(greenOldCase.getCancer());
        caseUserVo.setGeneticDisease(greenOldCase.getGeneticDisease());
        caseUserVo.setHeartDisease(greenOldCase.getHeartDisease());

        return caseUserVo;
    }

    /**
     * 查询病例管理列表
     * 
     * @param greenOldCase 病例管理
     * @return 病例管理
     */
    @Override
    public List<GreenOldCase> selectGreenOldCaseList(GreenOldCase greenOldCase)
    {
        List<GreenOldCase> greenOldCases = greenOldCaseMapper.selectGreenOldCaseList(greenOldCase);
        List<GreenOldCase> list = new ArrayList<>();
        for(GreenOldCase cases:greenOldCases){
            Long caseId = cases.getCaseId();
            GreenUser greenUser = greenUserMapper.selectUserById(userOldCaseMapper.selectUserIdByCaseId(caseId));
            cases.setOldName(greenUser.getOldName());
            list.add(cases);
        }

        return list;
    }

    /**
     * 新增病例管理
     * 
     * @param greenOldCase 病例管理
     * @return 结果
     */
    @Override
    public int insertGreenOldCase(GreenOldCase greenOldCase)
    {
        GreenUserCase greenUserCase = new GreenUserCase();
        List<GreenUserCase> list = new ArrayList<>();
        greenUserCase.setCaseId(greenOldCase.getCaseId());
        greenUserCase.setOldId(greenOldCase.getOldId());
        list.add(greenUserCase);
        userOldCaseMapper.batchUserCase(list);

        greenOldCase.setCreateTime(DateUtils.getNowDate());
        return greenOldCaseMapper.insertGreenOldCase(greenOldCase);
    }

    /**
     * 修改病例管理
     * 
     * @param greenOldCase 病例管理
     * @return 结果
     */
    @Override
    public int updateGreenOldCase(GreenOldCase greenOldCase)
    {
        greenOldCase.setUpdateTime(DateUtils.getNowDate());
        return greenOldCaseMapper.updateGreenOldCase(greenOldCase);
    }

    /**
     * 批量删除病例管理
     * 
     * @param caseIds 需要删除的病例管理主键
     * @return 结果
     */
    @Override
    public int deleteGreenOldCaseByCaseIds(Long[] caseIds)
    {
        return greenOldCaseMapper.deleteGreenOldCaseByCaseIds(caseIds);
    }

    /**
     * 删除病例管理信息
     * 
     * @param caseId 病例管理主键
     * @return 结果
     */
    @Override
    public int deleteGreenOldCaseByCaseId(Long caseId)
    {
        return greenOldCaseMapper.deleteGreenOldCaseByCaseId(caseId);
    }
}
