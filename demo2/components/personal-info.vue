<template>
  <div class="panel panel-white panel-static-height">
    <div class="panel-heading">
        <h3 class="panel-title">
            个人信息
        </h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="pull-left" style="width: 90px; height: 90px; padding-left: 15px;">
            <img src="assets/img/People.png" alt="" class="avatar">
          </div>
        <div class="pull-left" style="height: 90px; padding: 15px;">
            <ul class="no-style">
              <li class="police-name">张三</li>
              <li class="police-id">123456</li>
            </ul>
        </div>
      </div>
      <div class="row">
        <!-- <div class="col-lg-4 col-md-6"> -->
        <div class="func-item" onclick="go_wrongList();">
          <div class="icon">
            <img src="assets/img/Wrong.png" alt="">
          </div>
          <div class="desciption">
            错题集
          </div>
        </div>
        <div class="func-item">
          <div class="icon">
            <img src="assets/img/People.png" alt="">
          </div>
          <div class="desciption">
            个人设置
          </div>
        </div>
        <div class="func-item" onclick="go_login();">
          <div class="icon">
            <img src="assets/img/Out.png" alt="">
          </div>
          <div class="desciption">
            退出
          </div>
        </div>
        <div class="func-item">
          <div class="icon">
            <img src="assets/img/List.png" alt="">
          </div>
          <div class="desciption">
            成绩查询
          </div>
        </div>
        <div class="func-item func-item-2x no-border">
          <div class="info">
            <ul class="no-style">
              <li>已通过课程：10门</li>
              <li>未通过课程：4门</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
...
</style>

<script>
  // import AppHeader from './AppHeader.vue'
  export default {
    name:'app',
    props:['data']
    data() {
      return {}
    },
    methods: {
      handleClick() {}
    },
    components: {
      AppHeader
    }
  }
</script>