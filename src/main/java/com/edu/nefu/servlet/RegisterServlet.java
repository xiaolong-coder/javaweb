package com.edu.nefu.servlet;

import com.edu.nefu.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", -1);
        PrintWriter out = response.getWriter();
        User user = new User(request.getParameter("un"), request.getParameter("pw"), request.getParameter("sex"), Integer.parseInt(request.getParameter("age")), request.getParameter("home"), Double.parseDouble(request.getParameter("grade")));
        int register;
        try {
            register = user.register();
        } catch (Exception e) {
            register = 0;
        }
        if (register > 0) {
            response.sendRedirect("/ex7/login_servlet/register_success.html");
        } else {
            out.print("<br>" + "用户名已存在，请重新注册");
            response.setHeader("refresh", "3;URL=ex7/login_servlet/register.html");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
