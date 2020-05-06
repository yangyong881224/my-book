package com.yayo.base.aop;

import com.yayo.base.component.RequestContext;
import com.yayo.sys.controller.dto.RolePermission;
import com.yayo.sys.mapper.dataobject.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Aspect
@Component
public class ShiroUserRole {

    @Pointcut("execution(public * com.yayo..controller.*.*(..))")
    public void shiroUserRole(){}

    @Before("shiroUserRole()")
    public void before(JoinPoint joinPoint){
        ServletRequestAttributes ServletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ServletRequestAttributes.getRequest();
        RolePermission rolePermission = (RolePermission) request.getSession().getAttribute("rolePermission");
        if(!Objects.isNull(rolePermission)){
            User user = rolePermission.getUser();
            RequestContext.setUser(user);
            RequestContext.setRolePermission(rolePermission);
        }
    }

    @After("shiroUserRole()")
    public void after(){
        RequestContext.clearUser();
        RequestContext.clearPerssion();
    }

}
