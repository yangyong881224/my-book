package com.yayo.sys.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class UserRole implements Serializable {
    private static final long serialVersionUID = -7217528674973893499L;

    private Integer roleId;

    private String roleName;

    private String roleCode;

    private String targetId;

    private String targetType;

    private Integer deleted;

    private Date createdAt;

    private Long createdBy;

    private Date updatedAt;

    private Long updatedBy;
}
