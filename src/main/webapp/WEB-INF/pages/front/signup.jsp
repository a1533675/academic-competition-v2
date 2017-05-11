<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${contextName }</title>
	 <meta name="renderer" content="webkit">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	 <link rel="stylesheet" href="${webRoot }/layui/css/layui.css"  media="all">
	 <style type="text/css">
	 	html,body{
	 		padding:0px;
			margin:0px;
	 	}
	 </style>
</head>
<body>
	<jsp:include page="head.jsp"/>
	<div style="max-width:500px;margin:auto;">
		<h3 style="text-align:center;background-color: rgb(30,84,158);border-radius: 5px 5px 0px 0px;line-height: 3;font-weight: bold;color:white;margin-top:10px;">用 户 注 册</h3>
	<form name="signup-form" class="layui-form" action="${webRoot }/front/signup" method="POST" style="border:1px solid lightgray;padding-top:20px;margin-bottom:20px;">
 	<input type="hidden" name="type" value="参赛者"/>
 	
 	<div class="layui-form-item">
    	<label class="layui-form-label">用户名*</label>
	    <div class="layui-input-block">
	      <input name="name" lay-verify="required|name" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">密码*</label>
	    <div class="layui-input-block">
	      <input name="password" lay-verify="required|password" placeholder="请输入" autocomplete="off" class="layui-input" type="password">
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">确认密码*</label>
	    <div class="layui-input-block">
	      <input name="cfmword" lay-verify="required|cfmword" placeholder="请输入" autocomplete="off" class="layui-input" type="password">
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">手机号*</label>
	    <div class="layui-input-block">
	      <input name="tel" lay-verify="required|phone" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">邮箱*</label>
	    <div class="layui-input-block">
	      <input name="email" lay-verify="required|email" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
	    </div>
  	</div>
  	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	      <a href="${webRoot }/front/login" style="display: inline-block;float: right;padding-top:10px">返回登录</a>
	    </div>
  	</div>
	<div class="layui-form-item">
  	 	<div class="layui-input-block">
  		${requestScope.error }
  		</div>
  	</div>
	</form>
	</div>
 	<jsp:include page="tail.jsp"/>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','jquery'], function(){
  var form = layui.form()
  ,layer = layui.layer,
  jQuery = layui.jquery;
 
  //自定义验证规则
  form.verify({
    name: function(value){
      if(value.length < 2){
        return '用户名至少2个字符';
      }
    }
    ,password: [/(.+){6,20}$/, '密码必须6到20位']
    ,cfmword:function(value){
    	var pswd = jQuery("input[name='password']").val();
    	if(pswd != value){
    		return '两次密码输入不一致';
    	}
    }
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
