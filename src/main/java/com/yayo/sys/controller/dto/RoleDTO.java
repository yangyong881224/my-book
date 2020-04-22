package com.yayo.sys.controller.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class RoleDTO implements Serializable {
    private static final long serialVersionUID = -1785464875940436003L;

    private Long roleId;

    private String roleName;

    private String roleCode;

    private String targetId;

    private String targetType;

    private List<String> rolePermissionList;

}
