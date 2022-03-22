package com.ruoyi.his.service.Impl;

import com.ruoyi.his.domain.HisDept;
import com.ruoyi.his.mapper.HisDeptMapper;
import com.ruoyi.his.service.IHisDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HisDeotServiceImpl implements IHisDeptService {

    @Autowired
    private HisDeptMapper hisDeptMapper;


    @Override
    public List<HisDept> selectHisDeptList(HisDept hisDept) {
        List<HisDept> hisDepts = hisDeptMapper.selectDeptList(hisDept);
        return hisDepts;
    }
}
