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

		<form class="layui-form" action="Role_ManagePermission.action?role_id=${param.id }" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">角色ID:</label>
				<div class="layui-input-block">
					<input type="text" name="id" lay-verify="title" autocomplete="off"
						placeholder="${param.id}" class="layui-input" disabled="disabled" value="${param.id}">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">角色名:</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="title"
						autocomplete="off" placeholder="${param.name}" class="layui-input"
						disabled="disabled">
				</div>
			</div>
			<input type="hidden" name="type" value="${param.type }">
			<p class="col-red">权限如下，可在权限管理中增加</p>
			<div class="seachadd">
				<p class="float-left">权限：</p>
			</div>
			<div class="addbox">
				<div class="layui-inline">
					<label class="layui-form-label"><font
						class="faiqi-font-red-star"></font></label>
					<div class="layui-input-block">
						<!-- checkbox 每确定一个就在role_permisiion中增加一个数据 -->

						<sql:query dataSource="${snapshot}" var="permi">
                              SELECT  * FROM `PERMISSION`
                  </sql:query>

						<c:forEach var="row" items="${permi.rows}">
							<input type="checkbox" lay-filter="campus" class="campus" name="permission_value" value="<c:out value="${row.id}"/>"
								name="<c:out value="${row.name}"/>"
								title="<c:out value="${row.name}"/>">
						</c:forEach>
						<!-- value的值是permission的ID，导入到role_permision中去 -->

					</div>
				</div>
			</div>
			<div class=" tkbtnfxd">
				<input value="确认分配权限" type="submit"
					class="layui-btn  layui-btn-normal float-right" />
			</div>
		</form>
	</div>
	<script src="../assets/layui.all.js"></script>

</body>
</html>
