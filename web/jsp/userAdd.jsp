<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
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
		<form class="layui-form" action="User_Add.action">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="nickname" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-block">
					<input type="text" name="account" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
					<s:if test="#request.user_add_fail != null">
						<font color="red"><s:property value="#request.user_add_fail"/></font>
					</s:if>
					
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="text" name="password" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit" value="提交" class="layui-btn  layui-btn-normal float-right">
			</div>
		</form>
	</div>


	<script src="../assets/layui.all.js"></script>

</body>
</html>
