package com.ruoyi.his.service;

import java.util.List;
import com.ruoyi.his.domain.HisUser;

/**
 * His用户信息Service接口
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
public interface IHisUserService 
{
    /**
     * 查询His用户信息
     * 
     * @param userId His用户信息主键
     * @return His用户信息
     */
    public HisUser selectHisUserByUserId(Long userId);

    /**
     * 查询His用户信息列表
     * 
     * @param hisUser His用户信息
     * @return His用户信息集合
     */
    public List<HisUser> selectHisUserList(HisUser hisUser);

    /**
     * 新增His用户信息
     * 
     * @param hisUser His用户信息
     * @return 结果
     */
    public int insertHisUser(HisUser hisUser);

    /**
     * 修改His用户信息
     * 
     * @param hisUser His用户信息
     * @return 结果
     */
    public int updateHisUser(HisUser hisUser);

    /**
     * 批量删除His用户信息
     * 
     * @param userIds 需要删除的His用户信息主键集合
     * @return 结果
     */
    public int deleteHisUserByUserIds(Long[] userIds);

    /**
     * 删除His用户信息信息
     * 
     * @param userId His用户信息主键
     * @return 结果
     */
    public int deleteHisUserByUserId(Long userId);
}
