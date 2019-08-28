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
  <title>一起出发吧·注册</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <style>
	.container{
		margin-top:30px;
	}
	.error{
		color:#f03;
	}
	.p_error{
		color:#f03;
		font-weight:bold;
	}
  </style>
  <script type="text/javascript">
  function checkPhoneNum(){
		var phoneNum=$("input[name=phoneNum]").val();
		var $phoneNum_b=$("#phoneNum_b");

		if(phoneNum.length!=11){
			$phoneNum_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;手机号码长度有误");
			$phoneNum_b.attr("class", "error");
		}else{
			$.ajax({
	    	  type:"post",
	    	  url:"ajax/ajaxRequest!checkPhoneNum",
	    	  data:{phoneNum:phoneNum},
	    	  dataType:"json",
	    	  success:function(data){
	    		  if(data.phoneResult==1){
					$phoneNum_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;该手机号码已被注册");
					$phoneNum_b.attr("class", "error");
				  }else{
					$phoneNum_b.html("");
					$phoneNum_b.attr("class", "");
				  }
	    	  }
	      });
		}
	}
	function checkUsername(){
		var username=$("input[name=username]").val();
		var $username_b=$("#username_b");
		if(username!=""){
			$.ajax({
		    	type:"post",
		    	url:"ajax/ajaxRequest!checkUsername",
		    	data:{username:username},
		    	dataType:"json",
		    	success:function(data){
		    		if(data.nameResult==1){
						$username_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;该用户名已被注册");
						$username_b.attr("class", "error");
					}else{
						$username_b.html("");
						$username_b.attr("class", "");
					}
		    	}
		   });
		}
	}
	function checkPassword(){
		var password=$("input[name=password]").val();
		var $password_b=$("#password_b");
		if(password.length<6 || password.length>14){
			$password_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;密码应为6—14位");
			$password_b.attr("class", "error");
		}else{
			$password_b.html("");
			$password_b.attr("class", "");
		}
	}
	function checkPassword2(){
		if($("input[name=password]").val()!=""){
			var password2=$("input[name=password2]").val();
			var $password2_b=$("#password2_b");
			if(password2 != $("input[name=password]").val()){
				$password2_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;两次密码不一致");
				$password2_b.attr("class", "error");
			}
			else{
				$password2_b.html("");
				$password2_b.attr("class", "");
			}
		}
	}
	function checkInfo(){
		var $button_b=$("#button_b");
		if($("input[name=phoneNum]").val()!="" && $("input[name=username]").val()!="" && $("input[name=password]").val()!="" && $("input[name=password2]").val()!=""){
			var $b = $("b:hasClass('error')");
			if($b.length!=0){
				return false;
			}
			return true;
		}
		else{
			$button_b.html("&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;信息有误，请检查");
			$button_b.attr("class", "p_error");
			return false;
		}
	}
  </script>
 </head>
 <body>
  <div class="container">
	<form action="user/userAction!register" method="post">
	  <div class="form-group">
		
		<label for="exampleInputPhone">手机号<b id="phoneNum_b"></b></label>
		
		<input type="text" class="form-control" id="exampleInputPhone" name="phoneNum" placeholder="请输入手机号" onblur="checkPhoneNum()" />
		
	  </div>
	  <div class="form-group">
		<label for="exampleInputName">用户名<b id="username_b"></b> </label>
		<input type="text" class="form-control" id="exampleInputName" name="username" placeholder="请输入用户名" onblur="checkUsername()"/>
	  </div>
	  <div class="form-group">
		<label for="exampleInputPassword">密码<b id="password_b"></b></label>
		
		<input type="password" class="form-control" id="exampleInputPassword" name="password" placeholder="请输入6到14位密码" onblur="checkPassword()" />
	  </div>
	  <div class="form-group">
		<label for="exampleInputPassword2">确认密码<b id="password2_b"></b></label>
		<input type="password" class="form-control" id="exampleInputPassword2" name="password2" placeholder="再次输入密码" onblur="checkPassword2()" />
	  </div>
	  
	  <div>
		<input type="submit" class="btn btn-default" value="提交" onclick="return checkInfo()" />
		<p id="button_b"></p>
	  </div>
	</form>
  </div>
  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 </body>
</html>
