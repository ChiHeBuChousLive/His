package com.ruoyi.green.mapper;

import com.ruoyi.green.domain.GreenUser;

import java.util.List;

public interface GreenUserMapper {

    List<GreenUser> selectUserList(GreenUser greenUser);


    int  insertUser(GreenUser greenUser);

    /**
     * 删除单个科室
     * @param deptId
     * @return
     */
    public int deleteUserById(Long deptId);

    /***
     * 批量删除科室
     * @param deptIds
     * @return
     */
    public int deleteUserByIds(Long[] deptIds);


    GreenUser selectUserById(Long deptId);

    public int updateUser(GreenUser greenUser);
}
