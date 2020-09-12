<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>设备管理</title>
    <link rel="stylesheet" href="../assets/css/layui.css">    
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <link rel="stylesheet" href="../assets/css/admin.css"/> 
    <link rel="stylesheet" href="../assets/css/style.css"/>
    <style type="text/css">
    	.layui-form-item{ margin-bottom: 0;}
    </style>
</head>
<body class="layui-view-body">

    <div class="layui-content">
    	<!--面包屑导航-->
    	<div class="mianb">
    		<div class="mblf layui-col-xs6 layui-col-md6">
    			 <i class="layui-icon">&#xe656;</i>
    			 <p>设备管理 > <span><a href="equipWarnManage.jsp">报修管理</a></span></p>
    		</div>
    		<div class="mbrt layui-col-xs6 layui-col-md6">
    			<a href="equipWarn2.jsp" class="layui-btn layui-btn-normal" id="add">新增报修</a>    			     			 
    		</div>
    	</div>
    	<!--面包屑导航-->
        <div class="layui-row">
            <div class="layui-card">
            	<div class="table-responsive">
			 		  <table class="layui-table" lay-skin="line" lay-size="lg" id="table">						  
						  <thead>
						    <tr>
						      <th>报修编号</th>
						      <th>设备名称</th>	
						      <th>设备类型</th>
						      <th>报修人</th>
						      <th>维修人</th>
						      <th>维修状态</th>
						      <th>操作</th>
						    </tr> 
						  </thead>
						  <tbody>
						  
						  <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
			              url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
			              user="root" password="MySQLRootPassword123456" />
			               <sql:query dataSource="${snapshot}" var="result">
                                  SELECT  * FROM repairorder where repair_user = ${sessionScope.nowuser.id }
                           </sql:query>
                           <c:forEach var="row" items="${result.rows}">
						    <tr>
						      <td><c:out value="${row.id}"/></td>
						      <td><c:out value="${row.equipment_name}"/></td>
						      <td><c:out value="${row.equipment_type}"/></td>
						      
						       <td>
						      <!-- 报修人员名字展示 -->
						       <c:if test="${ empty row.repair_user}">
						               匿名报修人
						       </c:if>
						        
						          
						      <c:if test="${not empty row.repair_user }">
						      <sql:query dataSource="${snapshot}" var="repoman">
                                  SELECT  * FROM `d_user` where id = ${row.repair_user}
                             </sql:query>
                             <c:forEach var="row2" items="${repoman.rows}">
						      <c:out value="${row2.nickname}"/>
						      </c:forEach>
						      </c:if>
						      
						      </td>
						      
						      <td>
						         <c:if test="${row.service_user == null}">
						                   未分配
						          </c:if>
						          
						    <c:if test="${not empty row.service_user}">
						       <sql:query dataSource="${snapshot}" var="fixman">
                                  SELECT  * FROM `d_user` where id = ${row.service_user}
                             </sql:query>
                              <c:forEach var="row2" items="${fixman.rows}">
						      <c:out value="${row2.nickname}"/>
						       </c:forEach>
						       </c:if>
						      </td>

						      
						            <td>
                                    <c:if test="${row.status == 0}">
                                    <p>未修理<p>
                                    </c:if>
                                      <c:if test="${row.status == 1}">
                                    <p>修理完成<p>
                                    </c:if>
						           </td>
						      <td>
						      	  <div class="layui-table-cell laytable-cell-1-0-10"> 
						      	           <c:url var="myURL" value="equipWarnInfo.jsp">
                                            <c:param name="test" value="${row.id }"/>
                                            </c:url>
						      	  	   <a href="<c:out value="${myURL}"/>" class="layui-btn layui-btn-normal layui-btn-xs">查看</a>
										<c:if test="${row.service_user == null }">
							      	  	<a class="layui-btn layui-btn-danger layui-btn-xs" href="RepairOrder_Delete.action?repairOrder_id=${row.id}">删除</a> 
							      	  	</c:if>
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
		$('#info').on('click', function(){			
		  layui.use('layer', function(){
          var layer = layui.layer;
          layer.open({
                type: 2,
                title: '报修详情',
                fix: false,
                shadeClose: true,
                shade: 0.8,
                area: ['660px', '420px'],
                content: 'equipWarnInfo.jsp',
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