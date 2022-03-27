package com.ruoyi.green.mapper;

import com.ruoyi.green.domain.GreenOldCase;
import com.ruoyi.green.domain.GreenUserCase;
import java.util.List;

/**
 * 绿色通道与病例管理Mapper接口
 *
 * @author zhezhi
 * @date 2022-03-26
 */

public interface GreenOldUserCaseMapper {

    /**
     * 通过绿色通道用户Id删除用户与病例历史关系
     * @param oldId
     * @return
     */
    public int deleteUserCaseByUserId(Long oldId);

//    /**
//     * 这是个错误方法，不要调用，有逻辑问题
//     * @param oldId
//     * @return
//     */
//    public int countUserCaseByOldId(Long oldId);
//
    /**
     *通过绿色通道用户Id查询病例Id
     * @param oldId
     * @return
     */
    public Long selectCaseIdByUserId(Long oldId);

    /**
     * 通过病例Id查询病例绿色通道用户Id
     * @param caseId
     * @return
     */
    public Long selectUserIdByCaseId(Long caseId);

    /**
     * 批量删除绿色通道用户Id和病例Id关联
     * @param ids
     * @return
     */
    public int deleteUserCase(Long[] ids);

    /**
     * 批量增加绿色通道用户Id和病例Id关联
     * @param greenUserCases
     * @return
     */
    public int batchUserCase(List<GreenUserCase> greenUserCases);



}
