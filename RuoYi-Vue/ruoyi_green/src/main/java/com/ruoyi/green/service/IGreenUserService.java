package com.ruoyi.green.service;

import com.ruoyi.green.domain.GreenUser;

import java.util.List;

/**
 * 绿色通道管理Service接口
 *
 * @author zhezhi
 * @date 2022-03-23
 */
public interface IGreenUserService {

    List<GreenUser> selectUserList(GreenUser greenUser);

    public int insertUser(GreenUser greenUser);


    /**
     * 删除单个...空闲了
     * @param UserId
     * @return
     */
    public int deleteUserById(Long UserId);

    /**
     * 批量删除科室
     * @param UserIds
     * @return
     */
    public int deleteUserByIds(Long[] UserIds);


    public GreenUser selectUserById(Long UserId);

    public int updateUser(GreenUser greenUser);
    
}
