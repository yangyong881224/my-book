package com.yayo.sys.convert;

import com.yayo.sys.controller.response.UserRoleResponse;
import com.yayo.sys.mapper.dataobject.UserRole;
import org.mapstruct.Mapper;


@Mapper(componentModel = "spring")
public interface UserRoleConverter {

    public UserRoleResponse do2resp(UserRole userRole);

}
