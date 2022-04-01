<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户姓名" prop="oldName">
        <el-input
          v-model="queryParams.oldName"
          placeholder="请输入用户姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!-- <el-form-item label="糖尿病" prop="diabetes">
        <el-input
          v-model="queryParams.diabetes"
          placeholder="请输入糖尿病;1代表有，0代表无"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="糖尿病" prop="diabetes">
        <el-select v-model="queryParams.diabetes" placeholder="请选择是否患有糖尿病" clearable>
          <el-option
            v-for="dict in dict.type.have_medical_condition"
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
          v-hasPermi="['green:case:add']"
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
          v-hasPermi="['green:case:edit']"
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
          v-hasPermi="['green:case:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['green:case:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="病例Id" align="center" prop="caseId" />
      <el-table-column label="用户姓名" align="center" prop="oldName" />
      <el-table-column label="糖尿病" align="center" prop="diabetes">
      <template slot-scope="scope">
          <dict-tag :options="dict.type.have_medical_condition" :value="scope.row.diabetes"/>
        </template>
      </el-table-column>
      <el-table-column label="心脏病" align="center" prop="heartDisease">
            <template slot-scope="scope">
          <dict-tag :options="dict.type.have_medical_condition" :value="scope.row.heartDisease"/>
        </template>
      </el-table-column>
      <el-table-column label="高血压" align="center" prop="highBloodPressure">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.have_medical_condition" :value="scope.row.highBloodPressure"/>
        </template>
      </el-table-column>
      <el-table-column label="遗传病" align="center" prop="geneticDisease">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.have_medical_condition" :value="scope.row.heartDisease"/>
        </template>
      </el-table-column>
      <el-table-column label="癌症" align="center" prop="cancer">
                    <template slot-scope="scope">
          <dict-tag :options="dict.type.have_medical_condition" :value="scope.row.heartDisease"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['green:case:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['green:case:remove']"
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

    <!-- 添加或修改岗位对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户Id" prop="oldId">
          <el-input v-model="form.oldId" placeholder="请输入用户Id" />
        </el-form-item> 
        <!-- <el-form-item label="病历Id" prop="caseId">
          <el-input v-model="form.caseId" placeholder="请输入用户Id" />
        </el-form-item>  -->
        <el-form-item label="糖尿病" prop="diabetes">
          <el-radio-group v-model="form.diabetes">
            <el-radio
              v-for="dict in dict.type.have_medical_condition"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
         <el-form-item label="心脏病" prop="heartDisease">
          <el-radio-group v-model="form.heartDisease">
            <el-radio
              v-for="dict in dict.type.have_medical_condition"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
         <el-form-item label="高血压" prop="highBloodPressure">
          <el-radio-group v-model="form.highBloodPressure">
            <el-radio
              v-for="dict in dict.type.have_medical_condition"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
         <el-form-item label="遗传病" prop="geneticDisease">
          <el-radio-group v-model="form.geneticDisease">
            <el-radio
              v-for="dict in dict.type.have_medical_condition"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
         <el-form-item label="癌症" prop="cancer">
          <el-radio-group v-model="form.cancer">
            <el-radio
              v-for="dict in dict.type.have_medical_condition"
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
import { listCase, getCase, delCase, addCase, updateCase } from "@/api/green/case";
// import { listPost, getPost, delPost, addPost, updatePost } from "@/api/system/post";

export default {
  name: "Post",
  dicts: ['sys_normal_disable','have_medical_condition'],
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
      // 岗位表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        diabetes: "0",
        heartDisease: "0",
        highBloodPressure: "0",
        geneticDisease: "0",
        cancer: "0",
        oldName: undefined,
        oldId: undefined
        
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询岗位列表 */
    getList() {
      this.loading = true;
      listCase(this.queryParams).then(response => {
        this.postList = response.rows;
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
       diabetes: "0",
        heartDisease: "0",
        highBloodPressure: "0",
        geneticDisease: "0",
        cancer: "0",
        oldName: undefined,
        oldId: undefined,
        status: "0",
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
      this.ids = selection.map(item => item.caseId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户病历";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const caseIds = row.caseId || this.ids
      getCase(caseIds).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "添加用户病历";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.postId != undefined) {
            console.log(this.form.caseId)
            updateCase(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCase(this.form).then(response => {
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
      const caseIds = row.caseId || this.ids;
      this.$modal.confirm('是否确认删除岗位编号为"' + caseIds + '"的数据项？').then(function() {
        return delCase(caseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/post/export', {
        ...this.queryParams
      }, `post_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
