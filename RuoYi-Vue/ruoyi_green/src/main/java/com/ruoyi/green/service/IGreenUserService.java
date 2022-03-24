package com.ruoyi.green.service;

import com.ruoyi.green.domain.GreenUser;

import java.util.List;

public interface IGreenUserService {

    List<GreenUser> selectUserList(GreenUser greenUser);

}
