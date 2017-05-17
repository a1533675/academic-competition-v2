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
		  <a><cite>评分管理</cite></a>
		  <a><cite>项目评分</cite></a>
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
<table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="800">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>
      	<c:if test="${curUser.reviewlv > 0 }">
      		<p>以下是比赛参与者提交的作品列表，请您本着公正公平的态度，对学生的作品予以认真的评价。</p>
      	  	<p>感谢您的真诚评价与肯定!</p>
      	</c:if>
      	<c:if test="${curUser.reviewlv == 0 }">
      		<p>很抱歉，您没有权限进行评分!</p>
      	</c:if>
      </th>
    </tr> 
  </thead>
</table> 

<table class="layui-table" lay-skin="line">
  <colgroup>
  	<col>
    <col width="200">
    <col width="100">
    <col width="100">
    <col width="100">
  </colgroup>
  <thead>
    <tr>
      <th>参赛者姓名</th>
      <th>上传时间</th>
      <th>得分1</th>
      <th>得分2</th>
      <th>得分3</th>
    </tr> 
  </thead>
  <tbody>
	<c:forEach var="matches" items="${list }">
    <tr>
      <td>${matches.participant.name }</td>
      <td><fmt:formatDate value="${matches.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      <td>${matches.score1 }
      	<c:if test="${curUser.reviewlv == 1 }">&nbsp;&nbsp;<a href="${webRoot}/manager/matches/score?id=${matches.id }">评分</a></c:if>
      </td><td>${matches.score2 }
      	<c:if test="${curUser.reviewlv == 2 }">&nbsp;&nbsp;<a href="${webRoot}/manager/matches/score?id=${matches.id }">评分</a></c:if>
      </td><td>${matches.score3 }
      	<c:if test="${curUser.reviewlv == 3 }">&nbsp;&nbsp;<a href="${webRoot}/manager/matches/score?id=${matches.id }">评分</a></c:if>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>

<a href="${webRoot }/manager/competition/scorelist?id=${result.competition.id }" class="layui-btn">返回列表</a>
 </div>
 </div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','element','layer'], function(){
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
