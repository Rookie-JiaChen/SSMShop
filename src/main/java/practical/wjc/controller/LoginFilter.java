package practical.wjc.controller;

//登录拦截

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@WebFilter(filterName ="loginFilter", urlPatterns = {"/user/*","/admin/*"})
public class LoginFilter implements Filter {
    private static final Set<String> ALLOWED_PATHS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("index.jsp", "adminLogin.jsp","/user/login/", "/user/register/", "showCart.do","showCart.do","addToCart.do","clearShoppingCar.do","login.jsp")));
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest=(HttpServletRequest)request;
        Cookie[] cookies = httpServletRequest.getCookies();
        Object obj=new Object();
        for(int i=0;i<cookies.length;i++) {
            if (cookies[i].getName().equals("adminname")) {
                obj = cookies[i];
            }
        }

        String path = httpServletRequest.getRequestURI().substring(httpServletRequest.getContextPath().length()).replaceAll("[/]+$", "");

        // boolean loggedIn = (session != null && session.getAttribute("Id") != null);
        boolean allowedPath = ALLOWED_PATHS.contains(path);


        if(obj==null&&!allowedPath)
        {
            httpServletRequest.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        else
        {
            chain.doFilter(request,response);
        }
        }

    @Override
    public void destroy() {

    }
}
