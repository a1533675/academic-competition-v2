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
	  <link rel="stylesheet" href="${webRoot }/layui/css/bootstrap.css"  media="all">
	 <link rel="stylesheet" href="${webRoot }/layui/css/layui.css"  media="all">
	 <style>
	 	.schoollogo{
	 		position:absolute;
	 		right:0px;
	 		width:227px;
	 	}
	 	.main{
	 		width:750px;
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
		  <a><cite>通知公告</cite></a>
		  <a><cite>系统公告</cite></a>
		</span>
		</div>
  
    <div>
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
	  </div>
	  
 <form action="" method="post" class="layui-form">
	<table class="layui-table" lay-skin="line">
  <colgroup>
  	<col width="50">
    <col>
    <col width="180">
  </colgroup>
  <thead>
    <tr>
      <th><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>
      <th>系统公告</th>
      <th>&nbsp;</th>
    </tr> 
  </thead>
  <tbody>
	<c:forEach var="notice" items="${pagination.items }">
    <tr>
      <td><input lay-skin="primary" type="checkbox" name = "ids[]" value="${notice.id }"></td>
      <td><a href="${webRoot}/manager/notice/detail?id=${notice.id }">${notice.title }</a></td>
      <td><fmt:formatDate value="${notice.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
    </c:forEach>
  </tbody>
</table> 
	${pagination.render } 
	</form>
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
  
	//添加按钮
	$("#add").click(function(){
		$(location).prop("href","${webRoot}/manager/notice/add");
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
		$(location).prop("href","${webRoot}/manager/notice/update?id="+$chk.filter(":checked").val());
	});
	
	$("#detail").click(function(){
		var $chk = $("[name = 'ids[]']:checkbox");
		if($chk.filter(":checked").length > 1){
			layer.msg("只能选择一项!");
			return;
		}else if($chk.filter(":checked").length < 1){
			layer.msg("请选择一项!");
			return;
		}
		$(location).prop("href","${webRoot}/manager/notice/detail?id="+$chk.filter(":checked").val());
	});
	
	
	$("#delete").click(function(){
		var $chk = $("[name = 'ids[]']:checkbox");
		if($chk.filter(":checked").length < 1){
			layer.msg("请至少选择一项!");
			return;
		}
		
		$("form[class='layui-form']").prop("action","${webRoot}/manager/notice/delete");
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
