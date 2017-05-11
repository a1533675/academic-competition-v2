<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	 		float:right;
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
	<div class="main">
<table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="800">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th><p>&nbsp;&nbsp;&nbsp;&nbsp;以下是比赛参与者提交的作品列表，请您本着公正公平的态度，对学生的作品予以认真的评价。待您全部评审完成后，请您提交一份比赛结果和获奖情况的通知。</p>
      		<p>&nbsp;&nbsp;&nbsp;&nbsp;感谢您的真诚评价与肯定!</p>
      </th>
    </tr> 
  </thead>
</table> 
	<div class="layui-collapse" lay-filter="test">
	<c:forEach var="matches" items="${list }">
	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">${matches.participant.name }</h2>
	    <div class="layui-colla-content">
	      <p>${matches.content }</p>
	      <hr/>
	      <p>附件</p>
		  <p><a href="${webRoot }/competition/download?filename=${matches.attachmentUrl }"><i class="layui-icon">&#xe61e;</i> ${matches.attachmentUrl }</a></p>
	    </div>
	  </div>
  </c:forEach>
  </div>
		<div class="layui-form-item" style="text-align: center;">
	      <a href="${webRoot }/awards/add?id=${param.id}" class="layui-btn">发布获奖</a>
  		</div>
 </div>
 </div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','element', 'layer'], function(){
  var form = layui.form();
  var element = layui.element();
  var layer = layui.layer;
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
