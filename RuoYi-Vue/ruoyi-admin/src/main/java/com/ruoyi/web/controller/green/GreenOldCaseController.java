package com.ruoyi.web.controller.green;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.green.domain.GreenOldCase;
import com.ruoyi.green.service.IGreenOldCaseService;
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
 * 病例管理Controller
 * 
 * @author kule
 * @date 2022-03-26
 */
@RestController
@RequestMapping("/green/case")
public class GreenOldCaseController extends BaseController
{
    @Autowired
    private IGreenOldCaseService greenOldCaseService;

    /**
     * 查询病例管理列表
     */
    @PreAuthorize("@ss.hasPermi('green:case:list')")
    @GetMapping("/list")
    public TableDataInfo list(GreenOldCase greenOldCase)
    {
        startPage();
        List<GreenOldCase> list = greenOldCaseService.selectGreenOldCaseList(greenOldCase);
        return getDataTable(list);
    }

    /**
     * 导出病例管理列表
     */
    @PreAuthorize("@ss.hasPermi('green:case:export')")
    @Log(title = "病例管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GreenOldCase greenOldCase)
    {
        List<GreenOldCase> list = greenOldCaseService.selectGreenOldCaseList(greenOldCase);
        ExcelUtil<GreenOldCase> util = new ExcelUtil<GreenOldCase>(GreenOldCase.class);
        util.exportExcel(response, list, "病例管理数据");
    }

    /**
     * 获取病例管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('green:case:query')")
    @GetMapping(value = "/{caseId}")
    public AjaxResult getInfo(@PathVariable("caseId") Long caseId)
    {
        return AjaxResult.success(greenOldCaseService.selectGreenOldCaseByCaseId(caseId));
    }

    /**
     * 新增病例管理
     */
    @PreAuthorize("@ss.hasPermi('green:case:add')")
    @Log(title = "病例管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GreenOldCase greenOldCase)
    {
        return toAjax(greenOldCaseService.insertGreenOldCase(greenOldCase));
    }

    /**
     * 修改病例管理
     */
    @PreAuthorize("@ss.hasPermi('green:case:edit')")
    @Log(title = "病例管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GreenOldCase greenOldCase)
    {
        return toAjax(greenOldCaseService.updateGreenOldCase(greenOldCase));
    }

    /**
     * 删除病例管理
     */
    @PreAuthorize("@ss.hasPermi('green:case:remove')")
    @Log(title = "病例管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{caseIds}")
    public AjaxResult remove(@PathVariable Long[] caseIds)
    {
        return toAjax(greenOldCaseService.deleteGreenOldCaseByCaseIds(caseIds));
    }
}
