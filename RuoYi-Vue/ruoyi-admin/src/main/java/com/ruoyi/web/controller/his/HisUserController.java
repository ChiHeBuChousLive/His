package com.ruoyi.web.controller.his;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.his.domain.HisUser;
import com.ruoyi.his.service.IHisUserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * His用户信息Controller
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
@RestController
@RequestMapping("/user/user")
public class HisUserController extends BaseController
{
    @Autowired
    private IHisUserService hisUserService;

    /**
     * 查询His用户信息列表
     */
    @PreAuthorize("@ss.hasPermi('his:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(HisUser hisUser)
    {
        startPage();
        List<HisUser> list = hisUserService.selectHisUserList(hisUser);
        return getDataTable(list);
    }

    /**
     * 导出His用户信息列表
     */
    @PreAuthorize("@ss.hasPermi('his:user:export')")
    @Log(title = "His用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HisUser hisUser)
    {
        List<HisUser> list = hisUserService.selectHisUserList(hisUser);
        ExcelUtil<HisUser> util = new ExcelUtil<HisUser>(HisUser.class);
        util.exportExcel(response, list, "His用户信息数据");
    }

    /**
     * 获取His用户信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('his:user:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return AjaxResult.success(hisUserService.selectHisUserByUserId(userId));
    }

    /**
     * 新增His用户信息
     */
    @PreAuthorize("@ss.hasPermi('his:user:add')")
    @Log(title = "His用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HisUser hisUser)
    {
        return toAjax(hisUserService.insertHisUser(hisUser));
    }

    /**
     * 修改His用户信息
     */
    @PreAuthorize("@ss.hasPermi('his:user:edit')")
    @Log(title = "His用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HisUser hisUser)
    {
        return toAjax(hisUserService.updateHisUser(hisUser));
    }

    /**
     * 删除His用户信息
     */
    @PreAuthorize("@ss.hasPermi('his:user:remove')")
    @Log(title = "His用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(hisUserService.deleteHisUserByUserIds(userIds));
    }
}
