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
	    <link rel="stylesheet" href="../assets/css/view.css"/>
	    <link rel="stylesheet" href="../assets/css/style.css"/>
	</head>
	<body class="layui-tank">
	<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
			           url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
 user="root" password="MySQLRootPassword123456" />
		         <div class="layui-row">
            <div class="layui-card">
            <div class="mblf layui-col-xs6 layui-col-md6">
    			 <i class="layui-icon">&#xe656;</i>
    			 <p>设备管理 > <span><a href="equipWarnManage.jsp">报修管理</a></span></p>
    		</div>
    		
            
            	    <sql:query dataSource="${snapshot}" var="result">
                          SELECT  * FROM `repairorder` where id=${param.test}
                     </sql:query>
     <c:forEach var="row" items="${result.rows}">        	
    <div style="padding: 20px; background-color: #F2F2F2;">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">地址信息</div>
        <div class="layui-card-body">
          <p>${row.EQUIPMENT_BUILD}号楼  第${row.EQUIPMENT_FLOOR}层</p><br/>
          <p><span class="col-green">${row.EQUIPMENT_ADDRESS}</span></p>
        </div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">报修备注</div>
        <div class="layui-card-body">
               <p><span >${row.REMARK}</span></p>
        </div>
      </div>
    </div>
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header">图片</div>
        <div class="layui-card-body">
         <div class="spimg">
           <img src="../${row.image}" />
         </div>
        </div>
      </div>
    </div>
  </div>
</div> 
 </c:forEach>      
            </div>           
        </div>

    <script src="../assets/jquery.min.js"></script>
	<script src="../assets/layui.all.js"></script>    

	</body>
</html>