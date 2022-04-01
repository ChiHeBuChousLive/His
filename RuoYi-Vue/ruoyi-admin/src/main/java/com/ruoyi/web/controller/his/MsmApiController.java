//package com.ruoyi.web.controller.his;
//
//import com.ruoyi.common.core.controller.BaseController;
//import com.ruoyi.sms.domain.SmsVo;
//import com.ruoyi.sms.service.MsmService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping("/edumsm/msm")
//public class MsmApiController extends BaseController {
//    @Autowired
//    private MsmService msmService;
//
//    @GetMapping()
//    public void Test(){
//        System.out.println("测试");
//    }
//
//
//    @PostMapping
//    public void sendMsm(SmsVo smsVo){
//        System.out.println(smsVo);
//        boolean send = msmService.send(smsVo.getLeaderName(),smsVo.getLocationName(),smsVo.getPhoneNumber());
//        if (send){
//            System.out.println("通知诊所成功");
//        }else {
//            System.out.println("通知失败");
//        }
//
//
//    }
//
//
//}
