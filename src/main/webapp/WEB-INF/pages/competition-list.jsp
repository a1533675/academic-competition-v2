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
	 	.main{
	 		width:750px;
	 	}
	 </style>
  </head>
  <body>
    <div>
  
	<div class="main">
	<table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="800">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th colspan="2">竞赛通知</th>
    </tr> 
  </thead>
  <tbody>
	<c:forEach var="competition" items="${pagination.items }">
    <tr>
      <td><a href="${webRoot}/competition/detail?id=${competition.id }">${competition.title }</a></td>
      <td><fmt:formatDate value="${competition.createTime }" type="both" pattern="yyyy-MM-dd"/></td>
    </tr>
    </c:forEach>
  </tbody>
</table> 
${pagination.render } 
 </div>
 </div>
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
