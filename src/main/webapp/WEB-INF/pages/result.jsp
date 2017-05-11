<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  		<div style="text-align:center">
  			<h3>${result }</h3>
  		</div>
  		<div style="text-align:center">
  			<c:if test="${not empty continueUrl}"><a class="layui-btn layui-btn-normal" href="${continueUrl }" >继续</a>&nbsp;&nbsp;</c:if>
  				<a class="layui-btn layui-btn-normal" href="${returnUrl }" >返回</a>
  		</div>
</body>
</html>