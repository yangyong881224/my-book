package com.yayo.sys.shiro;

import com.yayo.sys.controller.dto.RolePermission;
import com.yayo.sys.mapper.dataobject.User;
import com.yayo.sys.service.LoginService;
import com.yayo.sys.service.RoleService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

public class CustomRealm extends AuthorizingRealm {

    @Autowired
    private LoginService loginService;

    @Autowired
    private RoleService roleService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<String> stringSet = new HashSet<>();
        stringSet.add("user:show");
        stringSet.add("user:admin");
        info.setStringPermissions(stringSet);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = authenticationToken.getPrincipal().toString();
        String password = new String((char[]) authenticationToken.getCredentials());
        User user = loginService.login(username,password);
        if(user == null){
            throw new AccountException("user.not.found");
        }
        RolePermission rolePermission = roleService.sysFindByUserId(user.getUserId());
        rolePermission.setUser(user);
        return new SimpleAuthenticationInfo(rolePermission , password,user.getUserNickname());
    }
}
