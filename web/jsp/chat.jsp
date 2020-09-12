<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>数据统计</title>
<link rel="icon" href="favicon.ico" type="../chat/image/ico">
<meta name="author" content="yinqi">
<link href="../chat/css/bootstrap.min.css" rel="stylesheet">
<link href="../chat/css/materialdesignicons.min.css" rel="stylesheet">
<link href="../chat/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
 url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
 user="root" password="MySQLRootPassword123456" />
<sql:query dataSource="${snapshot}" var="role">
SELECT  *  FROM `d_role` where TYPE='2'
</sql:query>
 
    <!--页面主要内容-->
 
      
      <div class="container-fluid">
        
        <div class="row">
   
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>维修分工图</h4></div>
              <div class="card-body">
                <canvas id="chart-vbar-1" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          
        
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>设备报修图</h4></div>
              <div class="card-body">
                <canvas id="chart-pie" width="280" height="280"></canvas>
              </div>
            </div>
          </div>
          
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>报修单情况</h4></div>
              <div class="card-body">
                <canvas id="chart-doughnut" width="280" height="280"></canvas>
              </div>
            </div>
          </div>
          
        
        </div>
        
      </div>
      

    <!--End 页面主要内容-->


<script type="text/javascript" src="../chat/js/jquery.min.js"></script>
<script type="text/javascript" src="../chat/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../chat/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../chat/js/Chart.js"></script>
<script type="text/javascript" src="../chat/js/main.min.js"></script>
<script type="text/javascript">










new Chart($("#chart-vbar-1"), {
    type: 'bar',
    data: {

        labels: [
        	<c:forEach var="fix" items="${role.rows}"> 
        	<sql:query dataSource="${snapshot}" var="user">
        	     SELECT  * FROM `d_user` where USER_ROLE=${fix.ID}
        	</sql:query>
        	<c:forEach var="fixman" items="${user.rows}">
        	"<c:out value="${fixman.nickname}"/>",
        	</c:forEach>
            </c:forEach>
        	],
        	
        	
        datasets: [{
            label: "维修数量",
            backgroundColor: "rgba(51,202,185,0.5)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(51,202,185,0.7)",
            hoverBorderColor: "rgba(0,0,0,0)",
            
            data: [
            	<sql:query dataSource="${snapshot}" var="role">
            	SELECT  *  FROM `d_role` where TYPE='2'
            	</sql:query>

            	 	<c:forEach var="count" items="${role.rows}"> 
            	            	<sql:query dataSource="${snapshot}" var="number">
            	            	select * from repairorder where service_USER =${count.ID}
            	                </sql:query>
            	       	      
            	       	    <%
            	               int i = 0;
            	       	       request.setAttribute("i",i);
            	             %>   
	             
            	       	     <c:forEach var="num" items="${number.rows}">
            	       	      <%
       	                        i = i+1;
       	       	               request.setAttribute("i",i);
       	                       %>   
            	       	      </c:forEach>  
            	       <c:out value="${i}"/>,
            	       
            	        </c:forEach>
            	            	

            
            	]
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});







new Chart($("#chart-pie"), {
    type: 'pie',
    data: {
        labels: ["辅助设备", "办公设备","教学设备"],
        datasets: [{
            data: [
            	
            	<c:forEach var="i" begin="1" end="3">
            	 <%
            	   int c=0;
            	 request.setAttribute("c",c);
            	 %>
            	<sql:query dataSource="${snapshot}" var="type">
            	  SELECT  *  FROM `d_equipment` where TYPE='${i}'
            	</sql:query>
            	  
            	  	<c:forEach var="count" items="${type.rows}">  
            	      <%
            	       c=c+1;
            	      request.setAttribute("c",c);
            	      %>
            	    </c:forEach>
            	    
            	  <c:out value="${c}"/>,
            	    
            	    
            	</c:forEach>
            	
            	
            	],
            backgroundColor: ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)']
        }]
    },
    options: {
        responsive: false
    }
});

new Chart($("#chart-doughnut"), {
    type: 'doughnut',
    data: {
        labels: ["未修理好设备", "已修理设备"],
        datasets: [{
            data: [
            	<sql:query dataSource="${snapshot}" var="ordernum">
            	SELECT  *  FROM `repairorder` where status = 0
            	</sql:query>
            	 <%
          	   int a=0;
          	 request.setAttribute("a",a);
          	     %>
            	<c:forEach var="numall" items="${ordernum.rows}"> 
            	<%
     	       a=a+1;
     	      request.setAttribute("a",a);
     	         %>
            	 </c:forEach>
            	 <c:out value="${a}"/>,
            	 
            	 <sql:query dataSource="${snapshot}" var="ordernum2">
             	SELECT  *  FROM `repairorder` where status = 1
             	</sql:query>
             	 <%
           	   int b=0;
           	 request.setAttribute("b",b);
           	     %>
             	<c:forEach var="numall1" items="${ordernum2.rows}"> 
             	<%
      	       b=b+1;
      	      request.setAttribute("b",b);
      	         %>
             	 </c:forEach>
             	 <c:out value="${b}"/>,
            	],
            backgroundColor: ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)']
        }]
    },
    options: {
        responsive: false
    }
});


</script>
</body>
</html>