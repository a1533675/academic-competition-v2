<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${contextName}</title>


</head>
	<frameset rows="60px,*,68px" border="0">
	  <frame src="${webRoot}/manager/head" scrolling="no" name="head" noresize />
	  <frameset cols="200px,*" border="0">
		<frame src="${webRoot}/manager/menu" scrolling="no" name="left" noresize style="background-color: #393D49"/>
		<frame src="${webRoot}/manager/main" scrolling="yes" name="main" noresize />
	  </frameset>
	  <frame src="${webRoot}/manager/tail" scrolling="yes" name="right" noresize />
	</frameset>

</html>