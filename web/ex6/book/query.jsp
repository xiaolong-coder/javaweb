<%@ page import="com.edu.nefu.bean.Book" %>
<%@ page import="java.util.List" %>
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
    <title>查询图书信息</title>
    <jsp:useBean id="book" class="com.edu.nefu.bean.Book"/>
    <%request.setCharacterEncoding("utf-8");%>
    <link rel="stylesheet" href="form.css"/>
    <script src="../../js/jquery-3.6.1.js"></script>
    <script>
        $(function () {
            // 先设置奇偶
            $("tr:odd").css("background-color", "#D9E1F2");
            $("tr:even").css("background-color", "#FFFFFF");
            // 再选择首行
            $("tr:first-child").css({"background-color": "#4472C4", "color": "#FFFFEC"});
            // 记录原来颜色
            let color;
            // 选择第 0 行之后的所有行，不包含第 0 行
            $("tr:gt(0)").hover(
                function () {
                    color = $(this).css("background-color");
                    $(this).css("background-color", "#ff6900");
                }, function () {
                    $(this).css("background-color", color);
                }
            )
        });
    </script>
</head>
<body>
<jsp:setProperty name="book" property="*"/>
<%
    boolean query = false;
    try {
        query = book.query();
    } catch (SQLException e) {
        out.print("<h2>图书数据插入失败！</h2>");
    }
    if (query) {
%>
<h2>图书数据</h2>
<table>
    <tr>
        <th>书号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版年份</th>
        <th>价格</th>
        <th>所属类别</th>
        <th>存书数</th>
    </tr>
    <%
        List<Book> books = book.getBooks();
        for (Book b : books) {
            out.print("<tr>" +
                    "        <td>" + b.getIsbn() + "</td>" +
                    "        <td>" + b.getTitle() + "</td>" +
                    "        <td>" + b.getAuthor() + "</td>" +
                    "        <td>" + b.getPublisher() + "</td>" +
                    "        <td>" + b.getYear() + "</td>" +
                    "        <td>" + b.getPrice() + "</td>" +
                    "        <td>" + b.getClassify() + "</td>" +
                    "        <td>" + b.getNum() + "</td>" +
                    "    </tr>");
        }
    %>
</table>
<%
    }
%>
<div class="item div-button">
    <input type="button" onclick="location.href='welcome.html'" value="返回首页">
</div>
</body>
</html>
