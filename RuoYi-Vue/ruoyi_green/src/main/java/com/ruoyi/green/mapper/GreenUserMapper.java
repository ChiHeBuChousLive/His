package com.ruoyi.green.mapper;

import com.ruoyi.green.domain.GreenUser;

import java.util.List;

public interface GreenUserMapper {

    List<GreenUser> selectUserList(GreenUser greenUser);

}
