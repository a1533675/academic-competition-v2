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
  </head>
  <body>
	<div class="main">
		<div class="layui-btn" style="width:100%;text-align: left">
			<a href="${webRoot }/topic/queryByPage" style="display: inline-block;float: right;color:#fff">&lt;&lt; &nbsp;返回列表</a>
			<i class="layui-icon">&#xe63c;</i> &nbsp;&nbsp;${result.title }
		</div>
		
		<table class="layui-table" lay-skin="line">
		  <colgroup>
		    <col width="150">
		    <col width="850">
		  </colgroup>
		  <tbody>
		  	<tr>
		      <th rowspan="2" style="border-right: 1px solid #666;vertical-align: top">${result.users.name }</th>
		      <th>发表于&nbsp;&nbsp;<fmt:formatDate value="${result.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
		      	<label style="display: inline-block;float: right;">楼主</label>
		      </th>
		    </tr> 
		    <tr>
		      <td><div style="min-height: 50px">${result.content }</div></td>
		    </tr>
		  </tbody>
		</table>  
		
		<c:forEach var="reply" items="${pagination.items }" varStatus="status">
		<table class="layui-table" lay-skin="line">
		  <colgroup>
		    <col width="150">
		    <col width="850">
		  </colgroup>
		  <tbody>
		  	<tr>
		      <th rowspan="2" style="border-right: 1px solid #666;vertical-align: top">${reply.users.name }</th>
		      <th>回复于&nbsp;&nbsp;<fmt:formatDate value="${reply.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
		      	<label style="display: inline-block;float: right;">#&nbsp;${(page-1)*pageSize + status.count }</label>
		      </th>
		    </tr> 
		    <tr>
		      <td><div style="min-height: 50px">${reply.content }</div></td>
		    </tr>
		  </tbody>
		</table>  
		
		</c:forEach>
		${pagination.render }
		<div style="width: 800px;margin-top: 50px">
		<form name="competition-form" class="layui-form" action="${webRoot }/reply/add" method="POST">
		<input type="hidden" value="${result.id }" name="topic.id"/>
		<div>
	    	<textarea class="layui-textarea" id="LAY_demo1" style="display: none" name="content"></textarea>
  		</div>
  		<div class="layui-form-item">
		      <button class="layui-btn" lay-submit="" lay-filter="demo1">提交回复</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  		</div>
  		</form>
  		</div>
	</div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','laydate','layedit','upload'], function(){
  var form = layui.form()
  ,layer = layui.layer, laydate = layui.laydate,layedit=layui.layedit;
  //自定义验证规则
  form.verify({
  });
  layedit.set({
	  uploadImage: {
	    url: '${webRoot}/img/upload' //接口url
	    ,type: 'post' //默认post
	  }
	});
  layedit.build('LAY_demo1',{
	  tool: ['strong','italic','underline','del','left', 'center', 'right', 'link','unlink','|','face','image'],height: 100
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
