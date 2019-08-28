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
  <title>一起出发吧·个人中心</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
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
  <style type="text/css">
	.img-circle{
		margin-top:80px;
	}
	dt{
		font-size:18px;
	}
	.container-recommend-list{
		margin-top:20px;
	}
  </style>
  
 </head>
 <body>
 <!---header top---->
	<div class="top-header">
		<form action="program/programAction!queryByAddress" method="post"
			class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input name="startAddress" type="text" class="form-control"
					placeholder="输入起始地，如广州" />&nbsp;至&nbsp; <input name="endAddress"
					type="text" class="form-control" placeholder="输入目的地，如北京" /> <input
					name="mold" type="hidden" value="个人方案" />
			</div>
			<button type="submit" class="btn btn-default"
				onclick="return checkInfo()">查询</button>
		</form>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<s:if test="#session.username == null">
					<li><a href="userLogin.jsp">登录</a>
					</li>
					<li><a href="userRegister.jsp">注册</a>
					</li>
				</s:if>
				<s:else>
					<li><a><s:property value="#session.username" /> </a>
					</li>
					<li><a href="user/userAction!exit">退出</a>
					</li>
				</s:else>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</div>
	</div>
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
					<li><a data-hover="主页"  href="go/index"><span>主页</span>
					</a>
					</li>
					<li><a data-hover="查找方案"
						href="program/programAction!queryAll?mold=个人方案"><span>查找方案</span>
					</a>
					</li>
					<li><a data-hover="旅行心得"
						href="experience/experienceAction!queryByTime"><span>旅行心得</span>
					</a>
					</li>

					<s:if test="#session.username == null">
						<li><a data-hover="个人中心" class="active" href="userLogin.jsp"><span>个人中心</span>
						</a>
						</li>
					</s:if>
					<s:else>
						<li><a data-hover="个人中心" class="active"
							href="user/userAction!getUserByName?pass=1&pass2=1"><span>个人中心</span>
						</a>
						</li>
					</s:else>
				</ul>
			</div>
		</nav>
	</header>
<%--   <nav class="navbar navbar-default navbar-fixed-top">
	<div class="nav-container">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a href="go/index">
			  <img src="images/ioc.png" class="img-ioc" />
			  <b class="nav-b navbar-brand">一起出发吧&nbsp;&nbsp;&nbsp;</b>
		  </a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		  <ul class="nav navbar-nav">
			<li><a href="program/programAction!queryAll?mold=个人方案">查找方案</a></li>
			<li><a href="experience/experienceAction!queryByTime">旅行心得</a></li>
			<li class="active"><a>个人中心</a></li>
		  </ul>
		  <form action="program/programAction!queryByAddress" method="post" class="navbar-form navbar-left" role="search">
			<div class="form-group">
			  <input name="startAddress" type="text" class="form-control" placeholder="输入起始地，如广州" />&nbsp;至&nbsp;
			  <input name="endAddress" type="text" class="form-control" placeholder="输入目的地，如北京" />
			</div>
			<button type="submit" class="btn btn-default" onclick="return checkInfo()">查询</button>
		  </form>
		  <ul class="nav navbar-nav navbar-right">
		  	<s:if test="#session.username == null">
				<li><a href="userLogin.jsp">登录</a></li>
				<li><a href="userRegister.jsp">注册</a></li>
			</s:if>
			<s:else>
				<li><a><s:property value="#session.username"/></a></li>
				<li><a href="user/userAction!exit">退出</a></li>
			</s:else>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
		  </ul>
		</div>
	</div>
  </nav> --%>
  <div class="container">
	<img src="images/3.jpg" class="center-block img-circle img-responsive" />
	<h4 class="text-center"><s:property value="#session.username" /></h4>
	<div class="text-center">
		<s:if test="#session.username != null">
			<p>手机号：<s:property value="user.phoneNum"/></p>
			<p>年龄：<s:property value="user.age"/>&nbsp;&nbsp;&nbsp;&nbsp;性别：<s:property value="user.sex"/></p>
			<p>所在地：<s:property value="user.address"/></p>
		</s:if>
		<p><a href="userInfo.jsp">修改个人信息</a>
		&nbsp;<a href="personPassword.jsp">修改密码</a></p>
	</div>
	<div class="container-recommend">
		<h3>我提交的方案&nbsp;&nbsp;<small><a href="editProgram.jsp"><span class="glyphicon glyphicon-plus">写方案</span></a></small></h3>
		<s:if test="#request.pass == 1">
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a>通过审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass=0&pass2=1">待审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass=2&pass2=1">未通过审核</a></li>
			</ul>
		</s:if>
		<s:elseif test="#request.pass == 2">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="user/userAction!getUserByName?pass=1&pass2=1">通过审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass=0&pass2=1">待审核</a></li>
				<li role="presentation" class="active"><a>未通过审核</a></li>
			</ul>
		</s:elseif>
		<s:else>
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="user/userAction!getUserByName?pass=1&pass2=1">通过审核</a></li>
				<li role="presentation" class="active"><a>待审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass=2&pass2=1">未通过审核</a></li>
			</ul>
		</s:else>
		<div class="container-recommend-list">
			<div class="row masonry">
				<s:if test="#session.username != null">
					<s:iterator value="programs" id="p">
						<a href="program/programAction!queryById?id=<s:property value="id"/>">
							<div class="col-sm-6 col-md-4 item">
								<div class="thumbnail">
								  <img src="upload/<s:property value="pictureUrl"/>" />
								  <div class="caption">
									<h3><s:property value="title"/><small>（<s:property value="mold"/>）<small></h3>
									<p class="text-muted"><s:property value="writeTime"/></p>
									<h4 class="text-primary"><s:property value="startAddress"/><small>&nbsp;至&nbsp;</small><s:property value="endAddress"/></h4>
								  	<p><a href="program/programAction!delete?id=<s:property value="id"/>" class="btn btn-primary" role="button">删除</a></p>
								  </div>
								</div>
							</div>
						</a>
					</s:iterator>
				</s:if>
			</div>
		</div>

		<h3>我的旅游心得&nbsp;&nbsp;<small><a href="editExperience.jsp"><span class="glyphicon glyphicon-plus">写心得</span></a></small></h3>
		<s:if test="#request.pass2 == 1">
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a>通过审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass2=0&pass=1">待审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass2=2&pass=1">未通过审核</a></li>
			</ul>
		</s:if>
		<s:elseif test="#request.pass2 == 2">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="user/userAction!getUserByName?pass2=1&pass=1">通过审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass2=0&pass=1">待审核</a></li>
				<li role="presentation" class="active"><a>未通过审核</a></li>
			</ul>
		</s:elseif>
		<s:else>
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="user/userAction!getUserByName?pass2=1&pass=1">通过审核</a></li>
				<li role="presentation" class="active"><a>待审核</a></li>
				<li role="presentation"><a href="user/userAction!getUserByName?pass2=2&pass=1">未通过审核</a></li>
			</ul>
		</s:else>
		<div class="container-recommend-list">
			<div class="row masonry">
				<s:if test="#session.username != null">
					<s:iterator value="experiences" id="e">
						<a href="experience/experienceAction!showById?id=<s:property value="id"/>">
							<div class="col-sm-6 col-md-4 item">
								<div class="thumbnail">
								  <div class="caption">
									<h3><s:property value="title"/><small>（<s:property value="writerName"/>）<small></h3>
									<p class="text-muted"><s:property value="writeTime"/></p>
								  	<p><a href="experience/experienceAction!delete?id=<s:property value="id"/>" class="btn btn-primary" role="button">删除</a></p>
								  </div>
								</div>
							</div>
						</a>
					</s:iterator>
				</s:if>
			</div>
		</div>
	<div class="foot">
		<hr />
		<p>Copyrights 2019 TheYouth团队 &copy; All rights reserved.
			东北石油大学软件工程学院</p>
	</div>
  </div>
  <a style="display: none;" href="javascript:void(0);"
		class="scrollTop back-to-top" id="back-to-top"> <span><i
			aria-hidden="true" class="fa fa-angle-up fa-lg"></i> </span> <span>Top</span>
	</a>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/masonry.pkgd.min.js"></script>
  <script src="js/imagesloaded.pkgd.min.js"></script>
  <script type="text/javascript">
  	function checkInfo(){
  		if($("input[name='startAddress']").val()!=""&&$("input[name='endAddress']").val()!=""){
  			return true;
  		}
  		return false;
  	}
  	$(".masonry").imagesLoaded(function() {
  		$(".masonry").masonry({
  			itemSelector: ".item"
  		});
  	});
  </script>
 </body>
</html>
