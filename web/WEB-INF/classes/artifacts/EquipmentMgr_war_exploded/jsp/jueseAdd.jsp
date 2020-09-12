<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
	<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
		user="root" password="MySQLRootPassword123456" />


	<div class="layui-card">

		<!-- form表单开始 -->
		<form class="layui-form" action="Role_Add.action">

			<div class="layui-form-item">
				<label class="layui-form-label">角色名</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
				</div>
			</div>
			<div class="layui-card">


				<!-- 基本角色信息 -->
				<label class="layui-form-label">身份信息</label>
				<div class="layui-input-block">
					<select name="type" lay-filter="shenfen">
						<option value="0">管理员</option>
						<option value="1">调度员</option>
						<option value="2">维修员</option>
						<option value="3">报修员</option>
					</select>
				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit" class="layui-btn  layui-btn-normal float-right" value="添加"/>
			</div>
		</form>
	</div>
	<script src="../assets/layui.all.js"></script>

</body>
</html>
