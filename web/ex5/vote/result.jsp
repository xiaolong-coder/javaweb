<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: kangl
  Date: 2022/10/12
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>投票结果</title>
    <link rel="stylesheet" href="vote.css"/>
    <script src="../../js/jquery-3.6.1.js"></script>
    <script>
        // 取消重新提交提示
        window.history.replaceState(null, null, window.location.href);

        // 初始 getAttribute 返回 null，使用内容选择器替换为 0
        $(function () {
            $("span:contains(null)").html(0);
        })
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    Enumeration<String> paramNames = request.getParameterNames();

    // 遍历表单，获取 checked 的选项
    while (paramNames.hasMoreElements()) {
        String paramName = (String) paramNames.nextElement();
        String paramValue = request.getParameter(paramName);
        // 拼凑 id，获取值
        Integer tmp = (Integer) application.getAttribute(paramName + paramValue);
        // 初始无值为 null
        if (tmp == null) {
            tmp = 0;
        }
        // 选中则需要加一
        application.setAttribute(paramName + paramValue, tmp + 1);
    }
%>
<div class="box">
    <div class="item">
        <span>最受欢迎的主食是：</span><br>
        <span>馒头：</span><span><%=application.getAttribute("major" + "0")%></span><br>
        <span>米饭：</span><span><%=application.getAttribute("major" + "1")%></span><br>
        <span>面条：</span><span><%=application.getAttribute("major" + "2")%></span><br>
    </div>
    <div class="item">
        <span>最受欢迎的食堂是：</span><br>
        <span>俭德园：</span><span><%=application.getAttribute("place" + "0")%></span><br>
        <span>颐丰园：</span><span><%=application.getAttribute("place" + "1")%></span><br>
        <span>专家公寓：</span><span><%=application.getAttribute("place" + "2")%></span><br>
    </div>
    <%=application.getAttribute("place")%>
    <%=application.getAttribute("major")%>
</div>
</body>
</html>
