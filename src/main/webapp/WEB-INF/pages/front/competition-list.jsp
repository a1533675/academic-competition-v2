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
	 </style>
  </head>
  <body>
  <jsp:include page="head.jsp"/>
  <div style="width:1000px;margin: auto;">
  <div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">可报名项目</li>
    <li>往期项目</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
    
    <table class="layui-table" lay-skin="line">
	  <colgroup>
	    <col>
	    <col>
	    <col>
	    <col width="100">
	  </colgroup>
	  <thead>
	    <tr>
	      <th>竞赛报名</th>
	      <th>报名时间</th>
      	  <th>竞赛时间</th>
      	  <th>#</th>
	    </tr> 
	  </thead>
	  <tbody>
		<c:forEach var="competition" items="${canList }">
	    <tr>
	      <td><a href="${webRoot}/front/competition/detail?id=${competition.id }&returnUrl=${webRoot }/front/competition/queryByPage">${competition.title }</a></td>
		  <td><fmt:formatDate value="${competition.enrollStartTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	      &nbsp;&nbsp; - &nbsp;&nbsp; <fmt:formatDate value="${competition.enrollEndTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	      </td>
	      <td><fmt:formatDate value="${competition.startTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
      &nbsp;&nbsp; - &nbsp;&nbsp; <fmt:formatDate value="${competition.endTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      		<td><button class="layui-btn layui-btn-small" onclick="join('${competition.id }')">报名</button></td>
      	
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
    </div>
    <div class="layui-tab-item">
	<table class="layui-table" lay-skin="line">
	  <colgroup>
	    <col>
	    <col>
	    <col>
	  </colgroup>
	  <thead>
	    <tr>
	      <th>往期项目</th>
	      <th>报名时间</th>
      	  <th>竞赛时间</th>
	    </tr> 
	  </thead>
	  <tbody>
		<c:forEach var="competition" items="${historyList }">
	    <tr>
	      <td><a href="${webRoot}/front/competition/detail?id=${competition.id }&returnUrl=${webRoot }/front/competition/queryByPage">${competition.title }</a></td>
	      <td><fmt:formatDate value="${competition.enrollStartTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	      &nbsp;&nbsp; - &nbsp;&nbsp; <fmt:formatDate value="${competition.enrollEndTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	      </td>
	      <td><fmt:formatDate value="${competition.startTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
      &nbsp;&nbsp; - &nbsp;&nbsp; <fmt:formatDate value="${competition.endTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
	</div>
  </div>
</div>
	
 
 </div>
  <jsp:include page="tail.jsp"/>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>

function join(id){
	console.log(id);
	layui.use(['form','layer','jquery','element'], function(){
		  var form = layui.form();
		  var $ = layui.jquery;
		  var layer = layui.layer;
		  var element = layui.element();
		  
		  layer.confirm('确认报名？', {
			  btn: ['报名', '取消'] //可以无限个按钮
		  }, function(index, layero){
			  $.post('${webRoot}/front/competition/join',{'id':id},function(data,status){
				  layer.close(index);
				  layer.msg(data.msg);
				  
			  });
		  }, function(index){
		  });
		  
	});
}


layui.use(['form','element'], function(){
  var form = layui.form(),element = layui.element();
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
