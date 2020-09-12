<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<form class="layui-form" action="Permission_Update.action">
			<input type="hidden" name="id" value="${param.id }">
			<div class="layui-form-item">
				<label class="layui-form-label">新权限名</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="title"
						autocomplete="off" placeholder="原有权限名:${param.name }"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">原有权限类型:</label>
				<div class="layui-input-block">
					<c:if test="${param.type=='A' }">
						高级权限
					</c:if>
					<c:if test="${param.type=='B' }">
						中级权限
					</c:if>
					<c:if test="${param.type=='C' }">
						低级权限
					</c:if>
					<c:if test="${param.type=='D' }">
						无权限即可查看
					</c:if>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新权限类型</label>
				<div class="layui-input-block">
					<select name="type" lay-filter="aihao">
						<option value="A">高级权限</option>
						<option value="B">中级权限</option>
						<option value="C">低级权限</option>
						<option value="D">无权限即可查看</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">URL</label>
				<div class="layui-input-block">
					<input type="text" name="url" lay-verify="title" autocomplete="off"
						placeholder="原URL:${param.url }" class="layui-input">
				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit" value="提交"
					class="layui-btn  layui-btn-normal float-right">
			</div>
		</form>
	</div>
	<script src="../assets/layui.all.js"></script>

</body>
</html>
