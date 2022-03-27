package com.ruoyi.web.controller.condition;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.condition.domain.ConditionSeat;
import com.ruoyi.condition.service.IConditionSeatService;
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
 * 位置信息管理Controller
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@RestController
@RequestMapping("/condition/seat")
public class ConditionSeatController extends BaseController
{
    @Autowired
    private IConditionSeatService conditionSeatService;

    /**
     * 查询位置信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('condition:seat:list')")
    @GetMapping("/list")
    public TableDataInfo list(ConditionSeat conditionSeat)
    {
        startPage();
        List<ConditionSeat> list = conditionSeatService.selectConditionSeatList(conditionSeat);
        return getDataTable(list);
    }

    /**
     * 导出位置信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('condition:seat:export')")
    @Log(title = "位置信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ConditionSeat conditionSeat)
    {
        List<ConditionSeat> list = conditionSeatService.selectConditionSeatList(conditionSeat);
        ExcelUtil<ConditionSeat> util = new ExcelUtil<ConditionSeat>(ConditionSeat.class);
        util.exportExcel(response, list, "位置信息管理数据");
    }

    /**
     * 获取位置信息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('condition:seat:query')")
    @GetMapping(value = "/{seatId}")
    public AjaxResult getInfo(@PathVariable("seatId") Long seatId)
    {
        return AjaxResult.success(conditionSeatService.selectConditionSeatBySeatId(seatId));
    }

    /**
     * 新增位置信息管理
     */
    @PreAuthorize("@ss.hasPermi('condition:seat:add')")
    @Log(title = "位置信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ConditionSeat conditionSeat)
    {
        return toAjax(conditionSeatService.insertConditionSeat(conditionSeat));
    }

    /**
     * 修改位置信息管理
     */
    @PreAuthorize("@ss.hasPermi('condition:seat:edit')")
    @Log(title = "位置信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ConditionSeat conditionSeat)
    {
        return toAjax(conditionSeatService.updateConditionSeat(conditionSeat));
    }

    /**
     * 删除位置信息管理
     */
    @PreAuthorize("@ss.hasPermi('condition:seat:remove')")
    @Log(title = "位置信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{seatIds}")
    public AjaxResult remove(@PathVariable Long[] seatIds)
    {
        return toAjax(conditionSeatService.deleteConditionSeatBySeatIds(seatIds));
    }
}
