package com.ruoyi.web.controller.net;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.net.domain.NetProduction;
import com.ruoyi.net.service.INetProductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 进销生产厂家Controller
 *
 * @author ruoyi
 * @date 2022-04-20
 */
@RestController
@RequestMapping("/net/production")
public class NetProductionController extends BaseController
{
    @Autowired
    private INetProductionService netProductionService;

    /**
     * 查询进销生产厂家列表
     */
    @PreAuthorize("@ss.hasPermi('net:production:list')")
    @GetMapping("/list")
    public TableDataInfo list(NetProduction netProduction)
    {
        startPage();
        List<NetProduction> list = netProductionService.selectNetProductionList(netProduction);
        return getDataTable(list);
    }

    /**
     * 导出进销生产厂家列表
     */
    @PreAuthorize("@ss.hasPermi('net:production:export')")
    @Log(title = "进销生产厂家", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NetProduction netProduction)
    {
        List<NetProduction> list = netProductionService.selectNetProductionList(netProduction);
        ExcelUtil<NetProduction> util = new ExcelUtil<NetProduction>(NetProduction.class);
        util.exportExcel(response, list, "进销生产厂家数据");
    }

    /**
     * 获取进销生产厂家详细信息
     */
    @PreAuthorize("@ss.hasPermi('net:production:query')")
    @GetMapping(value = "/{productionId}")
    public AjaxResult getInfo(@PathVariable("productionId") Long productionId)
    {
        return AjaxResult.success(netProductionService.selectNetProductionByProductionId(productionId));
    }

    /**
     * 新增进销生产厂家
     */
    @PreAuthorize("@ss.hasPermi('net:production:add')")
    @Log(title = "进销生产厂家", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NetProduction netProduction)
    {
        return toAjax(netProductionService.insertNetProduction(netProduction));
    }

    /**
     * 修改进销生产厂家
     */
    @PreAuthorize("@ss.hasPermi('net:production:edit')")
    @Log(title = "进销生产厂家", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NetProduction netProduction)
    {
        return toAjax(netProductionService.updateNetProduction(netProduction));
    }

    /**
     * 删除进销生产厂家
     */
    @PreAuthorize("@ss.hasPermi('net:production:remove')")
    @Log(title = "进销生产厂家", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productionIds}")
    public AjaxResult remove(@PathVariable Long[] productionIds)
    {
        return toAjax(netProductionService.deleteNetProductionByProductionIds(productionIds));
    }

}
