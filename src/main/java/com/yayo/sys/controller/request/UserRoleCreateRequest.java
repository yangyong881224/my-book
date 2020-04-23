package com.yayo.sys.controller.request;

import lombok.Data;

@Data
public class UserRoleCreateRequest {
    private Long id;
    private Long userId;
    private Long roleId;
    private String targetType;
}
