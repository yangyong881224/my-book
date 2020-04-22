package com.yayo.sys.service;

import com.yayo.sys.controller.response.UserRoleResponse;

import java.util.List;

public interface UserRoleService {

    List<UserRoleResponse> findByUserId(Long userId);
}
