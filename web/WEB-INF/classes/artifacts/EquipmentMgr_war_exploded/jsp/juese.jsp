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
    <title>任务发布</title>
    <link rel="stylesheet" href="../assets/css/layui.css">    
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <link rel="stylesheet" href="../assets/css/admin.css"/>    
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
    			 <p>系统管理 > <span>角色管理</span></p>
    		</div>
    		<div class="mbrt layui-col-xs6 layui-col-md6">
    			<a href="javascript:;" class="layui-btn layui-btn-normal" id="jueseAdd">新增角色</a>    			     			 
    		</div>
    	</div>
    	<!--面包屑导航-->
        <div class="layui-row">
            <div class="layui-card">
            	<div class="table-responsive">
			 		  <table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
						  <thead>
						    <tr>
						      <th>角色名</th>
						      <th>已有权限</th>
						      <th>ID</th>	
						      <th>操作</th>
						    </tr> 
						  </thead>
						  
						  
						  <tbody>
						  <sql:query dataSource="${snapshot}" var="roleall">
                              SELECT  *  FROM `d_role`
                           </sql:query>
                           <!-- 找到所有的角色 -->
                           
                            <c:forEach var="rowresult1" items="${roleall.rows}">
						    <tr>
						      <td><c:out value="${rowresult1.name}"/></td>
						      <sql:query dataSource="${snapshot}" var="permission1">
                              SELECT  *  FROM `d_role_permission` where  role_id= ${rowresult1.id}
                                </sql:query>
						      <!-- 找到所有的角色id对应的权限id -->
						      <td> 
						      <c:forEach var="rowreslut2" items="${permission1.rows}">
						      <sql:query dataSource="${snapshot}" var="name">
                              SELECT  *  FROM `permission` where  id= ${rowreslut2.permission_id}
                                </sql:query>
                                   <!-- 找到所有的权限id对应的权限名字 -->
                                 <c:forEach var="rowrulst3" items="${name.rows}">
                                 
                                 
                                 <c:out value="${rowrulst3.name}"/>、
                                 
                                 
                                 </c:forEach>
						      </c:forEach>
						      </td>
						      <td><c:out value="${rowresult1.id}"/></td>						      						     
						      <td>
						      	  <div class="layui-table-cell laytable-cell-1-0-10"> 	
						      	  		<a class="layui-btn layui-btn-normal layui-btn-xs" 	href="Role_Permission_Manage_DeleteAll.action?id=${rowresult1.id}&name=${rowresult1.name}&type=${rowresult1.type}">重新分配权限</a> 						      	  	 
							      	  	<a class="layui-btn layui-btn-danger layui-btn-xs delete" href="Role_Delete.action?id=${rowresult1.id}&name=${rowresult1.name}&type=${rowresult1.type}">删除</a> 
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
    <script src="../assets/jquery.min.js"></script>
    <script src="../assets/layui.all.js"></script>    
    <script>
    	var element = layui.element;
    	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;		  
		  
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
		
		//弹框		
		$('#jueseAdd').on('click', function(){			
		  layui.use('layer', function(){
          var layer = layui.layer;
          layer.open({
                type: 2,
                title: '新增角色',
                fix: false,
                shadeClose: true,
                shade: 0.8,
                area: ['660px', '420px'],
                content: 'jueseAdd.jsp',
                end: function () {
                   location.reload();
                }
            });
        });
      })
		
		//判断弹框
		$(".delete").click(function(){
			layer.confirm('确定要删除此任务？', {
			  btn: ['是','否'] //按钮
			}, function(){
			  layer.msg('已删除', {icon: 1});
			}, function(){
			  layer.msg('已取消',  {icon: 2});
			});
		})			
		
		 layui.use('form', function(){
		  var form = layui.form; 
		  form.render();
		}); 
	</script>
	
</body>
</html>