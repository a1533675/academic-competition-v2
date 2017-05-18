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
 <jsp:include page="head.jsp"/>
<div style="width:1000px;margin: auto;">
  
<div class="main">

<table style="width:1000px;">
	<tr>
		<td style="vertical-align: top">
		<table class="layui-table" lay-skin="line">
		  <colgroup>
		    <col>
		    <col width="180">
		  </colgroup>
		  <thead>
		    <tr>
		      <th colspan="2">获奖通知</th>
		    </tr> 
		  </thead>
		  <tbody>
			<c:forEach var="awards" items="${pagination.items }">
		    <tr>
		      <td><a href="${webRoot}/front/awards/detail?id=${awards.id }&returnUrl=${webRoot }/front/awards/queryByPage">${awards.title }</a></td>
		      <td><fmt:formatDate value="${awards.createTime }" type="both" pattern="yyyy-MM-dd"/></td>
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
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
});
</script>
</html>
