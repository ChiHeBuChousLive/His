package com.ruoyi.web.controller.condition;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.condition.domain.ConditionEquipment;
import com.ruoyi.condition.service.IConditionEquipmentService;
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
 * 设备Controller
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@RestController
@RequestMapping("/condition/equipment")
public class ConditionEquipmentController extends BaseController
{
    @Autowired
    private IConditionEquipmentService conditionEquipmentService;

    /**
     * 查询设备列表
     */
    @PreAuthorize("@ss.hasPermi('condition:equipment:list')")
    @GetMapping("/list")
    public TableDataInfo list(ConditionEquipment conditionEquipment)
    {
        startPage();
        List<ConditionEquipment> list = conditionEquipmentService.selectConditionEquipmentList(conditionEquipment);
        return getDataTable(list);
    }

    /**
     * 导出设备列表
     */
    @PreAuthorize("@ss.hasPermi('condition:equipment:export')")
    @Log(title = "设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ConditionEquipment conditionEquipment)
    {
        List<ConditionEquipment> list = conditionEquipmentService.selectConditionEquipmentList(conditionEquipment);
        ExcelUtil<ConditionEquipment> util = new ExcelUtil<ConditionEquipment>(ConditionEquipment.class);
        util.exportExcel(response, list, "设备数据");
    }

    /**
     * 获取设备详细信息
     */
    @PreAuthorize("@ss.hasPermi('condition:equipment:query')")
    @GetMapping(value = "/{equipmentId}")
    public AjaxResult getInfo(@PathVariable("equipmentId") Long equipmentId)
    {
        return AjaxResult.success(conditionEquipmentService.selectConditionEquipmentByEquipmentId(equipmentId));
    }

    /**
     * 新增设备
     */
    @PreAuthorize("@ss.hasPermi('condition:equipment:add')")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ConditionEquipment conditionEquipment)
    {
        return toAjax(conditionEquipmentService.insertConditionEquipment(conditionEquipment));
    }

    /**
     * 修改设备
     */
    @PreAuthorize("@ss.hasPermi('condition:equipment:edit')")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ConditionEquipment conditionEquipment)
    {
        return toAjax(conditionEquipmentService.updateConditionEquipment(conditionEquipment));
    }

    /**
     * 删除设备
     */
    @PreAuthorize("@ss.hasPermi('condition:equipment:remove')")
    @Log(title = "设备", businessType = BusinessType.DELETE)
	@DeleteMapping("/{equipmentIds}")
    public AjaxResult remove(@PathVariable Long[] equipmentIds)
    {
        return toAjax(conditionEquipmentService.deleteConditionEquipmentByEquipmentIds(equipmentIds));
    }

}
