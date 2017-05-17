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
  
  <div>
  <div style="padding-left:10px;background-color: #FBFBFB;line-height:2">
	<i class="layui-icon">&#xe632;</i>
	<span class="layui-breadcrumb">
	  <a><cite>首页</cite></a>
	  <a><cite>评分管理</cite></a>
	  <a><cite>项目评分</cite></a>
	</span>
	</div>
	<div style="padding:15px;">
		<blockquote class="layui-elem-quote">竞赛项目:${result.competition.title }</blockquote>
		
		<blockquote class="layui-elem-quote layui-quote-nm">
			提交内容:<br/>
			${result.content }
		</blockquote>
		<hr>
		<p>附件</p>
		<c:if test="${not empty result.attachmentUrl }">
		<p><a href="${webRoot }/manager/competition/download?filename=${result.attachmentUrl }"><i class="layui-icon">&#xe61e;</i> ${result.attachmentUrl }</a></p>
		</c:if>
		
		<div style="margin-top:2em">
			<form class="layui-form layui-form-pane" action="${webRoot }/manager/matches/score" method="post">
				<input type="hidden" name="id" value="${result.id }"/>
				<input type="hidden" name="competition.id" value="${result.competition.id }"/>
				<div class="layui-form-item">
				    <label class="layui-form-label">分数</label>
				    <div class="layui-input-inline">
				      <input name="score${curUser.reviewlv }" lay-verify="required|number" placeholder="请输入1-100的整数" autocomplete="off" class="layui-input" type="text">
				    </div>
			  </div>
			 <div class="layui-form-item">
			    <div>
			      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
			      <a href="${webRoot }/manager/matches/list?id=${result.competition.id }" class="layui-btn">返回列表</a>
			    </div>
		  	</div> 
			  
			</form>
		</div>
		
	</div>
	
 </div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','element'], function(){
  var form = layui.form();
  var element = layui.element();
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
