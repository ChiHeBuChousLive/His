package com.ruoyi.his.service;

import com.ruoyi.system.domain.SysClinic;

public interface Itransfer {
    // 这是一次失败的依赖
    public SysClinic requestTest(long EqId);
}
