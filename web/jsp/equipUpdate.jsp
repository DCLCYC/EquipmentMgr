<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>设备修改</title>
<link rel="stylesheet" href="../assets/css/layui.css">
<link rel="stylesheet" href="../assets/css/view.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
</head>
<body class="layui-tank">
	<div class="layui-card">
		<div class="layui-form-item">
				<label class="layui-form-label">原有设备名称</label>
				<div class="layui-input-block">
					${param.name }
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">原有设备类型</label>
				<div class="layui-input-block">
					<%
						if(request.getParameter("type").equals("0")){
							out.print("辅助设备");							
						}else if(request.getParameter("type").equals("1")){
							out.print("办公设备");
						}else{
							out.print("教学设备");
						}
					%>
				</div>
		</div>
		<form class="layui-form" action="Equip_Update.action">
			<input type="hidden" name="id" value="${param.id }">
			<div class="layui-form-item">
				<label class="layui-form-label">设备新名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">设备新类型</label>
				<div class="layui-input-block">
					<select name="type" lay-filter="aihao">
						<option value="0">辅助设备</option>
						<option value="1">办公设备</option>
						<option value="2">教学设备</option>
					</select>
				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit"
					class="layui-btn  layui-btn-normal float-right" name="修改">
			</div>
		</form>
	</div>


	<script src="../assets/layui.all.js"></script>

</body>
</html>