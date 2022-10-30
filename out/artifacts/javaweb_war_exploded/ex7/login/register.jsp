<%--
  Created by IntelliJ IDEA.
  User: kangl
  Date: 2022/10/12
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="form.css"/>
    <jsp:useBean id="user" class="com.edu.nefu.bean.User"/>
    <%request.setCharacterEncoding("utf-8");%>
</head>
<body>
<jsp:setProperty name="user" property="*"/>
<%
    int register;
    try {
        register = user.register();
    } catch (Exception e) {
        register = 0;
    }
    if (register > 0) {
%>
<h2>注册成功</h2>
<div class="box">
    <div class="item">
        <span class="label">用户名</span>
        <span class="information" id="un"><%=user.getUn()%></span>
    </div>
    <div class="item">
        <span class="label">密码</span>
        <span class="information" id="pw"><%=user.getPw()%></span>
    </div>
    <div class="item">
        <span class="label">性别</span>
        <span class="information" id="sex"><%=user.getSex()%></span>
    </div>
    <div class="item">
        <span class="label">年龄</span>
        <span class="information" id="age"><%=user.getAge()%></span>
    </div>
    <div class="item">
        <span class="label">籍贯</span>
        <span class="information" id="home"><%=user.getHome()%></span>
    </div>
    <div class="item">
        <span class="label">成绩</span>
        <span class="information" id="grade"><%=user.getGrade()%></span>
    </div>
    <div class="item div-button">
        <input type="button" onclick="location.href='login.html'" value="前往登录">
    </div>
</div>
<%
} else {
%>
<h2>注册失败，用户名已存在</h2>
<div class="item div-button">
    <input type="button" onclick="location.href='register.html'" value="重新注册">
</div>
<%
    }
%>
</body>
</html>
