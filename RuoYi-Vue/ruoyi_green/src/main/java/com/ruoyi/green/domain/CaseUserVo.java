package com.ruoyi.green.domain;

//import com.ruoyi.green.domain.GreenOldCase;

//

import com.ruoyi.green.domain.GreenOldCase;

public class CaseUserVo extends GreenOldCase {

    private String oldName;

    @Override
    public String toString() {
        return "CaseUserVo{" +
                "oldName='" + oldName + '\'' +
                '}';
    }

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }
}
