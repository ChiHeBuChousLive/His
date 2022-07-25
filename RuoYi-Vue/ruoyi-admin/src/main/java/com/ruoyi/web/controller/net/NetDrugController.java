package com.ruoyi.web.controller.net;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.net.domain.NetDrug;
import com.ruoyi.net.service.INetDrugService;
import com.ruoyi.net.service.INetProductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 进销药品信息维护Controller
 *
 * @author ruoyi
 * @date 2022-04-20
 */
@RestController
@RequestMapping("/net/drug")
public class NetDrugController extends BaseController
{
    @Autowired
    private INetDrugService netDrugService;
    @Autowired
    private INetProductionService netProductionService;
    /**
     * 查询进销药品信息维护列表
     */
    @PreAuthorize("@ss.hasPermi('net:drug:list')")
    @GetMapping("/list")
    public TableDataInfo list(NetDrug netDrug)
    {
        startPage();
        List<NetDrug> list = netDrugService.selectNetDrugList(netDrug);
        return getDataTable(list);
    }

    /**
     * 导出进销药品信息维护列表
     */
    @PreAuthorize("@ss.hasPermi('net:drug:export')")
    @Log(title = "进销药品信息维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NetDrug netDrug)
    {
        List<NetDrug> list = netDrugService.selectNetDrugList(netDrug);
        ExcelUtil<NetDrug> util = new ExcelUtil<NetDrug>(NetDrug.class);
        util.exportExcel(response, list, "进销药品信息维护数据");
    }

    /**
     * 获取进销药品信息维护详细信息
     */
    @PreAuthorize("@ss.hasPermi('net:drug:query')")
    @GetMapping(value = "/{drugId}")
    public AjaxResult getInfo(@PathVariable("drugId") Long drugId)
    {
        return AjaxResult.success(netDrugService.selectNetDrugByDrugId(drugId));
    }

    /**
     * 新增进销药品信息维护
     */
    @PreAuthorize("@ss.hasPermi('net:drug:add')")
    @Log(title = "进销药品信息维护", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NetDrug netDrug)
    {
        return toAjax(netDrugService.insertNetDrug(netDrug));
    }

    /**
     * 修改进销药品信息维护
     */
    @PreAuthorize("@ss.hasPermi('net:drug:edit')")
    @Log(title = "进销药品信息维护", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NetDrug netDrug)
    {
        return toAjax(netDrugService.updateNetDrug(netDrug));
    }

    /**
     * 删除进销药品信息维护
     */
    @PreAuthorize("@ss.hasPermi('net:drug:remove')")
    @Log(title = "进销药品信息维护", businessType = BusinessType.DELETE)
	@DeleteMapping("/{drugIds}")
    public AjaxResult remove(@PathVariable Long[] drugIds)
    {
        return toAjax(netDrugService.deleteNetDrugByDrugIds(drugIds));
    }

    //查询所有厂家的方法
    @GetMapping("/Production")
    public TableDataInfo listProduction()
    {
        List<NetDrug> list = netDrugService.selectNetDrugList(null);
        return getDataTable(list);
    }

}
