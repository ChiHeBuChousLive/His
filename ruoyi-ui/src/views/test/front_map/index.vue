<template>
  <div id="container" style="width:100%;height:700px"></div>
</template>

<script>
import {listOld,listClinic} from "@/api/test/map";
export default {
  name: 'index',
  data(){
    return{
      closet:{
        clinic:{
          clinicId: 0,
          clinicLeader: "",
          clinicLocation: "",
          clinicName: "",
          clinicPhone: "",
          coordinate: "",
        },
        old:{
          equipmentId:0,
          coordinate: "",
          equipmentHeartRate: "",
          equipmentIp: "",
          equipmentLocation: "",
          equipmentOx: "",
          equipmentTemperature: "",
        }
      },
      list:{

      }
    }
  },
  methods:{
    async getOldAndClinic(){
      await listOld().then(response => {
          //诊所数据
          this.closet.clinic.clinicId=response.data.clinic.clinicId;
          this.closet.clinic.clinicLeader=response.data.clinic.clinicLeader;
          this.closet.clinic.clinicLocation=response.data.clinic.clinicLocation;
          this.closet.clinic.clinicName=response.data.clinic.clinicName;
          this.closet.clinic.clinicPhone=response.data.clinic.clinicPhone;
          this.closet.clinic.coordinate=response.data.clinic.coordinate;


          //老人数据
          this.closet.old.equipmentId=response.data.old.equipmentId;
          this.closet.old.coordinate=response.data.old.coordinate;
          this.closet.old.equipmentHeartRate=response.data.old.equipmentHeartRate;
          this.closet.old.equipmentIp=response.data.old.equipmentIp;
          this.closet.old.equipmentLocation=response.data.old.equipmentLocation;
          this.closet.old.equipmentOx=response.data.old.equipmentOx;
          this.closet.old.equipmentTemperature=response.data.old.equipmentTemperature;
        }
      )
    },
    async getClinic(){
      await listClinic().then(response => {
          this.list=response.rows;
        }
      )
    },
    async draw(){
      await  this.getOldAndClinic();
      await  this.getClinic();
      var map = new BMapGL.Map("container");


      //获取所有的变量
      var oldXy=this.closet.old.coordinate.split(",");
      var oldId=this.closet.old.equipmentId;
      var oldTem=this.closet.old.equipmentTemperature;
      var oldOx=this.closet.old.equipmentOx;
      var oldIp=this.closet.old.equipmentIp;
      var oldLoc=this.closet.old.equipmentLocation;
      var oldRate=this.closet.old.equipmentHeartRate;

      var clinicXy=this.closet.clinic.coordinate.split(",");
      var clinicName=this.closet.clinic.clinicName;
      var clinicPhone=this.closet.clinic.clinicPhone;
      var clinicId=this.closet.clinic.clinicId;
      var clinicLoc=this.closet.clinic.clinicLocation;
      //其他诊所
      var otherClinics=this.list;

      //设置地图中心点，后面的是地图级别
      map.centerAndZoom(new BMapGL.Point(oldXy[0], oldXy[1]), 11);
      //设置可滚轮
      map.enableScrollWheelZoom(true);

      //3d地图
      map.setHeading(64.5);
      map.setTilt(73);
      //定义点
      var p1 = new BMapGL.Point(clinicXy[0],clinicXy[1]);
      var p2 = new BMapGL.Point(oldXy[0],oldXy[1]);


      var driving = new BMapGL.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true,}});
      driving.search(p1,p2);

      //创建起始点和终点
      var marker1 = new BMapGL.Marker(p1);
      var marker2 =new BMapGL.Marker(p2);
      map.addOverlay(marker1);
      map.addOverlay(marker2);


      //窗口优化
      var sContent1 = `<h4 style='margin:0 0 5px 0;'>天安门</h4>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    天安门坐落在中国北京市中心,故宫的南侧,<br>与天安门广场隔长安街相望,是清朝皇城的大门...
    </p></div>`;

      // 创建信息窗口
      var clinicOpts = {
        width: 200,
        height: 100,
        title: clinicName,
      };
      var oldOpts = {
        width: 200,
        height: 100,
        title: "设备"+oldId.toString(),
      };


      var message1="诊所电话："+clinicPhone+"\n"+"诊所地址："+clinicLoc
      var message2="设备温度："+oldTem+"C "+"设备OX："+oldOx+" "+"设备ip："+oldIp+" "+"设备地址："+oldLoc+" "+"设备心率："+oldRate
      //定义窗口
      var infoWindow1 = new BMapGL.InfoWindow(message1,clinicOpts);
      var infoWindow2 = new BMapGL.InfoWindow(message2, oldOpts);

      // 点标记添加点击事件
      marker1.addEventListener('click', function () {
        map.openInfoWindow(infoWindow1, p1); // 开启信息窗口
      });
      marker2.addEventListener('click', function () {
        map.openInfoWindow(infoWindow2, p2); // 开启信息窗口
      });
      //显示其他的点
      for(let i=0;i<otherClinics.length;i++){
        let xy= otherClinics[i].coordinate.split(",");
        let p = new BMapGL.Point(xy[0],xy[1]);
        let marker = new BMapGL.Marker(p);
        map.addOverlay(marker);
        let opt = {
          width: 200,
          height: 100,
          title: otherClinics[i].clinicName,
        };
        let message="诊所电话："+otherClinics[i].clinicPhone+"\n"+"诊所地址："+otherClinics[i].clinicLocation;
        let infoWindow= new BMapGL.InfoWindow(message,opt);
        marker.addEventListener('click', function () {
          map.openInfoWindow(infoWindow, p); // 开启信息窗口
        });

      }
      //改变地图样式，让他好看一点


    },


  },
  //div元素渲染好再引用
  mounted(){
    //画出与最近诊所的距离
    this.draw();
  }
}
</script>


<style scoped>
body,
html,
#container {
  overflow: hidden;
  width: 100%;
  height: 100%;
  margin: 0;
  font-family: "微软雅黑";
}
.info {
  z-index: 999;
  width: auto;
  min-width: 22rem;
  padding: .75rem 1.25rem;
  margin-left: 1.25rem;
  position: fixed;
  top: 1rem;
  background-color: #fff;
  border-radius: .25rem;
  font-size: 14px;
  color: #666;
  box-shadow: 0 2px 6px 0 rgba(27, 142, 236, 0.5);
}
ul li {
  list-style: none;
}
.drawing-panel {
  z-index: 999;
  position: fixed;
  bottom: 3.5rem;
  margin-left: 3rem;
  padding: 1rem 1rem;
  border-radius: .25rem;
  background-color: #fff;
  box-shadow: 0 2px 6px 0 rgba(27, 142, 236, 0.5);
}
.btn {
  width: 75px;
  height: 30px;
  float: left;
  background-color: #fff;
  color: rgba(27, 142, 236, 1);
  font-size: 14px;
  border:1px solid rgba(27, 142, 236, 1);
  border-radius: 5px;
  margin: 0 5px;
  text-align: center;
  line-height: 30px;
}
.btn.current {
  background-color: rgba(27, 142, 236, 1);
  color: #fff;
}
.btn:hover {
  background-color: rgba(27, 142, 236, 0.8);
  color: #fff;
}
</style>
