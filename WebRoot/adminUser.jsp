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
  <script type="text/javascript">
   /*全选JS*/
   function CheckAll(thisform){
       for (var i=0;i<thisform.elements.length;i++){
          var e = thisform.elements[i];
              if (e.Name != "chkAll"&&e.disabled!=true)
                  e.checked = thisform.chkAll.checked;
               }
    }
    /*判断是否选空*/
    function judge(){
      var arrayid = new Array();
        $('input[name="ids"]:checked').each(function(){
        	arrayid.push($(this).val());
        });
        if(arrayid.length==0){
        alert("无实例选中");
     event.preventDefault(); // 兼容标准浏览器
     window.event.returnValue = false; // 兼容IE6~8
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
	<%-- <ul class="nav nav-tabs">
	  <li role="presentation"><a href="program/programAction!queryByPass">审核方案</a></li>
	  <li role="presentation"><a href="guangliProgram.jsp">管理方案</a></li>
	  <li role="presentation"><a href="experience/experienceAction!queryByPass">审核心得</a></li>
	  <li role="presentation"><a href="guangliExperience.jsp">管理心得</a></li>
	  <li role="presentation" class="active"><a>管理用户</a></li>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <li role="presentation"><a>管理员：<s:property value="#session.username" /></a></li>
	  <li role="presentation"><a href="user/userAction!exit">退出</a></li>
	</ul> --%>
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
					<li role="presentation"><a data-hover="管理用户" class="active" 
						href="user/userAction!adminUser?pageNum=1"><span>管理用户</span></a>
					</li>

				</ul>
			</div>
		</nav>
	</header>
	<form id="formid" class="sousu" action="user/userAction!getUserByPhone" method="post">
		<div class="form-group">
			<div class="input-group col-sm-8">
				<input type="text" name="phoneNum" class="form-control" id="inputSearchName" placeholder="输入用户手机号查询">
				<span onclick="submitInfo()" class="input-group-addon glyphicon glyphicon-search" aria-hidden="true" role="button"></span>
			</div>
		</div>
	</form>
	<s:form action="user/userAction!delAll" method="post" theme="simple">
	 <table class="table">
		<tr>
			<td>全选</td>
			<td>手机号</td>
			<td>用户名</td>
			<td>状态</td>
			<td colspan="2">操作</td>
		</tr>
		<s:if test="#request.pagesNum != null">
			<s:iterator value="users" id="u">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="<s:property value="phoneNum"/> " />
					</td>
					
					<td><s:property value="phoneNum" /></td>
					<td><s:property value="username" /></td>
					<s:if test="state==0">
						<td>正常</td>
						<td><a href="user/userAction!freeze?phoneNum=<s:property value="phoneNum" />">冻结</a></td>
					</s:if>
					<s:else>
						<td>被冻结</td>
						<td><a href="user/userAction!notFreeze?phoneNum=<s:property value="phoneNum" />">解冻</a></td>
					</s:else>
					<td><a href="user/userAction!delete?phoneNum=<s:property value="phoneNum" />">删除</a></td>
				</tr>
			</s:iterator>
		</s:if>
		<tr class="td1"> 
			<td></td> 
			<td align="center">
				<s:checkbox name="chkAll" onclick="CheckAll(this.form)"/> 
				&nbsp;&nbsp;&nbsp;
				<s:submit value="批量删除" onclick="judge()"/>
			</td> 
		</tr>

	 </table>
	</s:form>
	<s:if test="#request.pagesNum != null">
		<nav style="text-align: center">
			<ul class="pagination">
				<li><s:if test="#request.pageNum==1">
						<a href="user/userAction!adminUser?pageNum=1"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</s:if> <s:else>
						<a href="user/userAction!adminUser?pageNum=<s:property value="#request.pageNum-1"/> "
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</s:else>
				</li>
				<s:bean name="org.apache.struts2.util.Counter" id="counter">
					<s:param name="first" value="1" />
					<s:param name="last" value="#request.pagesNum" />
					<s:iterator status="count">
						
						<s:if test="#request.pageNum != #count.index+1">
							
							<li><a href="user/userAction!adminUser?pageNum=<s:property />"><s:property /></a></li>
						</s:if>
						<s:else>
							<li class="active"><a><s:property /></a></li>
						</s:else>
					</s:iterator>
				</s:bean>
				<li><s:if test="#request.pageNum==#request.pagesNum">
						<a href="user/userAction!adminUser?pageNum=<s:property value="#request.pageNum"/>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</s:if> 
					<s:else>
						<a href="user/userAction!adminUser?pageNum=<s:property value="#request.pageNum+1"/> "
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
