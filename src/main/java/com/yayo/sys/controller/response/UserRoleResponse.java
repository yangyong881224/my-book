package com.yayo.sys.controller.response;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserRoleResponse implements Serializable {

    private static final long serialVersionUID = -7931193829277321815L;

    private Long id;
    private Long userId;
    private Long roleId;
    private String targetType;

}
