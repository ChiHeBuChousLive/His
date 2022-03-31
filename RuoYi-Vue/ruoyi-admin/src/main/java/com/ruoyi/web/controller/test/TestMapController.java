package com.ruoyi.web.controller.test;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.test.domain.OldAndClinic;
import com.ruoyi.test.service.ITestMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/testMap/map")
public class TestMapController extends BaseController {
    //拿到所有的诊所，剔除最近的
    @Autowired
    private ITestMapService testMapService;
    @PreAuthorize("@ss.hasPermi('test:front_map:list')")
    @GetMapping("/getClinicList")
    public TableDataInfo getClinicList(@RequestParam(value = "oldId",required=false,defaultValue ="1") long oldId){
        List<SysClinic> list=testMapService.getClinicList(oldId);
        return getDataTable(list);
    }
    //拿到最近的诊所对象，并且返回设备对象
    @PreAuthorize("@ss.hasPermi('test:front_map:list')")
    @GetMapping("/getOldAndClinic")
    public AjaxResult getOldAndClinic( @RequestParam(value = "oldId",required=false,defaultValue ="1") long oldId){
        OldAndClinic oldAndClinic=testMapService.getOldAndClinic(oldId);
        return AjaxResult.success(oldAndClinic);
    }

}
