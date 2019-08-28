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
  	.table{
  		margin-top:10px;
  	}
  	.form-inline{
  		margin-top:10px;
  	}
  </style>
  <script type="text/javascript">
  	function submitInfo(){
  		if($("input[name=phoneNum]").val()!=""){
  			$("#formid").submit();
  		}
  	}
  </script>
    <link href="css/toptitle.css" rel="stylesheet" />
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="fonts/antonio-exotic/stylesheet.css" rel="stylesheet">
<link rel="stylesheet" href="css/lightbox.min.css">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/lightbox-plus-jquery.min.js" type="text/javascript"></script>
<script src="js/instafeed.min.js" type="text/javascript"></script>
<script src="js/custom.js" type="text/javascript"></script>
 </head>
 <body>
  <div class="container">
  <!--header--->
	<header class="header-container">

		<div class="col-md-2 col-sm-6 col-xs-6" id="logotop">
			<div id="logo">
				<!--<a href="index.html"><img src="images/logo.png" alt="logo"></a>-->
				<a href="index.jsp"><span>一起</span><br />出发吧</a>
			</div>
		</div>
		<nav class="navbar navbar-default" id="meumtop">
			<div
				class="collapse navigation navbar-collapse navbar-ex1-collapse remove-space">
				<ul class="list-unstyled nav1 cl-effect-10">
					<li role="presentation"><a data-hover="审核方案" 
						href="program/programAction!queryByPass"><span>审核方案</span></a>
					</li>
					<li role="presentation"><a data-hover="管理方案" href="guangliProgram.jsp"><span>管理方案</span></a>
					</li>
					<li role="presentation"><a data-hover="审核心得"
						href="experience/experienceAction!queryByPass"><span>审核心得</span></a>
					</li>
					<li role="presentation"><a data-hover="管理心得" class="active" href="guangliExperience.jsp"><span>管理心得</span></a>
					</li>
					<li role="presentation"><a data-hover="管理用户"
						href="user/userAction!adminUser?pageNum=1"><span>管理用户</span></a>
					</li>

				</ul>
			</div>
		</nav>
	</header>
	<!-- <ul class="nav nav-tabs">
	  <li role="presentation"><a href="program/programAction!queryByPass">审核方案</a></li>
	  <li role="presentation"><a href="guangliProgram.jsp">管理方案</a></li>
	  <li role="presentation"><a href="experience/experienceAction!queryByPass">审核心得</a></li>
	  <li role="presentation" class="active"><a>管理心得</a></li>
	  <li role="presentation"><a href="user/userAction!adminUser?pageNum=1">管理用户</a></li>
	</ul> -->
	<s:if test="#request.meg != null">
  		<div class="alert alert-success alert-dismissible" role="alert">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			<s:property value="#request.meg" />
		</div>
  	</s:if>
	<form action="experience/experienceAction!queryByTitleAndPass" class="form-inline">
	  <div class="form-group">
	    <input type="text" name="title" class="form-control" placeholder="关键字" />
	  	<input type="hidden" name="pageNum" value="1" />
	  </div>
	  <div class="form-group">
	    <select name="pass" class="form-control">
			<s:if test="programVo.pass==1 || programVo.pass==null">
	    		<option value="1" selected="selected">通过审核</option>
				<option value="2">未通过审核</option>
	    	</s:if><s:else>
	    		<option value="1">通过审核</option>
				<option value="2" selected="selected">未通过审核</option>
	    	</s:else>
		</select>
	  </div>
	  <button type="submit" class="btn btn-default">搜索</button>
	</form>
	<s:if test="#request.pageNum != null">
		<table class="table">
		<th>
			<td>标题</td>
			<td>用户</td>
			<td>日期</td>
			<td></td>
		</th>
			<s:iterator value="experiences" id="e">
				<tr>
					<td></td>
					<td><a target="_blank" href="experience/experienceAction!adminShowById?id=<s:property value="id" />"><s:property value="title" /></a></td>
					<td><s:property value="writerName" /></td>
					<td><s:property value="writeTime" /></td>
					<td><a href="experience/experienceAction!admindelete?id=<s:property value="id" />">删除</a></td>
				</tr>
			</s:iterator>
		</table>
	</s:if>
	<s:if test="#request.pagesNum != null">
		<nav style="text-align: center">
			<ul class="pagination">
				<li><s:if test="#request.pageNum==1">
						<a href="experience/experienceAction!queryByTitleAndPass?title=<s:property value="experienceVo.title"/>&pass=<s:property value="experienceVo.pass"/>&pageNum=1"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</s:if> <s:else>
						<a href="experience/experienceAction!queryByTitleAndPass?title=<s:property value="experienceVo.title"/>&pass=<s:property value="experienceVo.pass"/>&pageNum=<s:property value="#request.pageNum-1"/>" 
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</s:else>
				</li>
				<s:bean name="org.apache.struts2.util.Counter" id="counter">
					<s:param name="first" value="1" />
					<s:param name="last" value="#request.pagesNum" />
					<s:iterator status="count">
						<s:if test="#request.pageNum != #count.index+1">
							<li><a href="experience/experienceAction!queryByTitleAndPass?title=<s:property value="experienceVo.title"/>&pass=<s:property value="experienceVo.pass"/>&pageNum=<s:property />"><s:property /></a></li>
						</s:if>
						<s:else>
							<li class="active"><a><s:property /></a></li>
						</s:else>
					</s:iterator>
				</s:bean>
				<li>
				<s:if test="#request.pageNum==#request.pagesNum">
						<a href="experience/experienceAction!queryByTitleAndPass?title=<s:property value="experienceVo.title"/>&pass=<s:property value="experienceVo.pass"/>&pageNum=<s:property value="#request.pageNum"/>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</s:if> 
					<s:else>
						<a href="experience/experienceAction!queryByTitleAndPass?title=<s:property value="experienceVo.title"/>&pass=<s:property value="experienceVo.pass"/>&pageNum=<s:property value="#request.pageNum+1"/> "
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</s:else>
				</li>
			</ul>
		</nav>
		</s:if>
	</div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 </body>
</html>
