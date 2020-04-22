package com.yayo.sys.controller.dto;

import com.google.common.collect.Sets;
import com.yayo.sys.enums.RoleTypeEnum;
import com.yayo.sys.mapper.dataobject.User;
import lombok.Data;
import org.mapstruct.ap.internal.util.Collections;

import java.io.Serializable;
import java.util.Set;

@Data
public class RolePermission implements Serializable {
    private static final long serialVersionUID = -7787890316052298315L;

    private User user;

    private Set<String> rolePermission;

    private Set<String> targetType;

    public RolePermission(Set<String> rolePermission, Set<String> targetType){
        this.rolePermission = rolePermission;
        this.targetType = targetType;
    }

    public static RolePermission userEmptyRole(){
        return  new RolePermission(Sets.newHashSet(), Collections.asSet(RoleTypeEnum.USER.code()));
    }


}
