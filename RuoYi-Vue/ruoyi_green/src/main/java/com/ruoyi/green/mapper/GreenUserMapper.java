package com.ruoyi.green.mapper;

import com.ruoyi.green.domain.GreenUser;

import java.util.List;


/**
 * 绿色通道管理接口
 *
 * @author zhezhi
 * @date 2022-03-23
 */
public interface GreenUserMapper {

    List<GreenUser> selectUserList(GreenUser greenUser);


    int  insertUser(GreenUser greenUser);

    /**
     * 删除单个用户
     * @param deptId
     * @return
     */
    public int deleteUserById(Long deptId);

    /***
     * 批量删除用户
     * @param deptIds
     * @return
     */
    public int deleteUserByIds(Long[] deptIds);


    GreenUser selectUserById(Long deptId);

    public int updateUser(GreenUser greenUser);
}
