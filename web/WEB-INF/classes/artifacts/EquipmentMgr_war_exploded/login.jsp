<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="icon" href="/favicon.ico">
    <title>欢迎登陆设备报修平台</title>
    <style>
body {
	background-image: url("assets/images/backbroud.jpg");
} 

</style>
    
</head>
<body class="login-wrap" onload="createCode()">
    <div class="login-container">
        <form class="login-form" action="login.action" method="post">
        
            <div class="input-group">
                <input type="text" id="account" name="account" class="input-field" onblur="checkAccount()" autocomplete="off">
           
                <label for="account" class="input-label">
                    <span class="label-title">账号</span>
                    
                </label>
            </div>
            <div style="text-align:center"> 
            	<s:if test="#request.account_error_tip != null">
                	<font color="red"><s:property value="#request.account_error_tip"/></font>
                </s:if>
            </div>
                
            <div class="input-group">
                <input type="password" id="password" name="password" class="input-field" onblur="checkPassword()">
                <label for="password" class="input-label">
                    <span class="label-title">密码</span>
                </label>
            </div>
            <div style="text-align:center"> 
            	<s:if test="#request.pwd_error_tip != null">
                	<font color="red"><s:property value="#request.pwd_error_tip"/></font>
                </s:if>
            </div>
            <div class="input-group" >
            <input type = "button" id="VerificationCode"  onclick="createCode()" style="width:80px;height:22px;font-size:20px"/>
                <input type="text" id="Verification" class="input-field" autocomplete="off">
                <label for="Verification" class="input-label">
                    <span class="label-title">验证码</span>
                </label>
                
            </div>
            <s:token></s:token>
            <input type="submit" class="login-button" onclick="return validate()" value="登录">
        </form>
    </div>
</body>
<script src="assets/layui.js"></script>
<script src="index.js" data-main="login"></script>
<script type = "text/javascript" src = "js/checkCode.js"></script>
<script type="text/javascript">
function checkAccount() {
	var node = document.getElementById("account");
	if(node.value.length <= 0){
		alert("请输入账号!")
	}
}
function checkPassword() {
	//alert("1");
	var node = document.getElementById("password");
	if(node.value.length <= 0){
		alert("请输入密码!")
	}
}
</script>
</html>