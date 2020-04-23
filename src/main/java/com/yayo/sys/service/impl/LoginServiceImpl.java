package com.yayo.sys.service.impl;

import com.yayo.sys.mapper.UserDao;
import com.yayo.sys.mapper.dataobject.User;
import com.yayo.sys.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String username , String password){
        return userDao.findByUserNamePassword(username,password);
    }
}
