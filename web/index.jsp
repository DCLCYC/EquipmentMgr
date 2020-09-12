<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="icon" href="/favicon.ico">
    <title>管理后台</title>
</head>
<body class="layui-layout-body">
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/equipmentmgr?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true"
			user="root" password="MySQLRootPassword123456" />
    <div class="layui-layout layui-layout-admin">
    
        <div class="layui-header custom-header">            
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item slide-sidebar" lay-unselect>
                    <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
                </li>               
            </ul>
			<p class="datexians">NEWCAPEC</p>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
              <a href="javascript:;"><s:property value="#session.nowuser.nickname"/></a>
                    <dl class="layui-nav-child">
                        <dd><a href="https://blog.csdn.net/qq_43285863/article/details/108345307">帮助中心</a></dd>
                        <dd><a href="login.jsp">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div class="layui-side custom-admin">
            <div class="layui-side-scroll">
                <div class="custom-logo">
                    <img src="assets/images/logo.png" alt=""/>                    
                    <h1>设备管理系统</h1>
                </div>
                
			     <c:if test="${sessionScope.nowuser.user_role.type == 0 }">
                <ul id="Nav" class="layui-nav layui-nav-tree">
                    <li class="layui-nav-item" >
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe665;</i>
                            <em>数据中心</em>
                        </a>
                           
                        <dl class="layui-nav-child">                        
                            <dd><a href="jsp/chat.jsp">数据中心</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                         <i class="layui-icon">&#xe857;</i>
                         <em>设备管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="jsp/equipInfo.jsp">设备信息</a></dd>
                            <dd><a href="jsp/equipWarnManage.jsp">报修管理</a></dd>
                                
                        </dl>
                    </li>
                   <!-- <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe663;</i>
                            <em>维修信息管理</em>
                        </a>
                        <dl class="layui-nav-child">
							<dd><a href="jsp/fixPeopleM.jsp">维修人员管理</a></dd>
                            <dd><a href="jsp/fixM.jsp">报修分配</a></dd>
                        </dl>
                    </li> -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe653;</i>
                            <em>系统管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="jsp/AreaManage.jsp">区域管理</a></dd>
                            <dd><a href="jsp/userM.jsp">用户管理</a></dd>
                            <dd><a href="jsp/juese.jsp">角色管理</a></dd>
                            <dd><a href="jsp/permission.jsp">权限管理</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        </c:if>
        
        
         <c:if test="${sessionScope.nowuser.user_role.type != 0 }">
                <ul id="Nav" class="layui-nav layui-nav-tree">
                    <li class="layui-nav-item" >
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe665;</i>
                            <em>管理中心</em>
                        </a>
                           <c:if test="${sessionScope.nowuser.user_role.type == 1 }">
                        <dl class="layui-nav-child">                        
                            <dd><a href="jsp/fixM.jsp">待调度任务</a></dd>
                            <dd><a href="jsp/fixM2.jsp">已调度任务</a></dd>
                        </dl>
                           </c:if>
                            <c:if test="${sessionScope.nowuser.user_role.type == 2 }">
                        <dl class="layui-nav-child">                        
                            <dd><a href="jsp/fixDo.jsp">待维修任务</a></dd>
                            <dd><a href="jsp/fixDo2.jsp">已维修任务</a></dd>
                        </dl>
                           </c:if>
                            <c:if test="${sessionScope.nowuser.user_role.type == 3 }">
                        <dl class="layui-nav-child">                        
                            <dd><a href="jsp/equipWarnManage2.jsp">我的报修管理</a></dd>
                        </dl>
                           </c:if>
                           
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe665;</i>
                        <em>拥有权限</em>  
                        </a>
                        
                        <dl class="layui-nav-child">
                        
                        <sql:query dataSource="${snapshot}" var="permission2">
                              SELECT  * FROM d_role_permission where role_id= ${sessionScope.nowuser.user_role.id}
                        </sql:query>
                        <!-- 查找所有的对应权限 -->
                        <c:forEach var="rowreslut4" items="${permission2.rows}">
                        <sql:query dataSource="${snapshot}" var="all">
                         SELECT  *  FROM `permission` where  id= ${rowreslut4.permission_id}
                        </sql:query>
                                <!-- 在权限表中查找所有的对应权限 -->
                           <c:forEach var="rowrulst5" items="${all.rows}">
                                 <dd><a href="${rowrulst5.url}"> <c:out value="${rowrulst5.name}"/></a></dd>
                           </c:forEach>
                         </c:forEach>
                         </dl>
                    </li>
                   
                </ul>
            </div>
          </div>
        </c:if>

        <div class="layui-body">
             <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
                <ul id="appTabs" class="layui-tab-title custom-tab" style="display: none;"></ul>
                <div id="appTabPage" class="layui-tab-content"></div>
            </div>
        </div>
        <div class="mobile-mask"></div>
    </div>
    <script src="assets/layui.js"></script>
    <script src="index.js" data-main="home"></script>
</body>
</html>