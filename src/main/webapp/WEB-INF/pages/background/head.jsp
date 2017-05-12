<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${webRoot }/layui/css/layui.css"  media="all">
<style>
html,body{
	padding:0px;
	margin:0px
}
</style>
</head>
<body>

</ul>
 <ul class="layui-nav">
  <li class="layui-nav-item"><img src="${webRoot }/img/xiaozhuang.png" style="width:50px;height:auto" /></li>
  <li class="layui-nav-item" style="font-size:22px;letter-spacing:4px;font-family: '华文行楷'">&nbsp;${contextName }</li>
  <li class="layui-nav-item" style="float:right;"><a href="${webRoot }/manager/users/info" style="display: inline-block;">${curUser.name }</a> | <a href="${webRoot }/manager/loginout" style="display: inline-block;" target="_parent">退出</a></li>
</ul>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
</script>
</html>