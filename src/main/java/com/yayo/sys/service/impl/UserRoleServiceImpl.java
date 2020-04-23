package com.yayo.sys.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.UserInfo;
import com.yayo.sys.controller.dto.RoleDTO;
import com.yayo.sys.controller.dto.UserRoleDTO;
import com.yayo.sys.controller.request.UserRoleCreateRequest;
import com.yayo.sys.controller.response.UserRoleResponse;
import com.yayo.sys.convert.UserRoleConverter;
import com.yayo.sys.mapper.UserRoleDao;
import com.yayo.sys.mapper.dataobject.UserRole;
import com.yayo.sys.service.RoleService;
import com.yayo.sys.service.UserRoleService;
import com.yayo.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private UserRoleConverter userRoleConverter;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Override
    public List<UserRoleResponse> findByUserId(Long userId) {
        List<UserRole> userRoleList = userRoleDao.findByUserId(userId);
        if(userRoleList.isEmpty()){
            return Lists.newArrayList();
        }
        return  userRoleList.stream().map(userRoleConverter::do2resp).collect(Collectors.toList());
    }

    @Override
    public Paging<UserRoleDTO> paging(Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo,pageSize);
        Map<String,Object> params = Maps.newHashMap();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        Paging<UserRole> userRolePaging = userRoleDao.paging(params);
        if(userRolePaging.isEmpty()){
            return Paging.empty();
        }
        List<UserRoleDTO> userRoleDTOList = userRolePaging.getData().stream().map(userRoleConverter::do2dto).collect(Collectors.toList());
        //构建用户数据
        userRoleDTOList = buildUser(userRoleDTOList);
        //构建角色数据
        userRoleDTOList = buildRole(userRoleDTOList);
        return new Paging<>(userRolePaging.getTotal(),userRoleDTOList);
    }

    @Override
    public Boolean createOrUpdate(UserRoleCreateRequest userRoleCreateRequest) {
        UserRole userRole = userRoleConverter.req2do(userRoleCreateRequest);
        //没有id就创建，有id就更新
        if(userRoleCreateRequest.getId() == null){
            return userRoleDao.create(userRole);
        }else{
            return userRoleDao.update(userRole);
        }
    }

    @Override
    public Boolean deleteById(Long id) {
        return userRoleDao.delete(id);
    }

    /**
     * 查询用户信息并组装
     * @param userRoleDTOList
     * @return
     */
    private List<UserRoleDTO> buildUser(List<UserRoleDTO> userRoleDTOList) {
        //获取所有userId
        List<Long> userIdList = userRoleDTOList.stream().map(UserRoleDTO::getUserId).collect(Collectors.toList());
        //根据userIds查询所有用户集合
        List<UserInfo> userInfoList = userService.findByIds(userIdList);
        //组装数据
        for(UserRoleDTO userRoleDTO : userRoleDTOList){
            for(UserInfo userInfo : userInfoList){
                if(userRoleDTO.getUserId().equals(userInfo.getUserId())){
                    userRoleDTO.setUserName(userInfo.getUserNickname());
                    userRoleDTO.setUserPhone(userInfo.getUsername());
                    break;
                }
            }
        }
        return userRoleDTOList;

    }

    /**
     * 查询角色信息并组装
     * @param userRoleDTOList
     * @return
     */
    private List<UserRoleDTO> buildRole(List<UserRoleDTO> userRoleDTOList) {
        //获取所有roleId
        List<Long> roleIdList = userRoleDTOList.stream().map(UserRoleDTO::getRoleId).collect(Collectors.toList());
        //根据roleId查询角色集合
        List<RoleDTO> roleDTOList = roleService.findByIds(roleIdList);
        //组装数据
        for(UserRoleDTO userRoleDTO : userRoleDTOList){
            for(RoleDTO roleDTO : roleDTOList){
                if(userRoleDTO.getRoleId().equals(roleDTO.getRoleId())){
                    userRoleDTO.setRoleName(roleDTO.getRoleName());
                    break;
                }
            }
        }
        return userRoleDTOList;
    }



}
