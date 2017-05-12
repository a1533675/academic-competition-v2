<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div style="padding-left:10px;background-color: #FBFBFB;line-height:2">
		<i class="layui-icon">&#xe632;</i>
		<span class="layui-breadcrumb">
		  <a><cite>首页</cite></a>
		  <a><cite>${navs[0] }</cite></a>
		  <a><cite>${navs[1] }</cite></a>
		  <a><cite>结果</cite></a>
		</span>
	</div>

  		<div style="text-align:center;margin-top:20px;margin-bottom:20px;line-height: 3">
  			<h3><i class="layui-icon">&#xe60b;</i> &nbsp;${result }</h3>
  		</div>
  		<div style="text-align:center">
  			<c:if test="${not empty continueUrl}"><a class="layui-btn layui-btn-normal" href="${continueUrl }" >继续</a>&nbsp;&nbsp;</c:if>
  				<a class="layui-btn layui-btn-normal" href="${returnUrl }" >返回</a>
  		</div>
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