<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <script>
        function yz() {
            var z;
            z = bl.chat.value;
            if (z == "") {
                alert("留言不能为空");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<%

    String str, say = "", addr;
    Date now = new Date();
    response.setHeader("Refresh", "30");
    request.setCharacterEncoding("utf-8");
    addr = (String) request.getRemoteAddr();
    // us="guest";

    String uus = (String) session.getAttribute("sess_us");
    out.print(uus + "<br>");
    if (uus.equals(""))
        out.print("请先登录：" + "<a href='liaotian.html'>返回</a>");
    else {
        say = request.getParameter("chat");
        if (say != null) {
            str = uus + " " + now.toString() + "在" + "IP:" + addr + say;
            if (application.getAttribute("chat") == null) {
                str = str + "<br>";
                application.setAttribute("chat", str);
            } else {
                str = application.getAttribute("chat") + str + "<br>";
                application.setAttribute("chat", str);
            }
%>
<table border="1" width="600">
    <tr>
        <td>
            <%=application.getAttribute("chat") %>
        </td>
    </tr>
</table>
<%
        }
    }
%>
<form action="liaotian.jsp" method="post" name="bl" onsubmit="return yz()">
    <textarea rows="3" cols="90" name="chat"></textarea><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
  