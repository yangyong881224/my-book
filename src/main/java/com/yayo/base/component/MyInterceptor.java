package com.yayo.base.component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
@Slf4j
public class MyInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("request.uri:{}",request.getRequestURI());
        if("/api/admin/login".equals(request.getRequestURI())){
            return true;
        }else if("/error".equals(request.getRequestURI())){
            response.sendRedirect("/404");
            log.error("catch.error,request.uri:{},userSession:{}",request.getRequestURI(),request.getSession().getAttribute("user"));
            return false;
        }else {
            if(request.getSession().getAttribute("user")!=null){
                return true;
            }
            response.sendRedirect("/");
            return false;
        }
    }

}
