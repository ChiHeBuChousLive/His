<template>
  <div>
    <div>
      <el-row class="home" :gutter="20">
        <el-col :span="6" style="margin-top: 20px"> </el-col>
        <el-col :span="12">
          <el-row>
            <div class="num">
              <el-card
                v-for="(item, index) in countData"
                :key="index"
                :body-style="{ display: 'flex', padding: 0 }"
              >
                <i
                  class="icon"
                  :class="`el-icon-${item.icon}`"
                  :style="{ background: item.color }"
                ></i>
                <div class="detail">
                  <p class="num">{{ item.name }}</p>
                  <p class="txt">{{ item.number }}</p>
                  <!-- <p class="txt">{{item.job}}</p> -->
                </div>
              </el-card>
            </div>
          </el-row>
        </el-col>
        <el-col :span="6" style="margin-top: 20px"> </el-col>
      </el-row>
    </div>
    <dir>
      <el-form
        ref="elForm"
        :model="formData"
        :rules="rules"
        size="medium"
        label-width="100px"
      >
        <el-row class="home2">
          <el-col :span="10">
            <el-card class="nuber_card">
              <!-- <el-card class="switch_card"> -->
              <el-form-item label="设备模拟" prop="equipment_switch" required>
                <el-switch
                  v-model="formData.equipment_switch"
                  active-text="开"
                  inactive-text="关"
                  active-color="#F81616"
                  inactive-color="#81F210"
                ></el-switch>
              </el-form-item>
            </el-card>
          </el-col>
          <el-col :span="10">
            <el-card class="nuber_card">
              <el-form-item label="设备数量" prop="switchNuber" required>
                <el-slider
                  :max="5"
                  :step="1"
                  v-model="formData.switchNuber"
                ></el-slider>
              </el-form-item>
            </el-card>
          </el-col>
        </el-row>
        <!-- <el-form-item label-width="-1px" label="开始设备模拟" prop="">
        <el-button type="primary" icon="el-icon-search" size="medium"> 主要按钮 </el-button>
      </el-form-item> -->
        <el-row class="home3">
          <el-col :span="6"> `</el-col>
          <el-col :span="10">
            <el-card class="card3">
              <span class="card3_font">开启模拟器需要先进行选择数量</span>
              <el-form-item size="large" class="card3_button">
                <el-button type="primary" @click="submitForm">提交</el-button>
                <el-button @click="resetForm">重置</el-button>
              </el-form-item>
            </el-card></el-col
          >
        </el-row>
      </el-form>
    </dir>
  </div>
</template>
<script>
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        equipment_switch: false,
        switchNuber: 0,
      },
      rules: {},

      countData: [
        {
          name: "模拟器测试",
          number: 106,
          icon: "user-solid",
          color: "#2ec7c9",
        },
        {
          name: "运行时间",
          number: 243,
          icon: "user-solid",
          color: "#ffb980",
        },
        {
          name: "服务数据流量",
          number: 0,
          icon: "user",
          color: "#5ab1ef",
        },
      ],
    };
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
    submitForm() {
      // console.log(this.formData.switchNuber)
      this.$router.push({ path: "/simulator/heart", query: {id: this.formData.switchNuber} });
      // this.$router.push('/simulator/heart')
      // this.$refs['elForm'].validate(valid => {
      //   if (!valid) return
      //   // TODO 提交表单
      // })
    },
    resetForm() {
      this.formData.switchNuber = 0;
      this.formData.equipment_switch = false;
      // this.$refs['elForm'].resetFields()
    },
  },
};
</script>
<style lang="less" scoped >
.home {
  .num {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    // width: 1200px;
    // text-align: center;

    .el-card {
      width: 250px;
      margin-top: 25px;
      margin-bottom: 20px;
    }

    .icon {
      font-size: 30px;
      width: 80px;
      height: 100px;
      text-align: center;
      line-height: 80px;
      color: #fff;
    }
    .detail {
      height: 30px;
      margin-left: 15px;
      // display: flex;
      flex-direction: column;
      justify-content: center;
      .num {
        font-size: 24px;
        margin-bottom: 2px;
      }
      .txt {
        font-size: 18px;
        text-align: center;
        color: #999999;
      }
    }
  }
  .graph {
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
    .el-card {
      width: 48%;
    }
  }
}

.home2 {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-bottom: 20px;
  .nuber_card {
    width: 800;
    align-content: center;
    margin-bottom: 20px;
  }
}
.home3 {

  .card3 {
    width: 800px;
    text-align: center;


    .card3_font {
    font-size: 30px;
    font-weight: 700;
    color: rgb(28, 181, 241);
    margin-bottom: 20px;
  }

  .card3_button {
    margin-bottom: 20px;
    margin-top: 20px;
    margin-right: 40px;
  }
  }
}
</style>
