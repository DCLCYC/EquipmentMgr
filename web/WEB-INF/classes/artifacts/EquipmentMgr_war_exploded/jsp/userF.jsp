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
	<div class="layui-card">
		<form class="layui-form" action="UserManageRole.action" method="post">
		<input type="hidden" name="id" value="${param.id }"/>
		<input type="hidden" name="nickname" value="${param.nickname }"/>
		<input type="hidden" name="account" value="${param.account }"/>
		<input type="hidden" name="password" value="${param.password }"/>
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
			<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
				user="root" password="MySQLRootPassword123456" />

			<sql:query dataSource="${snapshot}" var="user">
                      select distinct * from  d_role  where not exists (select user_role from d_user where USER_ROLE = d_role.id)
                   </sql:query>
			<div class="layui-form-item layui-form-text">
				<div class="layui-form-item">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-block">
						<select name="user_role.id" lay-filter="juese1">
						请选择：
							<c:forEach var="juese" items="${user.rows}">
								<option value="${juese.ID}"><c:out
										value="${juese.name}" /></option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class=" tkbtnfxd">
				<input type="submit" value="确认分配"
					class="layui-btn  layui-btn-normal float-right" />
			</div>
		</form>
	</div>


	<script src="../assets/layui.all.js"></script>

</body>
</html>
