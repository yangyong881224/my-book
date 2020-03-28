package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.dto.UserRoleDTO;

public interface UserRoleService {
    Paging<UserRoleDTO> paging(Integer pageSize, Integer pageNo);
}
