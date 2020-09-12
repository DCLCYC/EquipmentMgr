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
	<div class="layui-content">
		<!--面包屑导航-->
		<div class="mianb">
			<div class="mblf layui-col-xs6 layui-col-md6">
				<i class="layui-icon">&#xe656;</i>
				<p>
					统计中心 > <span>区域信息</span>
				</p>
			</div>
			<div class="mbrt layui-col-xs6 layui-col-md6">
				<a href="javascript:;" class="layui-btn layui-btn-normal" id="add">增加</a>
			</div>
		</div>
		<!--面包屑导航-->
		<div class="layui-row">
			<div class="layui-card">

				<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
					user="root" password="MySQLRootPassword123456" />


				<div class="layui-tab layui-tab-card">

					<sql:query dataSource="${snapshot}" var="result">
                     SELECT distinct BUILD FROM `d_area`
                    </sql:query>
					<ul class="layui-tab-title">
						<li class="layui-this">全部</li>
						<c:forEach var="row" items="${result.rows}">
							<li class="layui"><c:out value="${row.build}" />号楼</li>
						</c:forEach>

					</ul>

					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show">
							<div class="table-responsive">
								<table class="layui-table" lay-skin="line" lay-size="lg"
									id="table">
									<thead>
										<tr>
											<th>楼号</th>
											<th>层数</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

										<sql:query dataSource="${snapshot}" var="result2">
                                             SELECT  * FROM `d_area`
                                              </sql:query>

										<c:forEach var="row" items="${result2.rows}">
											<tr>
												<td>第<c:out value="${row.build}" />号楼
												</td>
												<td>第<c:out value="${row.floor}" />层
												</td>

												<td>
													<div class="layui-table-cell laytable-cell-1-0-10">
														<a class="layui-btn layui-btn-danger layui-btn-xs"
															href="AreaUpdate.jsp?id=${row.id }&build=${row.build}&floor=${row.floor}">修改</a>
														<a class="layui-btn layui-btn-danger layui-btn-xs"
															href="Delete_Area.action?id=${row.id }&build=${row.build}&floor=${row.floor}">删除</a>

													</div>

												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<c:forEach var="row1" items="${result.rows}">
							<!-- 首先获得楼号数据 -->
							<sql:query dataSource="${snapshot}" var="result3">
                                 SELECT * FROM `d_area` where BUILD=${row1.build}
                             </sql:query>
							<!-- 在获取对应楼号的楼层信息 -->

							<div class="layui-tab-item">
								<div class="table-responsive">
									<table class="layui-table" lay-skin="line" lay-size="lg"
										id="table">
										<thead>
											<tr>
												<th>楼号</th>
												<th>层数</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row2" items="${result3.rows}">
												<tr>
													<td>第<c:out value="${row1.build}" />号楼
													</td>
													<td>第<c:out value="${row2.floor}" />层
													</td>

													<td>
														<div class="layui-table-cell laytable-cell-1-0-10">
															<a class="layui-btn layui-btn-danger layui-btn-xs delete"
																href="AreaUpdate.jsp?id=${row2.id }&build=${row1.build}&floor=${row2.floor}">修改</a>
															<a class="layui-btn layui-btn-danger layui-btn-xs delete"
																href="Delete_Area.action?id=${row2.id }&build=${row1.build}&floor=${row2.floor}">删除</a>
														</div>

													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</c:forEach>
						<!-- foreach内循环foreach -->

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

			//弹框		
			$('#add').on('click', function() {
				layui.use('layer', function() {
					var layer = layui.layer;
					layer.open({
						type : 2,
						title : '添加区域',
						fix : false,
						shadeClose : true,
						shade : 0.8,
						area : [ '660px', '300px' ],
						content : 'AreaAdd.jsp',
						 end: function () {
			                   location.reload();
			                }
					});
				});
			})
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
			layer.confirm('确定要删除该设备？', {
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
	</script>

</body>
</html>