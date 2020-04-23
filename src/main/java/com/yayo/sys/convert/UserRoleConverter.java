package com.yayo.sys.convert;

import com.yayo.sys.controller.dto.UserRoleDTO;
import com.yayo.sys.controller.request.UserRoleCreateRequest;
import com.yayo.sys.controller.response.UserRoleResponse;
import com.yayo.sys.mapper.dataobject.User;
import com.yayo.sys.mapper.dataobject.UserRole;
import org.mapstruct.Mapper;


@Mapper(componentModel = "spring")
public interface UserRoleConverter {

    public UserRoleResponse do2resp(UserRole userRole);

    public UserRoleDTO do2dto(UserRole userRole);

    public UserRole req2do(UserRoleCreateRequest request);

}
