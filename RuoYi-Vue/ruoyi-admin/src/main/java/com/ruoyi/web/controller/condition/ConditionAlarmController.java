package com.ruoyi.web.controller.condition;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.condition.domain.ConditionAlarm;
import com.ruoyi.condition.service.IConditionAlarmService;
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
 * 设备警报管理Controller
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@RestController
@RequestMapping("/condition/alarm")
public class ConditionAlarmController extends BaseController
{
    @Autowired
    private IConditionAlarmService conditionAlarmService;

    /**
     * 查询设备警报管理列表
     */
    @PreAuthorize("@ss.hasPermi('condition:alarm:list')")
    @GetMapping("/list")
    public TableDataInfo list(ConditionAlarm conditionAlarm)
    {
        startPage();
        List<ConditionAlarm> list = conditionAlarmService.selectConditionAlarmList(conditionAlarm);
        return getDataTable(list);
    }

    /**
     * 导出设备警报管理列表
     */
    @PreAuthorize("@ss.hasPermi('condition:alarm:export')")
    @Log(title = "设备警报管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ConditionAlarm conditionAlarm)
    {
        List<ConditionAlarm> list = conditionAlarmService.selectConditionAlarmList(conditionAlarm);
        ExcelUtil<ConditionAlarm> util = new ExcelUtil<ConditionAlarm>(ConditionAlarm.class);
        util.exportExcel(response, list, "设备警报管理数据");
    }

    /**
     * 获取设备警报管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('condition:alarm:query')")
    @GetMapping(value = "/{alarmId}")
    public AjaxResult getInfo(@PathVariable("alarmId") Long alarmId)
    {
        return AjaxResult.success(conditionAlarmService.selectConditionAlarmByAlarmId(alarmId));
    }

    /**
     * 新增设备警报管理
     */
    @PreAuthorize("@ss.hasPermi('condition:alarm:add')")
    @Log(title = "设备警报管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ConditionAlarm conditionAlarm)
    {
        return toAjax(conditionAlarmService.insertConditionAlarm(conditionAlarm));
    }

    /**
     * 修改设备警报管理
     */
    @PreAuthorize("@ss.hasPermi('condition:alarm:edit')")
    @Log(title = "设备警报管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ConditionAlarm conditionAlarm)
    {
        return toAjax(conditionAlarmService.updateConditionAlarm(conditionAlarm));
    }

    /**
     * 删除设备警报管理
     */
    @PreAuthorize("@ss.hasPermi('condition:alarm:remove')")
    @Log(title = "设备警报管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{alarmIds}")
    public AjaxResult remove(@PathVariable Long[] alarmIds)
    {
        return toAjax(conditionAlarmService.deleteConditionAlarmByAlarmIds(alarmIds));
    }
}
