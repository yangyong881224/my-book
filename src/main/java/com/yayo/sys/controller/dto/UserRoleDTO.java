package com.yayo.sys.controller.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserRoleDTO implements Serializable {
    private static final long serialVersionUID = 7634840301339817117L;

    private Long id;

    private Long userId;
    private String userName;
    private String userPhone;
    private Long roleId;
    private String roleName;
    private String targetType;
}
