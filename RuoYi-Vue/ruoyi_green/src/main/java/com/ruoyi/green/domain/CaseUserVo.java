package com.ruoyi.green.domain;


/**
 * 病历填充用户用户姓名表（需要被弃用，此写法冗杂）
 *
 * @author zhezhi
 * @date 2022-03-27
 */

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
