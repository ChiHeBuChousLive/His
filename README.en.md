<p align="center">
	<img width="20%" height="20%" alt="logo" src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcQC0y8aTOuv8OT.MRqLxVqnXVy2uAsTXRNTwdzazW9DV6mEeRj.vSIuFFnK*KUyfH*PhEhYTMvUGYHFm5nlNF8E!/b&bo=9AH0AQAAAAADFzI!&rf=viewer_4">
</p>
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">His</h1>
<h4 align="center">基于SpringBoot+Vue前后端分离的乡村医疗扩展系统
</h4>
<p align="center">
	<a href="https://gitee.com/wuyao-kejiu/his"><img src="https://gitee.com/y_project/RuoYi-Vue/badge/star.svg?theme=dark"></a>
	<a href="https://gitee.com/y_project/RuoYi-Vue/blob/master/LICENSE"><img src="https://img.shields.io/github/license/mashape/apistatus.svg"></a>
</p>




## 项目简介

乡村医疗云平台项目。本项目是一款应用于医院与诊所等医疗管理机构的业务系统，实现了管理机构工作的可视化，科室管理和事务处理的专业化，患者信息库的集成化，实现了医院与诊所的联动，为老年人设计就诊绿色通道，从而保障了老年人在紧急情况下的救援，增强了医护人员对患者健康状况的了解。

## 技术架构

* 前端采用Vue、Element UI、Echarts
* 后端采用Spring Boot、Spring Security、Redis & Jwt、腾讯云SMS、阿里云OSS、Docker。
* 权限认证使用Jwt，支持多终端认证系统。
* 其他技术Gitee使用、Nginx使用、Docker使用、机器学习相关知识、微服务结构（此版本仅为过渡）
* 项目开放了大量的接口，方便与设备进行链接、交互。
* 提供了CSDN使用开发技术文章保持同步更新、方便用户进行使用。
* 后续会开发基于微服务版本的，方便项目的移植

## 内置功能

​        基本的医院人员各项功能：（不提供其他医院基础功能）

1. 用户管理：用户是系统操作者，该功能主要完成系统用户配置。

2. 部门管理：配置医院各部门，以树结构展现支持数据权限。

3. 岗位管理：配置系统用户所属担任职务。

4. 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。

5. 乡村诊所管理：对门诊医生基本管理

   

   项目核心的功能：

6. 绿色通道用户管理：主要面向乡村及空巢老人，功能包含老人的病历，问诊等信息

7. 病历禁忌药物：针对患者病情一键查询禁忌药物，与设备报警，地图定位功能共同构建了紧急救治功能

8. 设备状态监控管理：对接入接口的设备进行状态监控。

9. 异常警报管理：处理异常状态的设备。

10. 地图定位与紧急通知：根据异常警报对数据异常的设备进行定位，规划路线，就近通知门诊。

11. 紧急救治管理：获取定位以后，获取设备对应患者信息，根据患者以往信息进行病情推演预测，让医生及时准备救治方案。

12. 测试功能： 提供两套通过软件模拟的物理设备（自带用户检测状态判别与纯数据检测设备），可以为硬件提供必须的测试模拟信息。

    

    项目管理即扩展功能

13. 通知管理：根据业务代码自动生成相关的api接口文档。

14. 日志管理：拖动表单元素生成相应的HTML代码。

15. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。

16. 缓存监控：对系统的缓存信息查询，命令统计等。

17. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。

18. 提供预留扩充：项目以及配置好大量中间件（Elasticsearch或者Solr、RabbitMQ）

## 搭建步骤

推荐：前往gitee进行下载，以避免版本过旧导致的各种bug

https://gitee.com/wuyao-kejiu/his

1.首先配置数据库导入sql中的数据库脚本，必须保持库的结构，否则项目会出现bug

2.导入到`Eclipse`，菜单 `File` -> `Import`，然后选择 `Maven` -> `Existing Maven Projects`，点击 `Next`> 按钮，选择工作目录，然后点击 `Finish` 按钮，即可成功导入。`Eclipse`会自动加载`Maven`依赖包，初次加载会比较慢，运行项目出现山河已秋表示启动成功

3.前端配置

```bash
# 进入项目目录
cd ruoyi-ui
# 安装依赖
npm install
# 强烈建议不要用直接使用 cnpm 安装，会有各种诡异的 bug，可以通过重新指定 registry 来解决 npm 安装速度慢的问题。
npm install --registry=https://registry.npmmirror.com
# 本地开发 启动项目
npm run dev
```

4.打开浏览器，输入：([http://localhost:80 (opens new window)](http://localhost/)) 默认账户/密码 `admin/admin123`）
若能正确展示登录页面，并能成功登录，菜单及页面展示正常，则表明环境搭建成功

## 关于我们（山河已秋）：

​	目前团队主要的开发人员都是学生（包括me）：所以有很多地方的设计可能完全不到位，各种问题以及bug亦可能处理不了，

​	**但，我们已经在路上了！**

​	做这个之前有朋友总是问我你做这个有啥用啊，不浪费时间吗，你这项目能参加竞赛吗，也没什么经济性啊，为什么要去做哪？

​	**我想说的是：只要你感觉它有意义？哪怕只有一丁点意义，一丁点作用就不要去管那么多得失，不要把自己活着那么斤斤计较。这就是我们，一群将永远奔走在学习路上同时希望自己能用自己所学在这个时代发出自己微弱的光芒的孩子。**

## 团队主要的人员包括：

​	折纸：java后端，前端，数据库，基础硬件通信，机器学习

​	鹏哥：大数据分析，机器学习，数据可视化（Echarts）深，度学习（还不会，说能学会）

​	攸（LIGO）：python后端，前端（写的贼丑），

​	吃喝不愁的老谭：java后端

​	i狗子：java后端

团队没有专业的前台，希望在后续的路上能碰上。。。这群糙汉的审美我实在了受不了



## 数据库关系图

<div>
<img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcXU49d42iUY17syF34SSca3el1Ih5HsB*6aVLd4AsLim1tTyIzVfxpKBZ8mjfpwZFTV75xSHvXgSr6r5jw6Sq.E!/b&bo=7waAAv0GhQIDKRs!&rf=viewer_4"/>
<img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcXU49d42iUY17syF34SSca1STnNtT.NUdH2tGTpeZ8a4BTD4nJN9zhihHQDiSTh9D3CqAStnSjiIbpbFyKLcYiA!/b&bo=8gWAAnsIkQMDKZg!&rf=viewer_4">
</div>





## 演示图

<table>
    <tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcVOl*JbMRwqEPusmOf3twOjuJPv*lvUi9jaGPVdUlFFjJ1WGM8A*YCW1cDAhYdBdkxw52QY3zH434LedoH5diFw!/b&bo=eQcQBHkHEAQDiaw!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcRfXzyQtVXamITJ6pN8bzijmasRLc8g5jMOooZBlhd1dkcj94ZTccuVQusL8qwUYBu4Q1Ni5LybA0uQnZoo39MI!/b&bo=agWAAnwHdQMDGdw!&rf=viewer_4"/></td>
    </tr>
    <tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcRfXzyQtVXamITJ6pN8bziiI3hjuYB3M7CoYtaj24a0qK0CyEy.91a6SkEwtkF0ucGF3zG.*YwC9fbkZrwHcbT8!/b&bo=FQaAAoQHFwMDKQo!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcZD3vF*u3GEeKhwJCX99ENUNJ3ZeY684B*kT8.CsPG9wIXDhoFK8HHQ0iSlWFqkBD.Ar9BcSqBcMnWc3MgpAQjs!/b&bo=agWAAucGMAMDOSM!&rf=viewer_4"/></td>
    </tr>
	<tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcWnHYJd5UOAVYOXr5AnEZ2skQsEWDhKk722h93dHWWKb3ZinD.ZluIeZ4p27a5nI*v6chvJt4nFuIPDBJMr8sBI!/b&bo=PweAAn8HlgIDGWo!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcWnHYJd5UOAVYOXr5AnEZ2v*a9d3OQmv*50jz9dvgv9FK*81.Y8Cu0MoX7RzWhwWejcOSKi3t*DX3x5ck8RZpsI!/b&bo=mAWAAnAHUwMDGQQ!&rf=viewer_4"/></td>
    </tr>	 
    <tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcXgpr9Jl0gx.rgd0FIswdr1Dlhg4OAALCQaMl*q7z56rtBhnGtCqL9e0IbWn8EA2yM1GakcGgrvBgIMsieavWjY!/b&bo=FgWAArcHywMDGdU!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcTWILYGxwIDz0qJQMbwjYkD76Sv5B.ddnGbvsLrdHtoj7XPLR.tlNeyg1CTvRVI.F81roB0tfFIhmLyhPpPm29Y!/b&bo=9QWAAnIHIAMDGRg!&rf=viewer_4"/></td>
    </tr>
	<tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcTWILYGxwIDz0qJQMbwjYkCz41dGdZudZOYynHFxe.essmGxPzJuYJTWhFnC2t.fl1s4zvMc6ghn6bmIdJJF1Rc!/b&bo=9QWAAoMHJwMDGe4!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcRDoS7uJHkWSWr6gS0hmkb1v3H9mXKwYQmOkJLneD0FAOOyTNVWCR5cOa8KQiAy0rlC42YqUe0O09IqOiHQZGVU!/b&bo=fwcPBH8HDwQDGTw!&rf=viewer_4"/></td>
    </tr>
	<tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcTUHEJECZEBnqvOgX*k*XXhno*VssN928eLPLmHWQkyLrS8EDGbeKCV1.E7*0UorhL2jN4j8VkgViJxsG1yqLGk!/b&bo=nwaAAoUH1wIDGXA!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcTUHEJECZEBnqvOgX*k*XXhX..tI2qqV1A987*VK3nnD3xgmQhUzkTqHo3ChUSFrUzlhOuMHkJ3j2v51NZ6p*Q0!/b&bo=nQaAAoEH1gIDGXc!&rf=viewer_4"/></td>
    </tr>
    <tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcRDoS7uJHkWSWr6gS0hmkb3*D.6WgsjtAF9KI6YdSg09l3Jlx5PdrnHJfr36r7W6TlmG6sze91VsuOMC9qKSUjg!/b&bo=XQReAl0EXgIDGTw!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcTUHEJECZEBnqvOgX*k*XXjWrktcNyZqWunTH4qTpSC5ZsRaVSLt7GIpWg9bijyI6GJ746jKNe81Nvko25hpQnE!/b&bo=rgZ.Aq4GfgIDGTw!&rf=viewer_4"/></td>
    </tr>
     <tr>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mcRDoS7uJHkWSWr6gS0hmkb2arTeVzVoDsWvAKj22*4tKKs9Ev3q.BfNNMsGQHT3uB7hf2kKnmONU4.Vpv3cuhGc!/b&bo=gAJrBXYDgAcBGSA!&rf=viewer_4"/></td>
        <td><img src="http://m.qpic.cn/psc?/V51tOoIn0CYg3u2sSOD33s4zPK3zu1xX/45NBuzDIW489QBoVep5mceU.6DIAvmDf*Yo1dSHq2afZAnaDKsnW2WE6pkRbfeowaP6kMXXI9Oh5DKHLO8Ed5dh0.vFeV9e3Do7VcdLQXPo!/b&bo=VAR7BFQEewQDKQw!&rf=viewer_4"/></td>
    </tr>
</table>



​    

 

