package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.RoleDTO;
import com.yayo.sys.controller.dto.RolePermission;
import com.yayo.sys.controller.request.RoleCreateRequest;
import com.yayo.sys.controller.request.RolePagingReuest;

public interface RoleService {
    Paging<RoleDTO> paging(RolePagingReuest rolePagingReuest);

    Boolean create(RoleCreateRequest roleCreateRequest);

    RoleDTO findById(Long id);

    RolePermission sysFindByUserId(Long userId);
}
