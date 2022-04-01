<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="168px">
      <el-form-item label="节点Id" prop="parentId">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入节点Id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
	    <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>

      <el-form-item label="名称" prop="aidName">
        <el-input
          v-model="queryParams.aidName"
          placeholder="请输入名称"
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
          v-hasPermi="['green:first_aid:add']"
        >新增</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="aidList"
      row-key="aidId"
      default-expand-all
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="节点名称" prop="parentId" >
            <template slot-scope="scope">
              <el-tag v-if="scope.row.parentId == 0" type="success">
                病情名称
              </el-tag>
              <el-tag v-else type="danger">
                禁忌药物
              </el-tag>
            </template>
      </el-table-column>
      <el-table-column label="节点Id" prop="parentId" />
      <el-table-column label="名称" align="center" prop="aidName" >
      <template slot-scope="scope">
              <el-tag v-if="scope.row.parentId == 0" type="success">
             {{ scope.row.aidName}}
              </el-tag>
              <el-tag v-else type="danger">
               {{scope.row.aidName}}
              </el-tag>
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
            v-hasPermi="['green:first_aid:list:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['green:first_aid:list:add']"
          >新增</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['green:first_aid:list:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改紧急救治（关联病历与药物）对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="父id节点" prop="parentId">
          <treeselect v-model="form.parentId" :options="aidOptions" :normalizer="normalizer" placeholder="请选择父id节点" />
        </el-form-item>
        <el-form-item label="名称" prop="aidName">
          <el-input v-model="form.aidName" placeholder="请输入一级节点为病历名，二级节点为药物名称" />
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
import { listAid, getAid, delAid, addAid, updateAid } from "@/api/green/first_aid";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Aid",
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 紧急救治（关联病历与药物）表格数据
      aidList: [],
      // 紧急救治（关联病历与药物）树选项
      aidOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        parentId: null,
        aidName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parentId: [
          { required: true, message: "父id节点不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询紧急救治（关联病历与药物）列表 */
    getList() {
      this.loading = true;
      listAid(this.queryParams).then(response => {
        this.aidList = this.handleTree(response.data, "aidId", "parentId");
        this.loading = false;
      });
    },
    /** 转换紧急救治（关联病历与药物）数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.aidId,
        label: node.aidName,
        children: node.children
      };
    },
	/** 查询紧急救治（关联病历与药物）下拉树结构 */
    getTreeselect() {
      listAid().then(response => {
        this.aidOptions = [];
        const data = { aidId: 0, aidName: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "aidId", "parentId");
        this.aidOptions.push(data);
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
        aidId: null,
        parentId: null,
        aidName: null,
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
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != null && row.aidId) {
        this.form.parentId = row.aidId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "添加紧急救治（关联病历与药物）";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentId = row.aidId;
      }
      getAid(row.aidId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改紧急救治（关联病历与药物）";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.aidId != null) {
            updateAid(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAid(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除紧急救治（关联病历与药物）编号为"' + row.aidId + '"的数据项？').then(function() {
        return delAid(row.aidId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
