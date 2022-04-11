package com.ruoyi.web.controller.hospital;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.armarium.domain.Armarium;
import com.ruoyi.armarium.service.IArmariumService;
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
 * 医疗设备Controller
 * 
 * @author zhezhi
 * @date 2022-04-11
 */
@RestController
@RequestMapping("/system/armarium")
public class ArmariumController extends BaseController
{
    @Autowired
    private IArmariumService armariumService;

    /**
     * 查询医疗设备列表
     */
    @PreAuthorize("@ss.hasPermi('system:armarium:list')")
    @GetMapping("/list")
    public TableDataInfo list(Armarium armarium)
    {
        startPage();
        List<Armarium> list = armariumService.selectArmariumList(armarium);
        return getDataTable(list);
    }

    /**
     * 导出医疗设备列表
     */
    @PreAuthorize("@ss.hasPermi('system:armarium:export')")
    @Log(title = "医疗设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Armarium armarium)
    {
        List<Armarium> list = armariumService.selectArmariumList(armarium);
        ExcelUtil<Armarium> util = new ExcelUtil<Armarium>(Armarium.class);
        util.exportExcel(response, list, "医疗设备数据");
    }

    /**
     * 获取医疗设备详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:armarium:query')")
    @GetMapping(value = "/{armariumId}")
    public AjaxResult getInfo(@PathVariable("armariumId") Long armariumId)
    {
        return AjaxResult.success(armariumService.selectArmariumByArmariumId(armariumId));
    }

    /**
     * 新增医疗设备
     */
    @PreAuthorize("@ss.hasPermi('system:armarium:add')")
    @Log(title = "医疗设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Armarium armarium)
    {
        return toAjax(armariumService.insertArmarium(armarium));
    }

    /**
     * 修改医疗设备
     */
    @PreAuthorize("@ss.hasPermi('system:armarium:edit')")
    @Log(title = "医疗设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Armarium armarium)
    {
        return toAjax(armariumService.updateArmarium(armarium));
    }

    /**
     * 删除医疗设备
     */
    @PreAuthorize("@ss.hasPermi('system:armarium:remove')")
    @Log(title = "医疗设备", businessType = BusinessType.DELETE)
	@DeleteMapping("/{armariumIds}")
    public AjaxResult remove(@PathVariable Long[] armariumIds)
    {
        return toAjax(armariumService.deleteArmariumByArmariumIds(armariumIds));
    }
}
