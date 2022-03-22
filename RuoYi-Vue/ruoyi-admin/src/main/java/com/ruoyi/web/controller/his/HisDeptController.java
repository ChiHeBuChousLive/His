package com.ruoyi.web.controller.his;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.his.domain.HisDept;
import com.ruoyi.his.service.IHisDeptService;
import com.ruoyi.system.domain.SysPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/his/dept")
public class HisDeptController extends BaseController {

    @Autowired
    private IHisDeptService hisDeptService;

    @PreAuthorize("@ss.hasPermi('his:dept:list')")
    @GetMapping("/list")
    public TableDataInfo list(HisDept hisDept){
        startPage();  //不调用这个方法分页无效就是 帮分页插件那个封装了 可以抽空进去挖挖
        List<HisDept> list = hisDeptService.selectHisDeptList(hisDept);
        return getDataTable(list);  //这个也是
    }

}
