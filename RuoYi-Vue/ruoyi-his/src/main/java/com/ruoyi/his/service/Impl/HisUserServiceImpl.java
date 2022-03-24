package com.ruoyi.his.service.Impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.his.domain.HisUser;
import com.ruoyi.his.mapper.HisUserMapper;
import com.ruoyi.his.service.IHisUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HisUserServiceImpl implements IHisUserService {
        @Autowired
        private HisUserMapper hisUserMapper;

        /**
         * 查询His用户信息
         *
         * @param userId His用户信息主键
         * @return His用户信息
         */
        @Override
        public HisUser selectHisUserByUserId(Long userId)
        {
            return hisUserMapper.selectHisUserByUserId(userId);
        }

        /**
         * 查询His用户信息列表
         *
         * @param hisUser His用户信息
         * @return His用户信息
         */
        @Override
        public List<HisUser> selectHisUserList(HisUser hisUser)
        {
            return hisUserMapper.selectHisUserList(hisUser);
        }

        /**
         * 新增His用户信息
         *
         * @param hisUser His用户信息
         * @return 结果
         */
        @Override
        public int insertHisUser(HisUser hisUser)
        {
            hisUser.setCreateTime(DateUtils.getNowDate());
            return hisUserMapper.insertHisUser(hisUser);
        }

        /**
         * 修改His用户信息
         *
         * @param hisUser His用户信息
         * @return 结果
         */
        @Override
        public int updateHisUser(HisUser hisUser)
        {
            hisUser.setUpdateTime(DateUtils.getNowDate());
            return hisUserMapper.updateHisUser(hisUser);
        }

        /**
         * 批量删除His用户信息
         *
         * @param userIds 需要删除的His用户信息主键
         * @return 结果
         */
        @Override
        public int deleteHisUserByUserIds(Long[] userIds)
        {
            return hisUserMapper.deleteHisUserByUserIds(userIds);
        }

        /**
         * 删除His用户信息信息
         *
         * @param userId His用户信息主键
         * @return 结果
         */
        @Override
        public int deleteHisUserByUserId(Long userId)
        {
            return hisUserMapper.deleteHisUserByUserId(userId);
        }

}
