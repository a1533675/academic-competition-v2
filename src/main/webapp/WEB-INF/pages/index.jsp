<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${contextName}</title>


</head>
	<frameset rows="103px,*" border="0">
	  <frame src="${webRoot}/head" scrolling="no" name="head" noresize />
	  <frameset cols="*,1000px,*" border="0">
		<frame src="${webRoot}/left" scrolling="no" name="left" noresize />
		<frameset rows="80px,*,60px" border="0">
			<frame src="${webRoot}/menu" scrolling="no" name="menu" noresize />
			<frame src="${webRoot}/main" scrolling="yes" name="main" noresize />
			<frame src="${webRoot}/tail" scrolling="no" name="tail" noresize />
		</frameset>
		<frame src="${webRoot}/right" scrolling="yes" name="right" noresize />
	  </frameset>
	</frameset>

</html>