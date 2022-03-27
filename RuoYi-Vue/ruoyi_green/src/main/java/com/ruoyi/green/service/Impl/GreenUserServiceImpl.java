package com.ruoyi.green.service.Impl;

import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.mapper.GreenUserMapper;
import com.ruoyi.green.service.IGreenUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 绿色通道6用户Service业务层处理
 *
 * @author zhezhi
 * @date 2022-03-23
 */
@Service
public class GreenUserServiceImpl implements IGreenUserService {

    @Autowired
    private GreenUserMapper  greenUserMapper;

    @Override
    public List<GreenUser> selectUserList(GreenUser greenUser) {
        return greenUserMapper.selectUserList(greenUser);
    }

    @Override
    public int insertUser(GreenUser greenUser) {
        return greenUserMapper.insertUser(greenUser);
    }

    @Override
    public int deleteUserById(Long UserId) {
        return greenUserMapper.deleteUserById(UserId);
    }

    @Override
    public int deleteUserByIds(Long[] UserIds) {
        return greenUserMapper.deleteUserByIds(UserIds);
    }

    @Override
    public GreenUser selectUserById(Long UserId) {
        return greenUserMapper.selectUserById(UserId);
    }

    @Override
    public int updateUser(GreenUser greenUser) {
        return greenUserMapper.updateUser(greenUser);
    }
}
