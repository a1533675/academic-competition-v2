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
	  <a><cite>个人信息</cite></a>
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
	<form class="layui-form layui-form-pane" action="${webRoot }/manager/users/update" method="post" style="width: 500px;padding:20px;">
		<input type="hidden" name="number" value="${curUser.number }"/>
	
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
layui.use(['form','element'], function(){
  var form = layui.form();
  var element = layui.element();
  //自定义验证规则
  form.verify({});
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>