<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>区域修改</title>
<link rel="stylesheet" href="../assets/css/layui.css">
<link rel="stylesheet" href="../assets/css/view.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
</head>
<body class="layui-tank">
	<div class="layui-card">
		<div class="layui-form-item">
				<label class="layui-form-label">旧楼号</label>
				<div class="layui-input-block">
					<%out.print(request.getParameter("build")); %>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">旧楼层</label>
				<div class="layui-input-block">
					<%out.print(request.getParameter("floor")); %>
				</div>
		</div>
		<form class="layui-form" action="Update_Area.action">
			<input type="hidden" name="id" value="${param.id }">
			<div class="layui-form-item">
				<label class="layui-form-label">新楼号</label>
				<div class="layui-input-block">
					<input type="text" name="build" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新楼层</label>
				<div class="layui-input-block">
					<input type="text" name="floor" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">

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