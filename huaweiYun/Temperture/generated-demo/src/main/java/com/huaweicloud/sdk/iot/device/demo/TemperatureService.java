package com.huaweicloud.sdk.iot.device.demo;

import com.huaweicloud.sdk.iot.device.client.requests.CommandRsp;
import com.huaweicloud.sdk.iot.device.service.AbstractService;
import com.huaweicloud.sdk.iot.device.service.DeviceCommand;
import com.huaweicloud.sdk.iot.device.service.Property;
import java.util.Map;
import java.util.Random;
import org.apache.log4j.Logger;

/**
 * This code is generated by FreeMarker
 *
 */
public class TemperatureService extends AbstractService
{
    private static Logger log = Logger.getLogger(TemperatureService.class);
    private Random random = new Random();

    /********** attribute ***********/
    @Property(writeable =  false)
    private float temperature;

    @Property(writeable =  false)
    private float roomTemperature;



    /********** commands ***********/
    @DeviceCommand
    public CommandRsp getData (Map<String, Object> paras) {
      //todo 请在这里添加命令处理代码
      return new CommandRsp(0);
    }


    /********** get/set ***********/
    public float getTemperature() {
        //模拟从传感器读取数据
        temperature = Float.parseFloat(String.format("%.2f",random.nextFloat()*10+32));
        log.info("report property temperature value =  "+ temperature);

        return temperature;
    }

    public void setTemperature(float temperature) {
        this.temperature = temperature;
        log.info("property temperature set to "+ temperature);
    }

    public float getRoomTemperature() {
        //模拟从传感器读取数据
        roomTemperature = Float.parseFloat(String.format("%.2f",random.nextFloat()*40-10));
        log.info("report property roomTemperature value =  "+ roomTemperature);

        return roomTemperature;
    }

    public void setRoomTemperature(float roomTemperature) {
        this.roomTemperature = roomTemperature;
        log.info("property roomTemperature set to "+ roomTemperature);
    }


}