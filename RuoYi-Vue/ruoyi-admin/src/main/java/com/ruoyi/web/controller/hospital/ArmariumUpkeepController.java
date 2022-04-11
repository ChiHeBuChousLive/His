package com.ruoyi.web.controller.hospital;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.armarium.domain.ArmariumUpkeep;
import com.ruoyi.armarium.service.IArmariumUpkeepService;
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

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医疗设备保养Controller
 * 
 * @author ruoyi
 * @date 2022-04-11
 */
@RestController
@RequestMapping("/system/upkeep")
public class ArmariumUpkeepController extends BaseController
{
    @Autowired
    private IArmariumUpkeepService armariumUpkeepService;

    /**
     * 查询医疗设备保养列表
     */
    @PreAuthorize("@ss.hasPermi('system:upkeep:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArmariumUpkeep armariumUpkeep)
    {
        startPage();
        List<ArmariumUpkeep> list = armariumUpkeepService.selectArmariumUpkeepList(armariumUpkeep);
        return getDataTable(list);
    }

    /**
     * 导出医疗设备保养列表
     */
    @PreAuthorize("@ss.hasPermi('system:upkeep:export')")
    @Log(title = "医疗设备保养", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArmariumUpkeep armariumUpkeep)
    {
        List<ArmariumUpkeep> list = armariumUpkeepService.selectArmariumUpkeepList(armariumUpkeep);
        ExcelUtil<ArmariumUpkeep> util = new ExcelUtil<ArmariumUpkeep>(ArmariumUpkeep.class);
        util.exportExcel(response, list, "医疗设备保养数据");
    }

    /**
     * 获取医疗设备保养详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:upkeep:query')")
    @GetMapping(value = "/{upkeepId}")
    public AjaxResult getInfo(@PathVariable("upkeepId") Long upkeepId)
    {
        return AjaxResult.success(armariumUpkeepService.selectArmariumUpkeepByUpkeepId(upkeepId));
    }

    /**
     * 新增医疗设备保养
     */
    @PreAuthorize("@ss.hasPermi('system:upkeep:add')")
    @Log(title = "医疗设备保养", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArmariumUpkeep armariumUpkeep)
    {
        return toAjax(armariumUpkeepService.insertArmariumUpkeep(armariumUpkeep));
    }

    /**
     * 修改医疗设备保养
     */
    @PreAuthorize("@ss.hasPermi('system:upkeep:edit')")
    @Log(title = "医疗设备保养", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArmariumUpkeep armariumUpkeep)
    {
        return toAjax(armariumUpkeepService.updateArmariumUpkeep(armariumUpkeep));
    }

    /**
     * 删除医疗设备保养
     */
    @PreAuthorize("@ss.hasPermi('system:upkeep:remove')")
    @Log(title = "医疗设备保养", businessType = BusinessType.DELETE)
	@DeleteMapping("/{upkeepIds}")
    public AjaxResult remove(@PathVariable Long[] upkeepIds)
    {
        return toAjax(armariumUpkeepService.deleteArmariumUpkeepByUpkeepIds(upkeepIds));
    }
}
