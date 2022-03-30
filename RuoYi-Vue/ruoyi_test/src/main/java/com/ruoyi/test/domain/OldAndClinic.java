package com.ruoyi.test.domain;

import com.ruoyi.condition.domain.ConditionEquipment;
import com.ruoyi.system.domain.SysClinic;

public class OldAndClinic {
    SysClinic clinic;
    ConditionEquipment old;

    public SysClinic getClinic() {
        return clinic;
    }

    public void setClinic(SysClinic clinic) {
        this.clinic = clinic;
    }

    public ConditionEquipment getOld() {
        return old;
    }

    public void setOld(ConditionEquipment old) {
        this.old = old;
    }
}
