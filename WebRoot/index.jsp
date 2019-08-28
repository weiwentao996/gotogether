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
<title>一起出发吧</title>
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
.container {
	margin-top: 100px;
}

.collapse navbar-collapse {
	
}

.glyphicon-fire,.glyphicon-info-sign {
	color: red;
}

.container>h1 {
	color: blue;
}
</style>

</head>
<body>
	<!---header top---->
	<div class="top-header">
		<!-- <form action="program/programAction!queryByAddress" method="post"
			class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input name="startAddress" type="text" class="form-control"
					placeholder="输入起始地，如广州" />&nbsp;至&nbsp; <input name="endAddress"
					type="text" class="form-control" placeholder="输入目的地，如北京" /> <input
					name="mold" type="hidden" value="personplan" />
			</div>
			<button type="submit" class="btn btn-default"
				onclick="return checkInfo()">查询</button>
		</form> -->
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
					<li><a data-hover="主页" class="active" href="go/index"><span>主页</span>
					</a>
					</li>
					<li><a data-hover="查找方案"
						href="program/programAction!queryAll?mold=personplan"><span>查找方案</span>
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

	<div id="myCarousel1" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->

		<ol class="carousel-indicators">
			<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel1" data-slide-to="1"></li>
			<li data-target="#myCarousel1" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/banner.png" style="width:100%; height: 500px"
					alt="First slide">
				<div class="carousel-caption">
					<h1>
						vacayhome<br> spa & Resort
					</h1>
				</div>
			</div>
			<div class="item">
				<img src="images/banner2.png" style="width:100%; height: 500px"
					alt="Second slide">
				<div class="carousel-caption">
					<h1>
						vacayhome<br> spa & Resort
					</h1>
				</div>
			</div>
			<div class="item">
				<img src="images/banner3.png" style="width:100%; height: 500px"
					alt="Third slide">
				<div class="carousel-caption">
					<h1>
						vacayhome<br> spa & Resort
					</h1>
				</div>
			</div>

		</div>
		<a class="left carousel-control" href="#myCarousel1" data-slide="prev">
			<img src="images/icons/left-arrow.png"
			onmouseover="this.src = 'images/icons/left-arrow-hover.png'"
			onmouseout="this.src = 'images/icons/left-arrow.png'" alt="left">
		</a> <a class="right carousel-control" href="#myCarousel1"
			data-slide="next"><img src="images/icons/right-arrow.png"
			onmouseover="this.src = 'images/icons/right-arrow-hover.png'"
			onmouseout="this.src = 'images/icons/right-arrow.png'" alt="left">
		</a>
	</div>
	<div class="foot">
		<hr />
		<p>Copyrights 2019 TheYouth团队 &copy; All rights reserved.
			东北石油大学软件工程学院</p>
	</div>
	<div class="container">

		<s:if test="#request.registerState">
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>&nbsp;恭&nbsp;喜&nbsp;你&nbsp;！</strong>
				&nbsp;注&nbsp;册&nbsp;成&nbsp;功，请&nbsp;<a href="userLogin.jsp"
					class="alert-link">登&nbsp;录</a>&nbsp;吧！
			</div>
		</s:if>
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
