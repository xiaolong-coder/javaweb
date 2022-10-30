package com.edu.nefu.filter;

import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        if (request.getParameter("un") == null || request.getParameter("pw") == null) {
//
//        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginServlet");
        requestDispatcher.include(request, response);
        chain.doFilter(request, response);
    }
}
