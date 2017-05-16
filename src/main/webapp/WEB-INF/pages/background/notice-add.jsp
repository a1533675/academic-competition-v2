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
  <div style="max-width:800px;margin:auto;">
  	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>公告发布</legend>
	</fieldset>
 	<form name="competition-form" class="layui-form" action="${webRoot }/manager/notice/add" method="POST" enctype="multipart/form-data">
 	
 	<div class="layui-form-item">
    	<label class="layui-form-label">主题</label>
	    <div class="layui-input-block">
	      <input name="title" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">内容</label>
	    <div class="layui-input-block">
	    	<a href="javascript:;" style="padding-top:5px;padding-bottom:5px;display: inline-block;">(注：如有附加事项，可在附件中上传。)</a>
	      	<textarea class="layui-textarea" id="LAY_demo1" style="display: none" name="content">  
			</textarea>
	    </div>
  	</div>
  	
  	<div class="layui-form-item">
    	<label class="layui-form-label">附件</label>
	    <div class="layui-input-block">
	    	<a href="javascript:;" style="padding-top:5px;padding-bottom:5px;display: inline-block;">(注：此处用于上传项目公告中需要的附件。)</a>
	      <input name="attachment"  class="layui-input" type="file">
	    </div>
  	</div>
  	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	      <a href="${webRoot }/manager/notice/querySelfByPage" class="layui-btn">返回列表</a>
	    </div>
  	</div>
</form>
 </div>
</body>
<script src="${webRoot }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','laydate','layedit','upload','element'], function(){
  var form = layui.form(),element = layui.element()
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
	  tool: ['strong','italic','underline','del','left', 'center', 'right', 'link','unlink','|','face','image']
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    return true;
  });
  
  
});
</script>
</html>
