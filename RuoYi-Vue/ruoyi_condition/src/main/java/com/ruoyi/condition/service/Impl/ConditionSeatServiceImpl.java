package com.ruoyi.condition.service.Impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.condition.domain.ConditionSeat;
import com.ruoyi.condition.mapper.ConditionSeatMapper;
import com.ruoyi.condition.service.IConditionSeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 位置信息管理Service业务层处理
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@Service
public class ConditionSeatServiceImpl implements IConditionSeatService
{
    @Autowired
    private ConditionSeatMapper conditionSeatMapper;

    /**
     * 查询位置信息管理
     * 
     * @param seatId 位置信息管理主键
     * @return 位置信息管理
     */
    @Override
    public ConditionSeat selectConditionSeatBySeatId(Long seatId)
    {
        return conditionSeatMapper.selectConditionSeatBySeatId(seatId);
    }

    /**
     * 查询位置信息管理列表
     * 
     * @param conditionSeat 位置信息管理
     * @return 位置信息管理
     */
    @Override
    public List<ConditionSeat> selectConditionSeatList(ConditionSeat conditionSeat)
    {
        return conditionSeatMapper.selectConditionSeatList(conditionSeat);
    }

    /**
     * 新增位置信息管理
     * 
     * @param conditionSeat 位置信息管理
     * @return 结果
     */
    @Override
    public int insertConditionSeat(ConditionSeat conditionSeat)
    {
        conditionSeat.setCreateTime(DateUtils.getNowDate());
        return conditionSeatMapper.insertConditionSeat(conditionSeat);
    }

    /**
     * 修改位置信息管理
     * 
     * @param conditionSeat 位置信息管理
     * @return 结果
     */
    @Override
    public int updateConditionSeat(ConditionSeat conditionSeat)
    {
        conditionSeat.setUpdateTime(DateUtils.getNowDate());
        return conditionSeatMapper.updateConditionSeat(conditionSeat);
    }

    /**
     * 批量删除位置信息管理
     * 
     * @param seatIds 需要删除的位置信息管理主键
     * @return 结果
     */
    @Override
    public int deleteConditionSeatBySeatIds(Long[] seatIds)
    {
        return conditionSeatMapper.deleteConditionSeatBySeatIds(seatIds);
    }

    /**
     * 删除位置信息管理信息
     * 
     * @param seatId 位置信息管理主键
     * @return 结果
     */
    @Override
    public int deleteConditionSeatBySeatId(Long seatId)
    {
        return conditionSeatMapper.deleteConditionSeatBySeatId(seatId);
    }
}
