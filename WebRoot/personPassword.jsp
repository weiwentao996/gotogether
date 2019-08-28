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
  <title>一起出发吧·修改密码</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <style>
	.container{
		margin-top:30px;
	}
	.p_error{
		color:#f03;
		font-weight:bold;
		margin-top:10px;
	}
  </style>
  <script>
	function checkInfo(){
		var $button_b=$("#button_b");
		if($("input[name=password]").val()!="" && $("input[name=password2]").val()!="" && $("input[name=password3]").val()!=""){
			var password=$("input[name=password2]").val();
			var password2=$("input[name=password3]").val();
			if(password.length<6 || password.length>14){
				$button_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;密码应为6到14位");
				$button_b.attr("class", "p_error");
				return false;
			}
			else if(password2!=password){
				$button_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;两次密码不一致");
				$button_b.attr("class", "p_error");
				return false;
			}
			else
				return true;
		}else{
			return false;
		}
	}
  </script>
 </head>
 <body>
  <div class="container">
	<form action="user/userAction!editPassword" class="form-horizontal">
	  <div class="form-group">
		
		<label for="exampleInputPassword1" class="col-sm-2  control-label">原密码</label>
		<div class="col-sm-6 col-md-4">
			<input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="请输入你的原密码" />
		</div>
	  </div>
	  <div class="form-group">
		<label for="exampleInputPassword2" class="col-sm-2  control-label">新密码</label>
		<div class="col-sm-6 col-md-4">
			<input type="password" class="form-control" id="exampleInputPassword2" name="password2" placeholder="请输入你的6到14位的新密码" />
		</div>
	  </div>
	  <div class="form-group">
		<label for="exampleInputPassword3" class="col-sm-2  control-label">再输入一次新密码</label>
		<div class="col-sm-6 col-md-4">
			<input type="password" class="form-control" id="exampleInputPassword3" name="password3" placeholder="请再次输入你的新密码" />
		</div>
	  </div>
	  <div class="form-group">
		<div class="col-sm-offset-2 col-xs-offset-1">
			<input type="submit" class="btn btn-default" value="确定" onclick="return checkInfo()"/>
			<s:if test="#request.meg==null">
				<p id="button_b"></p>
			</s:if>
			<s:else>
				<p class="p_error" id="button_b"><s:property value="#request.meg"/></p>
			</s:else>
		</div>
		
	  </div>
	</form>
  </div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 </body>
</html>
