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
	 	.schoollogo{
	 		position:absolute;
	 		right:0px;
	 		width:227px;
	 	}
	 	h4{
	 		background-image: url(${webRoot}/img/ri_bo_25.png);
	 		clear:none;
	 		color:white;
	 		padding-left:5px;
	 		font-weight: bold;
	 	}
	 	.schoollogo table{
	 		width: 100%;
	 		border-spacing: 0;
	 		border-collapse: collapse;
	 	}
	 	.schoollogo table td{
	 		width: 50%;
	 		height: 100px;
	 		vertical-align: middle;
	 		text-align: center;
	 	}
	 	
	 	.schoollogo table img{
	 		width:85px;
	 		height: 85px;
	 	}
	 </style>
</head>
<body>
	<div style="padding-left:10px;background-color: #FBFBFB;line-height:2">
	<i class="layui-icon">&#xe632;</i>
	<span class="layui-breadcrumb">
	  <a><cite>首页</cite></a>
	  <a><cite>个人中心</cite></a>
	  <a><cite>密码修改</cite></a>
	</span>
	</div>
	<div class="schoollogo">
  		<h4>合作院校</h4>
  			<table>
  				<tr>
  					<td><img src="${webRoot }/img/hangdian.jpg"/></td><td><img src="${webRoot }/img/ligong.jpg"/></td>
  				</tr>
  				<tr>
  					<td><img src="${webRoot }/img/ningbo.jpg"/></td><td><img src="${webRoot }/img/wenyi.jpg"/></td>
  				</tr>
  				<tr>
  					<td><img src="${webRoot }/img/zhecaijing.jpg"/></td><td><img src="${webRoot }/img/zhechuanmei.jpg"/></td>
  				</tr>
  				
  				<tr>
  					<td><img src="${webRoot }/img/zheda.jpg"/></td><td><img src="${webRoot }/img/zhegongshang.jpg"/></td>
  				</tr>
  			</table>
  	</div>
	<form name="signup-form" class="layui-form layui-form-pane" action="${webRoot }/manager/users/password" method="post" style="width: 500px;padding:20px;">
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
layui.use(['form','jquery','element'], function(){
  var form = layui.form()
  ,layer = layui.layer,jQuery = layui.jquery;
  var element = layui.element();
 
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