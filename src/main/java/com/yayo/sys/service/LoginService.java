package com.yayo.sys.service;

import com.yayo.sys.mapper.dataobject.User;

public interface LoginService {
    User login(String username, String password);
}
