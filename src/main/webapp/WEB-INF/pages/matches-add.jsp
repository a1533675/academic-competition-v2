<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	 	.title{
	 		font-size:20px;
	 		font-weight: bold;
	 		text-align: center;
	 	}
	 </style>
  </head>
  <body>
  
  <div style="max-width:800px;margin:auto;">
 	<form name="competition-form" class="layui-form" action="${webRoot }/matches/add" method="POST" enctype="multipart/form-data">
 	<input type="hidden" value="${result.id }" name="competition.id"/>
 	
 	<div class="title">${result.title }</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">说明</label>
	    <div class="layui-input-block">
	    	<a href="javascript:;" style="padding-top:5px;padding-bottom:5px;display: inline-block;">(注：此处请根据具体的项目对提交的结果的进行描述，如有附加事项，可在附件中上传。)</a>
	      	<textarea class="layui-textarea" id="LAY_demo1" style="display: none" name="content">  
			</textarea>
	    </div>
  	</div>
  		<div class="layui-form-item">
    	<label class="layui-form-label">附件</label>
	    <div class="layui-input-block">
	    	<a href="javascript:;" style="padding-top:5px;padding-bottom:5px;display: inline-block;">(注：如果需要对结果说明添加附件，请点击此处进行上传。)</a>
	      <input name="attachment"  class="layui-input" type="file">
	    </div>
  	</div>
  	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
  	</div>
</form>
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
	  tool: ['strong','italic','underline','del','left', 'center', 'right', 'link','unlink','|','face','image'],height:100
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
