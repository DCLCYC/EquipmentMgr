<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
		<form class="layui-form" action="Add_Area.action">


			<div class="layui-form-item">
				<label class="layui-form-label">楼号</label>
				<div class="layui-input-block">
					<input type="text" name="build" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">楼层</label>
				<div class="layui-input-block">
					<input type="text" name="floor" lay-verify="title"
						autocomplete="off" placeholder="" class="layui-input">

				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit"
					class="layui-btn  layui-btn-normal float-right" name="添加">
			</div>
		</form>
	</div>


	<script src="../assets/layui.all.js"></script>

</body>
</html>