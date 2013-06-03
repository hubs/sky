<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>内容管理系统</title>
<style>
body
{
  scrollbar-base-color:#C0D586;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-shadow-color:DEEFC6;
}
</style>
</head>
<frameset rows="0,*" cols="*.*" frameborder="no" border="0" framespacing="0">
  <frame  name="topFrame_left" scrolling="no">
  <frameset cols="180,*" frameborder="NO" border="0" framespacing="0">
    <frame src="<%=basePath %>xitong/menu/left" noresize name="menu_left" scrolling="yes">
  <frame src="<%=basePath %>xitong/menu/index" noresize name="menu_content" scrolling="yes">
  </frameset>
</frameset>  
<noframes>
	<body>您的浏览器不支持框架！</body>
</noframes>
</html>