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
	  <a><cite>项目管理</cite></a>
	  <a><cite>项目审核</cite></a>
	</span>
	</div>
	<div style="padding:15px;">
		<div class="extra">
			<label>标题:</label>&nbsp;&nbsp;${result.title }
		</div>
		<div class="extra">
			<label>发布时间:</label>&nbsp;&nbsp;<fmt:formatDate value="${result.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div class="extra">
			<label>发布人:</label>&nbsp;&nbsp;${result.publisher.name }
		</div>
		<div class="extra">
			<label>报名时间:</label>&nbsp;&nbsp;<fmt:formatDate value="${result.enrollStartTime }" type="both"  pattern="yyyy-MM-dd HH:mm:ss"/> - <fmt:formatDate value="${result.enrollEndTime }" type="both"  pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div class="extra">
			<label>竞赛时间:</label>&nbsp;&nbsp;<fmt:formatDate value="${result.startTime }" type="both"  pattern="yyyy-MM-dd HH:mm:ss"/> - <fmt:formatDate value="${result.endTime }" type="both"  pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div class="extra">
			<label>竞赛地点:</label>&nbsp;&nbsp;${result.position }
		</div>
		
			<div class="layui-collapse" lay-filter="test">
			  <div class="layui-colla-item">
			    <h2 class="layui-colla-title">竞赛内容</h2>
			    <div class="layui-colla-content">
			      <blockquote class="layui-elem-quote layui-quote-nm">${result.content }</blockquote>
			      <hr/>
			      <p>附件</p>
			      <c:if test="${!empty result.attachmentUrl}">
				  	<p><a href="${webRoot }/competition/download?filename=${result.attachmentUrl }"><i class="layui-icon">&#xe61e;</i> ${result.attachmentUrl }</a></p>
				  </c:if>
			    </div>
			  </div>
		  </div>
		<hr>
		
		
		<form action="${webRoot }/manager/competition/check" method="post" class="layui-form">
	  	<input type="hidden" value="${result.id }" name="id"/>
	  	<input type="hidden" value="${result.checkStep }" name="initStep"/>
	  	<div class="layui-form-item">
		    <label class="layui-form-label">审核结果</label>
		    <div class="layui-input-block">
		      <input name="checkStep" value="${curUser.reviewlv }" title="通过" checked="checked" type="radio">
		      <input name="checkStep" value="-1" title="拒绝" type="radio">
		    </div>
	  </div>
	  
	  <div class="layui-form-item" style="padding-left:3em;">
		 	<button class="layui-btn layui-btn-normal" type="submit">提交审核</button>
		 	<a class="layui-btn layui-btn-primary" href="${webRoot }/manager/competition/checklist?checkStep=${result.checkStep }&page=${param.page }">返回列表</a>
	   </div>
	   
	   </form>
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
