package com.ruoyi.green.domain;

public class GreenUserCase  {
    /**绿色通道用户ID*/
    private Long oldId;
    /**绿色通道病例ID*/
    private Long caseId;

    public Long getOldId() {
        return oldId;
    }

    @Override
    public String toString() {
        return "GreenUserCase{" +
                "oldId=" + oldId +
                ", caseId=" + caseId +
                '}';
    }

    public void setOldId(Long oldId) {
        this.oldId = oldId;
    }

    public Long getCaseId() {
        return caseId;
    }

    public void setCaseId(Long caseId) {
        this.caseId = caseId;
    }


}
