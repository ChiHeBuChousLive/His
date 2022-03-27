package com.ruoyi.web.controller.green;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.green.domain.GreenFirstAid;
import com.ruoyi.green.service.IGreenFirstAidService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 紧急救治（关联病历与药物）Controller
 * 
 * @author zhezhi
 * @date 2022-03-27
 */
@RestController
@RequestMapping("/green/first_aid")
public class GreenFirstAidController extends BaseController
{
    @Autowired
    private IGreenFirstAidService greenFirstAidService;

    /**
     * 查询紧急救治（关联病历与药物）列表
     */
    @PreAuthorize("@ss.hasPermi('green:first_aid:list')")
    @GetMapping("/list")
    public AjaxResult list(GreenFirstAid greenFirstAid)
    {
        List<GreenFirstAid> list = greenFirstAidService.selectGreenFirstAidList(greenFirstAid);
        return AjaxResult.success(list);
    }

    /**
     * 导出紧急救治（关联病历与药物）列表
     */
    @PreAuthorize("@ss.hasPermi('green:first_aid:export')")
    @Log(title = "紧急救治（关联病历与药物）", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GreenFirstAid greenFirstAid)
    {
        List<GreenFirstAid> list = greenFirstAidService.selectGreenFirstAidList(greenFirstAid);
        ExcelUtil<GreenFirstAid> util = new ExcelUtil<GreenFirstAid>(GreenFirstAid.class);
        util.exportExcel(response, list, "紧急救治（关联病历与药物）数据");
    }

    /**
     * 获取紧急救治（关联病历与药物）详细信息
     */
    @PreAuthorize("@ss.hasPermi('green:first_aid:query')")
    @GetMapping(value = "/{aidId}")
    public AjaxResult getInfo(@PathVariable("aidId") Long aidId)
    {
        return AjaxResult.success(greenFirstAidService.selectGreenFirstAidByAidId(aidId));
    }

    /**
     * 新增紧急救治（关联病历与药物）
     */
    @PreAuthorize("@ss.hasPermi('green:first_aid:add')")
    @Log(title = "紧急救治（关联病历与药物）", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GreenFirstAid greenFirstAid)
    {
        return toAjax(greenFirstAidService.insertGreenFirstAid(greenFirstAid));
    }

    /**
     * 修改紧急救治（关联病历与药物）
     */
    @PreAuthorize("@ss.hasPermi('green:first_aid:edit')")
    @Log(title = "紧急救治（关联病历与药物）", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GreenFirstAid greenFirstAid)
    {
        return toAjax(greenFirstAidService.updateGreenFirstAid(greenFirstAid));
    }

    /**
     * 删除紧急救治（关联病历与药物）
     */
    @PreAuthorize("@ss.hasPermi('green:first_aid:remove')")
    @Log(title = "紧急救治（关联病历与药物）", businessType = BusinessType.DELETE)
	@DeleteMapping("/{aidIds}")
    public AjaxResult remove(@PathVariable Long[] aidIds)
    {
        return toAjax(greenFirstAidService.deleteGreenFirstAidByAidIds(aidIds));
    }
}
