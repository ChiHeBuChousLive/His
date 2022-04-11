<template>
  <div>
    <el-row>
        <div
          id="myChartOxygen"
          style="
            width: 700px;
            height: 500px;
            margin-top: 40px;
            margin-left: 20px;
          "
        ></div>
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
      OxygenseriesObjcet5: {
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

        data1: [],
        data2: [],
        data3: [],
        data4: [],
        data5: [],

    myChartOxygen: null,
    oneMinutes: 60 * 1000,
    oxygen: 60 + Math.random() * 45,
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
        title: { text: "血氧检测" },
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
              name: "用户1血氧",
            },
          ],
        },
        series: [
          {
            name: "用户1血氧",
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
          var newoxygen1 = Math.random() * 6 - 3;
          // this.dataname = this.dataname + j.toString();
          switch (j + 1) {
            case 1:
              this.datasOxygen.data1.push(Math.round(this.oxygen + newoxygen1));
              break;
            case 2:
              this.datasOxygen.data2.push(Math.round(this.oxygen + newoxygen1));
              break;
            case 3:
              this.datasOxygen.data3.push(Math.round(this.oxygen + newoxygen1));
              break;
            case 4:
              this.datasOxygen.data4.push(Math.round(this.oxygen + newoxygen1));
              break;
            case 5:
              this.datasOxygen.data5.push(Math.round(this.oxygen + newoxygen1));
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
        title: { text: "血氧检测" },
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
        name = "用户" + (j + 1) + "血氧";

        switch (j + 1) {
          case 1:
 
            this.OxygenlegendName1.name = name;
            this.option.legend.data.push(this.OxygenlegendName1);
              this.OxygenseriesObjcet1.name = name;
           this.OxygenseriesObjcet1.data = this.datasOxygen.data1;
        this.option.series.push(this.OxygenseriesObjcet1);
            break;
          case 2:
            this.OxygenlegendName2.name = name;
            this.option.legend.data.push(this.OxygenlegendName2);
                          this.OxygenseriesObjcet2.name = name;
           this.OxygenseriesObjcet2.data = this.datasOxygen.data2;
        this.option.series.push(this.OxygenseriesObjcet2);
            break;
          case 3:
            this.OxygenlegendName3.name = name;
            this.option.legend.data.push(this.OxygenlegendName3);
                this.OxygenseriesObjcet3.name = name;
           this.OxygenseriesObjcet3.data = this.datasOxygen.data3;
        this.option.series.push(this.OxygenseriesObjcet3);
            break;
          case 4:
            this.OxygenlegendName4.name = name;
            this.option.legend.data.push(this.OxygenlegendName4);
                                      this.OxygenseriesObjcet4.name = name;
           this.OxygenseriesObjcet4.data = this.datasOxygen.data4;
        this.option.series.push(this.OxygenseriesObjcet4);
            break;
          case 5:
      
            this.OxygenlegendName5.name = name;
            this.option.legend.data.push(this.OxygenlegendName5);
             this.OxygenseriesObjcet5.name = name;
           this.OxygenseriesObjcet5.data = this.datasOxygen.data5;
        this.option.series.push(this.OxygenseriesObjcet5);
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
    //    debugger;
      this.newtim = new Date(this.newtim + this.oneMinutes);
      var newoxygen1 = Math.random() * 9 - 4;
      var newoxygen2 = Math.random() * 7 - 4;
      var newoxygen3 = -20+Math.random() * 40;
      var newoxygen4 = Math.random() * 9 - 5;
      var newoxygen5 = Math.random() * 7 - 3;
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
        this.datasOxygen.data1.shift();
          this.datasOxygen.data1.push(Math.round(this.oxygen + newoxygen5));
          this.monitoringDate(this.datasOxygen.data1[0],1)
      }else if (b == 2){
        this.datasOxygen.data1.shift();
          this.datasOxygen.data1.push(Math.round(this.oxygen + newoxygen5));
          this.datasOxygen.data2.shift();
          // debugger
          this.datasOxygen.data2.push(Math.round(this.oxygen + newoxygen4));
          this.monitoringDate(this.datasOxygen.data1[0],1)
          this.monitoringDate(this.datasOxygen.data2[0],2)
      }else if(b == 3){
                this.datasOxygen.data1.shift();
          this.datasOxygen.data1.push(Math.round(this.oxygen + newoxygen5));
          this.datasOxygen.data2.shift();
          this.datasOxygen.data2.push(Math.round(this.oxygen + newoxygen4));
                    this.datasOxygen.data3.shift();
          this.datasOxygen.data3.push(Math.round(this.oxygen + newoxygen3));
                    this.monitoringDate(this.datasOxygen.data1[0],1)
          this.monitoringDate(this.datasOxygen.data2[0],2)
          this.monitoringDate(this.datasOxygen.data3[0],3)
      }else if(b == 4){
                        this.datasOxygen.data1.shift();
          this.datasOxygen.data1.push(Math.round(this.oxygen + newoxygen5));
          this.datasOxygen.data2.shift();
          this.datasOxygen.data2.push(Math.round(this.oxygen + newoxygen4));
                    this.datasOxygen.data3.shift();
          this.datasOxygen.data3.push(Math.round(this.oxygen + newoxygen3));
                    this.datasOxygen.data4.shift();
          this.datasOxygen.data4.push(Math.round(this.oxygen + newoxygen2));
                             this.monitoringDate(this.datasOxygen.data1[0],1)
          this.monitoringDate(this.datasOxygen.data2[0],2)
          this.monitoringDate(this.datasOxygen.data3[0],3)
                             this.monitoringDate(this.datasOxygen.data4[0],4)

      }else if(b==5){
                                this.datasOxygen.data1.shift();
          this.datasOxygen.data1.push(Math.round(this.oxygen + newoxygen5));
          this.datasOxygen.data2.shift();
          this.datasOxygen.data2.push(Math.round(this.oxygen + newoxygen4));
                    this.datasOxygen.data3.shift();
          this.datasOxygen.data3.push(Math.round(this.oxygen + newoxygen3));
                    this.datasOxygen.data4.shift();
          this.datasOxygen.data4.push(Math.round(this.oxygen + newoxygen2));
                    this.datasOxygen.data5.shift();
          this.datasOxygen.data5.push(Math.round(this.oxygen + newoxygen1));
                                       this.monitoringDate(this.datasOxygen.data1[0],1)
          this.monitoringDate(this.datasOxygen.data2[0],2)
          this.monitoringDate(this.datasOxygen.data3[0],3)
                             this.monitoringDate(this.datasOxygen.data4[0],4)
                             this.monitoringDate(this.datasOxygen.data5[0],5)
      }
      if(this.$route.query.id == 1){
      this.myChartOxygen.setOption({
            series: [{ data: this.datasOxygen.data1 }],
          });
      }else if(this.$route.query.id == 2){
      this.myChartOxygen.setOption({
            series: [{ data: this.datasOxygen.data1 },
            { data: this.datasOxygen.data2 }],
          })}else if(this.$route.query.id == 3){
      this.myChartOxygen.setOption({
            series: [{ data: this.datasOxygen.data1 },
            { data: this.datasOxygen.data2 },{ data: this.datasOxygen.data3 }],
          })}else if(this.$route.query.id == 4){
      this.myChartOxygen.setOption({
            series: [{ data: this.datasOxygen.data1 },
            { data: this.datasOxygen.data2 },{ data: this.datasOxygen.data3 },
            ,{ data: this.datasOxygen.data4 }]
          })}else if(this.$route.query.id == 5){
      this.myChartOxygen.setOption({
            series: [{ data: this.datasOxygen.data1 },
            { data: this.datasOxygen.data2 },{ data: this.datasOxygen.data3 },
            ,{ data: this.datasOxygen.data4 },
            { data: this.datasOxygen.data5 }]
          })}

      

      this.myChartOxygen.setOption({
        xAxis: { data: this.time },
      });
    },

   
  },
  mounted() {
    // debugger;
    this.myChartOxygen = echarts.init(document.getElementById("myChartOxygen"));
    // debugger;
    this.createDate();
    // debugger;
    this.myChartOxygen.setOption(this.option);
    //  // debugger;
    // setInterval(this.addData(), 3);

    setInterval(() => {
      //间隔函数，每隔多少时间将数据进行更新,并请求后端接口
      this.addData();
      // getMonitoring()
    }, 6000);
  },
    beforeDestroy(){
      clearInterval(this.clearTimeSet);
    }
};
</script>

<style>
</style>