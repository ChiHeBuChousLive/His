package com.ruoyi.sms.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class SmsVo extends BaseEntity {

    private String phoneNumber;

    private String locationName;

    private String leaderName;

    @Override
    public String toString() {
        return "SmsVo{" +
                "phoneNumber='" + phoneNumber + '\'' +
                ", locationName='" + locationName + '\'' +
                ", leaderName='" + leaderName + '\'' +
                '}';
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getLeaderName() {
        return leaderName;
    }

    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName;
    }
}
