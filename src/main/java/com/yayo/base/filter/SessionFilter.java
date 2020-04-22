package com.yayo.base.filter;

import com.yayo.base.component.RequestContext;
import com.yayo.sys.controller.dto.RolePermission;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class SessionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        RequestContext.clearUser();
        RequestContext.clearPerssion();

        HttpServletRequest req = (HttpServletRequest) request;
        RolePermission rolePermission = (RolePermission) req.getSession().getAttribute("rolePermission");
        if(rolePermission != null){
            RequestContext.setRolePermission(rolePermission);
            RequestContext.setUser(rolePermission.getUser());
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
    }
}
