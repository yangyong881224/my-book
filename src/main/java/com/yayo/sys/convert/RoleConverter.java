package com.yayo.sys.convert;

import com.yayo.sys.controller.dto.RoleDTO;
import com.yayo.sys.controller.request.RoleCreateRequest;
import com.yayo.sys.mapper.dataobject.Role;
import org.mapstruct.Mapper;


@Mapper(componentModel = "spring")
public interface RoleConverter {

    public RoleDTO do2dto(Role role);

    public Role request2do(RoleCreateRequest request);
}
