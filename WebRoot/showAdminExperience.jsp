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
    
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="Keywords" content="组团，旅行，一起出发吧">
  <meta name="Description" content="一起出发吧">
  <title>一起出发吧·阅读方案</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <style>
	.container{
		margin-top:80px;
	}
	.add{
		margin-top:40px;
	}
  </style>
  
 </head>
 <body>
  <div class="container">
	<div class="text-center">
		<h2><s:property value="experience.title" /><small></small></h2>
	</div>
	<div class="add panel panel-default">
	  <div class="panel-heading">
	  	<h5 class="center-text"><s:property value="experience.writerName" />&nbsp;&nbsp;发表于&nbsp;&nbsp;<s:property value="experience.writeTime" /></h5>
	  </div>
	  <div id="content" class="panel-body">
		<input type="hidden" name="content" value="<s:property value="experience.content" />" />
	  </div>
	</div>
	<div class="foot">
		<hr />
		<p>Copyrights 2019 TheYouth团队 &copy; All rights reserved.
			东北石油大学软件工程学院</p>
	</div>
  </div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.base64.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("#content").html($.base64.atob($("input[name='content']").val(), true));
  	});
  </script>
 </body>
</html>
