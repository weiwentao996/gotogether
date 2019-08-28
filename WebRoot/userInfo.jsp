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
  <title>一起出发吧·完善个人信息</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <style>
	.container{
		margin-top:30px;
	}
  </style>
 </head>
 <body>
  <div class="container">
	<form action="user/userAction!editUser" method="post" class="form-horizontal">
	  <div class="form-group">
		
		<label for="exampleInputAge" class="col-sm-2  control-label">年龄</label>
		<div class="col-sm-6 col-md-4">
			<input type="text" name="age" class="form-control" id="exampleInputAge" placeholder="请输入你的年龄" />
		</div>
	  </div>
	  <div class="form-group">
		<label for="exampleInputSex" class="col-sm-2  control-label">性别</label>
		<div class="col-sm-2 col-md-1 col-xs-4">
			<input type="text" name="sex" list="sexList" class="form-control" id="exampleInputSex" />
		</div>
	  </div>
	  <div class="form-group">
		<label for="exampleInputAddress" class="col-sm-2  control-label">所在地</label>
		<div class="col-sm-6 col-md-4">
			<input type="text" name="address" class="form-control" id="exampleInputAddress" placeholder="请输入你目前所在地" />
		</div>
	  </div>
	  <div class="form-group">
		<div class="col-sm-offset-2 col-xs-offset-1">
			<input type="submit" class="btn btn-default" value="确定提交" />
		</div>
	  </div>
	</form>
	<datalist id="sexList">
	  <option label="男" value="男"/>
	  <option label="女" value="女" />
	</datalist>
  </div>
 </body>
</html>
