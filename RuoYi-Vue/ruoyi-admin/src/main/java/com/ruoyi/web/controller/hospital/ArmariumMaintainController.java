package com.ruoyi.web.controller.hospital;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.armarium.domain.ArmariumMaintain;
import com.ruoyi.armarium.service.IArmariumMaintainService;
import com.ruoyi.common.utils.poi.ExcelUtil;
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

import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医疗设备维修Controller
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
@RestController
@RequestMapping("/system/maintain")
public class ArmariumMaintainController extends BaseController
{
    @Autowired
    private IArmariumMaintainService armariumMaintainService;

    /**
     * 查询医疗设备维修列表
     */
    @PreAuthorize("@ss.hasPermi('system:maintain:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArmariumMaintain armariumMaintain)
    {
        startPage();
        List<ArmariumMaintain> list = armariumMaintainService.selectArmariumMaintainList(armariumMaintain);
        return getDataTable(list);
    }

    /**
     * 导出医疗设备维修列表
     */
    @PreAuthorize("@ss.hasPermi('system:maintain:export')")
    @Log(title = "医疗设备维修", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArmariumMaintain armariumMaintain)
    {
        List<ArmariumMaintain> list = armariumMaintainService.selectArmariumMaintainList(armariumMaintain);
        ExcelUtil<ArmariumMaintain> util = new ExcelUtil<ArmariumMaintain>(ArmariumMaintain.class);
        util.exportExcel(response, list, "医疗设备维修数据");
    }

    /**
     * 获取医疗设备维修详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:maintain:query')")
    @GetMapping(value = "/{maintainId}")
    public AjaxResult getInfo(@PathVariable("maintainId") Long maintainId)
    {
        return AjaxResult.success(armariumMaintainService.selectArmariumMaintainByMaintainId(maintainId));
    }

    /**
     * 新增医疗设备维修
     */
    @PreAuthorize("@ss.hasPermi('system:maintain:add')")
    @Log(title = "医疗设备维修", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArmariumMaintain armariumMaintain)
    {
        return toAjax(armariumMaintainService.insertArmariumMaintain(armariumMaintain));
    }

    /**
     * 修改医疗设备维修
     */
    @PreAuthorize("@ss.hasPermi('system:maintain:edit')")
    @Log(title = "医疗设备维修", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArmariumMaintain armariumMaintain)
    {
        return toAjax(armariumMaintainService.updateArmariumMaintain(armariumMaintain));
    }

    /**
     * 删除医疗设备维修
     */
    @PreAuthorize("@ss.hasPermi('system:maintain:remove')")
    @Log(title = "医疗设备维修", businessType = BusinessType.DELETE)
	@DeleteMapping("/{maintainIds}")
    public AjaxResult remove(@PathVariable Long[] maintainIds)
    {
        return toAjax(armariumMaintainService.deleteArmariumMaintainByMaintainIds(maintainIds));
    }
}
