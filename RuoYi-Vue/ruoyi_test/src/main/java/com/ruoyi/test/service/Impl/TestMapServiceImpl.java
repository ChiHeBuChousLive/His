package com.ruoyi.test.service.Impl;

import com.ruoyi.condition.domain.ConditionEquipment;
import com.ruoyi.condition.mapper.ConditionEquipmentMapper;
import com.ruoyi.green.mapper.GreenUserMapper;
import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.system.mapper.SysClinicMapper;
import com.ruoyi.test.domain.OldAndClinic;
import com.ruoyi.test.service.ITestMapService;
import javafx.beans.binding.LongExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Math.sqrt;

@Service
public class TestMapServiceImpl implements ITestMapService {
    @Autowired
    private SysClinicMapper sysClinicMapper;
    @Autowired
    private ConditionEquipmentMapper conditionEquipmentMapper;

    //拿到附近所有的诊所信息
    @Override
    public List<SysClinic> getClinicList() {
        List<SysClinic> clinicList= sysClinicMapper.selectSysClinicList(null);
        //模拟数据，查询第一个，将老人放入
        long   a = 1;
        ConditionEquipment old= conditionEquipmentMapper.selectConditionEquipmentByEquipmentId(a);

        //寻找和老人最近的数组
        //取出老人经纬度
        String oldXy= old.getCoordinate();
        String[] mid= oldXy.split(",");
        double p1x=Double.parseDouble(mid[0]);
        double p1y=Double.parseDouble(mid[1]);


        //计算出最近的诊所
        double min=100;
        //查询到的最远的诊所
        double max=1;
        ArrayList compareList = new ArrayList();
        for(SysClinic clinic:clinicList){
            //取出诊所的经纬度
            String clinicXy=clinic.getCoordinate();
            String[] mid2=clinicXy.split(",");
            double x=Double.parseDouble(mid2[0]);
            double y=Double.parseDouble(mid2[1]);
            //计算出诊所到老人设备的距离
            double result=sqrt((p1x-x)*(p1x-x)+(p1y-y)*(p1y-y));
            //太远的诊所剔除列
            if(result>max){
                continue;
            }
            if(result<min){
                min=result;
                compareList.add(clinic);
            }
        }
        //拿到最近的诊所
        SysClinic closeClinic=(SysClinic) compareList.get(compareList.size()-1);

        clinicList.remove(closeClinic);


        //之后在这里加clinicList的长度为0的校验

        return clinicList;
    }

    //获得最近的设备和老人信息
    @Override
    public OldAndClinic getOldAndClinic() {
        List<SysClinic> clinicList= sysClinicMapper.selectSysClinicList(null);
        //模拟数据，查询第一个，将老人放入
        long   a = 1;
        ConditionEquipment old= conditionEquipmentMapper.selectConditionEquipmentByEquipmentId(a);
        OldAndClinic oldAndClinic=new OldAndClinic();
        oldAndClinic.setOld(old);

        //寻找和老人最近的数组
        //取出老人经纬度
        String oldXy= old.getCoordinate();
        String[] mid= oldXy.split(",");
        double p1x=Double.parseDouble(mid[0]);
        double p1y=Double.parseDouble(mid[1]);
        //计算出最近的诊所
        double min=100;
        ArrayList compareList = new ArrayList();
        for(SysClinic clinic:clinicList){
            //取出诊所的经纬度
            String clinicXy=clinic.getCoordinate();
            String[] mid2=clinicXy.split(",");
            double x=Double.parseDouble(mid2[0]);
            double y=Double.parseDouble(mid2[1]);
            //计算出诊所到老人设备的距离
            double result=sqrt((p1x-x)*(p1x-x)+(p1y-y)*(p1y-y));
            if(result<min){
                min=result;
                compareList.add(clinic);
            }
        }
        //将最近的真若加入到返回对象中
        SysClinic closeClinic=(SysClinic) compareList.get(compareList.size()-1);
        oldAndClinic.setClinic(closeClinic);

        return oldAndClinic;

    }



}
