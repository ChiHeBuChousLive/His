package com.ruoyi.web.controller.green;


import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.service.IGreenUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

@RestController
@RequestMapping("/green/user")
public class GreenUserController extends BaseController {

    @Autowired
    private IGreenUserService userService;

    @PreAuthorize("@ss.hasPermi('green:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(GreenUser greenUser){
        startPage();  //不调用这个方法分页无效就是 帮分页插件那个封装了 可以抽空进去挖挖
        List<GreenUser> list = userService.selectUserList(greenUser);
        System.out.println(list);
        return getDataTable(list);  //这个也是
    }


}
