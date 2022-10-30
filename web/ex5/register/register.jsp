<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: kangl
  Date: 2022/10/5
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="register.css"/>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("username");
    // 表单经过检查，不可能为空串，故不会抛出异常
    int year = Integer.parseInt(request.getParameter("year"));
    title += year <= 2019 ? " 校友你好！" : " 同学你好！";
%>

<div class="result-box">
    <h2>
        <%=title%>
    </h2>
    <div class="item">
        <span class="label">用户名：</span>
        <span class="information" id="res-username">
            <%=request.getParameter("username")%>
        </span>
    </div>
    <div class="item">
        <span class="label">密码：</span>
        <span class="information" id="res-password">
            <%=request.getParameter("password")%>
        </span>
    </div>
    <div class="item">
        <span class="label">入学年份</span>
        <span class="information" id="res-year">
            <%=request.getParameter("year")%>
        </span>
    </div>
    <div class="item">
        <span class="label">入学成绩</span>
        <span class="information" id="res-grade">
             <%=request.getParameter("grade")%>
        </span>
    </div>
    <div class="item">
        <span class="label">性别</span>
        <span class="information" id="res-sex">
             <%=request.getParameter("sex")%>
        </span>
    </div>
</div>
</body>
</html>
