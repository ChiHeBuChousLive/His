package com.ruoyi.web.controller.net;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.net.domain.NetSupplier;
import com.ruoyi.net.service.INetSupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 进销供应商Controller
 *
 * @author ruoyi
 * @date 2022-04-20
 */
@RestController
@RequestMapping("/net/supplier")
public class NetSupplierController extends BaseController
{
    @Autowired
    private INetSupplierService netSupplierService;

    /**
     * 查询进销供应商列表
     */
    @PreAuthorize("@ss.hasPermi('net:supplier:list')")
    @GetMapping("/list")
    public TableDataInfo list(NetSupplier netSupplier)
    {
        startPage();
        List<NetSupplier> list = netSupplierService.selectNetSupplierList(netSupplier);
        return getDataTable(list);
    }

    /**
     * 导出进销供应商列表
     */
    @PreAuthorize("@ss.hasPermi('net:supplier:export')")
    @Log(title = "进销供应商", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NetSupplier netSupplier)
    {
        List<NetSupplier> list = netSupplierService.selectNetSupplierList(netSupplier);
        ExcelUtil<NetSupplier> util = new ExcelUtil<NetSupplier>(NetSupplier.class);
        util.exportExcel(response, list, "进销供应商数据");
    }

    /**
     * 获取进销供应商详细信息
     */
    @PreAuthorize("@ss.hasPermi('net:supplier:query')")
    @GetMapping(value = "/{supplierId}")
    public AjaxResult getInfo(@PathVariable("supplierId") Long supplierId)
    {
        return AjaxResult.success(netSupplierService.selectNetSupplierBySupplierId(supplierId));
    }

    /**
     * 新增进销供应商
     */
    @PreAuthorize("@ss.hasPermi('net:supplier:add')")
    @Log(title = "进销供应商", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NetSupplier netSupplier)
    {
        return toAjax(netSupplierService.insertNetSupplier(netSupplier));
    }

    /**
     * 修改进销供应商
     */
    @PreAuthorize("@ss.hasPermi('net:supplier:edit')")
    @Log(title = "进销供应商", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NetSupplier netSupplier)
    {
        return toAjax(netSupplierService.updateNetSupplier(netSupplier));
    }

    /**
     * 删除进销供应商
     */
    @PreAuthorize("@ss.hasPermi('net:supplier:remove')")
    @Log(title = "进销供应商", businessType = BusinessType.DELETE)
	@DeleteMapping("/{supplierIds}")
    public AjaxResult remove(@PathVariable Long[] supplierIds)
    {
        return toAjax(netSupplierService.deleteNetSupplierBySupplierIds(supplierIds));
    }
}
