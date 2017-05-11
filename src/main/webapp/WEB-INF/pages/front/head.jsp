<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<style>
			li.layui-nav-item a:LINK,li.layui-nav-item a:VISITED,li.layui-nav-item a:HOVER,li.layui-nav-item a:ACTIVE{
				color:white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div style="width:1000px;margin:auto;background-color: white;">
		<table style="width:100%">
			<tr>
				<td style="width:620px"><img src="${webRoot }/img/logo.jpg" style="width:auto;height:auto;"/></td>
				<td style="text-align: right">
					<c:if test="${empty curUser }"><a href="${webRoot }/front/login">登录</a> | <a href="${webRoot }/front/signup">注册</a></c:if>
					<c:if test="${!empty curUser }">${curUser.name } | <a href="${webRoot }/front/loginout">退出</a></c:if>
				</td>
			</tr>
		</table>
		
		<ul class="layui-nav" style="background-color: rgb(30,84,158);">
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/index.html">首页</a></li>
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/front/users/info">个人信息</a></li>
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/front/users/password">修改密码</a></li>
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/competition/queryByPage">竞赛报名</a></li>
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/front/notice/queryByPage">系统公告</a></li>
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/awards/queryByPage">获奖通知</a></li>
		  <li class="layui-nav-item" style="line-height: 45px;"><a href="${webRoot }/manager/login">后台登录</a></li>
		</ul>
		
		<div style="padding:0px;margin:0px;width:1000px">
			<img src="${webRoot }/img/head.jpg" style="width:1000px;margin:0px"/>
		</div>
  	</div>
	</body>
</html>
	
