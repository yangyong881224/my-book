package com.yayo.sys.controller.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class RoleCreateRequest implements Serializable {
    private static final long serialVersionUID = 2739152717916371019L;

    private String roleName;
    private String roleCode;
    private String targetType;
    private String rolePermission;
}
