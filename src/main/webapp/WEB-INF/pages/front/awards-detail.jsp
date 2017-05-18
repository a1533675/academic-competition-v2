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
	 	.schoollogo{
	 		float:right;
	 		width:227px;
	 	}
	 	.main{
	 		width:100%;
	 	}
	 	
	 	.content{
	 		border-radius:10px;
	 		padding: 5px;
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
  <jsp:include page="head.jsp"/>
	<div style="width:1000px;margin: auto;">
  
	<div class="main">
		<div class="title">
			${result.title }
		</div>
		<div class="extra">
			<label>发布时间:</label>&nbsp;&nbsp;<fmt:formatDate value="${result.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		
		<blockquote class="layui-elem-quote layui-quote-nm">
			${result.content }
		</blockquote>
		<hr>
		<p>附件</p>
		<c:if test="${not empty result.attachmentUrl }">
			<p><a href="${webRoot }/notice/download?filename=${result.attachmentUrl }"><i class="layui-icon">&#xe61e;</i> ${result.attachmentUrl }</a></p>
		</c:if>
		<div class="layui-form-item" style="text-align: center;">
	      <a href="${param.returnUrl }" class="layui-btn">返回列表</a>
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
