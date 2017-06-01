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
		  <a><cite>项目申请</cite></a>
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
	  <div class="layui-btn-group" style="margin-bottom:10px;">
	    <button class="layui-btn layui-btn-primary" id="add">新增&nbsp;<i class="layui-icon">&#xe654;</i></button>
	    <button class="layui-btn layui-btn-primary" id="update">编辑&nbsp;<i class="layui-icon">&#xe642;</i></button>
	    <button class="layui-btn layui-btn-primary" id="delete">删除&nbsp;<i class="layui-icon">&#xe640;</i></button>
	    <c:if test="${curUser.reviewlv == 3 }">
	    	<button class="layui-btn layui-btn-primary" id="check">审核&nbsp;<i class="layui-icon">&#xe618;</i></button>
	    </c:if>
	  </div>
	  
 <form action="" method="post" class="layui-form">
	<table class="layui-table" lay-skin="line">
  <colgroup>
  	<col width="50">
  	<col>
    <col width="100">
    <col width="100">
    <col width="100">
    <col width="100">
  </colgroup>
  <thead>
    <tr>
      <th><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>
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
      <td><input lay-skin="primary" type="checkbox" name = "ids[]" value="${competition.id }"></td>
      <td><a href="${webRoot}/manager/competition/detail?id=${competition.id }">${competition.title }</a></td>
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
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','layer','jquery','element'], function(){
  var form = layui.form();
  var $ = layui.jquery;
  var layer = layui.layer;
  var element = layui.element();
  
	//添加按钮
	$("#add").click(function(){
		var reviewLv = ${curUser.reviewlv};
		if(reviewLv == 1){
			layer.msg("您没有权限发布项目!");
			return;
		}
		$(location).prop("href","${webRoot}/manager/competition/add");
	});
	
	$("#update").click(function(){
		var $chk = $("[name = 'ids[]']:checkbox");
		if($chk.filter(":checked").length > 1){
			layer.msg("只能选择一项!");
			return;
		}else if($chk.filter(":checked").length < 1){
			layer.msg("请选择一项!");
			return;
		}
		$(location).prop("href","${webRoot}/manager/competition/update?id="+$chk.filter(":checked").val());
	});
	
	$("#check").click(function(){
		var reviewLv = ${curUser.reviewlv};
		//添加按钮
		if(reviewLv != 3){
			layer.msg("您没有权限审核此项目!");
			return ;
		}
		
		var $chk = $("[name = 'ids[]']:checkbox");
		if($chk.filter(":checked").length > 1){
			layer.msg("只能选择一项!");
			return;
		}else if($chk.filter(":checked").length < 1){
			layer.msg("请选择一项!");
			return;
		}
		$(location).prop("href","${webRoot}/manager/competition/initCheck?id="+$chk.filter(":checked").val());
	})
	
	$("#delete").click(function(){
		var $chk = $("[name = 'ids[]']:checkbox");
		if($chk.filter(":checked").length < 1){
			layer.msg("请至少选择一项!");
			return;
		}
		
		$("form[class='layui-form']").prop("action","${webRoot}/manager/competition/delete");
		$("form[class='layui-form']").submit();
	});
  
  //全选
  form.on('checkbox(allChoose)', function(data){
    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
    child.each(function(index, item){
      item.checked = data.elem.checked;
    });
    form.render('checkbox');
  });
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
