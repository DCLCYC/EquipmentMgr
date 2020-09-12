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
<title>新增设备</title>
<link rel="stylesheet" href="../assets/css/layui.css">
<link rel="stylesheet" href="../assets/css/view.css" />
<link rel="stylesheet" href="../assets/css/admin.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
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
					设备管理管理 > <span><a href="equipWarnManage.jsp"> 设备报修</a></span>
				</p>
			</div>
		</div>

		<!--指示条-->
		<div class="layui-row">
			<div class="layui-card positionbox">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>基本信息</legend>
				</fieldset>
				<form class="layui-form" action="RepairOrder_Add.action"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="status" value="0"/>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="col-red">*</span>设备名称</label>
						<div class="layui-input-block">
							<input type="text" name="equipment_name" lay-verify="title"
								autocomplete="off" placeholder="请输入设备名称" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">设备位置</label>
						<div class="layui-input-inline">
							<sql:query dataSource="${snapshot}" var="lou">
                                                            SELECT  distinct BUILD FROM `d_area`
                                                          </sql:query>



							<select id="first"  name="build_floor_num">
								<option value="-1" selected="selected">请选择楼栋号</option>
								<c:forEach var="row" items="${lou.rows}">
									<sql:query dataSource="${snapshot}" var="ceng">
                                      SELECT  distinct floor FROM `d_area`where build = ${row.build}
                                    </sql:query>
									<c:forEach var="row1" items="${ceng.rows}">

										<option value="${row.build},${row1.floor}">
											
											<c:out value="${row.build}" />号楼
											<c:out value="${row1.floor}" />层
										</option>


									</c:forEach>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">设备类型</label>
						<div class="layui-input-block">
							<select name="equipment_type" lay-filter="aihao">
								<option value="0">辅助设备</option>
								<option value="1">办公设备</option>
								<option value="2">教学设备</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="col-red">*</span>详细地址</label>
						<div class="layui-input-block">
						
							<input type="text" name="equipment_address" lay-verify="title"
								autocomplete="off" placeholder="请输入设备详细地址" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">设备图片</label>
						<div class="layui-form-item layui-form-text">
							<div class="layui-input-block">
								<input type="file" value="上传图片 "name="repairOrder_image">
							</div>
						</div>
					</div>


					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">报修备注</label>
						<div class="layui-input-block">
							<textarea id="demo" style="display: none;" name="remark"></textarea>
						</div>
					</div>
					<input type="hidden" name="repair_user.id" value="${session.nowuser.id }"/>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="submit"
								class="layui-btn  layui-btn-normal float-right" name="提交报修单">
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<script src="../assets/jquery.min.js"></script>
	<script src="../assets/layui.all.js"></script>
	<script>
		layui.use('layedit', function() {
			var layedit = layui.layedit;
			layedit.build('demo'); //建立编辑器
		});
		layui.use('layedit', function() {
			var layedit = layui.layedit;
			layedit.build('demo2'); //建立编辑器
		});
	</script>
	<script src="../assets/layui.all.js"></script>
</body>
</html>