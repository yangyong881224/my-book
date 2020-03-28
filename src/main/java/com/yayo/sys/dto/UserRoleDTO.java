package com.yayo.sys.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class UserRoleDTO implements Serializable {
    private static final long serialVersionUID = -1785464875940436003L;

    private Long roleId;

    private String roleName;

    private String roleCode;

    private String targetId;

    private String targetType;

}
