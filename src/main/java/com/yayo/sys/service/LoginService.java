package com.yayo.sys.service;

import com.yayo.sys.bean.User;

public interface LoginService {
    User login(String username, String password);
}
