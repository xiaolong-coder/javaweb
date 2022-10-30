<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String us=request.getParameter("user");
  
   session.setAttribute("sess_us", us);
 // out.print(session.getAttribute("sess_us"));
  
  %>
  <jsp:forward page="truechat.jsp" />
 
  
</body>
</html>