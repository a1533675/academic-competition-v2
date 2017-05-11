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
	<ul class="layui-nav">
	  <li class="layui-nav-item"><a href="${webRoot }/main" target="main">首页</a></li>
	  <li class="layui-nav-item"><a href="${webRoot }/users/info" target="main">个人信息</a></li>
	  <li class="layui-nav-item"><a href="${webRoot }/competition/queryByPage" target="main">竞赛通知</a></li>
	  <li class="layui-nav-item"><a href="${webRoot }/notice/queryByPage" target="main">系统公告</a></li>
	  <li class="layui-nav-item"><a href="${webRoot }/topic/queryByPage" target="main">话题讨论</a></li>
	  <li class="layui-nav-item"><a href="${webRoot }/awards/queryByPage" target="main">获奖通知</a></li>
	</ul>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
});
</script>
</html>