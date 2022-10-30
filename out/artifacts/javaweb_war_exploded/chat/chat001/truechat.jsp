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

 String quyhm=(String)session.getAttribute("sess_us");
 
 String say=request.getParameter("liaotian");
  
 if(application.getAttribute("qusay")==null)
 {
	 say=quyhm+say;
	 application.setAttribute("qusay",say);
	 out.print(quyhm+"说:"+say+"<br>");
 }
 else
 {
String tmpsay=(String)application.getAttribute("qusay");
 say=quyhm+tmpsay+"<br>"+say;
 application.setAttribute("qusay",say);
 out.print(quyhm+"说:"+say+"<br>");
 }
 
%>

 <form action="chat.jsp" method="get">
  留言：<textarea rows="3" cols="30" name="liaotian"></textarea><br>
  <input type="submit" value="提交">
  
  </form>
</body>
</html>