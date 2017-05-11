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
	<form name="signup-form" class="layui-form layui-form-pane" action="${webRoot }/users/password" method="post">
	 <div class="layui-form-item">
	    <label class="layui-form-label">旧密码</label>
	    <div class="layui-input-block">
	    	<input name="oldpswd" autocomplete="off" class="layui-input" lay-verify="required|oldpswd" type="password">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">新密码</label>
	    <div class="layui-input-block">
	    	<input name="newpswd" autocomplete="off" class="layui-input" lay-verify="required|newpswd" type="password">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">确认密码</label>
	    <div class="layui-input-block">
	    	<input name="cfmpswd" autocomplete="off" class="layui-input" lay-verify="required|cfmpswd" type="password">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	    	<button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1">更新密码</button>
	    	<a href="${webRoot }/users/info" class="layui-btn">返回</a>
	    	</div>
	    </div>
	  </form>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form','jquery'], function(){
  var form = layui.form()
  ,layer = layui.layer,jQuery = layui.jquery;
 
  //自定义验证规则
  form.verify({
    oldpswd: [/(.+){6,20}$/, '旧密码必须6到20位']
    ,newpswd: [/(.+){6,20}$/, '新密码必须6到20位']
  	,cfmpswd:function(value){
	  	var pswd = jQuery("input[name='newpswd']").val();
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