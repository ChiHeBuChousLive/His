<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          <p>你好，朋友很高兴与你见面！</p>
          此套系统是我们山河已秋第一次业务开发：        <br />
          我们怀着利用自己的专业知识能做出点什么有意义的想法走到了一起 <br />
          这套项目的构思：来源与半年期我与朋友的讨论， <br />
          在后面的时间中我不断进行构思与完善，同时也在不断寻求开发伙伴 <br />
          <p> 今天他终于与大家见面了！！</p>
          在后面的时间中，我们山河已秋还会将各种之前的的想法创意都进行做出来 <br />
          当然，如果你有好的想法创意也可以找到我们，加入我们 <br />
          <p>我们由衷的希望，能够与你共同进步</p>
        </blockquote>
        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>分布式乡村医疗云管理后台</h2>
        <p>为多一丝挽救生命的可能而拼尽全力</p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="goTarget('https://gitee.com/wuyao-kejiu/his')"
            >访问码云</el-button
          >
          <el-button
            size="mini"
            icon="el-icon-s-home"
            plain
            @click="goTarget('https://blog.csdn.net/m0_52289494?type=blog')"
            >访问CSDN</el-button
          >
        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>Sms</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>联系信息</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-chat-dot-round"></i> QQ：<a href="javascript:;"
                >2272244163</a
              >
            </p>
            <p>
              <i class="el-icon-chat-dot-round"></i> 团队：<a
                href="javascript:;"
                >山河已秋</a>
            </p>
            <p>
              <i class="el-icon-chat-dot-round"></i>
              <a href="javascript:;">欢迎加入我们</a>
            </p>
            <h3 class="h3class">急求精通前端的朋友！！！</h3>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>更新日志</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v2.3 - 2022-03-31">
              <ol>
                <li>设备状态系统与测试系统出现依赖循环</li>
                <li>2.0版本逻辑架构崩盘，修复失败</li>
                <li>准备构建3.0版本逻辑架构</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
          <el-collapse accordion>
            <el-collapse-item title="v2.2 - 2022-03-31">
              <ol>
                <li>腾讯云短信功能实现</li>
                <li>位置信息管理系统ui界面滑块bug修复</li>
                <li>警报管理模块出现问题</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
          <el-collapse accordion>
            <el-collapse-item title="v2.1 - 2022-03-30">
              <ol>
                <li>增加腾讯云短信功能</li>
                <li>测试系统基本功能完成</li>
                <li>位置信息管理系统ui界面滑块出现问题</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
          <el-collapse accordion>
            <el-collapse-item title="v2.0 - 2022-03-28">
              <ol>
                <li>主体功能全部实现</li>
                <li>增加测试系统</li>
                <li>增加根据地图测试功能</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
          <el-collapse accordion>
            <el-collapse-item title="v1.4 - 2022-03-26">
              <ol>
                <li>完成绿色通道模块</li>
                <li>优化用户与病例关联逻辑</li>
                <li>优化ui显示界面</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
          <el-collapse accordion>
            <el-collapse-item title="v1.3 - 2022-03-26">
              <ol>
                <li>数据库整合完成</li>
                <li>全体框架搭建完成</li>
              </ol>
            </el-collapse-item>
          </el-collapse>

          <el-collapse accordion>
            <el-collapse-item title="v1.2 - 2022-03-24">
              <ol>
                <li>角色权限设计完成</li>
                <li>逻辑功能重构</li>
                <li>功能模块构建完成</li>
              </ol>
            </el-collapse-item>
          </el-collapse>

          <el-collapse accordion>
            <el-collapse-item title="v1.1 - 2022-03-22">
              <ol>
                <li>前后端框架搭建</li>
                <li>数据库结构构建</li>
                <li>Redis搭建完成</li>
                <li>开发团队组建完成</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>捐赠支持</span>
          </div>
          <div class="body">
            <!-- <img
              src="https://oscimg.oschina.net/oscnet/up-d6695f82666e5018f715c41cb7ee60d3b73.png"
              alt="donate"
              width="100%"
            /> -->
            <span style="display: inline-block; height: 30px; line-height: 30px"
              >你可以请作者喝杯冰柠檬水表示鼓励</span
            >
            <span style="display: inline-block; height: 30px; line-height: 30px"
              >当然如果你有好的想法或者也可以通过左侧的联系方式联系我们，</span
            >
            <span style="display: inline-block; height: 30px; line-height: 30px"
              >这是对我们最好的支持</span
            >
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.0",
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  .h3class {
      margin-top: 10px;
      font-weight: 300;
      font-size: 24px;
      color: rgb(12, 210, 245);
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

