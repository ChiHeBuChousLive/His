package com.ruoyi.caution.service.Impl;

import java.util.List;

import com.ruoyi.caution.domain.ConditionAlarm;
import com.ruoyi.caution.mapper.ConditionAlarmMapper;
import com.ruoyi.caution.service.IConditionAlarmService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.condition.domain.ConditionEquipment;
import com.ruoyi.condition.service.IConditionEquipmentService;
import com.ruoyi.green.domain.CaseUserVo;
import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.domain.GreenUserEquipment;
import com.ruoyi.green.mapper.GreenOldUserCaseMapper;
import com.ruoyi.green.mapper.GreenUserEquipmentMapper;
import com.ruoyi.green.service.IGreenOldCaseService;
import com.ruoyi.green.service.Impl.GreenUserServiceImpl;
import com.ruoyi.sms.domain.SmsVo;
import com.ruoyi.sms.service.MsmService;
import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.test.service.ITestMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 设备警报管理Service业务层处理
 * 
 * @author zhezhi
 * @date 2022-04-01
 */
@Service
public class ConditionAlarmServiceImpl implements IConditionAlarmService
{
    @Autowired
    private ConditionAlarmMapper conditionAlarmMapper;


    @Autowired
    private GreenOldUserCaseMapper greenOldUserCaseMapper;

    @Autowired
    private MsmService msmService;

    @Autowired
    GreenUserServiceImpl greenUserService;

    @Autowired
    private GreenUserEquipmentMapper greenUserEquipmentMapper;

    @Autowired
    private ITestMapService testMapService;

    @Autowired
    private IGreenOldCaseService iGreenOldCaseService;


    /**
     * 查询设备警报管理
     * 
     * @param alarmId 设备警报管理主键
     * @return 设备警报管理
     */
    @Override
    public ConditionAlarm selectConditionAlarmByAlarmId(Long alarmId)
    {
        return conditionAlarmMapper.selectConditionAlarmByAlarmId(alarmId);
    }

    /**
     * 查询设备警报管理列表
     * 
     * @param conditionAlarm 设备警报管理
     * @return 设备警报管理
     */
    @Override
    public List<ConditionAlarm> selectConditionAlarmList(ConditionAlarm conditionAlarm)
    {
        return conditionAlarmMapper.selectConditionAlarmList(conditionAlarm);
    }

    /**
     * 新增设备警报管理
     * 
     * @param conditionAlarm 设备警报管理
     * @return 结果
     */
    @Override
    public int insertConditionAlarm(ConditionAlarm conditionAlarm)
    {
        conditionAlarm.setCreateTime(DateUtils.getNowDate());
        return conditionAlarmMapper.insertConditionAlarm(conditionAlarm);
    }

    /**
     * 修改设备警报管理
     * 
     * @param conditionAlarm 设备警报管理
     * @return 结果
     */
    @Override
    public int updateConditionAlarm(ConditionAlarm conditionAlarm)
    {
        conditionAlarm.setUpdateTime(DateUtils.getNowDate());
        return conditionAlarmMapper.updateConditionAlarm(conditionAlarm);
    }

    /**
     * 批量删除设备警报管理
     * 
     * @param alarmIds 需要删除的设备警报管理主键
     * @return 结果
     */
    @Override
    public int deleteConditionAlarmByAlarmIds(Long[] alarmIds)
    {
        return conditionAlarmMapper.deleteConditionAlarmByAlarmIds(alarmIds);
    }

    /**
     * 删除设备警报管理信息
     * 
     * @param alarmId 设备警报管理主键
     * @return 结果
     */
    @Override
    public int deleteConditionAlarmByAlarmId(Long alarmId)
    {
        return conditionAlarmMapper.deleteConditionAlarmByAlarmId(alarmId);
    }

    @Override
    public int deviceRequestInterface(ConditionEquipment conditionEquipment) {
        // 拿取设备关联用户
        System.out.println("执行了");
        Long equipmentId = conditionEquipment.getEquipmentId();
        GreenUserEquipment greenUserEquipment = greenUserEquipmentMapper.selectGreenUserByEquipmentId(equipmentId);
        GreenUser greenUser = greenUserService.selectUserById(greenUserEquipment.getOldId());
        String oldName = greenUser.getOldName();
        // 拿取老人病例
        Long aLong = greenOldUserCaseMapper.selectCaseIdByUserId(greenUser.getOldId());
        CaseUserVo caseUserVo = iGreenOldCaseService.selectGreenOldCaseByCaseId(aLong);
        String toCaseThing = toCase(caseUserVo);


        // 拿取设备位置地址
        String location = conditionEquipment.getEquipmentLocation();

        // 等待一个最近的诊所，调用方法遍历出最近的诊所然后返回诊所对象，然后通过诊所对象获取负责人手机
        SysClinic closeClinic =testMapService.getCloseClinic(conditionEquipment.getEquipmentId());
        String phone = closeClinic.getClinicPhone();
        SmsVo smsVo = new SmsVo();

        boolean send = msmService.send(oldName, toCaseThing, location, phone);
        if (!send){
            System.out.println("发送失败");
            return 0;
        }


        return 1;
    }

    public String toCase(CaseUserVo caseUserVo){
        String caseString="";
        if (caseUserVo.getCancer().equals("0")){
            caseString=caseString+"癌症";
        }else if(caseUserVo.getDiabetes().equals("0")){
            caseString=caseString+"糖尿病";
        }else if(caseUserVo.getHeartDisease().equals("0")){
            caseString=caseString+"心脏病";
        }else if(caseUserVo.getHighBloodPressure().equals("0")){
            caseString=caseString+"高血压";
        }else if(caseUserVo.getGeneticDisease().equals("0")){
            caseString=caseString+"遗传病";
        }
        return caseString;
    }
}
