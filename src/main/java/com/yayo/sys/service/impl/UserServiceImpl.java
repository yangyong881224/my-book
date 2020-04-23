package com.yayo.sys.service.impl;

import com.google.common.collect.Maps;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.UserInfo;
import com.yayo.sys.convert.UserConverter;
import com.yayo.sys.mapper.UserDao;
import com.yayo.sys.mapper.dataobject.User;
import com.yayo.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/12 10:53
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserConverter userConverter;

    @Override
    public Paging<UserInfo> paging(Integer pageNo,Integer pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo,pageSize);
        Map<String,Object> params = Maps.newHashMap();
        params.put("limit",pageInfo.getLimit());
        params.put("offset",pageInfo.getOffset());
        Paging<User> userPaging = userDao.paging(params);
        if(userPaging.isEmpty()){
            return Paging.empty();
        }
        List<UserInfo> userInfoList = userPaging.getData().stream().map(userConverter::do2info).collect(Collectors.toList());
        return new Paging<>(userPaging.getTotal(),userInfoList);
    }

    @Override
    public UserInfo findById(Long userId) {
        User user = userDao.findById(userId);
        return userConverter.do2info(user);
    }

    @Override
    public List<UserInfo> findByIds(List<Long> userIdList) {
        List<User> userList = userDao.findByIds(userIdList);
        return userList.stream().map(userConverter::do2info).collect(Collectors.toList());
    }

    @Override
    public UserInfo findByUsername(String username) {
        Map<String,Object> params = Maps.newHashMap();
        params.put("username",username);
        User user = userDao.findByUniqueIndex(params);
        return userConverter.do2info(user);
    }
}
