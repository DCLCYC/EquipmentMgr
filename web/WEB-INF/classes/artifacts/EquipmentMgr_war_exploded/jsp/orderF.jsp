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
		<form class="layui-form" action="RepairOrder_Manage.action">
		<input type="hidden" name="id" value="${param.id}"/>
			<div class="layui-form-item">
				<label class="layui-form-label">报修单号</label>
				<div class="layui-input-block">
					${param.id}
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">设备名称</label>
				<div class="layui-input-block">
					${param.name}
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<div class="layui-form-item">
					<label class="layui-form-label">维修人员</label>
					<div class="layui-input-block">

						<sql:query dataSource="${snapshot}" var="role">
                                            SELECT  *  FROM `d_role` where TYPE='2'
                                      </sql:query>
						<select name="service_user.id" lay-filter="aihao" >
							<c:forEach var="fix" items="${role.rows}">

								<sql:query dataSource="${snapshot}" var="user">
                                       SELECT  * FROM `d_user` where USER_ROLE=${fix.ID}
                                      </sql:query>
								<c:forEach var="fixman" items="${user.rows}">

									<option value="${fixman.id}"><c:out
											value="${fixman.nickname}" /></option>
								</c:forEach>>
						            </c:forEach>
						</select>

					</div>
				</div>
				<div class=" tkbtnfxd">
					<input type="submit"
						class="layui-btn  layui-btn-normal float-right" value="确定分配">
					<a href="fixM.jsp" class="layui-btn layui-btn-primary float-right">取消</a>
				</div>
			</div>
		</form>

	</div>





	<script src="../assets/layui.all.js"></script>

</body>
</html>
