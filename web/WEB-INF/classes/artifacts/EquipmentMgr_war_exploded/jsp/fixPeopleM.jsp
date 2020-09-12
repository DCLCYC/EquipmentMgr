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
<title>设备信息</title>
<link rel="stylesheet" href="../assets/css/layui.css">
<link rel="stylesheet" href="../assets/css/view.css" />
<link rel="stylesheet" href="../assets/css/admin.css" />
<style type="text/css">
.layui-elem-quote {
	font-size: 18px;
	margin-bottom: 20px;
}

.layui-tab-card>.layui-tab-title {
	background-color: #009688;
	color: #fff;
}

.layui-tab-content {
	padding: 0;
}
</style>
</head>
<body class="layui-view-body">
	<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
		user="root" password="MySQLRootPassword123456" />
	<div class="layui-content">
		<!--面包屑导航-->
		<div class="mianb">
			<div class="mblf layui-col-xs6 layui-col-md6">
				<i class="layui-icon">&#xe656;</i>
				<p>
					维修信息管理 > <span>维修人员管理</span>
				</p>
			</div>
		</div>

		<sql:query dataSource="${snapshot}" var="role">
                     SELECT  *  FROM `d_role` where TYPE='2'
            </sql:query>

		<!--面包屑导航-->
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-tab layui-tab-card">
					<ul class="layui-tab-title">
						<c:forEach var="fix" items="${role.rows}">
							<!-- roles.rows是role表中的一条记录 -->
							<!-- 这里查询出来的user是role的一条记录的对应的user记录 -->
							<sql:query dataSource="${snapshot}" var="user">
                              SELECT  * FROM `d_user` where USER_ROLE=${fix.ID}
                         	</sql:query>
							<c:forEach var="fixman" items="${user.rows}">
								<li class="layui"><c:out value="${fixman.nickname}" /></li>
							</c:forEach>
						</c:forEach>

					</ul>
					<!-- 展示维修人员姓名，由于维修人员人数不多所以横向展示 -->

					<c:forEach var="fixorder" items="${role.rows}">
						<div class="layui-tab-item">
							<div class="table-responsive">
								<table class="layui-table" lay-skin="line" lay-size="lg"
									id="table">
									<thead>
										<tr>
											<th>设备编号</th>
											<th>设备名称</th>
											<th>维修状态</th>
										</tr>
									</thead>
									<tbody>
										<sql:query dataSource="${snapshot}" var="fixorderid">
                                                 SELECT  * FROM `repairorder` where SERVICE_USER=${fixorder.ID}
                                              </sql:query>
										<!-- 查找特定维修人员的报修单 -->

										<c:forEach var="orderinfo" items="${fixorderid.rows}">
											<tr>
												<td><c:out value="${orderinfo.ID}" /></td>
												<td><c:out value="${orderinfo.EQUIPMENT_NAME}" /></td>
												<td><c:if test="${orderinfo.STATUS==0}">
														<p>未修好
														</p>
													</c:if> <c:if test="${orderinfo.STATUS==1}">
														<p>已修好
														</p>
													</c:if></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<!--分页-->
							<div id="page"></div>
							<!--分页-->
						</div>
					</c:forEach>



				</div>
			</div>
		</div>
	</div>
	</div>
	<script src="../assets/jquery.min.js"></script>
	<script src="../assets/layui.all.js"></script>
	<script>
		var element = layui.element;
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer;

			//页码完整功能
			laypage.render({
				elem : 'page',
				count : 100,
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
				jump : function(obj) {
					console.log(obj)
				}
			});
		});
	</script>

</body>
</html>