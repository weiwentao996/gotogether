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
  <title>一起出发吧·后台管理</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <style type="text/css">
  	.sousu{
  		margin-top:20px;
  	}
  </style>
  <script type="text/javascript">
  	function submitInfo(){
  		if($("input[name=phoneNum]").val()!=""){
  			$("#formid").submit();
  		}
  	}
  </script>
 </head>
 <body>
  <div class="container">
	<ul class="nav nav-tabs">
	  <li role="presentation"><a href="program/programAction!queryByPass">审核方案</a></li>
	  <li role="presentation"><a href="guangliProgram.jsp">管理方案</a></li>
	  <li role="presentation"><a href="experience/experienceAction!queryByPass">审核心得</a></li>
	  <li role="presentation"><a href="guangliExperience.jsp">管理心得</a></li>
	  <li role="presentation" class="active"><a href="user/userAction!adminUser?pageNum=1">管理用户</a></li>
	</ul>
	<form id="formid" class="sousu" action="user/userAction!getUserByPhone" method="post">
		<div class="form-group">
			<div class="input-group col-sm-8">
				<input type="text" name="phoneNum" class="form-control" id="inputSearchName" placeholder="输入用户手机号查询">
				<span onclick="submitInfo()" class="input-group-addon glyphicon glyphicon-search" aria-hidden="true" role="button"></span>
			</div>
		</div>
	</form>
	<table class="table">
		<th>
			<td>手机号</td>
			<td>用户名</td>
			<td>状态</td>
			<td></td>
			<td></td>
		</th>
		<tr>
		<s:if test="user.phoneNum!=null">
			<td></td>
			<td><s:property value="user.phoneNum"/></td>
			<td><s:property value="user.username"/></td>
			<s:if test="state==0">
				<td>正常</td>
				<td><a href="user/userAction!freeze?phoneNum=<s:property value="user.phoneNum" />">冻结</a></td>
			</s:if>
			<s:else>
				<td>被冻结</td>
				<td><a href="user/userAction!notFreeze?phoneNum=<s:property value="user.phoneNum" />">解冻</a></td>
			</s:else>
			<td><a href="user/userAction!delete?phoneNum=<s:property value="user.phoneNum" />">删除</a></td>
		</s:if>
		</tr>
		</table>
	</div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 </body>
</html>
