<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.fuyv.utils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<link rel="stylesheet" href="../assets/css/layui.css">
<link rel="stylesheet" href="../assets/css/view.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
</head>
<body class="layui-tank">
	<div class="layui-card">
		
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					${param.nickname }
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-block">
					${param.account }
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">MD5加密后的密码为</label>
				<div class="layui-input-block">
					${param.password }
				</div>
			</div>
			<form class="layui-form" action="User_Update.action">
			<input type="hidden" name="id" value="${param.id}">
			<div class="layui-form-item">
				<label class="layui-form-label">新用户名:</label>
				<div class="layui-input-block">
					<input type="text" name="nickname" lay-verify="title"
						autocomplete="off" placeholder="${param.nickname }" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新账号：</label>
				<div class="layui-input-block">
					<input type="text" name="account" lay-verify="title"
						autocomplete="off" placeholder="${param.account }" class="layui-input">

				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新密码(必须输入或提交原密码，代码待补充！)：</label>
				<div class="layui-input-block">
					<input id="new_pwd" type="text" name="password" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">

				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit"
					class="layui-btn  layui-btn-normal float-right" name="修改" onclick="return checkPwd()">
			</div>
		</form>
	</div>


	<script src="../assets/layui.all.js"></script>
	<script type="text/javascript">
		function checkPwd() {
			
			var node = document.getElementByID("new_pwd").value;
			alert(node)
			return false;
		}
	</script>
</body>
</html>
