package com.ruoyi.sms.service.Impl;

import com.ruoyi.sms.service.MsmService;
import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.sms.v20210111.SmsClient;
import com.tencentcloudapi.sms.v20210111.models.SendSmsRequest;
import com.tencentcloudapi.sms.v20210111.models.SendSmsResponse;
import org.springframework.stereotype.Service;

@Service
public class MsmServiceImpl implements MsmService {
    @Override
    public boolean send(String name,String caseTing, String locationName,String phone) {
        try{
            System.out.println(name);
            System.out.println(caseTing);
            System.out.println(locationName);
            System.out.println(phone);
            if (!caseTing.isEmpty()){
                caseTing = "他患有"+caseTing;
            }
            // 实例化一个认证对象，入参需要传入腾讯云账户secretId，secretKey,此处还需注意密钥对的保密
            // 密钥可前往https://console.cloud.tencent.com/cam/capi网站进行获取
            Credential cred = new Credential("AKIDVpthEWXHkxtYwB9qHRLzNULvFI5crqY0", "DUaR1KM6anjOmulLfiUzKOBhwvd4E8l7");
            // 实例化一个http选项，可选的，没有特殊需求可以跳过
            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("sms.tencentcloudapi.com");
            // 实例化一个client选项，可选的，没有特殊需求可以跳过
            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);
            // 实例化要请求产品的client对象,clientProfile是可选的


            SmsClient client = new SmsClient(cred, "ap-guangzhou", clientProfile);

            // 实例化一个请求对象,每个接口都会对应一个request对象
            SendSmsRequest req = new SendSmsRequest();

            String[] phoneNumberSet1 = {phone};
            req.setPhoneNumberSet(phoneNumberSet1);

            req.setSmsSdkAppId("1400655237");
            req.setSignName("枣院AI院");
            req.setTemplateId("1352200");

            String[] templateParamSet1 = {name,caseTing,locationName};
            req.setTemplateParamSet(templateParamSet1);

            // 返回的resp是一个SendSmsResponse的实例，与请求对象对应
            SendSmsResponse resp = client.SendSms(req);

            // 输出json格式的字符串回包
            System.out.println(SendSmsResponse.toJsonString(resp));


            return true;
        } catch (TencentCloudSDKException e) {
            System.out.println("这个方法有问题呢");
            return false;
        }
    }
}
