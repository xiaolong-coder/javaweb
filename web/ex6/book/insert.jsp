<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: kangl
  Date: 2022/10/18
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>录入图书信息</title>
    <link rel="stylesheet" href="form.css"/>
    <jsp:useBean id="book" class="com.edu.nefu.bean.Book"/>
    <%request.setCharacterEncoding("utf-8");%>
</head>
<body>
<jsp:setProperty name="book" property="*"/>
<%
    int insert = 0;
    try {
        insert = book.insert();
    } catch (SQLException e) {
        out.print("<h2>图书数据插入失败！！！</h2>");
    }
    if (insert > 0) {
        out.print("<h2>图书数据已插入</h2>");
    }
%>
<div class="item div-button">
    <input type="button" onclick="location.href='welcome.html'" value="返回首页">
</div>
</body>
</html>
