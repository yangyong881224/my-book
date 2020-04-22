package com.yayo.sys.mapper.dataobject;

import lombok.Data;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Data
public class Role implements Serializable {
    private static final long serialVersionUID = -7217528674973893499L;

    private Long roleId;

    private String roleName;

    private String roleCode;

    private String targetId;

    private String targetType;

    private String rolePermission;

    private List<String> rolePermissionList;

    private Integer deleted;

    private Date createdAt;

    private Long createdBy;

    private Date updatedAt;

    private Long updatedBy;

    public void setRolePermission(String rolePermission){
        this.rolePermission = rolePermission;
        if(StringUtils.isNotBlank(rolePermission)){
            this.rolePermissionList = Arrays.asList(rolePermission.split(","));
        }
    }
}
