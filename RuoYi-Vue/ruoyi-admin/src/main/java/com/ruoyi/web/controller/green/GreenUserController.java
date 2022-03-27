package com.ruoyi.web.controller.green;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.green.domain.GreenUser;
import com.ruoyi.green.service.IGreenUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * 绿色通道用户Controller
 *
 * @author zhezhi
 * @date 2022-03-23
 */
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


    @PreAuthorize("@ss.hasPermi('green:user:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody GreenUser greenUser){
        // 校验
//        post.setCreateBy(getUsername());
        return toAjax(userService.insertUser(greenUser));
    }


    @PreAuthorize("@ss.hasPermi('green:user:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(userService.deleteUserByIds(userIds));
    }



    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
//    @PreAuthorize("@ss.hasPermi('green:user:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, GreenUser greenUser)
    {
        List<GreenUser> list = userService.selectUserList(greenUser);
        ExcelUtil<GreenUser> util = new ExcelUtil<GreenUser>(GreenUser.class);
        util.exportExcel(response, list, "用户管理");
    }



    /**
     * 根据用户编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('green:user:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable Long userId)
    {
        return AjaxResult.success(userService.selectUserById(userId));
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('green:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody GreenUser greenUser)
    {
        greenUser.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.updateUser(greenUser));
    }
    

}
