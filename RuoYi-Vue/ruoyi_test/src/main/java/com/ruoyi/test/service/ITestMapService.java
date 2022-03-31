package com.ruoyi.test.service;

import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.test.domain.OldAndClinic;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;


public interface ITestMapService {
    //拿到所有的诊所
    public List<SysClinic> getClinicList(long oldId);
    //拿到最近的诊所和老人
    public OldAndClinic getOldAndClinic(long oldId);
    //返回最近的诊所
    public SysClinic getCloseClinic(long oldId);

}
