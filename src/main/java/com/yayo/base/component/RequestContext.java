package com.yayo.base.component;

import com.yayo.sys.controller.dto.RolePermission;
import com.yayo.sys.mapper.dataobject.User;
import org.apache.commons.compress.archivers.dump.DumpArchiveEntry;

import java.util.Set;

public class RequestContext  {

    private static final ThreadLocal<User> USER = new ThreadLocal<>();

    private static final ThreadLocal<RolePermission> ROLE_PERMISSION = new ThreadLocal<>();

    public static void setUser(User user){
        USER.set(user);
    }

    public static void setRolePermission(RolePermission rolePermission){
        ROLE_PERMISSION.set(rolePermission);
    }

    public static User getUser(){
        checkLoginStatus();
        return USER.get();
    }

    public static Long getUserId(){
        checkLoginStatus();
        return USER.get().getUserId();
    }

    public static Set<String> getPermission(){
        checkLoginStatus();
        return ROLE_PERMISSION.get().getRolePermission();
    }

    public static Set<String> getTargetType(){
        checkLoginStatus();
        return ROLE_PERMISSION.get().getTargetType();
    }

    public static void checkLoginStatus(){
        if(USER.get() == null){
            throw new RuntimeException("user.not.login");
        }
    }

    public static void clearUser(){
        USER.remove();
    }
    public static void clearPerssion(){
        ROLE_PERMISSION.remove();
    }
}
