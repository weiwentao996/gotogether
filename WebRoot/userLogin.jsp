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
  <title>一起出发吧·登录</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <style>
	.form-horizontal{
		margin-top:100px;
	}
	.img-bg{
		position:absolute;
		z-index:-100;
		width:100%;
		height:100%;
	}
	.img-bg2{
		width:100%;
		height:100%;
	}
	.title{
		margin-top:30px;
	}
	.text-right{
		font-size:25px;
		color:#fff;
	}
	.control-label{
		color:#fff;
	}
	.meg > p{
		text-align:center;
		color:#f30;
		font-size:20px;
		font-weight:bold;
	}
  </style>
  <script>
	function isOk(){
		var $uPhone=$("input[name='phoneNum']").val();
		var $uPassword=$("input[name='password']").val();
		if(!$uPhone || !$uPassword){
			return false;
		}
		else
			return true;
	}
  </script>
 </head>
 <body>
  <div class="img-bg"><img src="images/2.jpg" class="img-responsive img-bg2" /></div>
  <div class="container">
	
	<form name="userLogin" action="user/userAction!login" method="post" class="form-horizontal">
		<div class="form-group">
			<label for="inputPhone" class="col-sm-2  control-label">用户</label>
			<div class="col-sm-6 col-md-4">
				<input type="text" name="phoneNum" class="form-control" id="inputPhone" placeholder="请输入手机号">
			</div>
		</div>
		<div class="form-group">
			<label for="InputPassword" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-6 col-md-4">
				<input type="password" name="password" class="form-control" id="InputPassword" placeholder="请输入密码">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4">
				<input class="btn btn-default" type="submit" value="登录" onclick="return isOk()"/>
				<a href="userRegister.jsp" role="button" class="btn btn-default">注册</a>
			</div>
		</div>
	</form>
	<s:if test="#request.meg != null">
		<div class="meg block-center">
			<p><s:property value="#request.meg" /></p>
		</div>
	</s:if>
	<div class="title">
		<p class="text-right">要么读书</p>
		<p class="text-right">要么旅行</p>
		<p class="text-right">身体和灵魂总要有一个在路上</p>
	</div>
  </div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 </body>
</html>
