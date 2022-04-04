<template>
  <div id="myChart" style="width: 700px; height: 500px; margin: auto"></div>
</template>

<script>
import echarts from "echarts";


export default {


  data() {
    return {
      data1: [],
      myCharts: null,
      oneMinutes: 60 * 1000,
      heart: 60 + Math.random() * 60,
      time: [],
    // starttime :
        now :new Date((+ new Date()- 120*60*1000)),
       newtim :new Date(),
       day: null,
        // hours:initDate(hours),
        // minutes:initDate(minutes),
        //     day:initDate(now.getDate()),
      option:{
            tooltip:{show:true,trigger:"axis"},
            title:{text:"心率检测"},
            xAxis:{ type:"category",data:this.time
            },
            yAxis:{type:"value",scale:false,splitLine:{show:false}
            },
            legend:{ type: 'scroll', orient: 'vertical',right: 10,top: 300, bottom: 20,
                data:[{
                    name:"用户1心率"
                }]
            },
            series:[{name:"用户1心率",type:"line",data:this.data1,
                endLable:{show:false}
                }]
        }
    };
  },
  methods: {
    createDate() {
        //  // debugger;
      for (var i = 0; i < 120; i++) {
        var newheart1 = Math.random() * 9 - 3;
        var hours = this.initDate(this.now.getHours());
        var montes = this.initDate(this.now.getMonth() + 1);
        var minutes = this.initDate(this.now.getMinutes() + i);
        if (minutes >= 60) {
          minutes = minutes - 60;
          hours = hours + 1;
          if (minutes >= 60) {
            minutes = minutes - 60;
            hours = hours + 1;
          }
        }
              //  // debugger;
        hours = this.initDate(hours);
        minutes = this.initDate(minutes);
        this.day= this.initDate(this.now.getDate());
        this.time.push(montes + "/" + this.day+ "/" + hours + ":" + minutes);
        this.data1.push(Math.round(this.heart + newheart1));
      }
    this.option ={
            tooltip:{show:true,trigger:"axis"},
            title:{text:"心率检测"},
            xAxis:{ type:"category",data:this.time
            },
            yAxis:{type:"value",scale:false,splitLine:{show:false}
            },
            legend:{ type: 'scroll', orient: 'vertical',right: 10,top: 300, bottom: 20,
                data:[{
                    name:"用户1心率"
                }]
            },
            series:[{name:"用户1心率",type:"line",data:this.data1,
                endLable:{show:false}
                }]
        }
    },
    initDate(value) {
      //时间格式化
      if (value <= 9) {
        return "0" + value;
      } else {
        return value;
      }
    },
    addData() {
        
    //    // debugger;
    // console.log(1)
      this.newtim = new Date(this.newtim + this.oneMinutes);
      var newheart1 = Math.random() * 9 - 3;
      var hours = this.initDate(this.newtim.getHours());
      var minutes = this.initDate(this.newtim.getMinutes());
      var montes = this.initDate(this.newtim.getMonth() + 1);
      if (minutes > 60) {
        minutes = minutes - 60;
        hours = hours + 1;
      }
        this.day= this.initDate(this.newtim.getDate());
        this.time.shift();
        this.time.push(montes + "/" + this.day+ "/" + hours + ":" + minutes); //对时间数据进行添加和删除
        this.data1.shift();
        this.data1.push(Math.round(this.heart + newheart1));
        // console.log(this.data1 === null)
         // debugger
        this.myCharts.setOption({
            series:[{data:this.data1},
            ],
            xAxis:{data:this.time}
            })

    },
  },
  mounted() {
    //     //  // debugger;
    this.myCharts = echarts.init(document.getElementById("myChart"));
    this.createDate();
    this.myCharts.setOption(this.option);
            //  // debugger;
     // setInterval(this.addData(), 3);

        setInterval(()=>{//间隔函数，每隔多少时间将数据进行更新
            this.addData()

        },1000)       
  },
};
</script>

<style>
</style>