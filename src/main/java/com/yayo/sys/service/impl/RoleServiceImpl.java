package com.yayo.sys.service.impl;

import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.RoleDTO;
import com.yayo.sys.controller.dto.RolePermission;
import com.yayo.sys.controller.request.RoleCreateRequest;
import com.yayo.sys.controller.request.RolePagingReuest;
import com.yayo.sys.controller.response.UserRoleResponse;
import com.yayo.sys.convert.RoleConverter;
import com.yayo.sys.enums.RoleTypeEnum;
import com.yayo.sys.mapper.RoleDao;
import com.yayo.sys.mapper.dataobject.Role;
import com.yayo.sys.service.RoleService;
import com.yayo.sys.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RoleConverter roleConverter;

    @Override
    public Paging<RoleDTO> paging(RolePagingReuest rolePagingReuest) {
        PageInfo pageInfo = new PageInfo(rolePagingReuest.getPageNo(),rolePagingReuest.getPageSize());
        Map<String,Object> params = Maps.newHashMap();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        params.put("roleName",rolePagingReuest.getRoleName());
        params.put("roleCode",rolePagingReuest.getRoleCode());
        Paging<Role> rolePaging = roleDao.paging(params);
        if(rolePaging.isEmpty()){
            return Paging.empty();
        }
        List<RoleDTO> roleDTOList = rolePaging.getData().stream().map(roleConverter::do2dto).collect(Collectors.toList());
        return new Paging<>(rolePaging.getTotal(),roleDTOList);
    }

    @Override
    public Boolean create(RoleCreateRequest roleCreateRequest) {
        Role role = roleConverter.request2do(roleCreateRequest);
        return roleDao.create(role);
    }

    @Override
    public RoleDTO findById(Long id) {
        Role role = roleDao.findById(id);
        return roleConverter.do2dto(role);
    }

    @Override
    public RolePermission sysFindByUserId(Long userId) {
        List<UserRoleResponse> userRoleList = userRoleService.findByUserId(userId);
        //普通用户，空权限
        if(userRoleList.isEmpty()){
            return RolePermission.userEmptyRole();
        }
        //角色集合
        Set<String> targetType = userRoleList.stream().map(userRoleResponse -> {
            return RoleTypeEnum.valueOf(userRoleResponse.getTargetType()).code();
        }).collect(Collectors.toSet());
        //roleId 集合
        List<Long> idList = userRoleList.stream().map(UserRoleResponse::getRoleId).collect(Collectors.toList());
        //查询所有权限
        List<Role> roleList = roleDao.findByIds(idList);
        //虽然有角色，但是空权限
        if(roleList.isEmpty()){
            return new RolePermission(Sets.newHashSet(),targetType);
        }
        Set<String> rolePermission = Sets.newHashSet();
        roleList.stream().forEach(role -> {
            List<String> permissionList = role.getRolePermissionList();
            permissionList.stream().forEach(permission -> {
                rolePermission.add(permission);
            });
        });

        return new RolePermission(rolePermission,targetType);
    }
}
