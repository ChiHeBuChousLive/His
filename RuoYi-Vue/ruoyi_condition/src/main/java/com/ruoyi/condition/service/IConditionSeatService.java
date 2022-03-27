package com.ruoyi.condition.service;

import com.ruoyi.condition.domain.ConditionSeat;

import java.util.List;

/**
 * 位置信息管理Service接口
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
public interface IConditionSeatService 
{
    /**
     * 查询位置信息管理
     * 
     * @param seatId 位置信息管理主键
     * @return 位置信息管理
     */
    public ConditionSeat selectConditionSeatBySeatId(Long seatId);

    /**
     * 查询位置信息管理列表
     * 
     * @param conditionSeat 位置信息管理
     * @return 位置信息管理集合
     */
    public List<ConditionSeat> selectConditionSeatList(ConditionSeat conditionSeat);

    /**
     * 新增位置信息管理
     * 
     * @param conditionSeat 位置信息管理
     * @return 结果
     */
    public int insertConditionSeat(ConditionSeat conditionSeat);

    /**
     * 修改位置信息管理
     * 
     * @param conditionSeat 位置信息管理
     * @return 结果
     */
    public int updateConditionSeat(ConditionSeat conditionSeat);

    /**
     * 批量删除位置信息管理
     * 
     * @param seatIds 需要删除的位置信息管理主键集合
     * @return 结果
     */
    public int deleteConditionSeatBySeatIds(Long[] seatIds);

    /**
     * 删除位置信息管理信息
     * 
     * @param seatId 位置信息管理主键
     * @return 结果
     */
    public int deleteConditionSeatBySeatId(Long seatId);
}
