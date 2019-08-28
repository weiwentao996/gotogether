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
  <title>一起出发吧·编写方案</title>
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
  <style>
	.container{
		margin-top:120px;
	}
	textarea{
		resize:none;
	}
  </style>
  <script type="text/javascript">
  	function checkInfo(){
  		if($("input[name='startAddress']").val()!=""&&$("input[name='endAddress']").val()!=""){
  			return true;
  		}
  		return false;
  	}
  </script>
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
					<li><a data-hover="查找方案"   class="active"
						href="program/programAction!queryAll?mold=个人方案"><span>查找方案</span>
					</a>
					</li>
					<li><a data-hover="旅行心得"
						href="experience/experienceAction!queryByTime"><span>旅行心得</span>
					</a>
					</li>

					<s:if test="#session.username == null">
						<li><a data-hover="个人中心" href="userLogin.jsp"><span>个人中心</span>
						</a>
						</li>
					</s:if>
					<s:else>
						<li><a data-hover="个人中心" 
							href="user/userAction!getUserByName?pass=1&pass2=1"><span>个人中心</span>
						</a>
						</li>
					</s:else>
				</ul>
			</div>
		</nav>
	</header>
  <%--  <nav class="navbar navbar-default navbar-fixed-top">
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
			<s:if test="#session.username == null">
				<li><a href="userLogin.jsp">个人中心</a></li>
			</s:if>
			<s:else>
				<li><a href="user/userAction!getUserByName?pass=1&pass2=1">个人中心</a></li>
			</s:else>
		  </ul>
		  <form action="program/programAction!queryByAddress" method="post" class="navbar-form navbar-left" role="search">
			<div class="form-group">
			  <input name="startAddress" type="text" class="form-control" placeholder="输入起始地，如广州" />&nbsp;至&nbsp;
			  <input name="endAddress" type="text" class="form-control" placeholder="输入目的地，如北京" />
			</div>
			<button type="submit" class="btn btn-default">查询</button>
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
  	<s:if test="#request.meg != null">
  		<div class="alert alert-success alert-dismissible" role="alert">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			<s:property value="#request.meg" />
		</div>
  	</s:if>
	<form action="program/programAction!save" method="post" enctype="multipart/form-data" class="form-horizontal">
		<div class="form-group">
			<div class="col-sm-12">
				<input type="text" name="title" class="form-control" placeholder="请输入主题，如青藏高原三日游（20字以内）" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-6">
				<input type="text" name="startAddress" class="form-control" placeholder="出发地（10字以内）">
			</div>
		
			<div class="col-sm-6">
				<input type="text" name="endAddress" class="form-control" placeholder="目的地（10字以内）">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<textarea class="form-control" name="course" rows="5" placeholder="方案简介，路线简介（250字以内，包括标点符号）"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<textarea class="form-control" name="basicNeed" rows="5" placeholder="衣食住行问题方案（250字以内，包括标点符号）"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<textarea class="form-control" name="transType" rows="5" placeholder="出行方式描述（80字以内，包括标点符号）"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<textarea class="form-control" name="cost" rows="5" placeholder="预算描述（80字以内，包括标点符号）"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<textarea class="form-control" name="writerInfo" rows="5" placeholder="发起者相关信息介绍，包括称呼，联系方式（100字以内，包括标点符号）"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4 col-md-2 col-xs-8">
				<input type="text" list="List" name="mold" class="form-control" placeholder="方案类型"/>
			</div>
		</div>
		<div class="form-group">
			<label for="inputImage" class=" control-label">选择一张图片做封面（大小不超过200K）</label>
			<div class="col-sm-9">
				<input type="file" name="file" class="form-control" id="inputImage" />
			</div>
		</div>
		<input type="submit" class="btn btn-default" value="提交" />
	</form>
	<datalist id="List">
	  <option label="个人方案" value="personplan"/>
	  <option label="团队方案" value="teamplan" />
	</datalist>
  </div>
  <div class="foot">
		<hr />
		<p>Copyrights 2019 TheYouth团队 &copy; All rights reserved.
			东北石油大学软件工程学院</p>
	</div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 </body>
</html>
