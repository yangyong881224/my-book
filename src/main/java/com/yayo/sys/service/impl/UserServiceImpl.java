package com.yayo.sys.service.impl;

import com.yayo.sys.mapper.dataobject.User;
import com.yayo.sys.mapper.UserMapper;
import com.yayo.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/12 10:53
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public List<User> getUserListAll() {
        List<User> userList = userMapper.findUserListAll();
        if(userList == null || userList.size() == 0){
            return null;
        }
        return userList;
    }
}
