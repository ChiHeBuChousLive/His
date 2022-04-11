<template>
  <div>
      <el-row>
          <el-col :span="12">
             <Heart_rate_chart/>
          </el-col>
          <el-col :span="12">
              <oxygens_chart></oxygens_chart>
          </el-col>
      </el-row>
  </div>
</template>

<script>
import Heart_rate_chart from './heart_rate_chart.vue'
import oxygens_chart from "./oxygens_chart.vue"

export default {
    components:{
        oxygens_chart,
        Heart_rate_chart
    }
}
</script>

<style>

</style>