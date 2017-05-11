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
	 html,body{
		padding:0px;
		margin:0px;
	}
	 </style>
  </head>
  <body>
  	<jsp:include page="head.jsp"/>
	<div style="width:1000px;margin: auto;">
  
	<div class="main">

	<table>
	<tr>
		<td style="vertical-align: top">
		<table class="layui-table" lay-skin="line">
		  <colgroup>
		    <col width="760">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th colspan="2">竞赛通知</th>
		    </tr> 
		  </thead>
		  <tbody>
			<c:forEach var="notice" items="${pagination.items }">
		    <tr>
		      <td><a href="${webRoot}/front/notice/detail?id=${notice.id }">${notice.title }</a></td>
		      <td><fmt:formatDate value="${notice.createTime }" type="both" pattern="yyyy-MM-dd"/></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table> 
		${pagination.render } 
		</td>
		<td style="padding-left:20px;padding-top:10px;">
			<jsp:include page="school-logo.jsp"></jsp:include>
		</td>
	</tr>
</table>

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
