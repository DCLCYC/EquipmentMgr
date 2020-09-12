<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
		<div class="mblf layui-col-xs6 layui-col-md6">
			<i class="layui-icon">&#xe656;</i>
			<p>
				维修信息管理 > <span><a href="fixM.jsp">维修分配</a></span>
			</p>
		</div>
		<form class="layui-form" action="RepairOrder_Record.action">
			<input type="hidden" name="id" value="${param.id}" />
			<div class="layui-form-item">
				<label class="layui-form-label">报修单号</label>
				<div class="layui-input-block">${param.id}</div>

			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">设备名称</label>
				<div class="layui-input-block">${param.name}</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<div class="layui-form-item">
					<label class="layui-form-label">维修反馈</label>
					<div class="layui-textarea-block">
						<textarea id="demo" style="display: none;" name="record"></textarea>
					</div>
				</div>

			</div>
			<div class=" tkbtnfxd">
				<input type="submit" 
					class="layui-btn  layui-btn-normal float-right" value="确定提交">
				<a type="button" href="fixDo.jsp"
					class="layui-btn layui-btn-primary float-right">取消</a>
			</div>
		</form>
	</div>


	<script src="../assets/layui.all.js"></script>
<script src="../assets/jquery.min.js"></script>
	<script src="../assets/layui.all.js"></script>
	<script>
		layui.use('layedit', function() {
			var layedit = layui.layedit;
			layedit.build('demo'); //建立编辑器
		});
		layui.use('layedit', function() {
			var layedit = layui.layedit;
			layedit.build('demo2'); //建立编辑器
		});
	</script>
	<script src="../assets/layui.all.js"></script>
</body>
</html>
