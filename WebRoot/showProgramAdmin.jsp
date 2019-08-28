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
		margin-top:100px;
	}
	.add{
		margin-top:40px;
	}
  </style>
 </head>
 <body>
  <div class="container">
	<div class="text-center">
		<h2><s:property value="program.title" /><small></small></h2>
		<h4><small class="col-xs-4 col-sm-4 col-md-4"><s:property value="program.writerName" /></small><small class="col-xs-4 col-sm-4 col-md-4"><s:property value="program.writeTime" /></small><small class="col-xs-4 col-sm-4 col-md-4"><s:property value="program.mold" /></small></h4>
	</div>
	<div class="add panel panel-default">
		<div class="panel-heading">
		<h5><s:property value="program.startAddress" /><small>&nbsp;至&nbsp;</small><s:property value="program.endAddress" /></h5>
		</div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-heading">方案简介，路线简介</div>
	  <div class="panel-body">
		<s:property value="program.course" />
	  </div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-heading">衣食住行问题方案</div>
	  <div class="panel-body">
		<s:property value="program.basicNeed" />
	  </div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-heading">出行方式描述</div>
	  <div class="panel-body">
		<s:property value="program.transType" />
	  </div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-heading">发起者相关信息介绍</div>
	  <div class="panel-body">
		<s:property value="program.writerInfo" />
	  </div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-heading">预算描述</div>
	  <div class="panel-body">
		<s:property value="program.cost" />
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
 </body>
</html>
