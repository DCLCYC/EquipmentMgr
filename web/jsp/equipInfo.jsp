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
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <link rel="stylesheet" href="../assets/css/admin.css"/>
    <style type="text/css">
    	.layui-elem-quote{ font-size: 18px; margin-bottom: 20px;}    
    	.layui-tab-card>.layui-tab-title{ background-color: #009688; color: #fff;}	
    	.layui-tab-content{ padding: 0;}
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
    			 <p>设备管理 > <span>设备信息</span></p>
    		</div> 
    		<div class="mbrt layui-col-xs6 layui-col-md6">
    			<a href="javascript:;" class="layui-btn layui-btn-normal" id="add">增加</a>    			     			 
    		</div>   		
    	</div>
    	<!--面包屑导航-->
        <div class="layui-row">
            <div class="layui-card">
            	   <div class="layui-tab layui-tab-card">
					  <ul class="layui-tab-title">
					    <li class="layui-this">所有设备</li>
					    <li>辅助设备</li>	
						<li>办公设备</li>
						<li>教学设备</li>
					  </ul>
					  <div class="layui-tab-content">
						    <div class="layui-tab-item layui-show">
						    	  <div class="table-responsive">
								 		  <table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
											  <thead>
											    <tr>											      
											      <th>设备编号</th>
											      <th>设备名称</th>	
											  	  <th>操作</th>							      											      
											    </tr> 
											  </thead>
											  
											   <sql:query dataSource="${snapshot}" var="result">
                                                       SELECT  * FROM `d_equipment`
                                              </sql:query>
											  <tbody>
											   <c:forEach var="row" items="${result.rows}">
											    <tr>											      
											      <td><c:out value="${row.id}"/></td>
											      <td><c:out value="${row.name}"/></td>
											      <td>
						      	                    <div class="layui-table-cell laytable-cell-1-0-10"> 							      	  	 
							      	  	             <a class="layui-btn layui-btn-normal layui-btn-xs" href="equipUpdate.jsp?id=${row.id }&name=${row.name}&type=${row.type}">修改</a> 
							      	  	             <a class="layui-btn layui-btn-danger layui-btn-xs delete" href="Equip_Delete.action?id=${row.id }&name=${row.name}&type=${row.type}">删除</a> 
						      	                    </div>
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
							
							
							
						    <div class="layui-tab-item">
						    	<div class="table-responsive">
								 		  <table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
											  <thead>
											   <tr>											      
											      <th>设备编号</th>
											      <th>设备名称</th>	
											  	  <th>操作</th>							      											      
											    </tr> 
											    
											  </thead>
											  <tbody>
											    <sql:query dataSource="${snapshot}" var="result">
                                                       SELECT  * FROM `d_equipment` where type='0'
                                              </sql:query>
                                               <c:forEach var="row" items="${result.rows}">
											    <tr>											      
											      <td><c:out value="${row.id}"/></td>
											      <td><c:out value="${row.name}"/></td>
											   			 <td>
						      	                    <div class="layui-table-cell laytable-cell-1-0-10"> 							      	  	 
							      	  	             <a class="layui-btn layui-btn-normal layui-btn-xs" href="equipUpdate.jsp?id=${row.id }&name=${row.name}&type=0">修改</a> 
							      	  	             <a class="layui-btn layui-btn-danger layui-btn-xs delete" href="Equip_Delete.action?id=${row.id }&name=${row.name}&type=${row.type}">删除</a> 
						      	                    </div>
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
												
												
												
												<div class="layui-tab-item">
													<div class="table-responsive">
													 		  <table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
																 <thead>
																   <tr>											      
																     <th>设备编号</th>
																     <th>设备名称</th>	
																	 <th>操作</th>										      											      
																   </tr> 
																 </thead>
																 <tbody>
																  <sql:query dataSource="${snapshot}" var="result">
                                                                 SELECT  * FROM `d_equipment` where type='1'
                                                                 </sql:query>
                                                                 <c:forEach var="row" items="${result.rows}">
											                      <tr>											      
											                      <td><c:out value="${row.id}"/></td>
											                      <td><c:out value="${row.name}"/></td>
											   			          <td>
						      	                    <div class="layui-table-cell laytable-cell-1-0-10"> 							      	  	 
							      	  	             <a class="layui-btn layui-btn-normal layui-btn-xs" href="equipUpdate.jsp?id=${row.id }&name=${row.name}&type=1">修改</a> 
							      	  	             <a class="layui-btn layui-btn-danger layui-btn-xs delete" href="Equip_Delete.action?id=${row.id }&name=${row.name}&type=${row.type}">删除</a> 
						      	                    </div>
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
					  
					  
					  
					  
					                                <div class="layui-tab-item">
													<div class="table-responsive">
													<table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
													<thead>
														<tr>											      
														 <th>设备编号</th>
														 <th>设备名称</th>	
														 <th>操作</th>										      											      
													    </tr> 
													</thead>
														<tbody>
																 <sql:query dataSource="${snapshot}" var="result">
                                                                 SELECT  * FROM `d_equipment` where type='2'
                                                                 </sql:query>
                                                                 <c:forEach var="row" items="${result.rows}">
											                      <tr>											      
											                      <td><c:out value="${row.id}"/></td>
											                      <td><c:out value="${row.name}"/></td>
											   			          <td>
						      	                    <div class="layui-table-cell laytable-cell-1-0-10"> 							      	  	 
							      	  	             <a class="layui-btn layui-btn-normal layui-btn-xs" href="equipUpdate.jsp?id=${row.id }&name=${row.name}&type=2">修改</a> 
							      	  	             <a class="layui-btn layui-btn-danger layui-btn-xs delete" href="Equip_Delete.action?id=${row.id }&name=${row.name}&type=${row.type}">删除</a> 
						      	                    </div>
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
				</div>
            </div>           
        </div>
 
    <script src="../assets/jquery.min.js"></script>
    <script src="../assets/layui.all.js"></script>    
    <script>
    	var element = layui.element;
    	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;		  
		  
		  
		//弹框		
			$('#add').on('click', function(){			
			  layui.use('layer', function(){
	          var layer = layui.layer;
	          layer.open({
	                type: 2,
	                title: '添加设备',
	                fix: false,
	                shadeClose: true,
	                shade: 0.8,
	                area: ['660px', '420px'],
	                content: 'equipAdd.jsp',
	                end: function () {
	                   location.reload();
	                }
	            });
	        });
	      })
		  //页码完整功能
		  laypage.render({
		    elem: 'page'
		    ,count: 100
		    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
		    ,jump: function(obj){
		      console.log(obj)
		    }
		  });	 
		});		
		
	</script>
	
</body>
</html>