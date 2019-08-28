<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript">
	
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
					<li role="presentation"><a data-hover="管理心得" href="guangliExperience.jsp"><span>管理心得</span></a>
					</li>
					<li role="presentation"><a data-hover="管理用户"
						href="user/userAction!adminUser?pageNum=1"><span>管理用户</span></a>
					</li>

				</ul>
			</div>
		</nav>
	</header>



	<!-- <div class="container">
	<ul class="nav nav-tabs">
	  <li role="presentation"><a href="program/programAction!queryByPass">审核方案</a></li>
	  <li role="presentation"><a href="guangliProgram.jsp">管理方案</a></li>
	  <li role="presentation"><a href="experience/experienceAction!queryByPass">审核心得</a></li>
	  <li role="presentation"><a href="guangliExperience.jsp">管理心得</a></li>
	  <li role="presentation"><a href="user/userAction!adminUser?pageNum=1">管理用户</a></li>
	</ul> -->
	<s:if test="#request.meg != null">
		<div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<s:property value="#request.meg" />
		</div>
	</s:if>
	</div>
	<script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
