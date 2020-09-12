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
<title>报修管理</title>
<link rel="stylesheet" href="../assets/css/layui.css">
<link rel="stylesheet" href="../assets/css/view.css" />
<link rel="stylesheet" href="../assets/css/admin.css" />
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
					维修信息管理 > <span>报修分配</span>
				</p>
			</div>

		</div>
		<!--面包屑导航-->
		<div class="layui-row">
			<div class="layui-card">
				<div class="sortbox layui-form">
					<div class="layui-form-item">
						<label class="layui-form-label">按设备类型筛选</label>
						<div class="layui-input-inline">
							<select name="interest" lay-filter="aihao">
								<option value=""></option>
								<option value="0">教学设备</option>
								<option value="1" selected="">辅助设备</option>
								<option value="2">办公设备</option>
							</select>
						</div>
						<label class="layui-form-label">设备名查询</label>
						<div class="layui-input-inline">
							<input type="text" name="price_min" placeholder=""
								autocomplete="off" class="layui-input">
						</div>
					</div>

				</div>
				<div class="table-responsive">
					<table class="layui-table" lay-skin="line" lay-size="lg" id="table">
						<thead>
							<tr>
								<th>报修单号</th>
								<th>设备名称</th>
								<th>楼号楼层</th>
								<th>详细地址</th>
								<th>错误信息</th>
								<th>报修人</th>
								<th>图片预览</th>
								<th>维修人员</th>
							</tr>
						</thead>
						<tbody>
							<sql:query dataSource="${snapshot}" var="fixorder">
                                SELECT * from repairorder where SERVICE_USER is not NULL
                           </sql:query>

							<c:forEach var="fix" items="${fixorder.rows}">
								<tr>
									<td><c:out value="${fix.id}" /></td>
									<td><c:out value="${fix.equipment_name}" /></td>
									<td>第<c:out value="${fix.equipment_build}" />号楼第<c:out
											value="${fix.equipment_build}" />层
									</td>
									<td><c:out value="${fix.equipment_address}" /></td>
									<td><c:out value="${fix.remark}" /></td>
									<td><c:if test="${empty fix.repair_user}">
						               	匿名报修人
						       			</c:if> 
						       		<c:if test="${not empty fix.repair_user }">
											<sql:query dataSource="${snapshot}" var="repoman">
                                  SELECT  * FROM `d_user` where id = ${fix.repair_user}
                             </sql:query>
											<c:forEach var="row2" items="${repoman.rows}">
												<c:out value="${row2.nickname}" />
											</c:forEach>
										</c:if></td>
									<td>
										<div id="layer-photos-demo" class="layer-photos-demo">
											<img layer-pid="" layer-src="${fix.IMAGE}"
												src="../assets/images/banner01.png" alt="图片名">
										</div>
									</td>

									<td class="layui-form">

										 <c:if test="${fix.service_user == null}">
						                                    未分配
						                </c:if>
						          
						    <c:if test="${not empty fix.service_user}">
						       <sql:query dataSource="${snapshot}" var="fixman">
                                  SELECT  * FROM `d_user` where id = ${fix.service_user}
                             </sql:query>
                              <c:forEach var="row2" items="${fixman.rows}">
						      <c:out value="${row2.nickname}"/>
						       </c:forEach>
						       </c:if>

									</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--分页-->
				<div id="page"></div>
				<!--分页-->
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

		//判断弹框
		$(".delete").click(function() {
			layer.confirm('确定要删除此信息？', {
				btn : [ '是', '否' ]
			//按钮
			}, function() {
				layer.msg('已删除', {
					icon : 1
				});
			}, function() {
				layer.msg('已取消', {
					icon : 2
				});
			});
		})

		layui.use('form', function() {
			var form = layui.form;
			form.render();
		});
	</script>
	<script>
		//调用示例
		layer.photos({
			photos : '.layer-photos-demo',
			anim : 5
		//0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
		});
	</script>
</body>
</html>