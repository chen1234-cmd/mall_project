 layui.config({
      base: '../layui/js/'
  }).extend({
      notice: 'notice'
  });
  layui.use(['notice'], function () {
      var notice = layui.notice; // 允许别名 toastr
          
          // 初始化配置，同一样式只需要配置一次，非必须初始化，有默认配置
          notice.options = {
              closeButton:true,//显示关闭按钮
              debug:false,//启用debug
              positionClass:"toast-top-right",//弹出的位置,
              showDuration:"300",//显示的时间
              hideDuration:"3000",//消失的时间
              timeOut:"3000",//停留的时间
              extendedTimeOut:"3000",//控制时间
              showEasing:"swing",//显示时的动画缓冲方式
              hideEasing:"linear",//消失时的动画缓冲方式
              iconClass: 'toast-info', // 自定义图标，有内置，如不需要则传空 支持layui内置图标/自定义iconfont类名
              onclick: null, // 点击关闭回调
          };
  
  
          notice.error("欢迎来到后台管理系统！");
          notice.info("登录成功");
          // 手动移除notice 或者使用 removeToast
          notice.hideToast();
          
  });