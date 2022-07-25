<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="药品名称" prop="drugName">
        <el-input
          v-model="queryParams.drugName"
          placeholder="请输入药品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="生产厂家" prop="drugProduction">-->
<!--        <el-input-->
<!--          v-model="queryParams.drugProduction"-->
<!--          placeholder="请输入生产厂家"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="生产厂家" prop="pdrugType">
        <el-select v-model="queryParams.drugProduction" placeholder="请选择生产厂家" clearable>
          <el-option
            v-for="production in this.productionList"
            :key="production.productionName"
            :value="production.productionName"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="药品类型" prop="pdrugType">
        <el-select v-model="queryParams.pdrugType" placeholder="请选择药品类型" clearable>
          <el-option
            v-for="dict in dict.type.pdrug_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="处方类型" prop="pdrugPrescription">
        <el-select v-model="queryParams.pdrugPrescription" placeholder="请选择处方类型" clearable>
          <el-option
            v-for="dict in dict.type.pdrug_units"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="预警值" prop="earlyWarning">
        <el-input
          v-model="queryParams.earlyWarning"
          placeholder="请输入预警值"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_job_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['net:drug:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['net:drug:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['net:drug:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['net:drug:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="drugList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="药品ID" align="center" prop="drugId" />
      <el-table-column label="药品名称" align="center" prop="drugName" />
      <el-table-column label="药品编号" align="center" prop="drugNumber" />
      <el-table-column label="生产厂家" align="center" prop="drugProduction" />
      <el-table-column label="药品类型" align="center" prop="pdrugType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pdrug_type" :value="scope.row.pdrugType"/>
        </template>
      </el-table-column>
      <el-table-column label="处方类型" align="center" prop="pdrugPrescription">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pdrug_units" :value="scope.row.pdrugPrescription"/>
        </template>
      </el-table-column>
      <el-table-column label="单位" align="center" prop="drugUnits" />
      <el-table-column label="价格" align="center" prop="drugPrice" />
      <el-table-column label="库存量" align="center" prop="drugStock" />
      <el-table-column label="预警值" align="center" prop="earlyWarning" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_job_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['net:drug:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['net:drug:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改进销药品信息维护对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="药品名称" prop="drugName">
          <el-input v-model="form.drugName" placeholder="请输入药品名称" />
        </el-form-item>
        <el-form-item label="药品编号" prop="drugNumber">
          <el-input v-model="form.drugNumber" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="生产厂家" prop="drugProduction">
<!--          <el-input v-model="form.drugProduction" placeholder="请输入生产厂家" />-->
          <el-select v-model="form.drugProduction" placeholder="请选择生产厂家" clearable>
            <el-option
              v-for="production in this.productionList"
              :key="production.productionName"
              :value="production.productionName"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="药品类型" prop="pdrugType">
          <el-select v-model="form.pdrugType" placeholder="请选择药品类型">
            <el-option
              v-for="dict in dict.type.pdrug_type"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="处方类型" prop="pdrugPrescription">
          <el-select v-model="form.pdrugPrescription" placeholder="请选择处方类型">
            <el-option
              v-for="dict in dict.type.pdrug_units"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="单位" prop="drugUnits">
          <el-input v-model="form.drugUnits" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="价格" prop="drugPrice">
          <el-input v-model="form.drugPrice" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="库存量" prop="drugStock">
          <el-input v-model="form.drugStock" placeholder="请输入库存量" />
        </el-form-item>
        <el-form-item label="预警值" prop="earlyWarning">
          <el-input v-model="form.earlyWarning" placeholder="请输入预警值" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_job_status"
              :key="dict.value"
:label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listDrug, getDrug, delDrug, addDrug, updateDrug} from "@/api/net/drug";
import {listProduction} from "@/api/net/production";

export default {
  name: "Drug",
  dicts: ['pdrug_units', 'sys_job_status', 'pdrug_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 进销药品信息维护表格数据
      drugList: [],
      //药品供应商信息
      productionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        drugName: null,
        drugNumber: null,
        drugProduction: null,
        pdrugType: null,
        pdrugPrescription: null,
        earlyWarning: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        drugName: [
          { required: true, message: "药品名称不能为空", trigger: "blur" }
        ],
        drugNumber: [
          { required: true, message: "药品编号不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getProduction();
  },
  methods: {
    /** 查询进销药品信息维护列表 */
    getList() {
      this.loading = true;
      listDrug(this.queryParams).then(response => {
        this.drugList = response.rows;
        this.total = response.total;
      });
      console.log(this.drugList);
      this.loading=false;
      },
    /** 查询生产厂家列表 */
    getProduction() {
      listProduction(this.queryParams).then(response => {
        this.productionList = response.rows;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        drugId: null,
        drugName: null,
        drugNumber: null,
        drugProduction: null,
        pdrugType: null,
        pdrugPrescription: null,
        drugUnits: null,
        drugPrice: null,
        drugStock: null,
        earlyWarning: null,
        status: "0",
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.drugId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加进销药品信息维护";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const drugId = row.drugId || this.ids
      getDrug(drugId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改进销药品信息维护";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.drugId != null) {
            updateDrug(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDrug(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const drugIds = row.drugId || this.ids;
      this.$modal.confirm('是否确认删除进销药品信息维护编号为"' + drugIds + '"的数据项？').then(function() {
        return delDrug(drugIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('net/drug/export', {
        ...this.queryParams
      }, `drug_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
