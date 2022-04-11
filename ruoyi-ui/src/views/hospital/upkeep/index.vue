<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="保养等级" prop="upkeepLevel">
        <el-select v-model="queryParams.upkeepLevel" placeholder="请选择保养等级" clearable>
          <el-option
            v-for="dict in dict.type.level_three"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="保养时间" prop="upkeepTime">
        <el-input
          v-model="queryParams.upkeepTime"
          placeholder="请输入保养时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['system:upkeep:add']"
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
          v-hasPermi="['system:upkeep:edit']"
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
          v-hasPermi="['system:upkeep:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:upkeep:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="upkeepList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="保养单号ID" align="center" prop="upkeepId" />
      <el-table-column label="保养等级" align="center" prop="upkeepLevel">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.level_three" :value="scope.row.upkeepLevel"/>
        </template>
      </el-table-column>
      <el-table-column label="保养频次" align="center" prop="upkeepFrequency" />
      <el-table-column label="保养结果" align="center" prop="upkeepResult" />
      <el-table-column label="保养时间" align="center" prop="upkeepTime" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:upkeep:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:upkeep:remove']"
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

    <!-- 添加或修改医疗设备保养对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="保养等级" prop="upkeepLevel">
          <el-select v-model="form.upkeepLevel" placeholder="请选择保养等级">
            <el-option
              v-for="dict in dict.type.level_three"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="保养频次" prop="upkeepFrequency">
          <el-input v-model="form.upkeepFrequency" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="保养结果">
          <editor v-model="form.upkeepResult" :min-height="192"/>
        </el-form-item>
        <el-form-item label="保养时间" prop="upkeepTime">
          <el-input v-model="form.upkeepTime" placeholder="请输入保养时间" />
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
import { listUpkeep, getUpkeep, delUpkeep, addUpkeep, updateUpkeep } from "@/api/hospital/upkeep";

export default {
  name: "Upkeep",
  dicts: ['level_three'],
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
      // 医疗设备保养表格数据
      upkeepList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        upkeepLevel: null,
        upkeepFrequency: null,
        upkeepResult: null,
        upkeepTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        upkeepLevel: [
          { required: true, message: "保养等级不能为空", trigger: "change" }
        ],
        upkeepFrequency: [
          { required: true, message: "保养频次不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询医疗设备保养列表 */
    getList() {
      this.loading = true;
      listUpkeep(this.queryParams).then(response => {
        this.upkeepList = response.rows;
        this.total = response.total;
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
        upkeepId: null,
        upkeepLevel: null,
        upkeepFrequency: null,
        upkeepResult: null,
        upkeepTime: null,
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
      this.ids = selection.map(item => item.upkeepId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加医疗设备保养";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const upkeepId = row.upkeepId || this.ids
      getUpkeep(upkeepId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改医疗设备保养";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.upkeepId != null) {
            updateUpkeep(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addUpkeep(this.form).then(response => {
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
      const upkeepIds = row.upkeepId || this.ids;
      this.$modal.confirm('是否确认删除医疗设备保养编号为"' + upkeepIds + '"的数据项？').then(function() {
        return delUpkeep(upkeepIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/upkeep/export', {
        ...this.queryParams
      }, `upkeep_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
