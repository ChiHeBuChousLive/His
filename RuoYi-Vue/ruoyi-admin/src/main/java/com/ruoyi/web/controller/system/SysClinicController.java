package com.ruoyi.web.controller.system;

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
import com.ruoyi.system.domain.SysClinic;
import com.ruoyi.system.service.ISysClinicService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 门诊管理Controller
 * 
 * @author ruoyi
 * @date 2022-03-25
 */
@RestController
@RequestMapping("/sys_clinic/clinic")
public class SysClinicController extends BaseController
{
    @Autowired
    private ISysClinicService sysClinicService;

    /**
     * 查询门诊管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:clinic:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysClinic sysClinic)
    {
        startPage();
        List<SysClinic> list = sysClinicService.selectSysClinicList(sysClinic);
        return getDataTable(list);
    }

    /**
     * 导出门诊管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:clinic:export')")
    @Log(title = "门诊管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysClinic sysClinic)
    {
        List<SysClinic> list = sysClinicService.selectSysClinicList(sysClinic);
        ExcelUtil<SysClinic> util = new ExcelUtil<SysClinic>(SysClinic.class);
        util.exportExcel(response, list, "门诊管理数据");
    }

    /**
     * 获取门诊管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:clinic:query')")
    @GetMapping(value = "/{clinicId}")
    public AjaxResult getInfo(@PathVariable("clinicId") Long clinicId)
    {
        return AjaxResult.success(sysClinicService.selectSysClinicByClinicId(clinicId));
    }

    /**
     * 新增门诊管理
     */
    @PreAuthorize("@ss.hasPermi('system:clinic:add')")
    @Log(title = "门诊管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysClinic sysClinic)
    {
        return toAjax(sysClinicService.insertSysClinic(sysClinic));
    }

    /**
     * 修改门诊管理
     */
    @PreAuthorize("@ss.hasPermi('system:clinic:edit')")
    @Log(title = "门诊管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysClinic sysClinic)
    {
        return toAjax(sysClinicService.updateSysClinic(sysClinic));
    }

    /**
     * 删除门诊管理
     */
    @PreAuthorize("@ss.hasPermi('system:clinic:remove')")
    @Log(title = "门诊管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{clinicIds}")
    public AjaxResult remove(@PathVariable Long[] clinicIds)
    {
        return toAjax(sysClinicService.deleteSysClinicByClinicIds(clinicIds));
    }
}
