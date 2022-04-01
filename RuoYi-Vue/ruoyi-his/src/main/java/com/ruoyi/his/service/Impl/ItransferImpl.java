package com.ruoyi.his.service.Impl;

import com.ruoyi.his.service.Itransfer;
import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.test.service.ITestMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItransferImpl implements Itransfer {

    @Autowired
    private ITestMapService iTestMapService;


    @Override
    public SysClinic requestTest(long EqId) {
        return iTestMapService.getCloseClinic(EqId);
    }
}
