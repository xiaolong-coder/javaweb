<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.awt.image.*,javax.imageio.*,java.io.*,java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

BufferedImage image=new BufferedImage(340,180,BufferedImage.TYPE_INT_RGB);
Graphics g=image.getGraphics();
g.fillRect(0,0,600,600);
g.setColor(new Color(255,0,0));
g.fillArc(20,20,150,150,30,120);
g.setColor(new Color(0,255,0));
g.fillArc(20,20,150,150,150,120);
g.setColor(new Color(0,0,255));
g.fillArc(20,20,150,150,270,120);
g.setColor(new Color(0,0,0));
//g.setColor(new Font("Arial Black",Font.PLAIN,16));
g.drawString("red:新食堂",200,60);
g.drawString("green:老食堂",200,100);
g.drawString("blue:专家公寓",200,140);
g.dispose();
ImageIO.write(image,"BMP",response.getOutputStream());
  %>
</body>
</html>