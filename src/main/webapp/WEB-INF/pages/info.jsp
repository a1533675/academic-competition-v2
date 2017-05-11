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
</head>
<body>
	<form class="layui-form layui-form-pane" action="${webRoot }/users/update" method="post">
	 <div class="layui-form-item">
	    <label class="layui-form-label">用户类型</label>
	    <div class="layui-input-block">
	    	<input name="name" autocomplete="off" class="layui-input" type="text" value="${curUser.type }" readonly="readonly">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名</label>
	    <div class="layui-input-block">
	    	<input name="name" autocomplete="off" class="layui-input" type="text" value="${curUser.name }" readonly="readonly">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">手机号</label>
	    <div class="layui-input-block">
	    	<input name="tel" autocomplete="off" class="layui-input" lay-verify="phone" type="text" value="${curUser.tel }">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">邮箱</label>
	    <div class="layui-input-block">
	    	<input name="email" autocomplete="off" class="layui-input" lay-verify="email" type="text" value="${curUser.email }">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
		 	<button class="layui-btn"  lay-submit="" lay-filter="demo1">修改信息</button>
	    	<a href="${webRoot }/users/password" class="layui-btn layui-btn-normal">更新密码</a>
	    	</div>
	    </div>
	  </form>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form'], function(){
  var form = layui.form();
 
  //自定义验证规则
  form.verify({});
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>