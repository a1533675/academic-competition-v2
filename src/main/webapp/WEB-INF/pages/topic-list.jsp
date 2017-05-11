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
  </head>
  <body>
	<div class="main">
	<table class="layui-table" lay-skin="line">
	  <colgroup>
	    <col width="800">
	    <col>
	  </colgroup>
  <thead>
    <tr>
      <th>话题列表 <a class="layui-btn layui-btn-normal" href="${webRoot}/topic/add" style="float:right;">发表话题 <i class="layui-icon">&#xe63c;</i></a></th>
    </tr> 
  </thead>
  <tbody>
	<c:forEach var="topic" items="${pagination.items }">
    <tr>
      <td><a href="${webRoot}/topic/detail?id=${topic.id }">${topic.title }</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table> 
${pagination.render }
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
