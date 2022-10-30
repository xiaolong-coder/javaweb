<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>file</title>
</head>
<body>
<%
    File file = new File("d:\\");//可以设为从页面上获取的一个资源管理器中的位置
    String file_name[] = file.list();
    //start 下面用于将file_name[]中所有值做成超链接
    for (String filename : file_name) {
        out.write("<a href=‘#’>" + filename + "</a><br/>");
    }
    //end
%>
</body>
</html>