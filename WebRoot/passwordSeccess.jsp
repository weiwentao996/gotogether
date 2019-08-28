<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>请稍候...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="refresh" content="5;url=<s:property value="#request.url" />">   
	<link href="css/main.css" rel="stylesheet" />
	<style type="text/css">
		div{
			margin:0 auto;
			font-size:25px;
			margin-top:100px;
			text-align:center;
		}
	</style>
  </head>
  
  <body>
    <div>
    	<p><s:property value="#request.meg" />正在为你跳转页面...</p>
    	<p><a href="<s:property value="#request.url" />">无法跳转，点此连接</a></p>
    </div>
  </body>
</html>
