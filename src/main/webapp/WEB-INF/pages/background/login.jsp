<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>${contextName }</title>
	 <meta name="renderer" content="webkit">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	 <link rel="stylesheet" href="${webRoot }/layui/css/layui.css"  media="all">
  </head>
  <body>
  
  <div style="width:1000px;height:auto;margin:auto;margin-bottom:50px">
  	<img src="${webRoot }/img/1.jpg" style="width:1000px;height:auto;"/>
  </div>
  
  <div style="max-width:500px;margin:auto;">
  	<h3 style="text-align:center;background-color: rgb(27,95,254);border-radius: 5px 5px 0px 0px;line-height: 3;font-weight: bold;color:white;margin-top:10px;">后 台 登 录</h3>
	<form name="login-form" class="layui-form" action="${webRoot }/login" method="POST"  style="border:1px solid lightgray;padding-top:20px;padding-right:20px;margin-bottom:20px;">
 	<div class="layui-form-item">
    	<label class="layui-form-label">用户名</label>
	    <div class="layui-input-block">
	      <input name="name" lay-verify="required|name" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">密码</label>
	    <div class="layui-input-block">
	      <input name="password" lay-verify="required|password" placeholder="请输入" autocomplete="off" class="layui-input" type="password">
	    </div>
  	</div>
  	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
  	</div>
	<div class="layui-form-item">
  	 	<div class="layui-input-block">
  		${requestScope.error }
  		</div>
  	</div>
</form>
 </div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form'], function(){
  var form = layui.form()
  ,layer = layui.layer;
 
  //自定义验证规则
  form.verify({
    name: function(value){
      if(value.length < 2){
        return '用户名至少2个字符';
      }
    }
    ,password: [/(.+){6,20}$/, '密码必须6到20位']
    
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
