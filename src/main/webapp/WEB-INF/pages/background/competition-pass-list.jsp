<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="tags/academic" prefix="academic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>${contextName }</title>
	 <meta name="renderer" content="webkit">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	  <link rel="stylesheet" href="${webRoot }/layui/css/bootstrap.css"  media="all">
	 <link rel="stylesheet" href="${webRoot }/layui/css/layui.css"  media="all">
	 <style>
	 	.schoollogo{
	 		position:absolute;
	 		right:0px;
	 		width:227px;
	 	}
	 	.main{
	 		width:900px;
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
  		<div style="padding-left:10px;background-color: #FBFBFB;line-height:2;">
		<i class="layui-icon">&#xe632;</i>
		<span class="layui-breadcrumb">
		  <a><cite>首页</cite></a>
		  <a><cite>项目管理</cite></a>
		  <a><cite>项目审核</cite></a>
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

	<div class="main" style="padding:20px;">
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">通过项目</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
      <form action="" method="post" class="layui-form">
	<table class="layui-table" lay-skin="line">
  <colgroup>
  	<col>
    <col width="100">
    <col width="100">
    <col width="100">
    <col width="100">
  </colgroup>
  <thead>
    <tr>
      <th>竞赛通知</th>
      <th>报名时间</th>
      <th>竞赛时间</th>
      <th>创建时间</th>
      <th>审核状态</th>
    </tr> 
  </thead>
  <tbody>
	<c:forEach var="competition" items="${pagination.items }">
    <tr>
      <td>${competition.title }</td>
      <td><fmt:formatDate value="${competition.enrollStartTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
      &nbsp;&nbsp; - &nbsp;&nbsp; <fmt:formatDate value="${competition.enrollEndTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
      </td>
      <td><fmt:formatDate value="${competition.startTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
      &nbsp;&nbsp; - &nbsp;&nbsp; <fmt:formatDate value="${competition.endTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      <td><fmt:formatDate value="${competition.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      <td><academic:checkStep step="${competition.checkStep }"/></td>
    </tr>
    </c:forEach>
  </tbody>
</table> 
	${pagination.render } 
	</form>
    </div>
  </div>
</div>	  
 
 </div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','layer','jquery','element'], function(){
  var form = layui.form();
  var $ = layui.jquery;
  var layer = layui.layer;
  var element = layui.element();
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
