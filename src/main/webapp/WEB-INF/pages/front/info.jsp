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
	 <style>
html,body{
	padding:0px;
	margin:0px;
}
</style>
</head>
<body>
	<jsp:include page="head.jsp"/>
	<div style="max-width:500px;margin:auto;">
		<h3 style="text-align:center;background-color: rgb(30,84,158);border-radius: 5px 5px 0px 0px;line-height: 3;font-weight: bold;color:white;margin-top:10px;">个 人 信 息</h3>
	<form class="layui-form layui-form-pane" action="${webRoot }/front/users/update" method="post" style="border:1px solid lightgray;padding-top:20px;margin-bottom:20px;">
	 	<input type="hidden" value="${curUser.number }" name="number"/>
	 	
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
	    	<a href="${webRoot }/front/users/password" class="layui-btn layui-btn-normal">更新密码</a>
	    	</div>
	    </div>
	  </form>
	  
	  </div>
	   <jsp:include page="tail.jsp"/>
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