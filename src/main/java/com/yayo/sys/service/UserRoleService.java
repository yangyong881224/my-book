package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.UserRoleDTO;
import com.yayo.sys.controller.request.UserRoleCreateRequest;
import com.yayo.sys.controller.response.UserRoleResponse;

import java.util.List;

public interface UserRoleService {

    List<UserRoleResponse> findByUserId(Long userId);

    Paging<UserRoleDTO> paging(Integer pageNo, Integer pageSize);

    Boolean createOrUpdate(UserRoleCreateRequest userRoleCreateRequest);

    Boolean deleteById(Long id);
}
