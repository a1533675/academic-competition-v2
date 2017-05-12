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
	<ul class="layui-nav layui-nav-tree" lay-filter="demo">
  <li class="layui-nav-item layui-nav-itemed">
    <a href="javascript:;">个人中心</a>
    <dl class="layui-nav-child">
      <dd><a href="${webRoot }/manager/users/info" target="main">个人信息</a></dd>
      <dd><a href="${webRoot }/manager/users/password" target="main">密码修改</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">项目管理</a>
    <dl class="layui-nav-child">
      <dd><a href="${webRoot }/manager/competition/querySelfByPage" target="main">项目申请</a></dd>
      <dd><a href="" target="main">一级审核</a></dd>
	  <dd><a href="" target="main">二级审核</a></dd>
	  <dd><a href="" target="main">最终审核</a></dd>
      <dd><a href="" target="main">项目查询</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item"><a href="">云市场</a></li>
  <li class="layui-nav-item"><a href="">社区</a></li>
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