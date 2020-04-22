package com.yayo.sys.service.impl;

import com.google.common.collect.Lists;
import com.yayo.sys.controller.response.UserRoleResponse;
import com.yayo.sys.convert.UserRoleConverter;
import com.yayo.sys.mapper.UserRoleDao;
import com.yayo.sys.mapper.dataobject.UserRole;
import com.yayo.sys.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private UserRoleConverter userRoleConverter;

    @Override
    public List<UserRoleResponse> findByUserId(Long userId) {
        List<UserRole> userRoleList = userRoleDao.findByUserId(userId);
        if(userRoleList.isEmpty()){
            return Lists.newArrayList();
        }
        return  userRoleList.stream().map(userRoleConverter::do2resp).collect(Collectors.toList());
    }
}
