package com.ruoyi.green.service.Impl;

import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.mapper.GreenUserMapper;
import com.ruoyi.green.service.IGreenUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GreenUserServiceImpl implements IGreenUserService {

    @Autowired
    private GreenUserMapper  greenUserMapper;

    @Override
    public List<GreenUser> selectUserList(GreenUser greenUser) {
        return greenUserMapper.selectUserList(greenUser);
    }
}
