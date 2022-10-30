<%--
  Created by IntelliJ IDEA.
  User: kangl
  Date: 2022/10/24
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>投票结果</title>
    <script>
        window.history.replaceState(null, null, window.location.href);
    </script>
    <jsp:useBean id="vote" class="com.edu.nefu.bean.Vote" scope="application"/>
    <jsp:setProperty name="vote" property="length"/>
</head>
<body>
<%
    if (vote.ticket == null) {
        vote.ticket = new int[vote.length];
    }
    if (request.getParameter("milk") != null) {
        int index = Integer.parseInt(request.getParameter("milk"));
        vote.ticket[index]++;
    }
%>
<div class="item">
    <h4>投票结果：</h4>
    <div class="information">
        <%
            for (int i = 0; i < vote.length; i++) {
                out.print("<div><img src='../../img/milk" + i + ".png' alt='图片无法加载'><span>获得了" + vote.ticket[i] + "票</span></div>");
            }
        %>
    </div>
</div>
</body>
</html>
