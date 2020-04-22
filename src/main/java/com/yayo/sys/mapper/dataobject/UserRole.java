package com.yayo.sys.mapper.dataobject;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserRole implements Serializable {
    private static final long serialVersionUID = -353492119240900480L;

    private Long id;
    private Long userId;
    private Long roleId;
    private String targetType;
}
