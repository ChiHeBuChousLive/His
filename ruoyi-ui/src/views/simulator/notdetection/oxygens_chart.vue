<template>
  <div>
    <el-row>
      <el-col :span="12">
        <div
          id="myChart"
          style="
            width: 700px;
            height: 500px;
            margin-top: 40px;
            margin-left: 20px;
          "
        ></div>
      </el-col>
      <el-col :span="12">
        <div
          id="myChartOxygen "
          style="
            width: 700px;
            height: 500px;
            margin-top: 40px;
            margin-left: 20px;
          "
        ></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import echarts from "echarts";
import { getMonitoring } from "@/api/caution/alarm";

export default {
  data() {
    return {
      // light = 0,
      // 血氧饱和度：
      OxygenseriesObjcet1: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      OxygenseriesObjcet2: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      OxygenseriesObjcet3: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      OxygenseriesObjcet4: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      seriesObjcet5: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      
      OxygenlegendName1: {
        name: null,
      },
      OxygenlegendName2: {
        name: null,
      },
      OxygenlegendName3: {
        name: null,
      },
      OxygenlegendName4: {
        name: null,
      },
      OxygenlegendName5: {
        name: null,
      },

      datasOxygen: {
        data1: [],
        data2: [],
        data3: [],
        data4: [],
        data5: [],
      },

    myChartOxygen:null,


  // 心率
      datas: {
        data1: [],
        data2: [],
        data3: [],
        data4: [],
        data5: [],
      },
      seriesObjcet1: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      seriesObjcet2: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      seriesObjcet3: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      seriesObjcet4: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      seriesObjcet5: {
        name: null,
        type: "line",
        data: [],
        endLable: { show: false },
      },
      
      legendName1: {
        name: null,
      },
      legendName2: {
        name: null,
      },
      legendName3: {
        name: null,
      },
      legendName4: {
        name: null,
      },
      legendName5: {
        name: null,
      },

      // data1: [],
      // data2: [],
      // data3: [],
      // data4: [],
      // data5: [],

      myCharts: null,
      oneMinutes: 60 * 1000,
      heart: 60 + Math.random() * 50,
      time: [],


      equipment: {
        equipmentId: 1,
      },
      // starttime :
      now: new Date(+new Date() - 120 * 60 * 1000),
      newtim: new Date(),
      day: null,
      option: {
        tooltip: { show: true, trigger: "axis" },
        title: { text: "心率检测" },
        xAxis: { type: "category", data: null },
        yAxis: { type: "value", scale: false, splitLine: { show: false } },
        legend: {
          type: "scroll",
          orient: "vertical",
          right: 10,
          top: 300,
          bottom: 20,
          data: [
            {
              name: "用户1心率",
            },
          ],
        },
        series: [
          {
            name: "用户1心率",
            type: "line",
            data: this.data1,
            endLable: { show: false },
          },
        ],
      },
    };
  },
  methods: {
    createDate() {
      // console.log(this.$route.query.id);
      for (var j = 0; j < this.$route.query.id; j++) {
        for (var i = 0; i < 120; i++) {
          var newheart1 = Math.random() * 6 - 3;
          // this.dataname = this.dataname + j.toString();
          switch (j + 1) {
            case 1:
              this.datas.data1.push(Math.round(this.heart + newheart1));
              break;
            case 2:
              this.datas.data2.push(Math.round(this.heart + newheart1));
              break;
            case 3:
              this.datas.data3.push(Math.round(this.heart + newheart1));
              break;
            case 4:
              this.datas.data4.push(Math.round(this.heart + newheart1));
              break;
            case 5:
              this.datas.data5.push(Math.round(this.heart + newheart1));
              break;
          }
        }
      }
      for(var t=0;t<120;t++){
          var hours = this.initDate(this.now.getHours());
          var montes = this.initDate(this.now.getMonth() + 1);
          var minutes = this.initDate(this.now.getMinutes() + t);
          if (minutes >= 60) {
            minutes = minutes - 60;
            hours = hours + 1;
            if (minutes >= 60) {
              minutes = minutes - 60;
              hours = hours + 1;
            }
          }
          //  debugger;
          hours = this.initDate(hours);
          minutes = this.initDate(minutes);
          this.day = this.initDate(this.now.getDate());
          this.time.push(montes + "/" + this.day + "/" + hours + ":" + minutes);
      }

      this.option = {
        tooltip: { show: true, trigger: "axis" },
        title: { text: "心率检测" },
        xAxis: { type: "category", data: this.time },
        yAxis: { type: "value", scale: false, splitLine: { show: false } },
        legend: {
          type: "scroll",
          orient: "vertical",
          right: 10,
          top: 300,
          bottom: 20,
          data: [],
        },
        series: [],
      };
      var name = null;
      for (var j = 0; j < this.$route.query.id; j++) {
        name = "用户" + (j + 1) + "心率";

        switch (j + 1) {
          case 1:
 
            this.legendName1.name = name;
            this.option.legend.data.push(this.legendName1);
              this.seriesObjcet1.name = name;
           this.seriesObjcet1.data = this.datas.data1;
        this.option.series.push(this.seriesObjcet1);
            break;
          case 2:
            this.legendName2.name = name;
            this.option.legend.data.push(this.legendName2);
                          this.seriesObjcet2.name = name;
           this.seriesObjcet2.data = this.datas.data2;
        this.option.series.push(this.seriesObjcet2);
            break;
          case 3:
            this.legendName3.name = name;
            this.option.legend.data.push(this.legendName3);
                this.seriesObjcet3.name = name;
           this.seriesObjcet3.data = this.datas.data3;
        this.option.series.push(this.seriesObjcet3);
            break;
          case 4:
            this.legendName4.name = name;
            this.option.legend.data.push(this.legendName4);
                                      this.seriesObjcet4.name = name;
           this.seriesObjcet4.data = this.datas.data4;
        this.option.series.push(this.seriesObjcet4);
            break;
          case 5:
      
            this.legendName5.name = name;
            this.option.legend.data.push(this.legendName5);
             this.seriesObjcet5.name = name;
           this.seriesObjcet5.data = this.datas.data5;
        this.option.series.push(this.seriesObjcet5);
            break;
        }

      }

    },
    //时间格式化
    initDate(value) {
      if (value <= 9) {
        return "0" + value;
      } else {
        return value;
      }
    },

    async monitoringDate(data,Id){
      // console.log(data)
      //   if(data <75 || data>80){
      //       var x = await getMonitoring(this.equipment)
      //   }
    },

    //添加数据
    addData() {
       debugger;
      this.newtim = new Date(this.newtim + this.oneMinutes);
      var newheart1 = Math.random() * 9 - 4;
      var newheart2 = Math.random() * 7 - 4;
      var newheart3 = -20+Math.random() * 40;
      var newheart4 = Math.random() * 9 - 5;
      var newheart5 = Math.random() * 7 - 3;
      var hours = this.initDate(this.newtim.getHours());
      var minutes = this.initDate(this.newtim.getMinutes());
      var montes = this.initDate(this.newtim.getMonth() + 1);
      if (minutes > 60) {
        minutes = minutes - 60;
        hours = hours + 1;
      }
      this.day = this.initDate(this.newtim.getDate());
      this.time.shift();
      this.time.push(montes + "/" + this.day + "/" + hours + ":" + minutes); //对时间数据进行添加和删除
    //  debugger
     var b = this.$route.query.id
    //  console.log(b==2)
      if(b == 1){
        this.datas.data1.shift();
          this.datas.data1.push(Math.round(this.heart + newheart5));
          this.monitoringDate(this.datas.data1[0],1)
      }else if (b == 2){
        this.datas.data1.shift();
          this.datas.data1.push(Math.round(this.heart + newheart5));
          this.datas.data2.shift();
          // debugger
          this.datas.data2.push(Math.round(this.heart + newheart4));
          this.monitoringDate(this.datas.data1[0],1)
          this.monitoringDate(this.datas.data2[0],2)
      }else if(b == 3){
                this.datas.data1.shift();
          this.datas.data1.push(Math.round(this.heart + newheart5));
          this.datas.data2.shift();
          this.datas.data2.push(Math.round(this.heart + newheart4));
                    this.datas.data3.shift();
          this.datas.data3.push(Math.round(this.heart + newheart3));
                    this.monitoringDate(this.datas.data1[0],1)
          this.monitoringDate(this.datas.data2[0],2)
          this.monitoringDate(this.datas.data3[0],3)
      }else if(b == 4){
                        this.datas.data1.shift();
          this.datas.data1.push(Math.round(this.heart + newheart5));
          this.datas.data2.shift();
          this.datas.data2.push(Math.round(this.heart + newheart4));
                    this.datas.data3.shift();
          this.datas.data3.push(Math.round(this.heart + newheart3));
                    this.datas.data4.shift();
          this.datas.data4.push(Math.round(this.heart + newheart2));
                             this.monitoringDate(this.datas.data1[0],1)
          this.monitoringDate(this.datas.data2[0],2)
          this.monitoringDate(this.datas.data3[0],3)
                             this.monitoringDate(this.datas.data4[0],4)

      }else if(b==5){
                                this.datas.data1.shift();
          this.datas.data1.push(Math.round(this.heart + newheart5));
          this.datas.data2.shift();
          this.datas.data2.push(Math.round(this.heart + newheart4));
                    this.datas.data3.shift();
          this.datas.data3.push(Math.round(this.heart + newheart3));
                    this.datas.data4.shift();
          this.datas.data4.push(Math.round(this.heart + newheart2));
                    this.datas.data5.shift();
          this.datas.data5.push(Math.round(this.heart + newheart1));
                                       this.monitoringDate(this.datas.data1[0],1)
          this.monitoringDate(this.datas.data2[0],2)
          this.monitoringDate(this.datas.data3[0],3)
                             this.monitoringDate(this.datas.data4[0],4)
                             this.monitoringDate(this.datas.data5[0],5)
      }
      if(this.$route.query.id == 1){
      this.myCharts.setOption({
            series: [{ data: this.datas.data1 }],
          });
      }else if(this.$route.query.id == 2){
      this.myCharts.setOption({
            series: [{ data: this.datas.data1 },
            { data: this.datas.data2 }],
          })}else if(this.$route.query.id == 3){
      this.myCharts.setOption({
            series: [{ data: this.datas.data1 },
            { data: this.datas.data2 },{ data: this.datas.data3 }],
          })}else if(this.$route.query.id == 4){
      this.myCharts.setOption({
            series: [{ data: this.datas.data1 },
            { data: this.datas.data2 },{ data: this.datas.data3 },
            ,{ data: this.datas.data4 }]
          })}else if(this.$route.query.id == 5){
      this.myCharts.setOption({
            series: [{ data: this.datas.data1 },
            { data: this.datas.data2 },{ data: this.datas.data3 },
            ,{ data: this.datas.data4 },
            { data: this.datas.data5 }]
          })}

      

      this.myCharts.setOption({
        xAxis: { data: this.time },
      });
    },

   
  },
  mounted() {
    debugger;
    this.myCharts = echarts.init(document.getElementById("myChart"));
    this.createDate();
    this.myCharts.setOption(this.option);
    //  // debugger;
    // setInterval(this.addData(), 3);

    setInterval(() => {
      //间隔函数，每隔多少时间将数据进行更新,并请求后端接口
      this.addData();
      // getMonitoring()
    }, 2000);
  },
    beforeDestroy(){
      clearInterval(this.clearTimeSet);
    }
};
</script>

<style>
</style>