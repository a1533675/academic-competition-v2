<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	 	.title{
	 		font-size:24px;
	 		font-weight: bold;
	 		text-align: center;
	 	}
	 	div.extra label{
	 		font-weight: bold;
	 		display: inline-block;
	 		line-height: 2
	 	}
	 	
	 </style>
  </head>
  <body>
  <jsp:include page="head.jsp"/>
  <div style="width:1000px;margin: auto;">
  
	<div class="main" >
		<div class="title">
			${result.title }
		</div>
		<div class="extra">
			<label>发布时间:</label>&nbsp;&nbsp;<fmt:formatDate value="${result.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div class="extra">
			<label>发布人:</label>&nbsp;&nbsp;${result.publisher.name }
		</div>
		<div class="extra">
			<label>竞赛时间:</label>&nbsp;&nbsp;<fmt:formatDate value="${result.startTime }" type="both"  pattern="yyyy-MM-dd HH:mm:ss"/> - <fmt:formatDate value="${result.endTime }" type="both"  pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div class="extra">
			<label>竞赛地点:</label>&nbsp;&nbsp;${result.position }
		</div>
		
			<blockquote class="layui-elem-quote layui-quote-nm">
			${result.content }
			</blockquote>
		<hr>
		<p>附件</p>
		<p><a href="${webRoot }/competition/download?filename=${result.attachmentUrl }"><i class="layui-icon">&#xe61e;</i> ${result.attachmentUrl }</a></p>
		
		<div class="layui-form-item" style="text-align: center;">
	      <a href="${webRoot }/index.html" class="layui-btn">&#xe603; 返回首页</a>
  		</div>
	</div>
	
 </div>
 <jsp:include page="tail.jsp"/>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form'], function(){
  var form = layui.form();
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
