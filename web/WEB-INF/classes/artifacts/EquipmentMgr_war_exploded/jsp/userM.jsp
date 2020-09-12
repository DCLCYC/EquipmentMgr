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
    <title>用户管理</title>
    <link rel="stylesheet" href="../assets/css/layui.css">    
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <link rel="stylesheet" href="../assets/css/admin.css"/> 
    <link rel="stylesheet" href="../assets/css/style.css"/>
    <style type="text/css">
    	.layui-form-item{ margin-bottom: 0;}
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
    			 <p>系统管理 > <span>用户管理</span></p>
    		</div>
    		<div class="mbrt layui-col-xs6 layui-col-md6">
    			<a href="javascript:;" class="layui-btn layui-btn-normal" id="userADD">新增用户</a>    			     			 
    		</div>
    	</div>
    	<!--面包屑导航-->
        <div class="layui-row">
            <div class="layui-card">

            	<div class="table-responsive">
			 		   <table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
						  <thead>
						    <tr>
						      <th>ID</th>
						      <th>用户名</th>	
						      <th>账号</th>
							  <th>密码</th>
							  <th>角色</th>
							  <th>分配角色</th>
						    </tr> 
						  </thead>
						  <tbody>
						  <sql:query dataSource="${snapshot}" var="result">
                              SELECT  * FROM `d_user`
                          </sql:query>
                          <c:forEach var="row" items="${result.rows}">
						    <tr>
						      <td>${row.id}</td>
							  <td>${row.nickname}</td>
						      <td>${row.account}</td>
						      <td>${row.password}</td>
						      <c:if test="${row.user_role == null }">
						       <td><font color="red">未分配</font></td>
						      </c:if>
						        <c:if test="${row.user_role != null }">
						      <sql:query dataSource="${snapshot}" var="result1">
                              SELECT  * FROM `d_role` where id = ${row.user_role}
                               </sql:query>
                                <c:forEach var="row1" items="${result1.rows}">
						          <td>${row1.name}</td>
						         </c:forEach>
						           </c:if>
							  <td>
								  <div class="layui-table-cell laytable-cell-1-0-10"> 
								  <c:if test="${row.user_role == null }">
								  	 <a class="layui-btn layui-btn-primary layui-btn-xs" id="userF" href="userF.jsp?id=${row.id}&nickname=${row.nickname}&account=${row.account}&password=${row.password}">分配角色</a> 
								  </c:if>
								  		<a class="layui-btn layui-btn-danger layui-btn-xs" href="userUpdate.jsp?id=${row.id}&nickname=${row.nickname}&account=${row.account}&password=${row.password}">修改信息</a>
								  	  	<a class="layui-btn layui-btn-danger layui-btn-xs delete" 
								  	  	href="User_Delete.action?id=${row.id}&nickname=${row.nickname}&account=${row.account}&password=${row.password}">删除</a> 
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
		$('#userADD').on('click', function(){			
		  layui.use('layer', function(){
          var layer = layui.layer;
          layer.open({
                type: 2,
                title: '新增用户',
                fix: false,
                shadeClose: true,
                shade: 0.8,
                area: ['660px', '420px'],
                content: 'userAdd.jsp',
                end: function () {
                   location.reload();
                }
            });
        });
      })
      
		
		//判断弹框
		$(".delete").click(function(){
			layer.confirm('确定要删除该设备？', {
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