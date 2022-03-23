package com.ruoyi.web.controller.his;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.his.domain.HisDept;
import com.ruoyi.his.service.IHisDeptService;
import com.ruoyi.system.domain.SysPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
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

    @PreAuthorize("@ss.hasPermi('his:dept:add')")
    @Log(title = "科室管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody HisDept hisDept){
        // 校验
//        post.setCreateBy(getUsername());
        return toAjax(hisDeptService.insertDept(hisDept));
    }


    @PreAuthorize("@ss.hasPermi('his:dept:remove')")
    @Log(title = "科室管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{postIds}")
    public AjaxResult remove(@PathVariable Long[] postIds)
    {
        return toAjax(hisDeptService.deleteDeptByIds(postIds));
    }



    @Log(title = "科室管理", businessType = BusinessType.EXPORT)
//    @PreAuthorize("@ss.hasPermi('his:dept:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, HisDept hisDept)
    {
        List<HisDept> list = hisDeptService.selectHisDeptList(hisDept);
        ExcelUtil<HisDept> util = new ExcelUtil<HisDept>(HisDept.class);
        util.exportExcel(response, list, "科室管理");
    }



    /**
     * 根据岗位编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('his:dept:query')")
    @GetMapping(value = "/{deptId}")
    public AjaxResult getInfo(@PathVariable Long deptId)
    {
        return AjaxResult.success(hisDeptService.selectDeptById(deptId));
    }

    /**
     * 修改岗位
     */
    @PreAuthorize("@ss.hasPermi('his:dept:edit')")
    @Log(title = "科室管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody HisDept dept)
    {
        dept.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(hisDeptService.updateDept(dept));
    }
//    @PreAuthorize("@ss.hasPermi('his:dept:edit')")
//    @Log(title = "科室管理", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@Validated @RequestBody HisDept hisDept)
//    {
////        if (UserConstants.NOT_UNIQUE.equals(hisDeptService.checkPostNameUnique(hisDept)))
////        {
////            return AjaxResult.error("修改岗位'" + hisDept.getPostName() + "'失败，岗位名称已存在");
////        }
////        else if (UserConstants.NOT_UNIQUE.equals(hisDeptService.checkPostCodeUnique(hisDept)))
////        {
////            return AjaxResult.error("修改岗位'" + hisDept.getPostName() + "'失败，岗位编码已存在");
////        }
//        // 获取修改者的姓名
//        hisDept.setUpdateBy(getUsername());
//        return toAjax(hisDeptService.updateDept(hisDept));
//    }



}
