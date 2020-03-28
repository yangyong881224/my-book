package com.yayo.sys.service.impl;

import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.dto.UserRoleDTO;
import com.yayo.sys.service.UserRoleService;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Override
    public Paging<UserRoleDTO> paging(Integer pageSize, Integer pageNo) {
        PageInfo pageInfo = new PageInfo(pageNo,pageSize);

        return null;
    }
}
