# 实训项目---设备报修管理系统

#### 介绍
  本项目是实训要求提交的大作业，实现了一个简单的设备报修管理系统。开发环境：Eclipse（后将项目移植到Idea上）+JDK8+Tomcat9.0+MySQL8。使用技术：Struts2+Hibernate5+Spring5框架，LayUI前端模板。

#### 软件架构

   在前端使用了LayUI构成了页面主体，其中使用了<sql:query>标签来直接查询获取数据，后端使用SSH框架技术，
将service层与action层进行了合并，action层获得数据并进行业务逻辑控制，dao及daoImpl层进行数据库级别的数据CRUD。


#### 安装教程

1.  下载整个项目和sql数据库文件
2.  将数据库文件导入MySQL数据库服务器。
3.  将项目导入自己的eclipse，并根据自己的开发环境修改项目Libraries，同时修改src/database.properties文件中的数据库连接信息。注意MySQL版本。本项目使用MySQL8.0，使用MySQL5的应当修改jar包，并修改上述文件下的驱动类名。
4.在很多个jsp页面中直接使用了<sql:setDataSource>和<sql:query>标签，注意修改前者的数据库连接密码。
5.上述步骤完成后，该项目应当可以正常运行。

#### 部分项目运行截图

1.登录页

![登录页](https://images.gitee.com/uploads/images/2020/0911/144739_7b7b535a_6580140.png "屏幕截图.png")


2. 管理员登陆后的数据中心主页

![登录页](https://images.gitee.com/uploads/images/2020/0911/143758_b50397e5_6580140.png "屏幕截图.png")


3. 用户信息管理页 

![用户管理页](https://images.gitee.com/uploads/images/2020/0911/143852_d01a3451_6580140.png "屏幕截图.png") 


4. 角色信息管理页

![角色管理页面](https://images.gitee.com/uploads/images/2020/0911/143939_7246451f_6580140.png "屏幕截图.png")


#### 合作开发人员

1.本项目中，我主要负责后端设计与实现，前端部分由另一位朋友完成。

2.本项目中已经包含了运行所需的全部文件。
